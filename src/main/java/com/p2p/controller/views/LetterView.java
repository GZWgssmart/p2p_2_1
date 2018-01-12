package com.p2p.controller.views;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by ccf on 2018/1/5.
 */
@Controller
@RequestMapping("/page/message")
public class LetterView {
    @RequestMapping("allLetter")
    public String allLetter(){
        return "message/allLetter";
    }
    @RequestMapping("addLetter")
    public String addLetter(){
        return "message/addLetter";
    }
    @RequestMapping("editLetter")
    public String editLetter(){
        return "message/editLetter";
    }
    @RequestMapping("letterDetail")
    public String letterDetail(){
        return "message/letterDetail";
    }
    @RequestMapping("letterDetailPage")
    public String letterDetailPage(){
        return"message/letterDetailPage";
    }
}
