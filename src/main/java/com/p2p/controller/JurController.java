package com.p2p.controller;

import com.p2p.bean.Jur;
import com.p2p.common.ServerResponse;
import com.p2p.service.JurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * Created by qingfeng on 2017/12/22.
 */
@Controller
@RequestMapping("/Jur")
public class JurController {
    @Autowired
    private JurService jurService;

    private Jur jur;

    private ServerResponse serverResponse;

    /**
     * 
     *
     * @param jur
     * @return
     */
    @RequestMapping(value = "/addJur",method= RequestMethod.POST)
    public ServerResponse save(Jur jur){
        return jurService.save(jur);
    }

    /**
     * 修改
     * @return
     */
    @RequestMapping("update")
    public ServerResponse updateJur(Integer jid){
        jur = new Jur();
        jur.setJurl("");
        jur.setContent("");
        jur.setJid(jid);
        return jurService.update(jur);
    }

    /**
     * 删除权限
     *
     * @param jid
     * @return
     */
    @PostMapping("remove/{jid}")
    @ResponseBody
    public ServerResponse removeById(@PathVariable("jid")Integer jid){
        jur = new Jur();
        jur.setJid(jid);
        return jurService.removeById(jid);
    }

}
