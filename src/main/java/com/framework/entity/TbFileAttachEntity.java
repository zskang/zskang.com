package com.framework.entity;

import java.io.Serializable;



/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-03 09:06:47
 */
public class TbFileAttachEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Integer id;
	//文件名称
	private String filename;
	//文件路径
	private String filepath;
	//业务id
	private String ywid;
	//创建时间
	private String createtime;
	//文件类型
	private String filetype;
	//状态
	private Integer state;

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
	 * 设置：文件名称
	 */
	public void setFilename(String filename) {
		this.filename = filename;
	}
	/**
	 * 获取：文件名称
	 */
	public String getFilename() {
		return filename;
	}
	/**
	 * 设置：文件路径
	 */
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	/**
	 * 获取：文件路径
	 */
	public String getFilepath() {
		return filepath;
	}
	/**
	 * 设置：业务id
	 */
	public void setYwid(String ywid) {
		this.ywid = ywid;
	}
	/**
	 * 获取：业务id
	 */
	public String getYwid() {
		return ywid;
	}
	/**
	 * 设置：创建时间
	 */
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	/**
	 * 获取：创建时间
	 */
	public String getCreatetime() {
		return createtime;
	}
	/**
	 * 设置：文件类型
	 */
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	/**
	 * 获取：文件类型
	 */
	public String getFiletype() {
		return filetype;
	}
	/**
	 * 设置：状态
	 */
	public void setState(Integer state) {
		this.state = state;
	}
	/**
	 * 获取：状态
	 */
	public Integer getState() {
		return state;
	}
}
