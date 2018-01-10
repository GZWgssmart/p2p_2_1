package com.p2p.controller.views;

import com.p2p.bean.BorrowApply;
import com.p2p.bean.User;
import com.p2p.common.ServerResponse;
import com.p2p.service.BorrowApplyService;
import com.p2p.service.UserMoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by 7025 on 2017/12/21.
 */
@Controller
@RequestMapping("/page/borrowApply")
public class BorrowApplyView {

    @Autowired
    private UserMoneyService userMoneyService;

    @GetMapping("page")
    public String borrowApplyPage() {
        return "user/front_home_model";
    }

    /**
     * 主页投资列表页
     * @return
     */
    @GetMapping("investList")
    public String investList(){
        return "index/investList";
    }

    /**
     * 管理员查看投资列表
     * @return
     */
    @GetMapping("adminBorrowList")
    public String adminManage() {
        return "borrow/adminBorrowManage";
    }

    @GetMapping("detail/{baid}")
    public String detail(@PathVariable("baid") Integer baid, HttpServletRequest request) {
        request.setAttribute("baid", baid);
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("user");
        if(obj != null) {
            User user = (User) obj;
            request.setAttribute("userMoney", userMoneyService.getUserMoney(user.getUid()));
        }
        return "index/borrowDetail";
    }

    @RequestMapping("investManage")
    public String investManage() {
        return "borrow/adminInvestManage";
    }
}
