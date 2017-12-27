package com.p2p.service;

import com.p2p.bean.User;
import com.p2p.utils.EncryptUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by 娃娃鱼 on 2017/12/21.
 */
public class UserTest extends BaseTest {

    @Autowired
    private UserService userService;

    @Test
    public void testSave() {
        String tzm = System.currentTimeMillis() + "";
        int z = Integer.valueOf(tzm.substring(5, 13));
        User user = new User();
        user.setPhone("15083562555");
        user.setUpwd(EncryptUtils.md5("123456"));
        user.setTzm(z);
        userService.save(user);
    }

    @Test
    public void testGetByPhone() {
//        userService.getByPhonePwd("15083562555",EncryptUtils.md5("123456"));
        userService.getById(1);
//        userService.getByPhone("13500000000");
    }

    @Test
    public void testUpdate() {
        User user = new User();
        user.setUid(2);
        user.setEmail("87654321@qq.com");
        userService.update(user);
    }
    @Test
    public void testCard(){
//        List<Object> userList =  userService.;
//        System.out.println(userList);
    }
}
