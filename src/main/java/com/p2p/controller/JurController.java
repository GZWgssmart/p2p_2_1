package com.p2p.controller;

import com.p2p.bean.Jur;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.service.JurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * Created by qingfeng on 2017/12/22.
 */
@Controller
@RequestMapping("/data/Jur")
public class JurController {
    @Autowired
    private JurService jurService;

    private ServerResponse serverResponse;

    /**
     *添加权限
     * @param jur
     * @return
     */
    @RequestMapping("addJur")
    public ServerResponse save(Jur jur){
        return jurService.save(jur);
    }

    /**
     * 修改权限
     * @return
     */
    @RequestMapping("update")
    public ServerResponse updateJur(Jur jur){
        return jurService.update(jur);
    }

    /**
     * 权限分页
     * @return
     */
    @RequestMapping("jurList")
    @ResponseBody
    public Pager HuserList(int page, int limit, Jur jur) {
        return jurService.listPagerCriteria(page,limit,jur);
    }


}
