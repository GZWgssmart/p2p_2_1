package com.p2p.controller;

import com.p2p.bean.Jur;
import com.p2p.bean.Rolejur;
import com.p2p.common.BeanCopyUtils;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.service.JurService;
import com.p2p.vo.JurRoleVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

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
     * @param
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

    @RequestMapping("jurDetail")
    public Jur jurDetail(Integer jurId){
        Object obj = jurService.getById(jurId);
        return (Jur) obj;
    }

    /**
     * 删除权限
     * @return
     */
    @RequestMapping("remove")
    public ServerResponse removeByIdJur(Jur jur){
        return jurService.removeById(jur.getJid());
    }


    /**
     * 权限分页
     * @return
     */
    @RequestMapping("jurList")
    public Pager HuserList(int page, int limit, Jur jur) {
        return jurService.listPagerCriteria(page,limit,jur);
    }

    @RequestMapping("listAll")
    @ResponseBody
    public List<Jur> allType() {
        List<Object> objects = jurService.listAll();
        List<Jur> jurs = new ArrayList<>();
        for (Object obj : objects) {
            Jur type = (Jur) obj;
            jurs.add(type);
        }
        return jurs;
    }

}
