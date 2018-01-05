package com.p2p.service.impl;

import com.p2p.common.ServerResponse;
import com.p2p.dao.HkbMapper;
import com.p2p.service.HkbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 7025 on 2017/12/25.
 */
@Service
public class HkbServiceImpl extends AbstractServiceImpl implements HkbService {

    private HkbMapper hkbMapper;

    @Autowired
    public void setHkbMapper(HkbMapper hkbMapper) {
        super.setBaseDAO(hkbMapper);
        this.hkbMapper = hkbMapper;
    }

    @Override
    public ServerResponse saveList(List hkbList) {
        if(hkbMapper.saveList(hkbList) == 1) {
            ServerResponse.createBySuccess("保存成功");
        }
        return ServerResponse.createByError("保存失败");
    }
}
