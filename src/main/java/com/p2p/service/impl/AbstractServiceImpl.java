package com.p2p.service.impl;

import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.common.ValidationResult;
import com.p2p.common.ValidationUtils;
import com.p2p.dao.BaseDAO;
import com.p2p.service.BaseService;

import java.util.List;

/**
 * Created by 7025 on 2017/12/22.
 */
public abstract class AbstractServiceImpl implements BaseService {

    private BaseDAO baseDAO;
    private ValidationResult validationResult;

    @Override
    public ServerResponse<Integer> save(Object obj) {
        validationResult = ValidationUtils.validateEntity(obj);
        if(validationResult.isHasErrors()) {
            return ServerResponse.createByError(validationResult.getErrorMsg());
        }
        baseDAO.save(obj);
        return ServerResponse.createBySuccess("添加成功");
    }

    @Override
    public ServerResponse<Integer> remove(Object obj) {
        validationResult = ValidationUtils.validateEntity(obj);
        if(validationResult.isHasErrors()) {
            return ServerResponse.createByError(validationResult.getErrorMsg());
        }
        baseDAO.remove(obj);
        return ServerResponse.createBySuccess("删除成功");
    }

    @Override
    public ServerResponse<Integer> removeById(Integer id) {
        if(baseDAO.remove(id) == 1) {
            return ServerResponse.createBySuccess("删除成功");
        } else {
            return ServerResponse.createByError("删除失败");
        }
    }

    @Override
    public ServerResponse<Integer> active(Integer id, Integer status) {
        if(baseDAO.active(id, status) == 1) {
            return ServerResponse.createBySuccess("修改成功");
        } else {
            return ServerResponse.createByError("修改失败");
        }
    }

    @Override
    public ServerResponse<Integer> update(Object obj) {
        validationResult = ValidationUtils.validateEntity(obj);
        if(validationResult.isHasErrors()) {
            return ServerResponse.createByError(validationResult.getErrorMsg());
        }
        baseDAO.update(obj);
        return ServerResponse.createBySuccess("更新成功");
    }

    @Override
    public Object getById(Integer id) {
        return baseDAO.getById(id);
    }

    @Override
    public List<Object> listAll() {
        return baseDAO.listAll();
    }

    @Override
    public Pager listPager(int pageNo, int pageSize) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(baseDAO.listPager(pager));
        return pager;
    }

    @Override
    public Pager listPagerCriteria(int pageNo, int pageSize, Object obj) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(baseDAO.listPagerCriteria(pager, obj));
        pager.setTotal(baseDAO.countCriteria(obj));
        return pager;
    }

    public void setBaseDAO(BaseDAO baseDAO) {
        this.baseDAO = baseDAO;
    }
}
