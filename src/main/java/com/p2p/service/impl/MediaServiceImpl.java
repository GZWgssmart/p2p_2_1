package com.p2p.service.impl;

import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.dao.MediaMapper;
import com.p2p.service.MediaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by yao on 2017/12/21.
 */
@Service
public class MediaServiceImpl extends AbstractServiceImpl implements MediaService{

    private MediaMapper mediaMapper;

    @Autowired
    public void setMediaMapper(MediaMapper mediaMapper) {
        super.setBaseDAO(mediaMapper);
        this.mediaMapper = mediaMapper;
    }
}
