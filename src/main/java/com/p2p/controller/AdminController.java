package com.p2p.controller;

import com.p2p.bean.Huser;
import com.p2p.bean.RoleUser;
import com.p2p.common.BeanCopyUtils;
import com.p2p.common.Constants;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.service.HuserService;
import com.p2p.utils.EncryptUtils;
import com.p2p.vo.HuserJurVO;
import com.p2p.vo.HuserRoleVO;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

/**
 * Created  qingfeng on 2017/12/27.
 */
@RestController
@RequestMapping("/data/admin")
public class AdminController {

    @Autowired
    private HuserService huserService;

    @RequestMapping("phone")
    public ServerResponse regPhone(String phone) {
        System.out.println(phone);
        return huserService.getByPhone(phone);
    }

    @RequestMapping("adminList")
    @ResponseBody
    public Pager HuserList(int page, int limit, HuserJurVO huserJurVO) {
        return huserService.listPagerCriteria(page,limit,huserJurVO);
    }

    @PostMapping("login")
    public ServerResponse login(Huser huser) {
        ServerResponse status = null;
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(new UsernamePasswordToken(huser.getPhone(), EncryptUtils.md5(huser.getPwd() + Constants.SALT)));
            Huser huser1 =huserService.getByPhonePwd(huser.getPhone(), EncryptUtils.md5(huser.getPwd() + Constants.SALT));
            Session session = subject.getSession();
            session.setAttribute("admin",huser1);
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

    @RequestMapping("out")
    public ServerResponse outTest() {
        ServerResponse serverResponse = null;
        Subject subject = SecurityUtils.getSubject();
        if (subject.isAuthenticated()) {
            subject.logout(); // session 会销毁，在SessionListener监听session销毁，清理权限缓存
            serverResponse = ServerResponse.createBySuccess();
        } else {
            serverResponse = ServerResponse.createByError();
        }
        return serverResponse;
    }
    
    @RequestMapping("addhuser")
    public ServerResponse save(HuserRoleVO huserRoleVO){
        Huser huser = new Huser();
        RoleUser roleUser = new RoleUser();
        huserRoleVO.setPwd(EncryptUtils.md5(huserRoleVO.getPwd() + Constants.SALT));
        try {
            BeanCopyUtils.copy(huser, huserRoleVO);
            BeanCopyUtils.copy(roleUser, huserRoleVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return huserService.saveRoleUser(huser, roleUser);
    }

    @RequestMapping("update")
    public ServerResponse updateHuser(Huser huser){
        return huserService.update(huser);
    }

    @RequestMapping("HuserDetail")
    public Huser HuserDetail(Integer huid){
        Object obj = huserService.getById(huid);
        return (Huser) obj;
    }

    @RequestMapping("remove")
    public ServerResponse removeByIdHuser(Huser huser){
        return huserService.removeById(huser.getHuid());
    }

    @RequestMapping("edit")
    public ServerResponse edit(Huser huser, HttpSession session) {
        ServerResponse serverResponse = null;
        if(huser.getPwd() != null && !"".equals(huser.getPwd())) {
            huser.setPwd(EncryptUtils.md5(huser.getPwd() + Constants.SALT));
        }
        serverResponse = huserService.update(huser);
        Object obj= huserService.getById(huser.getHuid());
        Huser huser1 = (Huser) obj;
        session.setAttribute("admin",huser1);
        serverResponse.setData(huser1);
        return serverResponse;
    }



}
