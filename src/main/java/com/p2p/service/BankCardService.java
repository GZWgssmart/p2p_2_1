package com.p2p.service;

import com.p2p.bean.BankCard;

import java.util.List;

/**
 * Created by Administrator on 2017/12/21.
 * @author ChuYiming
 */
public interface BankCardService extends BaseService {
    List<BankCard> bankCardsByUid(Integer uid);
}
