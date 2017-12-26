package com.p2p.service;

import com.p2p.bean.BorrowApply;
import com.p2p.bean.BorrowDetail;
import com.p2p.common.ServerResponse;

import java.util.Date;

public interface BorrowApplyService extends BaseService {

    ServerResponse updateChecked(Integer baid, Integer status, Date cktime);

    ServerResponse saveBorrow(BorrowApply borrowApply, BorrowDetail borrowDetail);
}