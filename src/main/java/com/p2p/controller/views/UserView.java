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

    private DESUtils desUtils = new DESUtils();

    public UserView() throws Exception {
    }

    @RequestMapping("reg")
    public String userReg() {
        return "user/userReg";
    }

    @RequestMapping("login")
    public String userLogin(HttpServletRequest request) throws Exception {
        // 从cookies中拿取数据并传到前台，密码解密
        String phone = "";
        String upwd = "";
        Cookie[] cookies = request.getCookies();
        if (cookies != null && cookies.length > 0) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("phone")) {
                    phone = URLDecoder.decode(cookies[i].getValue(), "utf-8");
                    request.setAttribute("phone", phone);
                }
                if(cookies[i].getName().equals("upwd")) {
                    upwd = cookies[i].getValue();
                    request.setAttribute("upwd", desUtils.decrypt(upwd));
                }
            }
        }
        return "user/userLogin";
    }

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

}
