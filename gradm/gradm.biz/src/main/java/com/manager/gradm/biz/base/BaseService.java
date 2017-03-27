package com.manager.gradm.biz.base;

import com.manager.gradm.dao.base.BaseDao;
import com.manager.gradm.entity.base.IdEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Map;

/**
 * Created by lifeilong on 2016/4/29.
 */
public interface BaseService {

    public <T extends IdEntity> Page<T> getPage(BaseDao<T> baseDao, Pageable pageable,
                                                Map<String, Object> parameters);
}
