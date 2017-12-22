package com.p2p.service.impl;

import com.p2p.dao.BorrowApplyMapper;
import com.p2p.service.BorrowApplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 7025 on 2017/12/21.
 */
@Service
public class BorrowApplyServiceImpl extends AbstractServiceImpl implements BorrowApplyService {

    private BorrowApplyMapper borrowApplyMapper;

    @Autowired
    public void setBorrowApplyMapper(BorrowApplyMapper borrowApplyMapper) {
        super.setBaseDAO(borrowApplyMapper);
        this.borrowApplyMapper = borrowApplyMapper;
    }
}
