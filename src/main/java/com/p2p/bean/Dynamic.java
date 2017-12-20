package com.p2p.bean;

import java.util.Date;

/**
 * Created by 7025 on 2017/12/19.
 * 对应公司动态
 */
public class Dynamic {
    private Integer dyid;

    private String title;

    private String content;

    private String pic;

    private Date createdTime;

    public Dynamic(Integer dyid, String title, String content, String pic, Date createdTime) {
        this.dyid = dyid;
        this.title = title;
        this.content = content;
        this.pic = pic;
        this.createdTime = createdTime;
    }

    public Dynamic() {
        super();
    }

    public Integer getDyid() {
        return dyid;
    }

    public void setDyid(Integer dyid) {
        this.dyid = dyid;
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

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic == null ? null : pic.trim();
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }
}