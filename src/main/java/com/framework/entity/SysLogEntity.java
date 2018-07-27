package com.framework.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-09-07 00:40:30
 */
public class SysLogEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Integer id;
	//
	private String clientip;
	//
	private String operatecontent;
	//
	private String operatemodule;
	//
	private String operateresult;
	//
	private Date operatetime;
	//
	private String operatetype;
	//
	private String username;
	//
	private String operatemodulename;

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
	public void setClientip(String clientip) {
		this.clientip = clientip;
	}
	/**
	 * 获取：
	 */
	public String getClientip() {
		return clientip;
	}
	/**
	 * 设置：
	 */
	public void setOperatecontent(String operatecontent) {
		this.operatecontent = operatecontent;
	}
	/**
	 * 获取：
	 */
	public String getOperatecontent() {
		return operatecontent;
	}
	/**
	 * 设置：
	 */
	public void setOperatemodule(String operatemodule) {
		this.operatemodule = operatemodule;
	}
	/**
	 * 获取：
	 */
	public String getOperatemodule() {
		return operatemodule;
	}
	/**
	 * 设置：
	 */
	public void setOperateresult(String operateresult) {
		this.operateresult = operateresult;
	}
	/**
	 * 获取：
	 */
	public String getOperateresult() {
		return operateresult;
	}
	/**
	 * 设置：
	 */
	public void setOperatetime(Date operatetime) {
		this.operatetime = operatetime;
	}
	/**
	 * 获取：
	 */
	public Date getOperatetime() {
		return operatetime;
	}
	/**
	 * 设置：
	 */
	public void setOperatetype(String operatetype) {
		this.operatetype = operatetype;
	}
	/**
	 * 获取：
	 */
	public String getOperatetype() {
		return operatetype;
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
	public void setOperatemodulename(String operatemodulename) {
		this.operatemodulename = operatemodulename;
	}
	/**
	 * 获取：
	 */
	public String getOperatemodulename() {
		return operatemodulename;
	}
}
