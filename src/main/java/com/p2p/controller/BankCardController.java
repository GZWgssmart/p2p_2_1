package com.p2p.controller;

import com.p2p.bean.BankCard;
import com.p2p.bean.LogCz;
import com.p2p.bean.User;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.service.BankCardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Calendar;
import java.util.List;

/**
 * Created by Administrator on 2017/12/21.
 *
 * @author ChuYiming
 */
@RestController
@RequestMapping("/data/bankCard")
public class BankCardController {

    @Autowired
    private BankCardService bankCardService;

    @PostMapping("remove/{bcid}")
    public ServerResponse removeById(@PathVariable("bcid") Integer bcid) {
        return bankCardService.removeById(bcid);
    }

    @PostMapping("active/{bcid}/{status}")
    public ServerResponse activeById(@PathVariable("bcid") Integer bcid, @PathVariable("status") Integer status) {
        return bankCardService.active(bcid, status);
    }

    @RequestMapping("allCards")
    public List<BankCard> allCards(Integer uid) {
        return bankCardService.bankCardsByUid(uid);
    }

    @RequestMapping("save")
    public ServerResponse addCard(BankCard bankCard){
          return bankCardService.save(bankCard);
    }

    @RequestMapping("remove")
    public ServerResponse remove(Integer bcid){
        return bankCardService.removeById(bcid);
    }
    @RequestMapping("listPagerCriteria")
    public Pager listPage(int page, int limit, BankCard bankCard, HttpSession session){
        Object obj= session.getAttribute("user");
        if(obj != null) {
            User user = (User)obj;
            bankCard.setUid(user.getUid());
            return bankCardService.listPagerCriteria(page, limit, bankCard);
        }
        return bankCardService.listPagerCriteria(page, limit, bankCard);
    }
}
