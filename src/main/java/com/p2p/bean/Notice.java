package com.p2p.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by 7025 on 2017/12/19.
 * 对应最新公告
 */
public class Notice {
    private Integer nid;

    private String title;

    private String content;

    private Date createdTime;

    public Notice(Integer nid, String title, String content, Date createdTime) {
        this.nid = nid;
        this.title = title;
        this.content = content;
        this.createdTime = createdTime;
    }

    public Notice() {
        super();
    }

    public Integer getNid() {
        return nid;
    }

    public void setNid(Integer nid) {
        this.nid = nid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }
}