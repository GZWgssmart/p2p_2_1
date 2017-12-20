package com.p2p.bean;
/**
 * Created by 7025 on 2017/12/19.
 * 对应用户角色
 */
public class RoleUser {
    private Integer ruid;

    private Integer rid;

    private Integer huid;

    public RoleUser(Integer ruid, Integer rid, Integer huid) {
        this.ruid = ruid;
        this.rid = rid;
        this.huid = huid;
    }

    public RoleUser() {
        super();
    }

    public Integer getRuid() {
        return ruid;
    }

    public void setRuid(Integer ruid) {
        this.ruid = ruid;
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public Integer getHuid() {
        return huid;
    }

    public void setHuid(Integer huid) {
        this.huid = huid;
    }
}