package com.p2p.service;

import com.p2p.bean.User;
import com.p2p.common.Constants;
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
        User user = new User();
        user.setPhone("15011111111");
        user.setUpwd(EncryptUtils.md5("123456" + Constants.SALT));
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
        String uid = ",1,2,3";
        System.out.println("uid:" + uid);
        String a = uid.replaceFirst(",","");
        System.out.println(a);
        // 可以用 StringBuilder 这个类，里面有一个接口replace，如下
        StringBuilder sb = new StringBuilder("abcd");
        sb.replace(1, 2, "测试是否替换指定的第二个元素");
        System.out.println(sb.toString());
    }
}
