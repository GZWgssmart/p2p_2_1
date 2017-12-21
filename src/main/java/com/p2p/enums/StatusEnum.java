package com.p2p.enums;

/**
 * Created by 7025 on 2017/12/21.
 */
public enum StatusEnum {

    ACTIVE(1,"激活"),
    FREEZE(0,"冻结");

    private int code;
    private String message;

    StatusEnum(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
