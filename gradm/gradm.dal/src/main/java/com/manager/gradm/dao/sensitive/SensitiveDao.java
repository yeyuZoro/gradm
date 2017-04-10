package com.manager.gradm.dao.sensitive;

import com.manager.gradm.dao.base.BaseDao;
import com.manager.gradm.dao.common.MyBatisRepository;
import com.manager.gradm.entity.sensitive.Sensitive;

import java.util.List;

/**
 * Created by Administrator on 2017/3/17.
 */
@MyBatisRepository
public interface SensitiveDao extends BaseDao {
    List<Sensitive> selectSensitive(Object id);
}
