package com.manager.gradm.biz;

import com.manager.gradm.biz.common.DefaultPage;
import com.manager.gradm.biz.goods.GoodsService;
import com.manager.gradm.entity.goods.Goods;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.junit.runner.RunWith;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by feilong.li on 17/4/5.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:test-biz-context.xml")
@Slf4j
public class InterfaceTest {

    @Autowired
    private DataSource dataSource;

    @Autowired
    private GoodsService goodsService;

    @Test
    public void intefaceTest01() {
        int pageNum = 1;
        int size = 10;
        Pageable pageable = new PageRequest(pageNum, size);
        Map<String, Object> searchParams = new HashMap<>();
        Page<Goods> page  = goodsService.getGoodsList(pageable, searchParams);
        List<Goods> goodsList = page.getContent();
        Assert.assertNotNull(goodsList);
        String sql = "select * from gradm_goods where is_deleted = 'N' limit " + (pageNum - 1) + "," + size;
        List<Map<String, Object>> goodsListDB = queryData(sql);
        for (int i = 0 ; i < goodsList.size(); i ++) {
            Goods goods = goodsList.get(i);
            Long idForDB = (Long)goodsListDB.get(i).get("id");
            Boolean check = goods.getId().equals(idForDB);
            log.info("check结果:{}", check);
            Assert.assertTrue(check);
            Assert.assertTrue(goods.getName().equals((String)goodsListDB.get(i).get("name")));
            Assert.assertTrue(goods.getGoodsBrand().equals((String)goodsListDB.get(i).get("goods_brand")));
            Assert.assertTrue(goods.getGoodsSn().equals((String)goodsListDB.get(i).get("goods_sn")));
        }
    }




    public List<Map<String, Object>> queryData(String sql) {
        List<Map<String, Object>> result = null;
        try {
            QueryRunner runner = new QueryRunner(dataSource);

            result = runner.query(sql, new MapListHandler());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public int updateData(String sql) {
        int result;
        try {
            QueryRunner runner = new QueryRunner(dataSource);

            result = runner.update(sql);
            return result;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
