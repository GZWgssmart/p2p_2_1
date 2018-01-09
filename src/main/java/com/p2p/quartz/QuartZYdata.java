package com.p2p.quartz;

import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by Master on 2017/11/10.
 * @author 娃娃鱼
 */
public class QuartZYdata {

    /**
     * @param args
     */
    public static void main(String... args) {
        // 作业类
        JobDetail jobDetail = JobBuilder.newJob(YdataUpdateJob.class)
                .withIdentity("updateJob", "group1")
                .build();
        // 每天的凌晨2：00更新数据
        Trigger trigger = TriggerBuilder.newTrigger()
                .withIdentity("trigger2", "group2")
                .withSchedule(CronScheduleBuilder.cronSchedule("0 */1 * * * ?")).build();
        try {
            // 调度器
            Scheduler scheduler = StdSchedulerFactory.getDefaultScheduler();
            scheduler.start();
            scheduler.scheduleJob(jobDetail, trigger);
        } catch (SchedulerException e) {
            e.printStackTrace();
        }
    }
}
