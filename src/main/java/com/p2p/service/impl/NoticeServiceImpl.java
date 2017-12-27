package com.p2p.service.impl;

import com.p2p.dao.NoticeMapper;
import com.p2p.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by ccf on 2017/12/26.
 */
@Service
public class NoticeServiceImpl extends AbstractServiceImpl implements NoticeService{
    private NoticeMapper noticeMapper;
    @Autowired
    public void setNoticeMapper(NoticeMapper noticeMapper){
        super.setBaseDAO(noticeMapper);
        this.noticeMapper = noticeMapper;
    }


}
