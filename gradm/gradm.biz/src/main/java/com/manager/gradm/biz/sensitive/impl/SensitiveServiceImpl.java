package com.manager.gradm.biz.sensitive.impl;

import com.manager.gradm.biz.base.BaseServiceImpl;
import com.manager.gradm.biz.common.DefaultPage;
import com.manager.gradm.biz.sensitive.SensitiveService;
import com.manager.gradm.common.Result;
import com.manager.gradm.dao.sensitive.SensitiveDao;
import com.manager.gradm.entity.sensitive.Sensitive;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


/**
 * Created by Administrator on 2017/3/17.
 */
@Service
@Slf4j
public class SensitiveServiceImpl extends BaseServiceImpl implements SensitiveService {

@Autowired
public SensitiveDao sensitiveDao;


@Override
    public Page<Sensitive> getSensitiveList(Pageable pageable, Map<String,Object>searchParams){
        log.info("敏感词表");

        if (pageable.getSort()!=null){
            Iterator<Sort.Order> iterator = pageable.getSort().iterator();
            ArrayList<String>sorts=new ArrayList<String>();
            while (iterator.hasNext()){
                Sort.Order order=iterator.next();
                sorts.add(order.getProperty() + " " + order.getDirection().name());
            }
            searchParams.put("sorts",sorts);
        }
    searchParams.put("name", "abc");
        Integer totaSize=sensitiveDao.selectCount(searchParams);

    PageRequest pageRequest =
            new PageRequest((pageable.getPageNumber() < 1 ? 1 : pageable.getPageNumber()) - 1,
                    pageable.getPageSize() < 1 ? 1 : pageable.getPageSize(), pageable.getSort());

    searchParams.put("limit", pageRequest.getPageSize());
    searchParams.put("offset", pageRequest.getOffset());

    List<Sensitive>date=sensitiveDao.select(searchParams);

    DefaultPage<Sensitive> page=new DefaultPage<Sensitive>(date,pageRequest,totaSize);
    return page;
    }

    @Override
    public Sensitive selectById(Long id){
        Sensitive sensitive=sensitiveDao.selectById(id);
        return sensitive;
    }
    //public Result

}
