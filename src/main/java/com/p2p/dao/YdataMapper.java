package com.p2p.dao;

import com.p2p.bean.Ydata;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;

@Repository
public interface YdataMapper extends BaseDAO {

    /**
     * 总交易总额
     * 月交易总额
     * @param month
     * @return
     */
    BigDecimal selectMoney(@Param("month") Integer month);
    /**
     * 注册人数
     * @return
     */
    int selectUser(@Param("month") Integer month);
    /**
     * 投资人数
     * @return
     */
    int selectTzno(@Param("month") Integer month);
    /**
     * 贷款人数
     * @return
     */
    int selectDkno(@Param("month") Integer month);
    /**
     * 贷款笔数
     * @return
     */
    int selectDkbno(@Param("month") Integer month);

    /**
     * 查找最新数据
     * @return
     */
    Ydata selectEnd();

}