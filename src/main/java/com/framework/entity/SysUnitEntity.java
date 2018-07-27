package com.framework.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 系统机构表
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-06-30 19:25:19
 */
public class SysUnitEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//
	private String name;
	//
	private String code;
	//联系人
	private String contact;
	//
	private String mobile;
	//
	private String address;
	//
	private String email;
	//
	private String web;
	//
	private String parentid;
	//
	private Integer haschildren;
	//
	private Integer system;
	//
	private Integer enabled;
	//
	private String createtime;
	//
	private String type;

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
	 * 设置：
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：
	 */
	public String getName() {
		return name;
	}
	/**
	 * 设置：
	 */
	public void setCode(String code) {
		this.code = code;
	}
	/**
	 * 获取：
	 */
	public String getCode() {
		return code;
	}
	/**
	 * 设置：联系人
	 */
	public void setContact(String contact) {
		this.contact = contact;
	}
	/**
	 * 获取：联系人
	 */
	public String getContact() {
		return contact;
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
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	 * 获取：
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * 设置：
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * 获取：
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * 设置：
	 */
	public void setWeb(String web) {
		this.web = web;
	}
	/**
	 * 获取：
	 */
	public String getWeb() {
		return web;
	}
	/**
	 * 设置：
	 */
	public void setParentid(String parentid) {
		this.parentid = parentid;
	}
	/**
	 * 获取：
	 */
	public String getParentid() {
		return parentid;
	}
	/**
	 * 设置：
	 */
	public void setHaschildren(Integer haschildren) {
		this.haschildren = haschildren;
	}
	/**
	 * 获取：
	 */
	public Integer getHaschildren() {
		return haschildren;
	}
	/**
	 * 设置：
	 */
	public void setSystem(Integer system) {
		this.system = system;
	}
	/**
	 * 获取：
	 */
	public Integer getSystem() {
		return system;
	}
	/**
	 * 设置：
	 */
	public void setEnabled(Integer enabled) {
		this.enabled = enabled;
	}
	/**
	 * 获取：
	 */
	public Integer getEnabled() {
		return enabled;
	}
	/**
	 * 设置：
	 */
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	/**
	 * 获取：
	 */
	public String getCreatetime() {
		return createtime;
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
