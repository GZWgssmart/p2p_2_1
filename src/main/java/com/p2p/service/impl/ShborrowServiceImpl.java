package com.p2p.service.impl;

import com.p2p.dao.ShborrowMapper;
import com.p2p.service.ShborrowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 7025 on 2017/12/25.
 */
@Service
public class ShborrowServiceImpl extends AbstractServiceImpl implements ShborrowService {

    private ShborrowMapper shborrowMapper;

    @Autowired
    public void setShborrowMapper(ShborrowMapper shborrowMapper) {
        super.setBaseDAO(shborrowMapper);
        this.shborrowMapper = shborrowMapper;
    }

    @Override
    public Integer getIdByBaid(Integer baid) {
        return shborrowMapper.getIdByBaid(baid);
    }
}
