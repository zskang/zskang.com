package com.framework.entity;
import java.io.Serializable;
import java.sql.Blob;
import java.sql.Clob;
import java.util.Date;



/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-15 08:31:10
 */
public class TbTextEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//创建时间
	private String createtime;
	//标题
	private String title;
	//内容
	private String content;

	public String getContentStr() {
		return contentStr;
	}

	public void setContentStr(String contentStr) {
		this.contentStr = contentStr;
	}

	private String contentStr; // 内容 编辑框
	//类型
	private String type;

	private String userid;

	private String image;


	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

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
	 * 设置：标题
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * 获取：标题
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * 设置：内容
	 * @param content
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * 获取：内容
	 */
	public String getContent() {
		return content;
	}
	/**
	 * 设置：类型
	 */
	public void setType(String type) {
		this.type = type;
	}
	/**
	 * 获取：类型
	 */
	public String getType() {
		return type;
	}


	@Override
	public String toString() {
		return "TbTextEntity{" +
				"id=" + id +
				", createtime='" + createtime + '\'' +
				", title='" + title + '\'' +
				", content='" + content + '\'' +
				", contentStr='" + contentStr + '\'' +
				", type='" + type + '\'' +
				'}';
	}
}
