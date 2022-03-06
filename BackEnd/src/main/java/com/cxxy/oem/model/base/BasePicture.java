package com.cxxy.oem.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings({"serial", "unchecked"})
public abstract class BasePicture<M extends BasePicture<M>> extends Model<M> implements IBean {

	public M setId(java.lang.Integer id) {
		set("id", id);
		return (M)this;
	}
	
	public java.lang.Integer getId() {
		return getInt("id");
	}

	public M setImagePath(java.lang.String imagePath) {
		set("imagePath", imagePath);
		return (M)this;
	}
	
	public java.lang.String getImagePath() {
		return getStr("imagePath");
	}

	public M setWriting(java.lang.String writing) {
		set("writing", writing);
		return (M)this;
	}
	
	public java.lang.String getWriting() {
		return getStr("writing");
	}

}