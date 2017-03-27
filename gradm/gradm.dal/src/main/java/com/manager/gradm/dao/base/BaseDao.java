package com.manager.gradm.dao.base;

import java.util.List;
import java.util.Map;

/**
 * Created by lifeilong on 2016/4/27.
 */
public interface BaseDao<T> {

    /**
     * 查询总数
     *
     * @param param
     * @return
     */
    Integer selectCount(Map<String, Object> param);

    /**
     * 查询
     *
     * @param parameters
     * @return
     */
    List<T> select(Map<String, Object> parameters);


    /**
     * 根据ID查询
     *
     * @param id
     * @return
     */
    T selectById(Object id);

    /**
     * 根据IDS查询
     * @param ids
     * @return
     */
    List<T> selectByIds(Long[] ids);

    /**
     * 根据ID删除
     *
     * @param id
     * @return
     */
    int deleteById(Object id);

    /**
     * 根据IDS批量删除
     *
     * @param list
     * @return
     */
    int deleteByIds(Object[] list);

    /**
     * 删除
     *
     * @param parameters
     * @return
     */
    int delete(Map<String, Object> parameters);

    /**
     * 添加
     *
     * @param t
     * @return
     */
    int insert(T t);

    /**
     * 通过ID更新
     *
     * @param t
     * @return
     */
    int updateById(T t);

    /**
     * 批量插入
     * @param t
     * @return
     */
    Integer batchInsert(List<T> t);

}
