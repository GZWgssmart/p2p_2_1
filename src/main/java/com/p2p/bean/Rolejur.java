package com.p2p.bean;
/**
 * Created by 7025 on 2017/12/19.
 * 对应角色权限
 */
public class Rolejur {
    private Integer rjid;

    private Integer rid;

    private Integer jid;

    public Rolejur(Integer rjid, Integer rid, Integer jid) {
        this.rjid = rjid;
        this.rid = rid;
        this.jid = jid;
    }

    public Rolejur() {
        super();
    }

    public Integer getRjid() {
        return rjid;
    }

    public void setRjid(Integer rjid) {
        this.rjid = rjid;
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public Integer getJid() {
        return jid;
    }

    public void setJid(Integer jid) {
        this.jid = jid;
    }
}