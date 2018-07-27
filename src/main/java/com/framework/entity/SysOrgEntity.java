package com.framework.entity;

import java.io.Serializable;

public class SysOrgEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 机构ID
	 */
	private Long id;
	/**
	 * 机构名称
	 */
	private String name;
	/**
	 * 机构代码
	 */
	private String code;
	/**
	 * 机构联系人
	 */
	private String contact;
	/**
	 * 机构联系电话
	 */
	private String mobile;
	/**
	 * 机构地址
	 */
	private String address;
	/**
	 * 机构联系邮箱
	 */
	private String email;
	/**
	 * 机构网址
	 */
	private String web;
	/**
	 * 机构所属父级id
	 */
	private Long pId;
	/**
	 * 机构是否有子机构
	 */
	private int hasChildren;

	/**
	 * 机构所属系统
	 */
	private int system;
	/**
	 * 机构可用状态
	 */
	private int enabled;
	/**
	 * 机构创建时间
	 */
	private String createTime;
	/**
	 * 机构类型
	 */
	private String type;
	
	private Boolean open;
	
	private Integer orderNum;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getWeb() {
		return web;
	}

	public void setWeb(String web) {
		this.web = web;
	}

	public Long getPId() {
		return pId;
	}

	public void setPId(Long pId) {
		this.pId = pId;
	}

	public int getHasChildren() {
		return hasChildren;
	}

	public void setHasChildren(int hasChildren) {
		this.hasChildren = hasChildren;
	}

	public int getSystem() {
		return system;
	}

	public void setSystem(int system) {
		this.system = system;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}


	public Boolean getOpen() {
		return open;
	}

	public void setOpen(Boolean open) {
		this.open = open;
	}

	public Integer getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(Integer orderNum) {
		this.orderNum = orderNum;
	}

 
}
