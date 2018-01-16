package com.p2p.dao;

import com.p2p.bean.Skb;
import com.p2p.common.Pager;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SkbMapper extends BaseDAO {

    int updateByBaid(Skb skb);

    int saveList(List<Skb> list);

    Long getByUidAndBaid(@Param("uid") Integer uid, @Param("baid") Integer baid);

    List<Object> list(@Param("pager") Pager pager, @Param("uid") Integer uid, @Param("baid") Integer baid);

    long countUid(@Param("uid") Integer uid,@Param("baid") Integer baid);
}