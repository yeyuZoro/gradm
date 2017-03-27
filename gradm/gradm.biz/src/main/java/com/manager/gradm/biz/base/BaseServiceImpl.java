package com.manager.gradm.biz.base;

import com.manager.gradm.biz.common.DefaultPage;
import com.manager.gradm.dao.base.BaseDao;
import com.manager.gradm.entity.base.IdEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Created by lifeilong on 2016/4/29.
 */
public abstract class BaseServiceImpl implements BaseService{

    @Override
    public <T extends IdEntity> Page<T> getPage(BaseDao<T> baseDao, Pageable pageable, Map<String, Object> searchParams) {
        if(pageable.getSort() != null){
            Iterator<Sort.Order> iterator = pageable.getSort().iterator();
            ArrayList<String> sorts = new ArrayList<String>();
            while (iterator.hasNext()) {
                Sort.Order order = iterator.next();
                sorts.add(order.getProperty() + " " + order.getDirection().name());
            }
            searchParams.put("sorts", sorts);
        }

        Integer totalSize = baseDao.selectCount(searchParams);

        PageRequest pageRequest =
                new PageRequest((pageable.getPageNumber() < 1 ? 1 : pageable.getPageNumber()) - 1,
                        pageable.getPageSize() < 1 ? 1 : pageable.getPageSize(), pageable.getSort());

        searchParams.put("limit", pageRequest.getPageSize());
        searchParams.put("offset", pageRequest.getOffset());

        List<T> data = baseDao.select(searchParams);
        DefaultPage<T> page = new DefaultPage<T>(data, pageRequest, totalSize);
        return page;
    }
}
