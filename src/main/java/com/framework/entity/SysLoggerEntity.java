package com.framework.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-02 23:13:37
 */
public class SysLoggerEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//日志主键
	private Integer id;
	//日志时间
	private String logTime;
	//用户
	private Integer userId;
	//表名
	private String tableName;
	//操作类型
	private Integer handleType;
	//操作数据条数
	private Integer handleRows;
	//明细
	private String details;
	//日志类型
	private Integer logType;

	/**
	 * 设置：日志主键
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * 获取：日志主键
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * 设置：日志时间
	 */
	public void setLogTime(String logTime) {
		this.logTime = logTime;
	}
	/**
	 * 获取：日志时间
	 */
	public String getLogTime() {
		return logTime;
	}
	/**
	 * 设置：用户
	 */
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	/**
	 * 获取：用户
	 */
	public Integer getUserId() {
		return userId;
	}
	/**
	 * 设置：表名
	 */
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	/**
	 * 获取：表名
	 */
	public String getTableName() {
		return tableName;
	}
	/**
	 * 设置：操作类型
	 */
	public void setHandleType(Integer handleType) {
		this.handleType = handleType;
	}
	/**
	 * 获取：操作类型
	 */
	public Integer getHandleType() {
		return handleType;
	}
	/**
	 * 设置：操作数据条数
	 */
	public void setHandleRows(Integer handleRows) {
		this.handleRows = handleRows;
	}
	/**
	 * 获取：操作数据条数
	 */
	public Integer getHandleRows() {
		return handleRows;
	}
	/**
	 * 设置：明细
	 */
	public void setDetails(String details) {
		this.details = details;
	}
	/**
	 * 获取：明细
	 */
	public String getDetails() {
		return details;
	}
	/**
	 * 设置：日志类型
	 */
	public void setLogType(Integer logType) {
		this.logType = logType;
	}
	/**
	 * 获取：日志类型
	 */
	public Integer getLogType() {
		return logType;
	}
}
