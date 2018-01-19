package com.p2p.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.p2p.bean.Ydata;
import com.p2p.common.BankResult;
import com.p2p.utils.HttpUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Calendar;
import java.util.Date;

/**
 * Created by 娃娃鱼 on 2018/1/8.
 */
public class YdataTest extends BaseTest {

    @Autowired
    private YdataService ydataService;

    @Test
    public void testUpdata() {
        Ydata ydata = new Ydata();
        // 总交易总额
//        ydata.setTmoney(BigDecimal.valueOf(10000));
        //月交易总额
//        ydata.setMmoney(BigDecimal.valueOf(1000));
//        //总注册人数
//        ydata.setTuser(20);
//        //月注册人数
//        ydata.setMuser(12);
//        //总投资人数
//        ydata.setTtzno(100);
//        //月投资人数
//        ydata.setMtzno(10);
//        //总贷款人数
//        ydata.setTdkno(10);
//        // 月贷款笔数
//        ydata.setMdkno(9);
//        //总贷款笔数
//        ydata.setTdkbno(10);
//        //月贷款笔数
//        ydata.setMdkbno(2);
//        ydata.setYid(1);
        ydata.setYid(2);
//        ydata.setCreatedTime(new Date());
        ydataService.update(ydata);
//        ydataService.save(ydata);
    }

    @Test
    public void testJSON() {
        System.out.println(HttpUtils.sendPost("http://localhost:8081/bind", "realName=abc&bank=建设银行&bankCardNo=6228480402564890018&phone=13366666666"));
    }

	public void testTz() {
		BankResult bankResult = JSON.parseObject(HttpUtils.sendPost("http://localhost:8081/bind",
                "realName=76859&bankCardNo=6212842120000014632&bank=建设银行&phone=13803576897" ), new TypeReference<BankResult>(){});
        System.out.println(bankResult.getCode()+"1111111111111111111111111111111111111111111");
    }

    @Test
    public void testSelect() {
        ydataService.selectEnd();
    }

    @Test
    public void testTime() {
        System.out.println("newDate:" + new Date());
        System.out.println("CalendarTiem:" + Calendar.getInstance().getTime());
    }
}
