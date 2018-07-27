package com.framework.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-25 14:30:01
 */
public class TbMsgConfigEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Integer id;
	//紧急程度
	private String urgencylevel;
	//指派时是否发短信
	private String sfzpsend;
	//提前提醒天数
	private Integer tqday;
	//当天是否提醒
	private String sfdtsend;
	//已查看后是否发短信
	private String sfseesend;
	//已反馈后是否发短信
	private String sffankuisend;

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
	 * 设置：紧急程度
	 */
	public void setUrgencylevel(String urgencylevel) {
		this.urgencylevel = urgencylevel;
	}
	/**
	 * 获取：紧急程度
	 */
	public String getUrgencylevel() {
		return urgencylevel;
	}
	/**
	 * 设置：指派时是否发短信
	 */
	public void setSfzpsend(String sfzpsend) {
		this.sfzpsend = sfzpsend;
	}
	/**
	 * 获取：指派时是否发短信
	 */
	public String getSfzpsend() {
		return sfzpsend;
	}
	/**
	 * 设置：提前提醒天数
	 */
	public void setTqday(Integer tqday) {
		this.tqday = tqday;
	}
	/**
	 * 获取：提前提醒天数
	 */
	public Integer getTqday() {
		return tqday;
	}
	/**
	 * 设置：当天是否提醒
	 */
	public void setSfdtsend(String sfdtsend) {
		this.sfdtsend = sfdtsend;
	}
	/**
	 * 获取：当天是否提醒
	 */
	public String getSfdtsend() {
		return sfdtsend;
	}
	/**
	 * 设置：已查看后是否发短信
	 */
	public void setSfseesend(String sfseesend) {
		this.sfseesend = sfseesend;
	}
	/**
	 * 获取：已查看后是否发短信
	 */
	public String getSfseesend() {
		return sfseesend;
	}
	/**
	 * 设置：已反馈后是否发短信
	 */
	public void setSffankuisend(String sffankuisend) {
		this.sffankuisend = sffankuisend;
	}
	/**
	 * 获取：已反馈后是否发短信
	 */
	public String getSffankuisend() {
		return sffankuisend;
	}
}
