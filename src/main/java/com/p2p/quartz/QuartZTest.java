package com.p2p.quartz;

import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;

/**
 * Created by Master on 2017/11/10.
 */
public class QuartZTest {

    /**
     * 1、作业、任务    Job, Task
     * 2、触发器      在哪个指定的时间规则
     * 3、调度器
     *
     * CRON表达式
     * 来源于linux系统，可以使用cron表达式表示出任意一个时间点
     *
     * Cron表达式是一个字符串，字符串以5或6个空格隔开，分为6或7个域，每一个域代表一个含义，Cron有如下两种语法格式：
     Seconds Minutes Hours DayofMonth Month DayofWeek Year或
     Seconds Minutes Hours DayofMonth Month DayofWeek

     每一个域可出现的字符如下：
     Seconds:可出现", - * /"四个字符，有效范围为0-59的整数
     Minutes:可出现", - * /"四个字符，有效范围为0-59的整数
     Hours:可出现", - * /"四个字符，有效范围为0-23的整数
     DayofMonth:可出现", - * / ? L W C"八个字符，有效范围为0-31的整数
     Month:可出现", - * /"四个字符，有效范围为1-12的整数或JAN-DEc
     DayofWeek:可出现", - * / ? L C #"四个字符，有效范围为1-7的整数或SUN-SAT两个范围。1表示星期天，2表示星期一， 依次类推
     Year:可出现", - * /"四个字符，有效范围为1970-2099年
     *
     * @param args
     */
    public static void main(String... args) {
        // 作业类
        JobDetail jobDetail = JobBuilder.newJob(HelloJob.class)
                .withIdentity("helloJob", "group1")
                .build();
        JobDetail jobDetail1 = JobBuilder.newJob(CronJob.class)
                .withIdentity("cronJob", "group1")
                .build();
        // 触发器
        Trigger trigger1 = TriggerBuilder.newTrigger()
                .withIdentity("trigger1", "group1")
                .withSchedule(CronScheduleBuilder.cronSchedule("0 0 2 * * ? *")).build();
        // 每天的凌晨2：00跑一次
        Trigger trigger2 = TriggerBuilder.newTrigger()
                .withIdentity("trigger2", "group2")
                .withSchedule(CronScheduleBuilder.cronSchedule("0 0 2 * * ? *")).build();
        try {
            // 调度器
            Scheduler scheduler = StdSchedulerFactory.getDefaultScheduler();
            scheduler.start();
            scheduler.scheduleJob(jobDetail, trigger1);
            scheduler.scheduleJob(jobDetail1, trigger2);
        } catch (SchedulerException e) {
            e.printStackTrace();
        }
    }
}
