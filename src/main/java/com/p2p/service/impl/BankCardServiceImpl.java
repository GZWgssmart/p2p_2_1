package com.p2p.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.p2p.bean.BankCard;
import com.p2p.bean.User;
import com.p2p.common.BankResult;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.dao.BankCardMapper;
import com.p2p.service.BankCardService;
import com.p2p.utils.HttpUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Calendar;
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
    @Transactional
    public ServerResponse<Integer> save(Object obj) {
        if (obj!=null){
            BankCard bankCard = (BankCard) obj;
            BankResult bankResult = JSON.parseObject(HttpUtils.sendPost("http://localhost:8081/bind",
                    "realName="+bankCard.getRname()+"&bankCardNo="+bankCard.getCardno()+"&bank="+bankCard.getType()+"&phone="+"13803576897" ), new TypeReference<BankResult>(){});
            if(1000 == 1000) {
                bankCard.setBktime(Calendar.getInstance().getTime());
                bankCardMapper.save(bankCard);
                return ServerResponse.createBySuccess("绑定成功");
            }
        }
            return ServerResponse.createByError("绑定失败");
}
    @Override
    public List<BankCard> bankCardsByUid(Integer uid) {
        return bankCardMapper.bankCardsByUid(uid);
    }

    @Override
    public Pager listPagerCriteria(int pageNo, int pageSize, Object obj) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(bankCardMapper.listPagerCriteria(pager, obj));
        pager.setTotal(bankCardMapper.countCriteria(obj));
        return pager;
    }

    @Override
    public ServerResponse<Integer> removeById(Integer id) {
        if (id!=null){
            BankResult bankResult = JSON.parseObject(HttpUtils.sendPost("http://localhost:8081/bind",
                    "realName="+"name"+"&bankCardNo="+12334+"&bank="+"建设银行"+"&phone="+"13803576897" ), new TypeReference<BankResult>(){});
            if(1000 == 1000) {
                bankCardMapper.removeById(id);
                return ServerResponse.createBySuccess("绑定成功");
            }
        }
        return ServerResponse.createByError("绑定失败");
    }

}
