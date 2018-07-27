package com.framework.entity;

import java.io.Serializable;


/**
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-05 11:38:18
 */
public class TbBanliEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    //
    private Long id;
    //
    private Long docId;
    //1:阅读时间  2  反馈时间 3.指派时间
    private String doTime;
    //1:阅读 2 反馈 3 指派
    private String doType;
    //谁指派
    private String fromUserId;
    //谁来做
    private Long toUserId;
    //备注
    private String remark;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    private String title;


    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    private String uuid;

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
     * 设置：
     */
    public void setDocId(Long docId) {
        this.docId = docId;
    }

    /**
     * 获取：
     */
    public Long getDocId() {
        return docId;
    }

    /**
     * 设置：1:阅读时间  2  反馈时间 3.指派时间
     */
    public void setDoTime(String doTime) {
        this.doTime = doTime;
    }

    /**
     * 获取：1:阅读时间  2  反馈时间 3.指派时间
     */
    public String getDoTime() {
        return doTime;
    }

    /**
     * 设置：1:阅读 2 反馈 3 指派
     */
    public void setDoType(String doType) {
        this.doType = doType;
    }

    /**
     * 获取：1:阅读 2 反馈 3 指派
     */
    public String getDoType() {
        return doType;
    }

    /**
     * 设置：谁指派
     */
    public void setFromUserId(String fromUserId) {
        this.fromUserId = fromUserId;
    }

    /**
     * 获取：谁指派
     */
    public String getFromUserId() {
        return fromUserId;
    }

    /**
     * 设置：谁来做
     */
    public void setToUserId(Long toUserId) {
        this.toUserId = toUserId;
    }

    /**
     * 获取：谁来做
     */
    public Long getToUserId() {
        return toUserId;
    }

    /**
     * 设置：备注
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * 获取：备注
     */
    public String getRemark() {
        return remark;
    }
}
