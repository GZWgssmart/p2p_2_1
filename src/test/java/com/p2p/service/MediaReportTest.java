package com.p2p.service;

import com.p2p.bean.Media;
import com.p2p.common.Pager;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by yao on 2017/12/22.
 */
public class MediaReportTest extends BaseTest {
    @Autowired
    private MediaService mediaService;

    @Test
    public void pagerList(){
        Media media=new Media();
        media.setTitle("3");
        Pager pager1=mediaService.listPagerCriteria(1,10,media);
        System.out.println(pager1);
    }
}
