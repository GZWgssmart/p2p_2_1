package com.p2p.common;

/**
 * Created by 娃娃鱼 on 2017/12/6.
 */
public enum ControllerEnum {
    
    SUCCESS(0, "success", "成功"),
    FAIL(1, "fail", "失败");

    private int code;
    private String result;
    private String message;
    
    ControllerEnum(int code, String result, String message) {
        this.code = code;
        this.result = result;
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

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }
}
