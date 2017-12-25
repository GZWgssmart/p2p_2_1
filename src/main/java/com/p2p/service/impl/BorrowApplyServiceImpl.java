package com.p2p.service.impl;

import com.p2p.common.ServerResponse;
import com.p2p.dao.BorrowApplyMapper;
import com.p2p.service.BorrowApplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

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

    @Override
    public ServerResponse updateChecked(Integer baid, Integer status, Date cktime) {
        if(borrowApplyMapper.updateChecked(baid, status, cktime) == 1) {
            return ServerResponse.createBySuccess("修改成功");
        }
        return ServerResponse.createByError("修改失败");
    }
}
