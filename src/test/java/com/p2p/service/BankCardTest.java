package com.p2p.service;

import com.p2p.bean.BankCard;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by Administrator on 2017/12/25.
 * @author  ChuYiming
 */
public class BankCardTest extends BaseTest {

    @Autowired
    private BankCardService bankCardService;

    @Test
    public  void testAddCard(){
        BankCard bankCard = new BankCard();
        bankCard.setUid(1);
        bankCard.setCardno("1234567891");
        bankCard.setIdno("2354545565655");
        bankCard.setRname("www1");
        bankCard.setType("hhh1");
        bankCardService.save(bankCard);
    }
}
