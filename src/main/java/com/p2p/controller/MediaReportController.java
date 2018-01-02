package com.p2p.controller;

import com.p2p.bean.Media;
import com.p2p.utils.DateUtil;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.service.MediaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by yao on 2017/12/21.
 */
@Controller
@RequestMapping("/data/company")
public class MediaReportController {

    @Autowired
    private MediaService mediaService;

    @RequestMapping("addMediaReport")
    @ResponseBody
    public ServerResponse addMediaReport(Media media, String whatTime){
        media.setCreatedTime(DateUtil.parseDate(whatTime, "yyyy-MM-dd HH:mm:ss"));
        return mediaService.save(media);
    }
    @RequestMapping("pagerCriteria")
    @ResponseBody
    public Pager pagerCriteria(int page, int limit, Media media){
        return mediaService.listPagerCriteria(page,limit,media);
    }

    @RequestMapping("details")
    @ResponseBody
    public Media detail(Integer mediaId){
        Object obj=mediaService.getById(mediaId);
        return (Media)obj;
    }

    @RequestMapping("editMediaReport")
    @ResponseBody
    public ServerResponse<Integer> editMediaReport(Media media, String testTime){
        media.setCreatedTime(DateUtil.parseDate(testTime,"yyyy-MM-dd HH:mm:ss"));
        return mediaService.update(media);
    }


}
