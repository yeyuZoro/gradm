package com.manager.gradm.biz.user;

import com.manager.gradm.common.Result;
import com.manager.gradm.entity.user.Manager;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Map;

/**
 * Created by lifeilong on 2016/5/19.
 */
public interface ManagerService {
    public Manager selectById(Long id);

    /**
     * 获取员工信息列表
     * @param pageable
     * @param searchParams
     * @return
     */
    public Page<Manager> getPage(Pageable pageable, Map<String, Object> searchParams);


    public Result saveOrUpt(Manager manager);

    public Result deletedById(Long id);
}
