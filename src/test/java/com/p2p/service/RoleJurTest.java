package com.p2p.service;

import com.p2p.bean.Rolejur;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by qingfeng on 2017/12/26.
 */
public class RoleJurTest extends BaseTest {

    @Autowired
    private RoleJurService roleJurService;

    @Test
    public void testSave(){
        Rolejur rolejur = new Rolejur();
        rolejur.setJid(1);
        rolejur.setRid(3);
        roleJurService.save(rolejur);
    }


}
