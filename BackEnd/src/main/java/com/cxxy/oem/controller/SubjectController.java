package com.cxxy.oem.controller;

import com.alibaba.fastjson.JSON;
import com.cxxy.oem.common.WebConfig;
import com.cxxy.oem.db.DbConfig;
import com.cxxy.oem.db.DbRecord;
import com.cxxy.oem.model.Subject;
import com.cxxy.oem.service.UserService;
import com.cxxy.oem.validator.SubjectValidator;
import com.cxxy.oem.vo.AjaxResult;
import com.cxxy.oem.vo.LayUITableResult;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.PathKit;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.upload.UploadFile;
import org.apache.shiro.SecurityUtils;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

public class SubjectController extends Controller {

    public void index() {
    }

    @Before(SubjectValidator.class)
    public void add() {
        Record user = UserService.me.getCurrentUserInfo();

        // 获取上传原始文件(暂定最多5个)
        List<UploadFile> allFiles = getFiles("file");

        if (allFiles.size() > 1) {
            renderJson(new AjaxResult(AjaxResult.CODE_ERROR, "文件数量超出上限，上传失败"));
        } else {
            // 重命名元素: 用户名
            String username = (String) SecurityUtils.getSubject().getPrincipal();
            // 重命名元素: 上传时间
            Date now = new Date(System.currentTimeMillis());
            String uploadDateTime = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss").format(now);

            // 重命名元素: 序号

            // 目标文件路径列表
            ArrayList<String> webPaths = new ArrayList<String>();
            // 源路径
            String originPath = "";
            // 每个文件名
            String webPathString;
            username += user.getStr("name");

            originPath = File.separator + "upload" +
                    File.separator + "video" +
                    File.separator + getPara("SubjectName") + ".mp4";
            webPaths.add(originPath);
            //2020-10-20之前的单图片模式
            // File targetFile = new File(PathKit.getWebRootPath() + webPath);

            ArrayList<File> targetFiles = new ArrayList<File>();
            for (int i = 0; i < allFiles.size(); i++) {
                File oneFile = new File(PathKit.getWebRootPath() + webPaths.get(i));
                targetFiles.add(oneFile);
            }


            try {
                // 保存文件信息至数据库
                Subject subject = new Subject();
                subject.setSubjectName(getPara("SubjectName"));

                // 数据库最终保存的路径，如果多图则在结尾加 "*"符号 跟上图片数量
                String finalPath = "";
                if (allFiles.size() == 1) {
                    finalPath = originPath;
                } else {
                    finalPath = originPath + "*" + allFiles.size();
                }
                if (subject.save()) {
                    for (int i = 0; i < allFiles.size(); i++) {
                        if (!targetFiles.get(i).getParentFile().exists()) {
                            targetFiles.get(i).getParentFile().mkdirs(); // 递归创建父类文件夹
                        }
                        allFiles.get(i).getFile().renameTo(targetFiles.get(i));
                    }
                }
                if (SecurityUtils.getSubject().hasRole(WebConfig.ROLE_STUDENT)) {
                    renderJson(new AjaxResult(AjaxResult.CODE_SUCCESS, "上传成功，等待审核..."));
                } else {
                    renderJson(new AjaxResult(AjaxResult.CODE_SUCCESS, "上传成功"));
                }
            } catch (Exception e) {
                e.printStackTrace();
                renderJson(new AjaxResult(AjaxResult.CODE_ERROR, "上传失败"));
            } finally {
                for (int i = 0; i < allFiles.size(); i++) {
                    allFiles.get(i).getFile().delete();
                }
            }
        }
    }

    public void listSubject() {
        int page = getParaToInt("page");
        int limit = getParaToInt("limit");
        String key = getPara("key");
        String order = getPara("order");
        String field = getPara("field");
        String defaultField = "SubjectName";
        Page<Record> p = null;
        p = new DbRecord(DbConfig.T_SUBJECT)
                .whereContains("SubjectName", key)
                .orderBySelect(field, order, defaultField)
                .page(page, limit);

        renderJson(new LayUITableResult<Record>(AjaxResult.CODE_SUCCESS, "", p.getTotalRow(), p.getList()));
    }

    public void video() {
        Integer id = getParaToInt("id");
        Record info = UserService.me.getCurrentUserInfo();
        if(info.getStr("roleNameEn").equals(WebConfig.ROLE_STUDENT)) {
            List<Record> result = new DbRecord(DbConfig.T_SUBJECT)
                    .whereEqualTo("id", id)
                    .query();
            renderJson(result);
        }else{
            renderJson(new AjaxResult(AjaxResult.CODE_ERROR, "登录状态失效，请重新登录"));
        }
    }

    public void delete() {
        final String subjectName = getPara("subjectName");
        boolean recordsDeletionSuccess = true;
        boolean filesDeletionSuccess = true;

        filesDeletionSuccess = UserService.me.deleteSubjectFile(subjectName);
        recordsDeletionSuccess = UserService.me.deleteSubject(subjectName);

        if (recordsDeletionSuccess && filesDeletionSuccess) {
            renderJson(new AjaxResult(AjaxResult.CODE_SUCCESS, "课程信息删除成功，已上传文件清理成功"));
        } else if (!recordsDeletionSuccess && !filesDeletionSuccess) {
            renderJson(new AjaxResult(AjaxResult.CODE_ERROR, "课程信息删除失败，已上传文件清理失败"));
        } else if (recordsDeletionSuccess && !filesDeletionSuccess) {
            renderJson(new AjaxResult(AjaxResult.CODE_ERROR, "课程信息删除成功，已上传文件清理失败"));
        } else if (!recordsDeletionSuccess && filesDeletionSuccess) {
            renderJson(new AjaxResult(AjaxResult.CODE_ERROR, "课程信息删除失败，已上传文件清理成功"));
        }
    }

    public void deleteFile() {
        final Integer[] studentNos = getParaValuesToInt("studentNos[]");
        boolean filesDeletionSuccess = true;

        filesDeletionSuccess = UserService.me.deleteFiles(studentNos, WebConfig.ROLE_STUDENT);

        if (filesDeletionSuccess) {
            renderJson(new AjaxResult(AjaxResult.CODE_SUCCESS, "已上传文件清理成功"));
        } else if (!filesDeletionSuccess) {
            renderJson(new AjaxResult(AjaxResult.CODE_ERROR, "已上传文件清理失败"));
        }
    }
}
