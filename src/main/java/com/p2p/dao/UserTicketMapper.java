package com.p2p.dao;

import com.p2p.vo.UserTicketVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserTicketMapper extends BaseDAO {

    int getByUidKid(@Param("uid") Integer uid, @Param("kid") Integer kid);

    List<UserTicketVO> userAllTicket(@Param("uid") Integer uid);

}