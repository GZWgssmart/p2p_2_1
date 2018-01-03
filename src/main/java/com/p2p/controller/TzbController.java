package com.p2p.controller;

import com.p2p.bean.Tzb;
import com.p2p.bean.User;
import com.p2p.common.ServerResponse;
import com.p2p.service.TzbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;

/**
 * Created by 7025 on 2018/1/2.
 */
@RestController
@RequestMapping("/data/tz")
public class TzbController {

    @Autowired
    private TzbService tzbService;

    @RequestMapping("invest")
    public ServerResponse invest(Tzb tzb, HttpSession session) {
        Object obj = session.getAttribute("user");
        if(obj != null) {
            User user = (User) obj;
            tzb.setUid(user.getUid());
            return tzbService.save(tzb);
        }
        return ServerResponse.createByError("投资失败");
    }
}
