package com.framework.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-01 10:00:12
 */
public class TbFromUnitEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//主键
	private Integer id;
	//单位名称
	private String dwmc;
	//单位编号
	private String dwcode;
	//备注
	private String remark;

	/**
	 * 设置：主键
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * 获取：主键
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * 设置：单位名称
	 */
	public void setDwmc(String dwmc) {
		this.dwmc = dwmc;
	}
	/**
	 * 获取：单位名称
	 */
	public String getDwmc() {
		return dwmc;
	}
	/**
	 * 设置：单位编号
	 */
	public void setDwcode(String dwcode) {
		this.dwcode = dwcode;
	}
	/**
	 * 获取：单位编号
	 */
	public String getDwcode() {
		return dwcode;
	}
	/**
	 * 设置：备注
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	/**
	 * 获取：备注
	 */
	public String getRemark() {
		return remark;
	}
}
