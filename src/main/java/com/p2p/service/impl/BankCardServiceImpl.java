package com.p2p.service.impl;

import com.p2p.bean.BankCard;
import com.p2p.dao.BankCardMapper;
import com.p2p.service.BankCardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/21.
 *
 * @author ChuYiming
 */
@Service
public class BankCardServiceImpl extends AbstractServiceImpl implements BankCardService {

    private BankCardMapper bankCardMapper;

    @Autowired
    public void setBankCardMapper(BankCardMapper bankCardMapper) {
        super.setBaseDAO(bankCardMapper);
        this.bankCardMapper = bankCardMapper;
    }

    @Override
    public List<BankCard> bankCardsByUid(Integer uid) {
        return bankCardMapper.bankCardsByUid(uid);
    }
}
