package com.cxxy.oem.validator;

import com.cxxy.oem.vo.AjaxResult;
import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

import java.util.Date;

public class SubjectValidator extends Validator {

	@Override
	protected void validate(Controller c) {
		setShortCircuit(true);
		if (c.getFile("file") == null) {
			addError("msg", "请选择上传视频");
		}
		validateRequiredString("SubjectName", "msg", "请输入章节名称");
	}

	@Override
	protected void handleError(Controller c) {
		c.renderJson(new AjaxResult(AjaxResult.CODE_ERROR, c.getAttrForStr("msg")));
	}

}
