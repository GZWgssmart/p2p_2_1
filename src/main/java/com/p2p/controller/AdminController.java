package com.p2p.controller;

import com.p2p.bean.Huser;
import com.p2p.common.ServerResponse;
import com.p2p.dao.HuserMapper;
import com.p2p.service.HuserService;
import com.p2p.utils.EncryptUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created  qingfeng on 2017/12/27.
 */
@Controller
@RequestMapping("/data/admin")
public class AdminController {

    @Autowired
    private HuserService huserService;

    @RequestMapping("Phone")
    @ResponseBody
    public ServerResponse regPhone(String phone) {
        System.out.println(phone);
        return huserService.getByPhone(phone);
    }


    @PostMapping("login")
    @ResponseBody
    public ServerResponse login(Huser huser) {
        System.out.println("name:" +huser.getPhone() + "----password:" +huser.getPwd());
        ServerResponse status = null;
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(new UsernamePasswordToken(huser.getPhone(), EncryptUtils.md5(huser.getPwd())));
            String username = (String) subject.getPrincipal();
//            Huser huser1 =huserService.getByPhonePwd(huser.getPhone(), EncryptUtils.md5(huser.getPwd()));
            Session session = subject.getSession();
            if(subject.hasRole("root")) {
                System.out.println("我是root用户");
            }
            if(subject.hasRole("manage")) {
                System.out.println("我是manage用户");
            }
            if(subject.hasRole("message")) {
                System.out.println("我是message用户");
            }
            session.setAttribute("admin",username);
            status = ServerResponse.createBySuccess();
        } catch (UnknownAccountException e) {
            status = ServerResponse.createByError();
        } catch (IncorrectCredentialsException e) {
            status = ServerResponse.createByError();
        } catch (AuthenticationException e) {
            status = ServerResponse.createByError();
        }
        return status;
    }
    
    @RequestMapping("addhuser")
    public ServerResponse save(Huser huser){
        return huserService.save(huser);
    }
}
