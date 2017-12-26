package com.p2p.service;

import com.p2p.bean.BorrowApply;
import com.p2p.query.BorrowQuery;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.math.BigDecimal;
import java.util.Calendar;

/**
 * Created by 7025 on 2017/12/22.
 */
public class BorrowApplyTest extends BaseTest {

    @Autowired
    private BorrowApplyService borrowApplyService;
    @Autowired
    private BorrowDetailService borrowDetailService;

    @Test
    public void testSave() {
        BorrowApply borrowApply = new BorrowApply();
        borrowApply.setUid(1);
        borrowApply.setMoney(BigDecimal.valueOf(1000));
        borrowApply.setType(1);
        borrowApply.setRname("张三");
        borrowApply.setDeadline(Calendar.getInstance().getTime());
        borrowApply.setBzid(1);
        borrowApply.setTerm(3);
        borrowApplyService.save(borrowApply);
        System.out.println(borrowApply.getBaid());
    }

    @Test
    public void testListCir() {
        BorrowQuery borrowQuery = new BorrowQuery();
//        borrowQuery.setUid(1);
//        borrowQuery.setNprofit(1f);
        borrowApplyService.listPagerCriteria(1,3, borrowQuery);
    }
}
