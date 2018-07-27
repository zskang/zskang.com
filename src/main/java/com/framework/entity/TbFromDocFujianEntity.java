package com.framework.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-04 10:56:24
 */
public class TbFromDocFujianEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//来文附件
	private String fujianFile;
	//
	private Long fromDocId;

	/**
	 * 设置：
	 */
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 获取：
	 */
	public Long getId() {
		return id;
	}
	/**
	 * 设置：来文附件
	 */
	public void setFujianFile(String fujianFile) {
		this.fujianFile = fujianFile;
	}
	/**
	 * 获取：来文附件
	 */
	public String getFujianFile() {
		return fujianFile;
	}
	/**
	 * 设置：
	 */
	public void setFromDocId(Long fromDocId) {
		this.fromDocId = fromDocId;
	}
	/**
	 * 获取：
	 */
	public Long getFromDocId() {
		return fromDocId;
	}
}
