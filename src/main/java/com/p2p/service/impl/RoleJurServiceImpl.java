package com.p2p.service.impl;

import com.p2p.bean.Jur;
import com.p2p.dao.JurMapper;
import com.p2p.dao.RolejurMapper;
import com.p2p.service.RoleJurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleJurServiceImpl extends AbstractServiceImpl implements RoleJurService {

    private RolejurMapper rolejurMapper;

    @Autowired
    public void setRolejurMapper(RolejurMapper rolejurMapper){
        super.setBaseDAO(rolejurMapper);
        this.rolejurMapper = rolejurMapper;
    }

    @Override
    public List<Jur> getRoleJur(Integer rid) {
        return rolejurMapper.getRoleJur(rid);
    }
}
