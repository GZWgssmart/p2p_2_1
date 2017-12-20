package com.p2p.bean;
/**
 * Created by 7025 on 2017/12/19.
 * 对应标种
 */
public class Bz {
    private Integer bzid;

    private String bzname;

    private Integer status;

    public Bz(Integer bzid, String bzname, Integer status) {
        this.bzid = bzid;
        this.bzname = bzname;
        this.status = status;
    }

    public Bz() {
        super();
    }

    public Integer getBzid() {
        return bzid;
    }

    public void setBzid(Integer bzid) {
        this.bzid = bzid;
    }

    public String getBzname() {
        return bzname;
    }

    public void setBzname(String bzname) {
        this.bzname = bzname == null ? null : bzname.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}