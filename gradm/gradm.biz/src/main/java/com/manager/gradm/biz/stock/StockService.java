package com.manager.gradm.biz.stock;

import com.manager.gradm.common.Result;
import com.manager.gradm.entity.stock.Stock;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

/**
 * Created by feilong.li on 2016/5/28.
 */
public interface StockService {

    public Page<Stock> getStockList(Pageable pageable, Map<String, Object> searchParams);

    public Stock selectById(Long id);

    public Result addOrUptStock(Stock stock);

    public List<Stock> select(Map<String, Object> searchParams);

    public Integer insert(Stock stock);

    public Result saveOrUpt(Stock stock);
}
