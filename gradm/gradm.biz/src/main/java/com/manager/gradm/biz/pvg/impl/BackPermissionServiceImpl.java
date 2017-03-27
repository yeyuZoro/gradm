package com.manager.gradm.biz.pvg.impl;

import com.manager.gradm.biz.base.BaseServiceImpl;
import com.manager.gradm.biz.pvg.BackPermissionService;
import com.manager.gradm.common.Result;
import com.manager.gradm.dao.pvg.BackPermissionDao;
import com.manager.gradm.entity.pvg.BackPermission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by lifeilong on 2016/4/29.
 */
@Service
public class BackPermissionServiceImpl extends BaseServiceImpl implements BackPermissionService {

    @Autowired
    private BackPermissionDao backPermissionDao;

    @Override
    public Page<BackPermission> getPage(Pageable pageable, Map<String, Object> searchParams) {
        return super.getPage(backPermissionDao, pageable, searchParams);
    }

    @Override
    public Result updateById(BackPermission backPermission) {
        backPermissionDao.updateById(backPermission);
        return Result.wrapSuccessfulResult(backPermission.getId());
    }

    @Override
    public Result insert(BackPermission backPermission) {
        backPermissionDao.insert(backPermission);
        return Result.wrapSuccessfulResult(backPermission.getId());
    }

    @Override
    public List<BackPermission> select(Map<String, Object> searchParams) {
        List<BackPermission> backPermissionList = backPermissionDao.select(searchParams);
        return backPermissionList;
    }
}
