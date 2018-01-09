package com.p2p.quartz;

import com.p2p.bean.Ydata;
import com.p2p.common.ServerResponse;
import com.p2p.service.YdataService;
import com.p2p.service.impl.YdateServiceImpl;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * Created by 娃娃鱼 on 2018/1/9.
 */
@Component
public class YdataUpdateJob implements Job {

    @Autowired
    private YdataService ydataService;

    private Ydata ydata;

    public void query() {

    }

    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        ydataService = (YdataService) jobExecutionContext.getJobDetail().getJobDataMap().get("ydataService");
        ydata = new Ydata();
        ydata.setYid(2);
        ydataService.update(ydata);
    }
}
