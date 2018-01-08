package com.p2p.service.impl;

import com.p2p.dao.LetterMapper;
import com.p2p.service.LetterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by ccf on 2018/1/5.
 */
@Service
public class LetterServiceImpl extends AbstractServiceImpl implements LetterService {

    private LetterMapper letterMapper;
    @Autowired
    public void setLetterMapper(LetterMapper letterMapper) {
        super.setBaseDAO(letterMapper);
        this.letterMapper = letterMapper;
    }
}
