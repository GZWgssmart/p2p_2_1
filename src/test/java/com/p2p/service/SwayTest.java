package com.p2p.service;

import com.p2p.bean.Sway;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class SwayTest extends BaseTest {
    @Autowired
    private SwayService swayService;

    @Test
    public void testSave(){
        Sway sway = new Sway();
        sway.setWay("先本后息");
        sway.setFw("XX算法");
        swayService.save(sway);
    }
    @Test
    public void testupdate(){
        Sway sway = new Sway();
        sway.setSid(1);
        sway.setWay("先息后本");
        sway.setFw("XX算法");
        swayService.update(sway);
    }



}
