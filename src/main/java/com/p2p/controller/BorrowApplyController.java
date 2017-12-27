package com.p2p.controller;

import com.p2p.bean.BorrowApply;
import com.p2p.bean.BorrowDetail;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.query.BorrowQuery;
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

    @RequestMapping("list")
    public Pager borrowList(int page, int limit, Integer ckstatus, Integer term, Integer bzid, Float nprofit, String cpname) {
        BorrowQuery borrowQuery = new BorrowQuery();
        if(ckstatus != null) {
            borrowQuery.setCkstatus(ckstatus);
        }
        if(nprofit != null) {
            borrowQuery.setNprofit(nprofit);
        }
        if(bzid != null) {
            borrowQuery.setBzid(bzid);
        }
        if(term != null) {
            borrowQuery.setTerm(term);
        }
        if(cpname != null && !"".equals(cpname)) {
            borrowQuery.setCpname(cpname);
        }
        return borrowApplyService.listPagerCriteria(page, limit, borrowQuery);
    }
}
