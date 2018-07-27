package com.framework.entity;

import java.io.Serializable;



/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-22 21:50:50
 */
public class TbMsgLogEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//接受人
	private String touserid;
	//短信发送时间
	private String sendtime;
	//发送结果
	private String result;
	//文件
	private String docuuid;
	//类型
	private String typ;
	//扩展字段
	private String ext1;

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
	 * 设置：接受人
	 */
	public void setTouserid(String touserid) {
		this.touserid = touserid;
	}
	/**
	 * 获取：接受人
	 */
	public String getTouserid() {
		return touserid;
	}
	/**
	 * 设置：短信发送时间
	 */
	public void setSendtime(String sendtime) {
		this.sendtime = sendtime;
	}
	/**
	 * 获取：短信发送时间
	 */
	public String getSendtime() {
		return sendtime;
	}
	/**
	 * 设置：发送结果
	 */
	public void setResult(String result) {
		this.result = result;
	}
	/**
	 * 获取：发送结果
	 */
	public String getResult() {
		return result;
	}
	/**
	 * 设置：文件
	 */
	public void setDocuuid(String docuuid) {
		this.docuuid = docuuid;
	}
	/**
	 * 获取：文件
	 */
	public String getDocuuid() {
		return docuuid;
	}
	/**
	 * 设置：类型
	 */
	public void setTyp(String typ) {
		this.typ = typ;
	}
	/**
	 * 获取：类型
	 */
	public String getTyp() {
		return typ;
	}
	/**
	 * 设置：扩展字段
	 */
	public void setExt1(String ext1) {
		this.ext1 = ext1;
	}
	/**
	 * 获取：扩展字段
	 */
	public String getExt1() {
		return ext1;
	}
}
