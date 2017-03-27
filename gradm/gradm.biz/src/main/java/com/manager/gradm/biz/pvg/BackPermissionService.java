package com.manager.gradm.biz.pvg;

import com.manager.gradm.common.Result;
import com.manager.gradm.entity.pvg.BackPermission;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

/**
 * Created by lifeilong on 2016/4/29.
 */
public interface BackPermissionService {

    public Page<BackPermission> getPage(Pageable pageable, Map<String, Object> searchParams);
    //更新
    public Result updateById(BackPermission backPermission);
    //添加
    public Result insert(BackPermission backPermission);

    public List<BackPermission> select(Map<String, Object> searchParams);
}
