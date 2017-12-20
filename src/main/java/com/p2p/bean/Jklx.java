package com.p2p.bean;
/**
 * Created by 7025 on 2017/12/19.
 * 对应借款类型
 */
public class Jklx {
    private Integer lxid;

    private String lxname;

    private Integer status;

    public Jklx(Integer lxid, String lxname, Integer status) {
        this.lxid = lxid;
        this.lxname = lxname;
        this.status = status;
    }

    public Jklx() {
        super();
    }

    public Integer getLxid() {
        return lxid;
    }

    public void setLxid(Integer lxid) {
        this.lxid = lxid;
    }

    public String getLxname() {
        return lxname;
    }

    public void setLxname(String lxname) {
        this.lxname = lxname == null ? null : lxname.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}