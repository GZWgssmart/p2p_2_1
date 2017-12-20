package com.p2p.bean;
/**
 * Created by 7025 on 2017/12/19.
 * 对应短信模板
 */
public class Dxmodel {
    private Integer dxid;

    private String content;

    public Dxmodel(Integer dxid, String content) {
        this.dxid = dxid;
        this.content = content;
    }

    public Dxmodel() {
        super();
    }

    public Integer getDxid() {
        return dxid;
    }

    public void setDxid(Integer dxid) {
        this.dxid = dxid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}