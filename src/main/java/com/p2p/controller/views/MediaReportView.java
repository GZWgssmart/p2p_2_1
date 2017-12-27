package com.p2p.controller.views;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by yao on 2017/12/22.
 */
@Controller
@RequestMapping("/page/company")
public class MediaReportView{

    @RequestMapping("addMediaReportPage")
    public String addMediaReportPage(){
        return "company/addMediaReport";
    }

    @RequestMapping("mediaReport")
    public String mediaReport(){
        return "company/mediaReport";
    }

    @RequestMapping("mediaDetailPage")
    public String mediaDetailPage(){
        return "company/mediaDetail";
    }

    @RequestMapping("editPage")
    public String editPage(){
        return "company/editMedia";
    }
}
