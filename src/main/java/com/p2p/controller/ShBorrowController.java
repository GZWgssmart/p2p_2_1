package com.p2p.controller;

import com.p2p.bean.Huser;
import com.p2p.bean.Shborrow;
import com.p2p.common.ServerResponse;
import com.p2p.service.ShborrowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.Calendar;

/**
 * Created by 7025 on 2018/1/8.
 */
@RestController
@RequestMapping("/data/shBorrow")
public class ShBorrowController {

    @Autowired
    private ShborrowService shborrowService;

    @RequestMapping("check")
    public ServerResponse<Integer> check(Shborrow shborrow, HttpSession session) {
        Object obj = session.getAttribute("admin");
        if(obj != null) {
            Huser huser = (Huser)obj;
            Integer huid = shborrowService.getIdByBaid(shborrow.getBaid());
            if(huid != null && huid != 0) {
                return shborrowService.update(shborrow);
            } else {
                shborrow.setHuid(huser.getHuid());
                shborrow.setCktime(Calendar.getInstance().getTime());
                return shborrowService.save(shborrow);
            }
        }
        return ServerResponse.createByError("审核失败！");
    }
}
