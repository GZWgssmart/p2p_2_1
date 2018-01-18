package com.p2p.bean;

import com.fasterxml.jackson.annotation.JsonInclude;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by 7025 on 2017/12/19.
 * 对应公司动态
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Dynamic {

    private Integer dyid;

    private String title;

    private String summary;

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

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }
}