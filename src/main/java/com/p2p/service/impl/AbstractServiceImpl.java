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
        if(baseDAO.save(obj) == 1) {
            return ServerResponse.createBySuccess("添加成功");
        }
        return ServerResponse.createByError("添加失败");
    }

    @Override
    public ServerResponse<Integer> remove(Object obj) {
        validationResult = ValidationUtils.validateEntity(obj);
        if(validationResult.isHasErrors()) {
            return ServerResponse.createByError(validationResult.getErrorMsg());
        }
        if(baseDAO.remove(obj) == 1) {
            return ServerResponse.createBySuccess("删除成功");
        }
        return ServerResponse.createByError("删除失败");
    }

    @Override
    public ServerResponse<Integer> removeById(Integer id) {
        if(baseDAO.removeById(id) == 1) {
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
        if(baseDAO.update(obj) == 1){
            return ServerResponse.createBySuccess("更新成功");
        }
        return ServerResponse.createByError("更新失败");
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
        pager.setTotal(baseDAO.count());
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

    //以下根据需求，个人自定义使用的分页
    @Override
    public Pager listPagerStatus(int pageNo, int pageSize) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(baseDAO.listPager(pager));
        pager.setTotal(baseDAO.count());
        return pager;
    }

    @Override
    public Pager listPagerCriteriaStatus(int pageNo, int pageSize, Object obj) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(baseDAO.listPagerCriteriaStatus(pager, obj));
        pager.setTotal(baseDAO.countCriteriaStatus(obj));
        return pager;
    }

}
