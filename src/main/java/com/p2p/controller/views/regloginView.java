package com.p2p.controller.views;

import com.p2p.utils.DESUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.net.URLDecoder;

/**
 * Created by 娃娃鱼 on 2018/1/4.
 */
@Controller
@RequestMapping("/page")
public class regloginView {

    private DESUtils desUtils = new DESUtils();

    public regloginView() throws Exception {
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

}
