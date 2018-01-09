package com.p2p.quartz;

import com.p2p.bean.Ydata;
import com.p2p.common.ServerResponse;
import com.p2p.service.YdataService;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

/**
 * Created by 娃娃鱼 on 2018/1/9.
 */
public class YdataJob implements Job {

    @Autowired
    private YdataService ydataService;

    private Ydata ydata;

    public void query() {
        ydata = new Ydata();
        ydata.setCreatedTime(new Date());
        ServerResponse serverResponse = ydataService.save(ydata);
    }

    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        query();
        System.out.println("1312312312");
    }
}
