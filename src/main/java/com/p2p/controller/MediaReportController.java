package com.p2p.controller;

import com.p2p.bean.Media;
import com.p2p.common.DateUtil;
import com.p2p.common.ServerResponse;
import com.p2p.service.MediaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by yao on 2017/12/21.
 */
@Controller
@RequestMapping("/data/company")
public class MediaReportController {

    @Autowired
    private MediaService mediaService;

    @RequestMapping("/addMediaReport")
    @ResponseBody
    public ServerResponse addMediaReport(Media media, String whatTime){
        System.out.println(whatTime);
        media.setCreatedTime(DateUtil.parseDate(whatTime, "yyyy-MM-dd HH:mm:ss"));
        return mediaService.save(media);
    }


}
