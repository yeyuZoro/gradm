package com.manager.gradm.biz.stock.impl;

import com.manager.gradm.biz.base.BaseServiceImpl;
import com.manager.gradm.biz.common.DefaultPage;
import com.manager.gradm.biz.goods.GoodsService;
import com.manager.gradm.biz.stock.StockService;
import com.manager.gradm.common.Result;
import com.manager.gradm.common.util.DateUtil;
import com.manager.gradm.dao.goods.GoodsDao;
import com.manager.gradm.dao.stock.StockDao;
import com.manager.gradm.entity.goods.Goods;
import com.manager.gradm.entity.stock.Stock;
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
 * Created by feilong.li on 2016/5/28.
 */
@Service
@Slf4j
public class StockServiceImpl extends BaseServiceImpl implements StockService {

    @Autowired
    private StockDao stockDao;

    @Autowired
    private GoodsDao goodsDao;

    @Override
    public Page<Stock> getStockList(Pageable pageable, Map<String, Object> searchParams) {
        if(pageable.getSort() != null){
            Iterator<Sort.Order> iterator = pageable.getSort().iterator();
            ArrayList<String> sorts = new ArrayList<String>();
            while (iterator.hasNext()) {
                Sort.Order order = iterator.next();
                sorts.add(order.getProperty() + " " + order.getDirection().name());
            }
            searchParams.put("sorts", sorts);
        }

        Integer totalSize = stockDao.selectCount(searchParams);

        PageRequest pageRequest =
                new PageRequest((pageable.getPageNumber() < 1 ? 1 : pageable.getPageNumber()) - 1,
                        pageable.getPageSize() < 1 ? 1 : pageable.getPageSize(), pageable.getSort());

        searchParams.put("limit", pageRequest.getPageSize());
        searchParams.put("offset", pageRequest.getOffset());

        List<Stock> data = stockDao.select(searchParams);
        if(!CollectionUtils.isEmpty(data)) {
            for(Stock stock : data) {
                stock.setGmtCreateStr(DateUtil.convertDateToYMDHMStr(stock.getGmtCreate()));
                stock.setGmtModifiedStr(DateUtil.convertDateToYMDHMStr(stock.getGmtModified()));
            }
        }
        DefaultPage<Stock> page = new DefaultPage<Stock>(data, pageRequest, totalSize);
        return page;
}

    @Override
    public Stock selectById(Long id) {
        return stockDao.selectById(id);
    }

    @Override
    public Result addOrUptStock(Stock stock) {
        return null;
    }

    @Override
    public List<Stock> select(Map<String, Object> searchParams) {
        return stockDao.select(searchParams);
    }

    @Override
    public Integer insert(Stock stock) {
        return stockDao.insert(stock);
    }

    @Override
    public Result saveOrUpt(Stock stock) {
        if(stockDao.updateById(stock) > 0) {
            Goods goods = new Goods();
            goods.setId(stock.getGoodsId());
            goods.setStock(stock.getCurrentStock());
            goods.setMeasureUnit(stock.getMeasureUnit());
            if(goodsDao.updateById(goods) > 0 ) {
                log.info("[库存更新] 更新配件库存成功");
            } else {
                log.info("[库存更新] 更新配件库存失败");
            }
            return Result.wrapSuccessfulResult("更新成功");
        } else {
            return Result.wrapErrorResult("", "更新失败，请检查更新信息");
        }
    }

}
