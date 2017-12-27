package com.p2p.controller.views;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017/12/25.
 *
 * @author ChuYiming
 */
@Controller
@RequestMapping("/page/bankCard")
public class BankCardView {

    @RequestMapping("bankCard")
    public String bankCard() {
        return "bankCard/userBankCard";
    }

    @RequestMapping("addCard")
    public String bankCardAdd(){
        return "bankCard/userAddCard";
    }

}
