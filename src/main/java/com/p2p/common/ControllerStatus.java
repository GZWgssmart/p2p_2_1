package com.p2p.common;

import java.io.Serializable;

/**
 * Created by 娃娃鱼 on 2017/11/23.
 */
public class ControllerStatus implements Serializable {
    private String result;
    private String message;
    private int code;

    public ControllerStatus() {
    }

    public ControllerStatus(String result, String message) {
        this.result = result;
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    /**
     * 输出对应的信息
     * @param statusEnum
     * @return
     */
    public static ControllerStatus status(ControllerEnum statusEnum) {
        return new ControllerStatus(statusEnum.getResult(), statusEnum.getMessage());
    }
}
