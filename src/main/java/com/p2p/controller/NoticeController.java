package com.p2p.controller;

import com.p2p.bean.Notice;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.service.NoticeService;
import com.p2p.utils.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * Created by ccf on 2017/12/26.
 */
@Controller
@RequestMapping("/data/message")
public class NoticeController {
    @Autowired
    private NoticeService noticeService;

    @RequestMapping("pagerNotice")
    @ResponseBody
    public Pager pagerNotice(int page,int limit,Notice notice){
        return noticeService.listPagerCriteria(page,limit,notice);
    }

    @RequestMapping("addNotice")
    @ResponseBody
    public ServerResponse addNotice(Notice notice, String addNoticeTime){
        notice.setCreatedTime(DateUtil.parseDate(addNoticeTime, "yyyy-MM-dd HH:mm:ss"));
        return noticeService.save(notice);
    }

    @RequestMapping("editNotice")
    @ResponseBody
    public ServerResponse editNotice(Notice notice ,String editNoticeTime){
        notice.setCreatedTime(DateUtil.parseDate(editNoticeTime, "yyyy-MM-dd HH:mm:ss"));
        return noticeService.update(notice);
    }

    @RequestMapping("noticeDetail")
    @ResponseBody
    public Notice noticeDetail(Integer noticeId){
       Object obj = noticeService.getById(noticeId);
       return (Notice) obj;
    }
    @RequestMapping("removeNotice")
    @ResponseBody
    public ServerResponse removeNotice(Notice notice){
        return noticeService.removeById(notice.getNid());
    }

}
