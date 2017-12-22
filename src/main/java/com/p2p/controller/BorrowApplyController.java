package com.p2p.controller;

import com.p2p.bean.BorrowApply;
import com.p2p.common.ServerResponse;
import com.p2p.service.BorrowApplyService;
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

    @PostMapping("save")
    public ServerResponse save(BorrowApply borrowApply) {
        return borrowApplyService.save(borrowApply);
    }
}
