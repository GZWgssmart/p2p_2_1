package com.p2p.controller;

import com.p2p.bean.Jur;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.service.JurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * Created by qingfeng on 2017/12/22.
 */
@RestController
@RequestMapping("/data/Jur")
public class JurController {
    @Autowired
    private JurService jurService;
    /**
     *添加权限
     * @param jur
     * @return
     */
    @RequestMapping("save")
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
    public Pager HuserList(int page, int limit, Jur jur) {
        return jurService.listPagerCriteria(page,limit,jur);
    }


}
