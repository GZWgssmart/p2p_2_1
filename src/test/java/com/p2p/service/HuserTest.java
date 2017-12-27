package com.p2p.service;

import com.p2p.bean.Huser;
import com.p2p.utils.EncryptUtils;
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
        huser.setRname("message");
        huser.setSex(1);
        huser.setPhone("13522222222");
        huser.setHuname("message");
        huser.setEmail("222@qq.com");
        huser.setPwd(EncryptUtils.md5("123456"));
        huserService.save(huser);
    }

}
