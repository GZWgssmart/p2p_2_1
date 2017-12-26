package com.p2p.controller;

import com.p2p.bean.BankCard;
import com.p2p.common.ServerResponse;
import com.p2p.service.BankCardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Calendar;
import java.util.List;

/**
 * Created by Administrator on 2017/12/21.
 *
 * @author ChuYiming
 */
@Controller
@RequestMapping("/bankCard")
public class BankCardController {

    @Autowired
    private BankCardService bankCardService;

    @PostMapping("save")
    public ServerResponse save(BankCard bankCard) {
        bankCard.setBktime(Calendar.getInstance().getTime());
        return bankCardService.save(bankCard);
    }

    @PostMapping("remove/{bcid}")
    @ResponseBody
    public ServerResponse removeById(@PathVariable("bcid") Integer bcid) {
        return bankCardService.removeById(bcid);
    }

    @PostMapping("active/{bcid}/{status}")
    @ResponseBody
    public ServerResponse activeById(@PathVariable("bcid") Integer bcid, @PathVariable("status") Integer status) {
        return bankCardService.active(bcid, status);
    }

    @RequestMapping("allCards")
    @ResponseBody
    public List<BankCard> allCards(Integer uid) {
        System.out.println(uid);
        return bankCardService.bankCardsByUid(uid);
    }
}
