package com.p2p.service;

import com.p2p.bean.Jur;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by qingfeng on 2017/12/25.
 */
public class JurTest extends BaseTest{

    @Autowired
    private JurService jurService;

    @Test
    public void testSave(){
        Jur jur = new Jur();
        jur.setJurl("install");
        jur.setContent("设置奖励的权限");
        jurService.save(jur);
    }

    @Test
    public void testRemoveById(){
        jurService.removeById(1);
    }

    @Test
    public void testPages(){
        Jur jur = new Jur();
        jurService.listPagerCriteria(1,10,jur);
    }
}
