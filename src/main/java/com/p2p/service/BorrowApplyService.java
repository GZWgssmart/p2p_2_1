package com.p2p.service;

import java.util.Date;

public interface BorrowApplyService extends BaseService {

    int updateChecked(Integer baid, Integer status, Date cktime);
}