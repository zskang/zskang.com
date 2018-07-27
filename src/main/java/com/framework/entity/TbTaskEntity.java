package com.framework.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-09-18 15:44:38
 */
public class TbTaskEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//普通，会议，急办，领导交办，督办
	private String tasktype;
	//
	private String title;
	//
	private String content;
	//
	private Date createtime;
	//
	private String extrafile;
	//
	private Long createuserid;

	public String getCreatename() {
		return createname;
	}

	public void setCreatename(String createname) {
		this.createname = createname;
	}

	private String createname;

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
	 * 设置：普通，会议，急办，领导交办，督办
	 */
	public void setTasktype(String tasktype) {
		this.tasktype = tasktype;
	}
	/**
	 * 获取：普通，会议，急办，领导交办，督办
	 */
	public String getTasktype() {
		return tasktype;
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
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	/**
	 * 获取：
	 */
	public Date getCreatetime() {
		return createtime;
	}
	/**
	 * 设置：
	 */
	public void setExtrafile(String extrafile) {
		this.extrafile = extrafile;
	}
	/**
	 * 获取：
	 */
	public String getExtrafile() {
		return extrafile;
	}
	/**
	 * 设置：
	 */
	public void setCreateuserid(Long createuserid) {
		this.createuserid = createuserid;
	}
	/**
	 * 获取：
	 */
	public Long getCreateuserid() {
		return createuserid;
	}
}
