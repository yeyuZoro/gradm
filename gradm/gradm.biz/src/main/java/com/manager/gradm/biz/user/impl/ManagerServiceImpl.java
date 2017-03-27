package com.manager.gradm.biz.user.impl;

import com.manager.gradm.biz.base.BaseServiceImpl;
import com.manager.gradm.biz.common.DefaultPage;
import com.manager.gradm.biz.user.ManagerService;
import com.manager.gradm.common.Result;
import com.manager.gradm.dao.user.ManagerDao;
import com.manager.gradm.entity.user.Manager;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Created by lifeilong on 2016/5/19.
 */
@Service
@Slf4j
public class ManagerServiceImpl extends BaseServiceImpl implements ManagerService {

    @Autowired
    private ManagerDao managerDao;

    @Override
    public Manager selectById(Long id) {
        Manager manager = managerDao.selectById(id);
        return manager;
    }

    @Override
    public Page<Manager> getPage(Pageable pageable, Map<String, Object> searchParams) {
        if(pageable.getSort() != null){
            Iterator<Sort.Order> iterator = pageable.getSort().iterator();
            ArrayList<String> sorts = new ArrayList<String>();
            while (iterator.hasNext()) {
                Sort.Order order = iterator.next();
                sorts.add(order.getProperty() + " " + order.getDirection().name());
            }
            searchParams.put("sorts", sorts);
        }

        Integer totalSize = managerDao.selectCount(searchParams);

        PageRequest pageRequest =
                new PageRequest((pageable.getPageNumber() < 1 ? 1 : pageable.getPageNumber()) - 1,
                        pageable.getPageSize() < 1 ? 1 : pageable.getPageSize(), pageable.getSort());

        searchParams.put("limit", pageRequest.getPageSize());
        searchParams.put("offset", pageRequest.getOffset());

        List<Manager> data = managerDao.select(searchParams);
        if(!CollectionUtils.isEmpty(data)) {
            for(Manager manager : data) {
                if(null != manager.getGender()) {
                    if(manager.getGender().equals(0)) {
                        manager.setGenderName("女");
                    } else if(manager.getGender().equals(1)){
                        manager.setGenderName("男");
                    }
                }
                if(null != manager.getIsAdmin()) {
                    if(manager.getIsAdmin().equals(0)) {
                        manager.setIsAdminName("否");
                    }
                    if(manager.getIsAdmin().equals(1)) {
                        manager.setIsAdminName("是");
                    }
                }
            }
        }
        DefaultPage<Manager> page = new DefaultPage<Manager>(data, pageRequest, totalSize);

        return page;
    }

    @Override
    public Result saveOrUpt(Manager manager) {
        try{
            if(null == manager.getId()) {
               if( managerDao.insert(manager) < 1) {
                   log.error("[员工管理]新增员工信息失败");
                   return Result.wrapErrorResult("", "更新失败");
               } else {
                   return Result.wrapSuccessfulResult("新增成功");
               }
            } else {
                if(managerDao.updateById(manager)  < 0){
                    log.error("[员工管理]更新员工信息失败");
                    return Result.wrapErrorResult("", "更新失败");
                } else {
                    return Result.wrapSuccessfulResult("更新成功");
                }
            }
        }catch (Exception e) {
            log.error("更新员工信息失败, e={}", e);
            return Result.wrapErrorResult("","更新失败");
        }
    }

    @Override
    public Result deletedById(Long id) {
        if(managerDao.deleteById(id) > 0) {
            return Result.wrapSuccessfulResult("删除成功");
        } else {
            return Result.wrapErrorResult("", "删除失败");
        }
    }
}
