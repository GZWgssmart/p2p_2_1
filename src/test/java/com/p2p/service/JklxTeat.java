package com.p2p.service;

import com.p2p.bean.Jklx;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class JklxTeat extends BaseTest {
    @Autowired
    private JklxService jklxService;
    @Test
    public void saveTest(){
        Jklx jklx = new Jklx();
        jklx.setLxname("借款类型");
        jklxService.save(jklx);

    }
}
