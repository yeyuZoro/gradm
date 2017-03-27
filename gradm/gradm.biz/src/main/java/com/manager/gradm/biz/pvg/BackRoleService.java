package com.manager.gradm.biz.pvg;

import com.manager.gradm.common.Result;
import com.manager.gradm.entity.user.BackRole;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

/**
 * Created by lifeilong on 2016/5/19.
 */
public interface BackRoleService {

    /**
     * 获取角色列表分页
     */
    public Page<BackRole> getPage(Pageable pageable,Map<String,Object> searchParams);

    public BackRole selectById(Long id);

    public Result update(BackRole backRole);

    public Result insert(BackRole backRole);

    public List<BackRole> select(Map<String,Object> searchParams);
}
