package com.p2p.service.impl;

import com.p2p.bean.Ydata;
import com.p2p.common.ServerResponse;
import com.p2p.common.ValidationResult;
import com.p2p.common.ValidationUtils;
import com.p2p.dao.UserMapper;
import com.p2p.dao.YdataMapper;
import com.p2p.service.YdataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;

/**
 * Created by 娃娃鱼 on 2018/1/8.
 */
@Service
public class YdateServiceImpl implements YdataService {

    private ValidationResult validationResult;
    @Autowired
    private YdataMapper ydataMapper;

    Calendar now=Calendar.getInstance();
    int month=now.get(Calendar.MONTH)+1;

    @Override
    public Ydata getById(Integer yid) {
        return (Ydata) ydataMapper.getById(yid);
    }

    @Override
    public ServerResponse<Integer> update(Ydata ydata) {
        ydata.setTmoney(ydataMapper.selectMoney(0));
        ydata.setMmoney(ydataMapper.selectMoney(month));
        ydata.setTuser(ydataMapper.selectUser(0));
        ydata.setMuser(ydataMapper.selectUser(month));
        ydata.setTtzno(ydataMapper.selectTzno(0));
        ydata.setMtzno(ydataMapper.selectTzno(month));
        ydata.setTdkno(ydataMapper.selectDkno(0));
        ydata.setMdkno(ydataMapper.selectDkno(month));
        ydata.setTdkbno(ydataMapper.selectDkbno(0));
        ydata.setMdkbno(ydataMapper.selectDkbno(month));
        validationResult = ValidationUtils.validateEntity(ydata);
        if(validationResult.isHasErrors()) {
            return ServerResponse.createByError(validationResult.getErrorMsg());
        }
        if(ydataMapper.update(ydata) == 1){
            return ServerResponse.createBySuccess("更新成功");
        }
        return ServerResponse.createByError("更新失败");
    }

    @Override
    public ServerResponse<Integer> save(Ydata ydata) {
        ydata.setTmoney(ydataMapper.selectMoney(0));
        ydata.setMmoney(ydataMapper.selectMoney(month));
        ydata.setTuser(ydataMapper.selectUser(0));
        ydata.setMuser(ydataMapper.selectUser(month));
        ydata.setTtzno(ydataMapper.selectTzno(0));
        ydata.setMtzno(ydataMapper.selectTzno(month));
        ydata.setTdkno(ydataMapper.selectDkno(0));
        ydata.setMdkno(ydataMapper.selectDkno(month));
        ydata.setTdkbno(ydataMapper.selectDkbno(0));
        ydata.setMdkbno(ydataMapper.selectDkbno(month));
        validationResult = ValidationUtils.validateEntity(ydata);
        if(validationResult.isHasErrors()) {
            return ServerResponse.createByError(validationResult.getErrorMsg());
        }
        if(ydataMapper.save(ydata) == 1){
            return ServerResponse.createBySuccess("添加成功");
        }
        return ServerResponse.createByError("添加失败");
    }

    @Override
    public Ydata selectEnd() {
        return ydataMapper.selectEnd();
    }
}
