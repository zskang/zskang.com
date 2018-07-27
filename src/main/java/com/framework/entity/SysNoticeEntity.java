package com.framework.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-06-30 19:46:28
 */
public class SysNoticeEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Integer id;
	//
	private String title;
	//
	private String content;
	//
	private String fbsj;
	//
	private Integer fbrid;
	//
	private Integer fbunitid;
	//
	private String state;
	//
	private String type;

	/**
	 * 设置：
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * 获取：
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * 设置：
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * 获取：
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * 设置：
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * 获取：
	 */
	public String getContent() {
		return content;
	}
	/**
	 * 设置：
	 */
	public void setFbsj(String fbsj) {
		this.fbsj = fbsj;
	}
	/**
	 * 获取：
	 */
	public String getFbsj() {
		return fbsj;
	}
	/**
	 * 设置：
	 */
	public void setFbrid(Integer fbrid) {
		this.fbrid = fbrid;
	}
	/**
	 * 获取：
	 */
	public Integer getFbrid() {
		return fbrid;
	}
	/**
	 * 设置：
	 */
	public void setFbunitid(Integer fbunitid) {
		this.fbunitid = fbunitid;
	}
	/**
	 * 获取：
	 */
	public Integer getFbunitid() {
		return fbunitid;
	}
	/**
	 * 设置：
	 */
	public void setState(String state) {
		this.state = state;
	}
	/**
	 * 获取：
	 */
	public String getState() {
		return state;
	}
	/**
	 * 设置：
	 */
	public void setType(String type) {
		this.type = type;
	}
	/**
	 * 获取：
	 */
	public String getType() {
		return type;
	}
}
