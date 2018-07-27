package com.framework.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-09-19 16:12:29
 */
public class TbTaskSendInfoEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long staticid;

	//
	private Long mryscount;
	//
	private Long mzywcount;
	//
	private String staticname;

	private String unitname;

	public String getUnitname() {
		return unitname;
	}

	public void setUnitname(String unitname) {
		this.unitname = unitname;
	}

	public Long getStaticid() {
		return staticid;
	}

	public void setStaticid(Long staticid) {
		this.staticid = staticid;
	}

	public Long getMryscount() {
		return mryscount;
	}

	public void setMryscount(Long mryscount) {
		this.mryscount = mryscount;
	}

	public Long getMzywcount() {
		return mzywcount;
	}

	public void setMzywcount(Long mzywcount) {
		this.mzywcount = mzywcount;
	}

	public String getStaticname() {
		return staticname;
	}

	public void setStaticname(String staticname) {
		this.staticname = staticname;
	}
}
