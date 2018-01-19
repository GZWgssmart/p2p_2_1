package com.p2p.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by 7025 on 2017/12/19.
 * 对应前台用户
 */
public class User {
    private Integer uid;

    private String uname;

    private String upwd;

    private String phone;

    private Integer tzm;

    private String zpwd;

    private String idtype;

    private String idno;

    private String email;

    private String rname;

    private Integer tid;

    private String face;

    private Integer sex;

    private Integer isvip;

    private Integer resint1;

    private Integer resint2;

    private Date resstr1;

    private String resstr2;

    public User(Integer uid, String uname, String upwd, String phone, Integer tzm, String zpwd, String idtype, String idno, String email, String rname, Integer tid, String face, Integer sex, Integer isvip, Integer resint1, Integer resint2, Date resstr1, String resstr2) {
        this.uid = uid;
        this.uname = uname;
        this.upwd = upwd;
        this.phone = phone;
        this.tzm = tzm;
        this.zpwd = zpwd;
        this.idtype = idtype;
        this.idno = idno;
        this.email = email;
        this.rname = rname;
        this.tid = tid;
        this.face = face;
        this.sex = sex;
        this.isvip = isvip;
        this.resint1 = resint1;
        this.resint2 = resint2;
        this.resstr1 = resstr1;
        this.resstr2 = resstr2;
    }

    public User() {
        super();
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname == null ? null : uname.trim();
    }

    public String getUpwd() {
        return upwd;
    }

    public void setUpwd(String upwd) {
        this.upwd = upwd == null ? null : upwd.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Integer getTzm() {
        return tzm;
    }

    public void setTzm(Integer tzm) {
        this.tzm = tzm;
    }

    public String getZpwd() {
        return zpwd;
    }

    public void setZpwd(String zpwd) {
        this.zpwd = zpwd == null ? null : zpwd.trim();
    }

    public String getIdtype() {
        return idtype;
    }

    public void setIdtype(String idtype) {
        this.idtype = idtype == null ? null : idtype.trim();
    }

    public String getIdno() {
        return idno;
    }

    public void setIdno(String idno) {
        this.idno = idno == null ? null : idno.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname == null ? null : rname.trim();
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public String getFace() {
        return face;
    }

    public void setFace(String face) {
        this.face = face == null ? null : face.trim();
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Integer getIsvip() {
        return isvip;
    }

    public void setIsvip(Integer isvip) {
        this.isvip = isvip;
    }

    public Integer getResint1() {
        return resint1;
    }

    public void setResint1(Integer resint1) {
        this.resint1 = resint1;
    }

    public Integer getResint2() {
        return resint2;
    }

    public void setResint2(Integer resint2) {
        this.resint2 = resint2;
    }

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    public Date getResstr1() {
        return resstr1;
    }

    public void setResstr1(Date resstr1) {
        this.resstr1 = resstr1;
    }

    public String getResstr2() {
        return resstr2;
    }

    public void setResstr2(String resstr2) {
        this.resstr2 = resstr2 == null ? null : resstr2.trim();
    }
}