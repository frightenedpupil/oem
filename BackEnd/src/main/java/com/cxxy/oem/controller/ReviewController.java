package com.cxxy.oem.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.cxxy.oem.validator.ReviewValidator;
import com.jfinal.aop.Before;
import org.apache.shiro.SecurityUtils;

import com.cxxy.oem.common.WebConfig;
import com.cxxy.oem.db.DbConfig;
import com.cxxy.oem.db.DbRecord;
import com.cxxy.oem.service.UserService;
import com.cxxy.oem.vo.AjaxResult;
import com.cxxy.oem.vo.LayUITableResult;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

public class ReviewController extends Controller {

    public void index() {
//		setAttr("grade", new DbRecord(DbConfig.T_GRADE).query());
//		setAttr("major", new DbRecord(DbConfig.T_MAJOR).query());
//		renderTemplate("review.html");
        Map<String, Object> attrMap = new HashMap<String, Object>();
        attrMap.put("grade", new DbRecord(DbConfig.T_GRADE).query());
        attrMap.put("major", new DbRecord(DbConfig.T_MAJOR).query());
        renderJson(new AjaxResult(AjaxResult.CODE_SUCCESS, JSON.toJSONString(attrMap)));
    }

    public void list() {
        Integer page = getParaToInt("page");
        Integer limit = getParaToInt("limit");
        String order = getPara("order");
        String field = getPara("field");
        String defaultField = "createAt";
        Integer gradeId = getParaToInt("gradeId");
        Integer majorId = getParaToInt("majorId");
        Integer classId = getParaToInt("classId");
        String keyUsername = getPara("keyUsername");
        String keyName = getPara("keyName");
        String keyWorkName = getPara("keyWorkName");

        Record info = UserService.me.getCurrentUserInfo();
        if (info.getStr("roleNameEn").equals(WebConfig.ROLE_ADMIN)) {
            Page<Record> p = new DbRecord(DbConfig.V_STUDENT_WORK)
                    .whereEqualTo("gradeId", gradeId)
                    .whereEqualTo("majorId", majorId)
                    .whereEqualTo("classId", classId)
                    .whereEqualTo("username", keyUsername)
                    .whereContains("WorkName", keyWorkName)
                    .whereContains("name", keyName)
                    .orderBySelect(field, order, defaultField)
                    .page(page, limit);
            renderJson(new LayUITableResult<Record>(AjaxResult.CODE_SUCCESS, "", p.getTotalRow(), p.getList()));
        } else {
            Page<Record> p = new DbRecord(DbConfig.V_STUDENT_WORK_TEACHER)
                    .whereEqualTo("teacherId", (String) SecurityUtils.getSubject().getPrincipal())
                    .whereEqualTo("gradeId", gradeId)
                    .whereEqualTo("majorId", majorId)
                    .whereEqualTo("classId", classId)
                    .whereEqualTo("username", keyUsername)
                    .whereContains("WorkName", keyWorkName)
                    .whereContains("name", keyName)
                    .orderBySelect(field, order, defaultField)
                    .page(page, limit);
            renderJson(new LayUITableResult<Record>(AjaxResult.CODE_SUCCESS, "", p.getTotalRow(), p.getList()));
        }
    }

    @Before(ReviewValidator.class)
    public void review() {
        Integer id = getParaToInt("id");
        Integer score = getParaToInt("score");
        Integer scoretype = getParaToInt("scoreType");
        Record r = new DbRecord(DbConfig.T_USER_WORK).whereEqualTo("id", id).queryFirst();
        r.set("reviewId", WebConfig.REVIEW_PASS);
        r.set("reviewAt", new Date(System.currentTimeMillis()));
        r.set("score", score);
        r.set("scoreType", scoretype);
        if (Db.update(DbConfig.T_USER_WORK, "id", r)) {
            renderJson(new AjaxResult(AjaxResult.CODE_SUCCESS, "????????????"));
        } else {
            renderJson(new AjaxResult(AjaxResult.CODE_SUCCESS, "????????????"));
        }
    }


//	public void detail() {
//		int id = getParaToInt("id");
//		redirect("/oem/detail-stu?id=" + id);
//	}

}
