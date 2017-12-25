package com.p2p.service;

import com.p2p.common.ServerResponse;

import java.util.Date;

public interface BorrowApplyService extends BaseService {

    ServerResponse updateChecked(Integer baid, Integer status, Date cktime);
}