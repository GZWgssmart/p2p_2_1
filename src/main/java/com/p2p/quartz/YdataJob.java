package com.p2p.quartz;

import com.p2p.bean.Ydata;
import com.p2p.service.YdataService;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import java.util.Date;

/**
 * Created by 娃娃鱼 on 2018/1/9.
 */
public class YdataJob implements Job {

    private YdataService ydataService;

    private Ydata ydata;

    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        ydataService = (YdataService) jobExecutionContext.getJobDetail().getJobDataMap().get("ydataService");
        ydata = new Ydata();
        ydata.setCreatedTime(new Date());
        ydataService.save(ydata);
    }
}
