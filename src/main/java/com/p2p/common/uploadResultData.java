package com.p2p.common;

/**
 * Created by 娃娃鱼 on 2017/12/16.
 */
public class uploadResultData {

    private String src;
    private String title;

    public uploadResultData() {

    }

    public uploadResultData(String src, String title) {
        this.src = src;
        this.title = title;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
