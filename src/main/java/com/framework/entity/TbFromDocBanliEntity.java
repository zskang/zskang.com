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
public class TbFromDocBanliEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//来文id
	private Long fromDocId;
	//办理人员id
	private Long userId;
	//接收时间
	private String receivedtime;
	//是否查阅    0:否 1:是
	private Integer read;
	//是否反馈    0:否 1:是
	private Integer feedback;
	//预留1
	private String spare1;
	//预留3
	private String spare2;
	//备注
	private String comment;
	//文件来源用户id
	private Long fromUserId;
	//指派到的用户id
	private Long toUserId;
	//阅读时间
	private String readtime;
	//反馈时间
	private String feedbacktime;
	//指派时间
	private String sendtime;
	//是否指派   0:否 1:是
	private Integer send;

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
	 * 设置：办理人员id
	 */
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	/**
	 * 获取：办理人员id
	 */
	public Long getUserId() {
		return userId;
	}
	/**
	 * 设置：接收时间
	 */
	public void setReceivedtime(String receivedtime) {
		this.receivedtime = receivedtime;
	}
	/**
	 * 获取：接收时间
	 */
	public String getReceivedtime() {
		return receivedtime;
	}
	/**
	 * 设置：是否查阅    0:否 1:是
	 */
	public void setRead(Integer read) {
		this.read = read;
	}
	/**
	 * 获取：是否查阅    0:否 1:是
	 */
	public Integer getRead() {
		return read;
	}
	/**
	 * 设置：是否反馈    0:否 1:是
	 */
	public void setFeedback(Integer feedback) {
		this.feedback = feedback;
	}
	/**
	 * 获取：是否反馈    0:否 1:是
	 */
	public Integer getFeedback() {
		return feedback;
	}
	/**
	 * 设置：预留1
	 */
	public void setSpare1(String spare1) {
		this.spare1 = spare1;
	}
	/**
	 * 获取：预留1
	 */
	public String getSpare1() {
		return spare1;
	}
	/**
	 * 设置：预留3
	 */
	public void setSpare2(String spare2) {
		this.spare2 = spare2;
	}
	/**
	 * 获取：预留3
	 */
	public String getSpare2() {
		return spare2;
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
	/**
	 * 设置：文件来源用户id
	 */
	public void setFromUserId(Long fromUserId) {
		this.fromUserId = fromUserId;
	}
	/**
	 * 获取：文件来源用户id
	 */
	public Long getFromUserId() {
		return fromUserId;
	}
	/**
	 * 设置：指派到的用户id
	 */
	public void setToUserId(Long toUserId) {
		this.toUserId = toUserId;
	}
	/**
	 * 获取：指派到的用户id
	 */
	public Long getToUserId() {
		return toUserId;
	}
	/**
	 * 设置：阅读时间
	 */
	public void setReadtime(String readtime) {
		this.readtime = readtime;
	}
	/**
	 * 获取：阅读时间
	 */
	public String getReadtime() {
		return readtime;
	}
	/**
	 * 设置：反馈时间
	 */
	public void setFeedbacktime(String feedbacktime) {
		this.feedbacktime = feedbacktime;
	}
	/**
	 * 获取：反馈时间
	 */
	public String getFeedbacktime() {
		return feedbacktime;
	}
	/**
	 * 设置：指派时间
	 */
	public void setSendtime(String sendtime) {
		this.sendtime = sendtime;
	}
	/**
	 * 获取：指派时间
	 */
	public String getSendtime() {
		return sendtime;
	}
	/**
	 * 设置：是否指派   0:否 1:是
	 */
	public void setSend(Integer send) {
		this.send = send;
	}
	/**
	 * 获取：是否指派   0:否 1:是
	 */
	public Integer getSend() {
		return send;
	}
}
