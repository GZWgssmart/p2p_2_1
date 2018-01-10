package com.p2p.controller;

import com.p2p.calc.*;
import com.p2p.common.Pager;
import com.p2p.enums.WayEnum;
import com.p2p.query.CalcQuery;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by qingfeng on 2018/1/8.
 */
@RestController
@RequestMapping("/data/calc")
public class CalcController {

    @RequestMapping("calc")
    @ResponseBody
    public Pager getPlan(int page, int limit, CalcQuery calcQuery) {
        Pager pager = new Pager(page,limit);
        List<Object> objects = new ArrayList<>();
        //等额本息
        if(WayEnum.EQUAL_BX.getCode().equals(calcQuery.getType()+"")) {
            Loan loan = new ACPIMLoanCalculator().calLoan(calcQuery.getTotalMoney(), calcQuery.getMonth(), calcQuery.getNprofit(), LoanUtil.RATE_TYPE_YEAR);
            objects.addAll(loan.getAllLoans());
            pager.setRows(objects);
            pager.setTotal((long) loan.getAllLoans().size());
        } else {
            Loan loan = new ACMLoanCalculator().calLoan(calcQuery.getTotalMoney(), calcQuery.getMonth(), calcQuery.getNprofit(), LoanUtil.RATE_TYPE_YEAR);
            objects.addAll(loan.getAllLoans());
            pager.setRows(objects);
            pager.setTotal((long) loan.getAllLoans().size());
        }
        return pager;
    }
}
