package com.p2p.controller;

import com.p2p.bean.BorrowApply;
import com.p2p.bean.BorrowDetail;
import com.p2p.common.ServerResponse;
import com.p2p.service.BorrowApplyService;
import com.p2p.service.BorrowDetailService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by 7025 on 2017/12/21.
 */
@RestController
@RequestMapping("/data/borrow")
public class BorrowApplyController {

    @Autowired
    private BorrowApplyService borrowApplyService;
    @Autowired
    private BorrowDetailService borrowDetailService;

    private ServerResponse serverResponse;

    @PostMapping("save")
    public ServerResponse save(BorrowApply borrowApply, BorrowDetail borrowDetail) {
        serverResponse = borrowApplyService.save(borrowApply);
        if(serverResponse.isSuccess()) {
            borrowDetail.setBaid(borrowApply.getBaid());
            serverResponse = borrowDetailService.save(borrowDetail);
            if(serverResponse.isSuccess()) {
                return serverResponse;
            }
        }
        return serverResponse;
    }
}
