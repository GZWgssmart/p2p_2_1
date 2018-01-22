package com.p2p.controller;

import com.p2p.bean.Recommend;
import com.p2p.bean.Rzvip;
import com.p2p.bean.User;
import com.p2p.bean.UserMoney;
import com.p2p.common.BeanCopyUtils;
import com.p2p.common.Constants;
import com.p2p.common.ServerResponse;
import com.p2p.service.UserMoneyService;
import com.p2p.service.UserService;
import com.p2p.utils.DESUtils;
import com.p2p.utils.EncryptUtils;
import com.p2p.vo.UserRzvipVO;
import com.p2p.vo.UserTuijianVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;

/**
 * Created by 娃娃鱼 on 2017/12/22.
 */
@RestController
@RequestMapping("/data/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserMoneyService userMoneyService;

    private DESUtils desUtils = new DESUtils();

    public UserController() throws Exception {
    }

    @RequestMapping("regPhone")
    @ResponseBody
    public ServerResponse regPhone(String phone) {
        return userService.getByPhone(phone);
    }

    @RequestMapping("reg")
    @ResponseBody
    public ServerResponse reg(UserTuijianVO uservo) {
        User user = new User();
        Recommend recommend = new Recommend();
        uservo.setUpwd(EncryptUtils.md5(uservo.getUpwd() + Constants.SALT));
        try {
            if(uservo.getTid() != null) {
                BeanCopyUtils.copy(user, uservo);
                BeanCopyUtils.copy(recommend, uservo);
                recommend.setRname(uservo.getUname());
                recommend.setCreatedTime(new Date());
                return userService.saveRecommend(user,recommend);
            } else {
                BeanCopyUtils.copy(user, uservo);
                return userService.save(user);
            }
        } catch (Exception e) {
            return ServerResponse.createByError();
        }
    }

    @RequestMapping("login")
    @ResponseBody
    public ServerResponse login(User user, String choose, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception{
        ServerResponse serverResponse = null;
        User user1 = userService.getByPhonePwd(user.getPhone(), EncryptUtils.md5(user.getUpwd() + Constants.SALT));
        if(user1 != null) {
            session.setAttribute("user", user1);
            if(choose == null) {
                System.out.println("为空，null了！");
            } else if(choose.equals("0")){
                // 登录成功时把密码和用户保存到cookies中，密码加密
                addCookie(user.getPhone(), desUtils.encrypt(user.getUpwd()), response, request);
            }
            serverResponse = ServerResponse.createBySuccess();
        } else {
            serverResponse = ServerResponse.createByError();
        }
        return serverResponse;
    }

    @RequestMapping("edit")
    @ResponseBody
    public ServerResponse edit(User user, HttpSession session) {
        ServerResponse serverResponse = null;
        if(user.getUpwd() != null && !"".equals(user.getUpwd())) {
            user.setUpwd(EncryptUtils.md5(user.getUpwd() + Constants.SALT));
        }
        serverResponse = userService.update(user);
        Object obj= userService.getById(user.getUid());
        User user1 = (User) obj;
        session.setAttribute("user",user1);
        serverResponse.setData(user1);
        return serverResponse;
    }

    @PostMapping("saveUserRzvip")
    public ServerResponse saveUserRzvip(UserRzvipVO userRzvipVO) {
        User user = new User();
        Rzvip rzvip = new Rzvip();
        try {
            BeanCopyUtils.copy(user, userRzvipVO);
            BeanCopyUtils.copy(rzvip, userRzvipVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userService.saveBorrow(user, rzvip);
    }

    @RequestMapping("money")
    public UserMoney getUserMoney(Integer uid) {
        return userMoneyService.getUserMoney(uid);
    }

    @RequestMapping("out")
    @ResponseBody
    public ServerResponse out(HttpSession session) {
        session.removeAttribute("user");
        ServerResponse serverResponse = ServerResponse.createBySuccess();
        return serverResponse;
    }

    @RequestMapping("vip")
    public ServerResponse vip(String uid) {
        System.out.println("uid:" + uid);
        String[] strings = uid.split(",");
        return userService.updateVip(strings);
    }

    @GetMapping("getById")
    @ResponseBody
    public User getById(Integer uid) {
        return (User) userService.getById(uid);
    }

    /**
     * 在系统退出后，重新进入登录页面，用户名自动填充.。
     * 在用户登录成功时调用此方法
     * @param phone
     * @param response
     * @param request
     * @throws UnsupportedEncodingException
     */
    public static void addCookie(String phone, String upwd, HttpServletResponse response, HttpServletRequest request) throws UnsupportedEncodingException {
        //创建cookie
        Cookie nameCookie = new Cookie("phone", URLEncoder.encode(phone, "utf-8"));
        Cookie upwdCookie = new Cookie("upwd", upwd);
        //设置cookie路径
        nameCookie.setPath(request.getContextPath() + "/");
        upwdCookie.setPath(request.getContextPath() + "/");
        //设置cookie保存的时间 单位：秒
        nameCookie.setMaxAge(60 * 60);
        upwdCookie.setMaxAge(60 * 60);
        //将cookie添加到响应
        response.addCookie(nameCookie);
        response.addCookie(upwdCookie);
    }

}
