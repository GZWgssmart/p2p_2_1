package com.p2p.common;

import java.math.BigDecimal;

/**
 * Created by 7025 on 2017/12/25.
 */
public class Constants {

    /**
     * 最小借款金额10000
     */
    public static final BigDecimal MIN_BORROW = BigDecimal.valueOf(10000);

    /**
     * 最小投资金额
     */
    public static final BigDecimal MIN_TZ = BigDecimal.valueOf(100);

    /**
     * 盐值
     */
    public static final String SALT = "p2p_2_1";

    /**
     * 后台用户session名
     */
    public static final String ADMIN_IN_SESSION = "admin";
    /**
     * 前台用户session名
     */
    public static final String USER_IN_SESSION = "user";
}
