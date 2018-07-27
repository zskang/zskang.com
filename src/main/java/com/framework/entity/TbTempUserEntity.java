package com.framework.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-09-09 01:30:34
 */
public class TbTempUserEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	//
	private Long id;
	//
	private Long userid;
	//
	private String username;
	//
	private String xm;
	//
	private String mobile;
	//
	private String status;
	//
	private String unitid;
	//
	private String docid;

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	private  String uname;

	/**
	 * 设置：
	 */
	public void setUserid(Long userid) {
		this.userid = userid;
	}
	/**
	 * 获取：
	 */
	public Long getUserid() {
		return userid;
	}
	/**
	 * 设置：
	 */
	public void setUsername(String username) {
		this.username = username;
	}
	/**
	 * 获取：
	 */
	public String getUsername() {
		return username;
	}
	/**
	 * 设置：
	 */
	public void setXm(String xm) {
		this.xm = xm;
	}
	/**
	 * 获取：
	 */
	public String getXm() {
		return xm;
	}
	/**
	 * 设置：
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	/**
	 * 获取：
	 */
	public String getMobile() {
		return mobile;
	}
	/**
	 * 设置：
	 */
	public void setStatus(String status) {
		this.status = status;
	}
	/**
	 * 获取：
	 */
	public String getStatus() {
		return status;
	}
	/**
	 * 设置：
	 */
	public void setUnitid(String unitid) {
		this.unitid = unitid;
	}
	/**
	 * 获取：
	 */
	public String getUnitid() {
		return unitid;
	}
	/**
	 * 设置：
	 */
	public void setDocid(String docid) {
		this.docid = docid;
	}
	/**
	 * 获取：
	 */
	public String getDocid() {
		return docid;
	}
}
