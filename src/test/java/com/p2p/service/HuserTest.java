package com.p2p.service;

import com.p2p.bean.Huser;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created  qingfeng on 2017/12/27.
 */
public class HuserTest extends BaseTest {

    @Autowired
    private HuserService huserService;

    @Test
    public void savetest(){
        Huser huser = new Huser();
        huser.setRname("ooo");
        huser.setSex(1);
        huser.setPhone("12345678901");
        huser.setHuname("管理员");
        huser.setEmail("oooo");
        huser.setPwd("123456");
        huserService.save(huser);
    }

}
