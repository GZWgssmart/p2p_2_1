package com.p2p.bean;
/**
 * Created by 7025 on 2017/12/19.
 * 对应权限
 */
public class Jur {
    private Integer jid;

    private String jurl;

    private String content;

    public Jur(Integer jid, String jurl, String content) {
        this.jid = jid;
        this.jurl = jurl;
        this.content = content;
    }

    public Jur() {
        super();
    }

    public Integer getJid() {
        return jid;
    }

    public void setJid(Integer jid) {
        this.jid = jid;
    }

    public String getJurl() {
        return jurl;
    }

    public void setJurl(String jurl) {
        this.jurl = jurl == null ? null : jurl.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}