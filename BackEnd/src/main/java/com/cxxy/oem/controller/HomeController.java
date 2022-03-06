package com.cxxy.oem.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.cxxy.oem.db.DbConfig;
import com.cxxy.oem.db.DbRecord;
import com.cxxy.oem.model.Inform;
import com.cxxy.oem.model.Picture;
import com.cxxy.oem.validator.ImageAddValidatior;
import com.cxxy.oem.validator.ImageUpdateValidatior;
import com.cxxy.oem.validator.InfomUpdateValidatior;
import com.cxxy.oem.validator.InformAddValidatior;
import com.cxxy.oem.vo.AjaxResult;
import com.cxxy.oem.vo.LayUITableResult;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

public class HomeController extends Controller {

	public void index() {
		List<Record> record = new DbRecord(DbConfig.T_USER_WORK).query();
		List<Record> studentRecord = new DbRecord(DbConfig.V_STUDENT_WORK).whereEqualTo("reviewName", "已审核").query();
		Map<String, Object> attrMap = new HashMap<String, Object>();
		attrMap.put("l_student", studentRecord.size());
		setAttrs(attrMap);
		// System.out.println(record);
		setAttr("image", new DbRecord(DbConfig.T_PICTURE).orderByASC("id").query());
		setAttr("inform", new DbRecord(DbConfig.T_INFORM).orderByASC("id").query());
		//向前端发送全部attribute
		Enumeration<String> names = getAttrNames();
		while (names.hasMoreElements()){
			String name = names.nextElement();
			attrMap.put(name,getAttr(name));
			//System.out.println(name);
		}
		renderJson(new AjaxResult(AjaxResult.CODE_SUCCESS, JSON.toJSONString(attrMap)));
	}

	public void imagelist() {
		Integer page = getParaToInt("page");
		Integer limit = getParaToInt("limit");
		Page<Record> p = new DbRecord(DbConfig.T_PICTURE).orderByASC("id").page(page, limit);
		renderJson(new LayUITableResult<Record>(AjaxResult.CODE_SUCCESS, "", p.getTotalRow(), p.getList()));
	}

	@Before(ImageUpdateValidatior.class)
	public void imageupdate() {
		Integer Id = getParaToInt("id");
		String writing = getPara("writing");
		boolean success = new Picture().setId(Id).setWriting(writing).update();

		if (success) {
			renderJson(new AjaxResult(AjaxResult.CODE_SUCCESS, "更新成功"));
		} else {
			renderJson(new AjaxResult(AjaxResult.CODE_ERROR, "更新失败"));
		}
	}

	@Before(ImageAddValidatior.class)
	public void imageadd() {
		String imageUrl = getPara("imageurl");
		String writing = getPara("imagecontent");
		boolean success = new Picture().setImagePath(imageUrl).setWriting(writing).save();

		if (success) {
			renderJson(new AjaxResult(AjaxResult.CODE_SUCCESS, "添加成功"));
		} else {
			renderJson(new AjaxResult(AjaxResult.CODE_ERROR, "添加失败"));
		}
	}

	public void imagedel() {
		Integer ID = getParaToInt("id");
		boolean success = new Picture().deleteById(ID);

		if (success) {
			renderJson(new AjaxResult(AjaxResult.CODE_SUCCESS, "删除成功"));
		} else {
			renderJson(new AjaxResult(AjaxResult.CODE_ERROR, "删除失败"));
		}
	}

	public void informlist() {
		Integer page = getParaToInt("page");
		Integer limit = getParaToInt("limit");
		Page<Record> p = new DbRecord(DbConfig.T_INFORM).orderByASC("id").page(page, limit);
		renderJson(new LayUITableResult<Record>(AjaxResult.CODE_SUCCESS, "", p.getTotalRow(), p.getList()));
	}

	@Before(InfomUpdateValidatior.class)
	public void informupdate() {
		Integer ID = getParaToInt("id");
		String title = getPara("title");
		String content = getPara("content");
		boolean success = new Inform().setId(ID).setTitle(title).setContent(content).update();

		if (success) {
			renderJson(new AjaxResult(AjaxResult.CODE_SUCCESS, "更新成功"));
		} else {
			renderJson(new AjaxResult(AjaxResult.CODE_ERROR, "更新失败"));
		}
	}

	@Before(InformAddValidatior.class)
	public void informadd() {
		String title = getPara("title");
		String content = getPara("content");
		boolean success = new Inform().setTitle(title).setContent(content).save();

		if (success) {
			renderJson(new AjaxResult(AjaxResult.CODE_SUCCESS, "添加成功"));
		} else {
			renderJson(new AjaxResult(AjaxResult.CODE_ERROR, "添加失败"));
		}
	}

	public void informdel() {
		Integer ID = getParaToInt("id");
		boolean success = new Inform().deleteById(ID);

		if (success) {
			renderJson(new AjaxResult(AjaxResult.CODE_SUCCESS, "删除成功"));
		} else {
			renderJson(new AjaxResult(AjaxResult.CODE_ERROR, "删除失败"));
		}
	}
}
