package com.p2p.dao;

import com.p2p.common.Pager;
import com.p2p.vo.BorrowingVO;
import com.p2p.vo.IndexBorrowVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Repository
public interface BorrowApplyMapper extends BaseDAO {

    int updateChecked(@Param("baid")Integer baid, @Param("status")Integer status, @Param("cktime")Date cktime);

    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query") Object obj);

    @Override
    Long countCriteria(@Param("query") Object obj);

    List<Object> listPagerByBzid(@Param("pager") Pager pager, @Param("query") Object obj);

    List<BorrowingVO> borrowingList();
}