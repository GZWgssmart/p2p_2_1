package com.p2p.service.impl;

import com.p2p.dao.DxmodelMapper;
import com.p2p.service.DxmodelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DxmodelServiceImpl extends AbstractServiceImpl implements DxmodelService {
    private DxmodelMapper dxmodelMapper;
    @Autowired
    private void setDxmodelMapper(DxmodelMapper dxmodelMapper){
        super.setBaseDAO(dxmodelMapper);
        this.dxmodelMapper = dxmodelMapper;
    }
}
