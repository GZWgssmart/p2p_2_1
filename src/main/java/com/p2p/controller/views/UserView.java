package com.p2p.controller.views;

import com.p2p.utils.DESUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.net.URLDecoder;

/**
 * Created by 娃娃鱼 on 2017/12/22.
 */
@Controller
@RequestMapping("/page/user")
public class UserView {

    @RequestMapping("account")
    public String account() {
        return "user/account";
    }

    @RequestMapping("safe")
    public String safe() {
        return "user/safe";
    }

    @RequestMapping("taste")
    public String taste() {
        return "user/taste";
    }

    @RequestMapping("fund")
    public String fund() {
        return "user/fund";
    }

    @RequestMapping("recommend")
    public String recommend(){
        return "user/recommendPage";
    }

    @RequestMapping("notice")
    public String notice(){
        return "user/notice";
    }

    @GetMapping("borrow/addPage")
    public String borrowApplyAdd() {
        return "user/borrowApply";
    }

    /**
     * 用户借款管理列表页
     * @return
     */
    @GetMapping("borrow/management")
    public String borrowManagement() {
        return "user/borrowManage";
    }

    /**
     * 用户投资管理列表页
     * @return
     */
    @GetMapping("invest/management")
    public String investManagement() {
        return "user/investManage";
    }

    /**
     * ChuYiming begin
     * @return
     */
    @RequestMapping("userLogCz")
    public String logCz() {
        return "logCz/userLogCz";
    }

    @RequestMapping("userCzHistory")
    public String czHistory(){
        return "logCz/userCzHistory";
    }

    @RequestMapping("userBankCard")
    public String bankCard() {
        return "bankCard/userBankCard";
    }

    @RequestMapping("userAddCard")
    public String bankCardAdd(){
        return "bankCard/userAddCard";
    }
    @RequestMapping("userLogTx")
    public String logTx(){
        return "logTx/userLogTx";
    }
    /**
     * end
     */

    @RequestMapping("getticket")
    public String getTicket() {
        return "user/getTicket";
    }
}
