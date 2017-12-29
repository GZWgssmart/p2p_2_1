package com.p2p.controller;

import com.p2p.bean.Recommend;
import com.p2p.bean.Rzvip;
import com.p2p.bean.User;
import com.p2p.common.BeanCopyUtils;
import com.p2p.common.Constants;
import com.p2p.common.ServerResponse;
import com.p2p.service.UserService;
import com.p2p.utils.EncryptUtils;
import com.p2p.vo.UserRzvipVO;
import com.p2p.vo.UserTuijianVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * Created by 娃娃鱼 on 2017/12/22.
 */
@RestController
@RequestMapping("/data/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("regPhone")
    @ResponseBody
    public ServerResponse regPhone(String phone) {
        System.out.println(phone);
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
            e.printStackTrace();
        }
        return ServerResponse.createBySuccess();
    }

    @RequestMapping("login")
    @ResponseBody
    public ServerResponse login(User user, HttpSession session) {
        ServerResponse serverResponse = null;
        User user1 = userService.getByPhonePwd(user.getPhone(), EncryptUtils.md5(user.getUpwd() + Constants.SALT));
        if(user1 != null) {
            session.setAttribute("user", user1);
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

}
