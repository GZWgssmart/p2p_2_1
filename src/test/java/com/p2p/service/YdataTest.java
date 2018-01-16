package com.p2p.service;

import com.p2p.bean.Ydata;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.math.BigDecimal;
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
//        ydata.setYid(2);
        ydata.setCreatedTime(new Date());
        ydataService.save(ydata);
    }

    @Test
    public void testSelect() {
        ydataService.selectEnd();
    }
}
