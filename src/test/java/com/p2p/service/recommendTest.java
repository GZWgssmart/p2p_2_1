package com.p2p.service;

import com.p2p.bean.Recommend;
import org.activiti.engine.impl.Page;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

/**
 * Created by 娃娃鱼 on 2017/12/26.
 */
public class recommendTest extends BaseTest {

    @Autowired
    private RecommendService recommendService;

    @Test
    public void testSave() {
        Recommend recommend = new Recommend();
        recommend.setTid(2);
        recommend.setTname("张三");
        recommend.setUid(3);
        recommend.setRname("李四");
        recommend.setCreatedTime(new Date());
        recommendService.save(recommend);
    }

    @Test
    public void testPage() {
        Recommend recommend = new Recommend();
        recommend.setUid(1);
        recommendService.listPagerCriteria(1,5,recommend);
    }
}
