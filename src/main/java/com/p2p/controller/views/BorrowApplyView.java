package com.p2p.controller.views;

import com.p2p.bean.BorrowApply;
import com.p2p.common.ServerResponse;
import com.p2p.service.BorrowApplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by 7025 on 2017/12/21.
 */
@Controller
@RequestMapping("/page/borrowApply")
public class BorrowApplyView {

    @GetMapping("page")
    public String borrowApplyPage() {
        return "user/front_home_model";
    }

    @GetMapping("addPage")
    public String borrowApplyAdd() {
        return "user/borrowApply";
    }

    /**
     * 用户借款管理列表页
     * @return
     */
    @GetMapping("management")
    public String borrowManagement() {
        return "user/borrowManage";
    }

    /**
     * 主页投资列表页
     * @return
     */
    @GetMapping("investList")
    public String investList(){
        return "index/investList";
    }
}
