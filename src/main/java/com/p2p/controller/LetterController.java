package com.p2p.controller;

import com.p2p.bean.Letter;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.service.LetterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * Created by ccf on 2018/1/5.
 */
@Controller
@RequestMapping("/data/message")
public class LetterController {
    @Autowired
    private LetterService letterService;

    @RequestMapping("pagerLetter")
    @ResponseBody
    public Pager pagerNotice(int page, int limit, Letter letter){
        return letterService.listPagerCriteria(page,limit,letter);
    }

    @RequestMapping("addLetter")
    @ResponseBody
    public ServerResponse addLetter(Letter letter){
        letter.setCreatedTime(new Date());
        return letterService.save(letter);
    }

    @RequestMapping("editLetter")
    @ResponseBody
    public ServerResponse editNotice(Letter letter){
        return letterService.update(letter);
    }

    @RequestMapping("letterDetail")
    @ResponseBody
    public Letter letterDetail(Integer letterId){
        Object obj = letterService.getById(letterId);
        return (Letter) obj;
    }

}
