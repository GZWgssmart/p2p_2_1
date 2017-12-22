package com.p2p.service.impl;

import com.p2p.dao.BankCardMapper;
import com.p2p.service.BankCardService;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/12/21.
 * @author
 */
@Service
public class BankCardServiceImpl extends AbstractServiceImpl implements BankCardService {

    private BankCardMapper bankCardMapper;

    public void setBorrowApplyMapper(BankCardMapper bankCardMapper) {
        super.setBaseDAO(bankCardMapper);
        this.bankCardMapper = bankCardMapper;
    }

}
