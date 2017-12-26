package com.p2p.service.impl;

import com.p2p.bean.BorrowApply;
import com.p2p.bean.BorrowDetail;
import com.p2p.common.ServerResponse;
import com.p2p.common.ValidationResult;
import com.p2p.common.ValidationUtils;
import com.p2p.dao.BorrowApplyMapper;
import com.p2p.dao.BorrowDetailMapper;
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
    private BorrowDetailMapper borrowDetailMapper;

    @Autowired
    public void setBorrowApplyMapper(BorrowApplyMapper borrowApplyMapper) {
        super.setBaseDAO(borrowApplyMapper);
        this.borrowApplyMapper = borrowApplyMapper;
    }

    @Autowired
    public void setBorrowDetailMapper(BorrowDetailMapper borrowDetailMapper) {
        this.borrowDetailMapper = borrowDetailMapper;
    }

    @Override
    public int updateChecked(Integer baid, Integer status, Date cktime) {
        return 0;
    }

    @Override
    public ServerResponse saveBorrow(BorrowApply borrowApply, BorrowDetail borrowDetail) {
        ValidationResult validationResult = ValidationUtils.validateEntity(borrowApply);
        if(validationResult.isHasErrors()) {
            return ServerResponse.createByError("保存失败");
        }
        validationResult = ValidationUtils.validateEntity(borrowDetail);
        if(validationResult.isHasErrors()) {
            return ServerResponse.createByError("保存失败");
        }
        if(borrowApplyMapper.save(borrowApply) == 0) {
            return ServerResponse.createByError("保存失败");
        }
        borrowDetail.setBaid(borrowApply.getBaid());
        if(borrowDetailMapper.save(borrowDetail) == 0){
            return ServerResponse.createByError("保存失败");
        }
        return ServerResponse.createBySuccess("保存成功");
    }
}
