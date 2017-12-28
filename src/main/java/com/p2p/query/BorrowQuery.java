package com.p2p.query;

/**
 * Created by 7025 on 2017/12/26.
 */
public class BorrowQuery {

    private Integer uid;

    private Integer ckstatus;

    private Integer term;

    private Integer bzid;

    private Float nprofitMin;

    private Float nprofitMax;

    private String cpname;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getCkstatus() {
        return ckstatus;
    }

    public void setCkstatus(Integer ckstatus) {
        this.ckstatus = ckstatus;
    }

    public Integer getTerm() {
        return term;
    }

    public void setTerm(Integer term) {
        this.term = term;
    }

    public Integer getBzid() {
        return bzid;
    }

    public void setBzid(Integer bzid) {
        this.bzid = bzid;
    }

    public Float getNprofitMin() {
        return nprofitMin;
    }

    public void setNprofitMin(Float nprofitMin) {
        this.nprofitMin = nprofitMin;
    }

    public Float getNprofitMax() {
        return nprofitMax;
    }

    public void setNprofitMax(Float nprofitMax) {
        this.nprofitMax = nprofitMax;
    }

    public String getCpname() {
        return cpname;
    }

    public void setCpname(String cpname) {
        this.cpname = cpname;
    }
}
