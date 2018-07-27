package com.framework.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-08-10 15:50:32
 */
public class TbSendDocEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//登记号
	private String djh;
	//年度
	private String nd;
	//发文时间
	private String fwsj;
	//登记时间
	private String djsj;
	//文号
	private String wh;
	//紧急程度
	private String jjcd;
	//全宗号
	private String qzh;
	//实体分类号
	private String stflh;
	//保管期限
	private String bgqx;
	//题名
	private String timing;
	//责任者
	private String zrz;
	//签发人
	private String qfr;
	//主题词
	private String ztc;
	//类别
	private String lb;
	//密级
	private String mj;
	//页数
	private String yeshu;
	//是否归档
	private String sfgd;
	//主送单位
	private String zsdw;
	//选送单位
	private String xsdw;
	//分发情况
	private String ffqk;
	//穿越情况
	private String cyqk;
	//处理情况
	private String clqk;
	//备注
	private String beizhu;
	//创建时间
	private String createtime;
	//创建人
	private String creator;
	//所属单位id
	private String unitid;
	//状态
	private String status;

	private String doctype;

	public String getDoctype() {
		return doctype;
	}

	public void setDoctype(String doctype) {
		this.doctype = doctype;
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
	 * 设置：登记号
	 */
	public void setDjh(String djh) {
		this.djh = djh;
	}
	/**
	 * 获取：登记号
	 */
	public String getDjh() {
		return djh;
	}
	/**
	 * 设置：年度
	 */
	public void setNd(String nd) {
		this.nd = nd;
	}
	/**
	 * 获取：年度
	 */
	public String getNd() {
		return nd;
	}
	/**
	 * 设置：发文时间
	 */
	public void setFwsj(String fwsj) {
		this.fwsj = fwsj;
	}
	/**
	 * 获取：发文时间
	 */
	public String getFwsj() {
		return fwsj;
	}
	/**
	 * 设置：登记时间
	 */
	public void setDjsj(String djsj) {
		this.djsj = djsj;
	}
	/**
	 * 获取：登记时间
	 */
	public String getDjsj() {
		return djsj;
	}
	/**
	 * 设置：文号
	 */
	public void setWh(String wh) {
		this.wh = wh;
	}
	/**
	 * 获取：文号
	 */
	public String getWh() {
		return wh;
	}
	/**
	 * 设置：紧急程度
	 */
	public void setJjcd(String jjcd) {
		this.jjcd = jjcd;
	}
	/**
	 * 获取：紧急程度
	 */
	public String getJjcd() {
		return jjcd;
	}
	/**
	 * 设置：全宗号
	 */
	public void setQzh(String qzh) {
		this.qzh = qzh;
	}
	/**
	 * 获取：全宗号
	 */
	public String getQzh() {
		return qzh;
	}
	/**
	 * 设置：实体分类号
	 */
	public void setStflh(String stflh) {
		this.stflh = stflh;
	}
	/**
	 * 获取：实体分类号
	 */
	public String getStflh() {
		return stflh;
	}
	/**
	 * 设置：保管期限
	 */
	public void setBgqx(String bgqx) {
		this.bgqx = bgqx;
	}
	/**
	 * 获取：保管期限
	 */
	public String getBgqx() {
		return bgqx;
	}
	/**
	 * 设置：题名
	 */
	public void setTiming(String timing) {
		this.timing = timing;
	}
	/**
	 * 获取：题名
	 */
	public String getTiming() {
		return timing;
	}
	/**
	 * 设置：责任者
	 */
	public void setZrz(String zrz) {
		this.zrz = zrz;
	}
	/**
	 * 获取：责任者
	 */
	public String getZrz() {
		return zrz;
	}
	/**
	 * 设置：签发人
	 */
	public void setQfr(String qfr) {
		this.qfr = qfr;
	}
	/**
	 * 获取：签发人
	 */
	public String getQfr() {
		return qfr;
	}
	/**
	 * 设置：主题词
	 */
	public void setZtc(String ztc) {
		this.ztc = ztc;
	}
	/**
	 * 获取：主题词
	 */
	public String getZtc() {
		return ztc;
	}
	/**
	 * 设置：类别
	 */
	public void setLb(String lb) {
		this.lb = lb;
	}
	/**
	 * 获取：类别
	 */
	public String getLb() {
		return lb;
	}
	/**
	 * 设置：密级
	 */
	public void setMj(String mj) {
		this.mj = mj;
	}
	/**
	 * 获取：密级
	 */
	public String getMj() {
		return mj;
	}
	/**
	 * 设置：页数
	 */
	public void setYeshu(String yeshu) {
		this.yeshu = yeshu;
	}
	/**
	 * 获取：页数
	 */
	public String getYeshu() {
		return yeshu;
	}
	/**
	 * 设置：是否归档
	 */
	public void setSfgd(String sfgd) {
		this.sfgd = sfgd;
	}
	/**
	 * 获取：是否归档
	 */
	public String getSfgd() {
		return sfgd;
	}
	/**
	 * 设置：主送单位
	 */
	public void setZsdw(String zsdw) {
		this.zsdw = zsdw;
	}
	/**
	 * 获取：主送单位
	 */
	public String getZsdw() {
		return zsdw;
	}
	/**
	 * 设置：选送单位
	 */
	public void setXsdw(String xsdw) {
		this.xsdw = xsdw;
	}
	/**
	 * 获取：选送单位
	 */
	public String getXsdw() {
		return xsdw;
	}
	/**
	 * 设置：分发情况
	 */
	public void setFfqk(String ffqk) {
		this.ffqk = ffqk;
	}
	/**
	 * 获取：分发情况
	 */
	public String getFfqk() {
		return ffqk;
	}
	/**
	 * 设置：穿越情况
	 */
	public void setCyqk(String cyqk) {
		this.cyqk = cyqk;
	}
	/**
	 * 获取：穿越情况
	 */
	public String getCyqk() {
		return cyqk;
	}
	/**
	 * 设置：处理情况
	 */
	public void setClqk(String clqk) {
		this.clqk = clqk;
	}
	/**
	 * 获取：处理情况
	 */
	public String getClqk() {
		return clqk;
	}
	/**
	 * 设置：备注
	 */
	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}
	/**
	 * 获取：备注
	 */
	public String getBeizhu() {
		return beizhu;
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
	 * 设置：创建人
	 */
	public void setCreator(String creator) {
		this.creator = creator;
	}
	/**
	 * 获取：创建人
	 */
	public String getCreator() {
		return creator;
	}
	/**
	 * 设置：所属单位id
	 */
	public void setUnitid(String unitid) {
		this.unitid = unitid;
	}
	/**
	 * 获取：所属单位id
	 */
	public String getUnitid() {
		return unitid;
	}
	/**
	 * 设置：状态
	 */
	public void setStatus(String status) {
		this.status = status;
	}
	/**
	 * 获取：状态
	 */
	public String getStatus() {
		return status;
	}
}
