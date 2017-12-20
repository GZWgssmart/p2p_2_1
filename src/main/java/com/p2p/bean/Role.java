package com.p2p.bean;
/**
 * Created by 7025 on 2017/12/19.
 * 对应权限
 */
public class Role {
    private Integer rid;

    private String rname;

    private String content;

    public Role(Integer rid, String rname, String content) {
        this.rid = rid;
        this.rname = rname;
        this.content = content;
    }

    public Role() {
        super();
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname == null ? null : rname.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}