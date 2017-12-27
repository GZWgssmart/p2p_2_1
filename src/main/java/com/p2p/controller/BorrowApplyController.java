package com.p2p.controller;

import com.p2p.bean.BorrowApply;
import com.p2p.bean.BorrowDetail;
import com.p2p.common.ServerResponse;
import com.p2p.service.BorrowApplyService;
import com.p2p.vo.BorrowApplyDetail;
import com.p2p.common.BeanCopyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by 7025 on 2017/12/21.
 */
@RestController
@RequestMapping("/data/borrow")
public class BorrowApplyController {

    @Autowired
    private BorrowApplyService borrowApplyService;

    @RequestMapping(value="save", method = RequestMethod.POST)
    public ServerResponse save(BorrowApplyDetail borrowApplyDetail) {
        BorrowApply borrowApply = new BorrowApply();
        BorrowDetail borrowDetail = new BorrowDetail();
        try {
            BeanCopyUtils.copy(borrowApply, borrowApplyDetail);
            BeanCopyUtils.copy(borrowDetail, borrowApplyDetail);
        } catch (Exception e) {
            e.printStackTrace();
        }
        borrowApply.setUid(1);
        return borrowApplyService.saveBorrow(borrowApply, borrowDetail);
    }
}
