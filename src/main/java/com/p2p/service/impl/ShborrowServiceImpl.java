package com.p2p.service.impl;

import com.p2p.bean.Shborrow;
import com.p2p.common.ServerResponse;
import com.p2p.dao.BorrowApplyMapper;
import com.p2p.dao.ShborrowMapper;
import com.p2p.enums.BorrowStatusEnum;
import com.p2p.service.ShborrowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Calendar;

/**
 * Created by 7025 on 2017/12/25.
 */
@Service
public class ShborrowServiceImpl extends AbstractServiceImpl implements ShborrowService {

    private ShborrowMapper shborrowMapper;
    private BorrowApplyMapper borrowApplyMapper;

    @Override
    public Integer getIdByBaid(Integer baid) {
        return shborrowMapper.getIdByBaid(baid);
    }

    @Override
    @Transactional
    public ServerResponse<Integer> save(Object obj) {
        super.save(obj);
        Shborrow shborrow = (Shborrow)obj;
        if(shborrow.getIsok() == BorrowStatusEnum.CK_SUCCESS.getCode()) {
            borrowApplyMapper.updateChecked(shborrow.getBaid(), BorrowStatusEnum.BORROWING.getCode(), Calendar.getInstance().getTime());
        } else {
            borrowApplyMapper.updateChecked(shborrow.getBaid(), BorrowStatusEnum.CK_FAIL.getCode(), Calendar.getInstance().getTime());
        }
        return ServerResponse.createBySuccess("审核成功");
    }

    @Override
    @Transactional
    public ServerResponse<Integer> update(Object obj) {
        super.update(obj);
        Shborrow shborrow = (Shborrow)obj;
        if(shborrow.getIsok() == BorrowStatusEnum.CK_SUCCESS.getCode()) {
            borrowApplyMapper.updateChecked(shborrow.getBaid(), BorrowStatusEnum.BORROWING.getCode(), Calendar.getInstance().getTime());
        } else {
            borrowApplyMapper.updateChecked(shborrow.getBaid(), BorrowStatusEnum.CK_FAIL.getCode(), Calendar.getInstance().getTime());
        }
        return ServerResponse.createBySuccess("审核成功");
    }

    @Autowired
    public void setShborrowMapper(ShborrowMapper shborrowMapper) {
        super.setBaseDAO(shborrowMapper);
        this.shborrowMapper = shborrowMapper;
    }

    @Autowired
    public void setBorrowApplyMapper(BorrowApplyMapper borrowApplyMapper) {
        this.borrowApplyMapper = borrowApplyMapper;
    }
}
