package com.p2p.service.impl;

import com.p2p.dao.BankCardMapper;
import com.p2p.service.BankCardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/12/21.
 * @author ChuYiming
 */
@Service
public class BankCardServiceImpl extends AbstractServiceImpl implements BankCardService {

    @Autowired
    private BankCardMapper bankCardMapper;

    public void setBankCardMapper(BankCardMapper bankCardMapper) {
        super.setBaseDAO(bankCardMapper);
        this.bankCardMapper = bankCardMapper;
    }


}
