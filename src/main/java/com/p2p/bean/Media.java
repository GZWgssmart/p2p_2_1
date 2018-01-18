package com.p2p.bean;

import com.fasterxml.jackson.annotation.JsonInclude;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by 7025 on 2017/12/19.
 * 对应媒体文章
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Media {
    private Integer mid;

    private String title;

    private String summary;

    private String content;

    private String pic;

    private String url;

    private Date createdTime;

    public Media(Integer mid, String title, String content, String pic, String url, Date createdTime,String summary) {
        this.mid = mid;
        this.title = title;
        this.content = content;
        this.pic = pic;
        this.url = url;
        this.createdTime = createdTime;
        this.summary=summary;
    }

    public Media() {
        super();
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
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

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
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