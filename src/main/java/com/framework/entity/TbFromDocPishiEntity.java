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
public class TbFromDocPishiEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//来文id
	private Long fromDocId;
	//领导id
	private Long userId;
	//创建日期
	private String createTime;
	//是否批示
	private String pishi;
	//备注
	private String comment;

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
	 * 设置：来文id
	 */
	public void setFromDocId(Long fromDocId) {
		this.fromDocId = fromDocId;
	}
	/**
	 * 获取：来文id
	 */
	public Long getFromDocId() {
		return fromDocId;
	}
	/**
	 * 设置：领导id
	 */
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	/**
	 * 获取：领导id
	 */
	public Long getUserId() {
		return userId;
	}
	/**
	 * 设置：创建日期
	 */
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	/**
	 * 获取：创建日期
	 */
	public String getCreateTime() {
		return createTime;
	}
	/**
	 * 设置：是否批示
	 */
	public void setPishi(String pishi) {
		this.pishi = pishi;
	}
	/**
	 * 获取：是否批示
	 */
	public String getPishi() {
		return pishi;
	}
	/**
	 * 设置：备注
	 */
	public void setComment(String comment) {
		this.comment = comment;
	}
	/**
	 * 获取：备注
	 */
	public String getComment() {
		return comment;
	}
}
