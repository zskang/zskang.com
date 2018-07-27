package com.framework.entity;

import java.io.Serializable;
import java.util.List;


/**
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-01 11:56:00
 */
public class TbFromDocEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    public String getUnitid() {
        return unitid;
    }

    public void setUnitid(String unitid) {
        this.unitid = unitid;
    }

    //
    private  String unitid;

    private Long fromDocId;
    //年度
    private String years;
    private String createtime;
    private String regisnumber;

    private String receiveddate;

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getRegisnumber() {
        return regisnumber;
    }

    public void setRegisnumber(String regisnumber) {
        this.regisnumber = regisnumber;
    }

    //登记号
    //文号
    private String filenumber;
    //紧急程度
    private String urgencylevel;
    //紧急程度
    private String urgencylevelCode;
    //全案号
    private String fondsnumber;
    //实体分类号
    private String entityclassnumber;
    //保管期限
    private String storageperiod;
    //题名
    private String title;
    //来文机关
    private String fromdepartment;
    //主题词
    private String subjectword;
    //文件份数
    private String count;
    //密级
    private String secretlevel;
    //页数
    private String pagenumber;
    //文件序号
    private String filesequence;
    //办文编号
    private String transactnumber;
    //完成时间
    private String finishdate;
    //文件类型
    private String filetype;
    private String uuid;

    private String ldArr;

    public String getLdArr() {
        return ldArr;
    }

    public void setLdArr(String ldArr) {
        this.ldArr = ldArr;
    }

    public Long getFromDocId() {
        return fromDocId;
    }

    public void setFromDocId(Long fromDocId) {
        this.fromDocId = fromDocId;
    }


    public String getYears() {
        return years;
    }

    public void setYears(String years) {
        this.years = years;
    }


    public String getFilenumber() {
        return filenumber;
    }

    public void setFilenumber(String filenumber) {
        this.filenumber = filenumber;
    }


    public String getUrgencylevel() {
        return urgencylevel;
    }

    public void setUrgencylevel(String urgencylevel) {
        this.urgencylevel = urgencylevel;
    }

    public String getFondsnumber() {
        return fondsnumber;
    }

    public void setFondsnumber(String fondsnumber) {
        this.fondsnumber = fondsnumber;
    }

    public String getEntityclassnumber() {
        return entityclassnumber;
    }

    public void setEntityclassnumber(String entityclassnumber) {
        this.entityclassnumber = entityclassnumber;
    }

    public String getStorageperiod() {
        return storageperiod;
    }

    public void setStorageperiod(String storageperiod) {
        this.storageperiod = storageperiod;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFromdepartment() {
        return fromdepartment;
    }

    public void setFromdepartment(String fromdepartment) {
        this.fromdepartment = fromdepartment;
    }

    public String getSubjectword() {
        return subjectword;
    }

    public void setSubjectword(String subjectword) {
        this.subjectword = subjectword;
    }

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }

    public String getSecretlevel() {
        return secretlevel;
    }

    public void setSecretlevel(String secretlevel) {
        this.secretlevel = secretlevel;
    }

    public String getPagenumber() {
        return pagenumber;
    }

    public void setPagenumber(String pagenumber) {
        this.pagenumber = pagenumber;
    }

    public String getFilesequence() {
        return filesequence;
    }

    public void setFilesequence(String filesequence) {
        this.filesequence = filesequence;
    }

    public String getTransactnumber() {
        return transactnumber;
    }

    public void setTransactnumber(String transactnumber) {
        this.transactnumber = transactnumber;
    }

    public String getFinishdate() {
        return finishdate;
    }

    public void setFinishdate(String finishdate) {
        this.finishdate = finishdate;
    }

    public String getFiletype() {
        return filetype;
    }

    public void setFiletype(String filetype) {
        this.filetype = filetype;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getReceiveddate() {
        return receiveddate;
    }

    public void setReceiveddate(String receiveddate) {
        this.receiveddate = receiveddate;
    }

    public String getUrgencylevelCode() {
        return urgencylevelCode;
    }

    public void setUrgencylevelCode(String urgencylevelCode) {
        this.urgencylevelCode = urgencylevelCode;
    }
}
