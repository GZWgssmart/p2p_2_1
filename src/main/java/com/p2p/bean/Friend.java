package com.p2p.bean;
/**
 * Created by 7025 on 2017/12/19.
 * 对应合作伙伴
 */
public class Friend {
    private Integer fid;

    private String furl;

    private String fpic;

    public Friend(Integer fid, String furl, String fpic) {
        this.fid = fid;
        this.furl = furl;
        this.fpic = fpic;
    }

    public Friend() {
        super();
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public String getFurl() {
        return furl;
    }

    public void setFurl(String furl) {
        this.furl = furl == null ? null : furl.trim();
    }

    public String getFpic() {
        return fpic;
    }

    public void setFpic(String fpic) {
        this.fpic = fpic == null ? null : fpic.trim();
    }
}