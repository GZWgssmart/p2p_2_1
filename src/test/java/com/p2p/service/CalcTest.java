package com.p2p.service;

import com.p2p.calc.ACMLoanCalculator;
import com.p2p.calc.ACPIMLoanCalculator;
import com.p2p.calc.Loan;
import com.p2p.calc.LoanUtil;
import org.junit.Test;

import java.math.BigDecimal;

/**
 * Created by 7025 on 2018/1/4.
 */
public class CalcTest extends BaseTest {

    private int totalMonth;
    private BigDecimal totalMoney;
    private double percent;
    private double rate;
    private double rateDiscount;

    @Test
    public void testACPIMCalculate() {
        totalMonth = 3;
        totalMoney = new BigDecimal(10000);
        percent = 0;
        rate = 2;
        rateDiscount = 1;
        ACPIMLoanCalculator calculator = new ACPIMLoanCalculator();
        Loan loan = calculator.calLoan(
                LoanUtil.totalLoanMoney(totalMoney, percent),
                totalMonth,
                LoanUtil.rate(rate, rateDiscount),
                LoanUtil.RATE_TYPE_YEAR);
        System.out.println(loan);
    }

    @Test
    public void testACMCalculate() {
        ACMLoanCalculator calculator = new ACMLoanCalculator();
        Loan loan = calculator.calLoan(
                LoanUtil.totalLoanMoney(totalMoney, percent),
                totalMonth,
                LoanUtil.rate(rate, rateDiscount),
                LoanUtil.RATE_TYPE_YEAR);
        System.out.println(loan);
    }
}
