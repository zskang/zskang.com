package com.framework.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-09-19 12:48:24
 */
public class TbTaskSendEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	private String fromname;
	//
	private String toname;
	//
	private String remarkinfo;
	//
	private Date createtime;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFromname() {
		return fromname;
	}

	public void setFromname(String fromname) {
		this.fromname = fromname;
	}

	public String getToname() {
		return toname;
	}

	public void setToname(String toname) {
		this.toname = toname;
	}

	public String getRemarkinfo() {
		return remarkinfo;
	}

	public void setRemarkinfo(String remarkinfo) {
		this.remarkinfo = remarkinfo;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
}
