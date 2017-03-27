package com.manager.gradm.biz.pvg.impl;

import com.manager.gradm.biz.base.BaseServiceImpl;
import com.manager.gradm.biz.pvg.BackRoleService;
import com.manager.gradm.common.Result;
import com.manager.gradm.dao.pvg.BackPermissionDao;
import com.manager.gradm.dao.user.BackRoleDao;
import com.manager.gradm.entity.pvg.BackPermission;
import com.manager.gradm.entity.user.BackRole;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.Map;

/**
 * Created by lifeilong on 2016/5/19.
 */
@Service
@Slf4j
public class BackRoleServiceImpl extends BaseServiceImpl implements BackRoleService {

    @Autowired
    private BackRoleDao backRoleDao;

    @Autowired
    private BackPermissionDao backPermissionDao;

    @Override
    public Page<BackRole> getPage(Pageable pageable, Map<String, Object> searchParams) {
        Page<BackRole> page = super.getPage(backRoleDao, pageable, searchParams);
        List<BackPermission> backPermissionList = backPermissionDao.select(null);

        if (page != null && page.getContent() != null) {
            for (BackRole backRole : page.getContent()) {
                String permissionIds = backRole.getPermissionIds();
                String[] permissionIdsArr = permissionIds.split(",");
                StringBuilder sb = new StringBuilder("");

                for (int i = 0; i < permissionIdsArr.length; i++) {
                    Long permissionId = Long.parseLong(permissionIdsArr[i]);

                    if (!CollectionUtils.isEmpty(backPermissionList)) {
                        for (BackPermission backPermission : backPermissionList) {
                            if (backPermission.getId().equals( permissionId)) {
                                sb.append(backPermission.getName());
                                sb.append("|");
                            }
                        }
                    }
                }
                backRole.setPermissionNames(sb.toString());
            }
        }
        return page;
    }

    @Override
    public BackRole selectById(Long id) {
        return backRoleDao.selectById(id);
    }

    @Override
    @Transactional
    public Result update(BackRole backRole) {
        backRoleDao.updateById(backRole);
        return Result.wrapSuccessfulResult(backRole.getId());
    }

    @Override
    @Transactional
    public Result insert(BackRole backRole) {
        backRoleDao.insert(backRole);
        return Result.wrapSuccessfulResult(backRole.getId());
    }

    @Override
    public List<BackRole> select(Map<String, Object> searchParams) {
        return backRoleDao.select(searchParams);
    }

}
