package com.p2p.common;

import java.util.List;

/**
 * @author 娃娃鱼
 */
public class Pager {

    private Integer pageNo;
    private Integer pageSize;

    private List<Object> rows;
    private Long total;

    private Long pages;

    private Integer status;
    private String message;

    public Pager() {
    }

    public Pager(Integer pageNo, Integer pageSize) {
        this.pageNo = pageNo;
        this.pageSize = pageSize;
    }

    public Integer getPageNo() {
        return pageNo;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public List<Object> getRows() {
        return rows;
    }

    public void setRows(List<Object> rows) {
        this.rows = rows;
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }

    public Long getPages() {
        return total % pageSize == 0 ? total / pageSize : total / pageSize + 1;
    }

    public void setPages(Long pages) {
        this.pages = pages;
    }

    public Integer getStatus() {
        return 0;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMessage() {
        return "pager";
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Integer getBeginIndex() {
        return (pageNo - 1) * pageSize;
    }

}
