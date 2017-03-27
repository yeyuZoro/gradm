package com.manager.gradm.biz.goods.impl;

import com.manager.gradm.biz.base.BaseServiceImpl;
import com.manager.gradm.biz.common.DefaultPage;
import com.manager.gradm.biz.goods.GoodsService;
import com.manager.gradm.biz.stock.StockService;
import com.manager.gradm.common.Result;
import com.manager.gradm.dao.goods.GoodsCategoryDao;
import com.manager.gradm.dao.goods.GoodsDao;
import com.manager.gradm.entity.goods.Goods;
import com.manager.gradm.entity.goods.GoodsCategory;
import com.manager.gradm.entity.stock.Stock;
import com.manager.gradm.pojo.goods.GoodsCategoryVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.math.BigDecimal;
import java.util.*;

/**
 * Created by lifeilong on 2016/5/4.
 */
@Service
@Slf4j
public class GoodsServiceImpl extends BaseServiceImpl implements GoodsService {

    @Autowired
    private GoodsDao goodsDao;

    @Autowired
    private GoodsCategoryDao goodsCategoryDao;

    @Autowired
    private StockService stockService;

    @Override
    public Page<Goods> getGoodsList(Pageable pageable, Map<String, Object> searchParams) {
        log.info("[配件列表]");
        if(pageable.getSort() != null){
            Iterator<Sort.Order> iterator = pageable.getSort().iterator();
            ArrayList<String> sorts = new ArrayList<String>();
            while (iterator.hasNext()) {
                Sort.Order order = iterator.next();
                sorts.add(order.getProperty() + " " + order.getDirection().name());
            }
            searchParams.put("sorts", sorts);
        }

        Integer totalSize = goodsDao.selectCount(searchParams);

        PageRequest pageRequest =
                new PageRequest((pageable.getPageNumber() < 1 ? 1 : pageable.getPageNumber()) - 1,
                        pageable.getPageSize() < 1 ? 1 : pageable.getPageSize(), pageable.getSort());

        searchParams.put("limit", pageRequest.getPageSize());
        searchParams.put("offset", pageRequest.getOffset());

        List<Goods> data = goodsDao.select(searchParams);
        if(!CollectionUtils.isEmpty(data)) {
            for(Goods goods : data) {
                GoodsCategory goodsCategory = goodsCategoryDao.selectById(goods.getCategoryId());
                if(null != goodsCategory) {
                    goods.setCategoryName(goodsCategory.getCatName());
                }
            }
        }
        DefaultPage<Goods> page = new DefaultPage<Goods>(data, pageRequest, totalSize);
        return page;
    }

    @Override
    public Goods selectById(Long id) {
        Goods goods = goodsDao.selectById(id);
        return goods;
    }

    @Override
    public Result addOrUptGoods(Goods goods) {
        log.info("[新增或更新配件],goods={}", goods);
        if(null == goods.getId() || goods.getId() < 1){
            if(goodsDao.insert(goods) > 0) {
                Stock stock = new Stock();
                stock.setGoodsId(goods.getId());
                stock.setMeasureUnit(goods.getMeasureUnit());
                stock.setGoodsName(goods.getName());
                stock.setCurrentStock(goods.getStock());
                stock.setRealStock(goods.getStock());
                stock.setDiffStock(BigDecimal.ZERO);
                if(stockService.insert(stock) > 0) {
                    log.info("新增配件，库存初始化成功, stockId={}", stock.getId());
                } else {
                    log.error("新增配件，库存初始化失败,goodsId={}", goods.getId());
                }
                return Result.wrapSuccessfulResult("配件新增成功");
            }
        } else {
            if(goodsDao.updateById(goods) > 0) {
                Map<String, Object> stockParam = new HashMap<>();
                stockParam.put("goodsId", goods.getId());
                List<Stock> stockList = stockService.select(stockParam);
                if(!CollectionUtils.isEmpty(stockList)) {
                    Stock stock = stockList.get(0);
                    stock.setCurrentStock(goods.getStock());
                    stock.setRealStock(goods.getStock().subtract(stock.getRealStock()));
                }
                return Result.wrapSuccessfulResult("更新成功");
            }
        }
        return Result.wrapErrorResult("", "保存失败");
    }

    @Override
    public Page<GoodsCategoryVO> getGoodsCategory(Pageable pageable, Map<String, Object> searchParams) {
        if(pageable.getSort() != null){
            Iterator<Sort.Order> iterator = pageable.getSort().iterator();
            ArrayList<String> sorts = new ArrayList<String>();
            while (iterator.hasNext()) {
                Sort.Order order = iterator.next();
                sorts.add(order.getProperty() + " " + order.getDirection().name());
            }
            searchParams.put("sorts", sorts);
        }

        Integer totalSize = goodsCategoryDao.selectCount(searchParams);

        PageRequest pageRequest =
                new PageRequest((pageable.getPageNumber() < 1 ? 1 : pageable.getPageNumber()) - 1,
                        pageable.getPageSize() < 1 ? 1 : pageable.getPageSize(), pageable.getSort());

        searchParams.put("limit", pageRequest.getPageSize());
        searchParams.put("offset", pageRequest.getOffset());

        List<GoodsCategory> goodsCategoryList = goodsCategoryDao.select(searchParams);
        List<GoodsCategoryVO> goodsCategoryVOs = new ArrayList<>();
        if(!CollectionUtils.isEmpty(goodsCategoryList)) {
            for (GoodsCategory goodsCategory : goodsCategoryList) {
                GoodsCategoryVO goodsCategoryVO = new GoodsCategoryVO();
                goodsCategoryVO.setId(goodsCategory.getId());
                goodsCategoryVO.setCatName(goodsCategory.getCatName());
                if(goodsCategory.getParentId() > 0) {
                    GoodsCategory cate = goodsCategoryDao.selectById(goodsCategory.getParentId());
                    if(null != cate) {
                        goodsCategoryVO.setParentName(cate.getCatName());
                    } else {
                        goodsCategoryVO.setParentName("无");
                    }
                } else {
                    goodsCategoryVO.setParentName("无");
                }
                goodsCategoryVOs.add(goodsCategoryVO);
            }
        }
        DefaultPage<GoodsCategoryVO> page = new DefaultPage<GoodsCategoryVO>(goodsCategoryVOs, pageRequest, totalSize);
        return page;
    }

    @Override
    public GoodsCategory catSelectById(Long id) {
        GoodsCategory category = goodsCategoryDao.selectById(id);
        return category;
    }

    /**
     * 获取配件所有分类
     * @param searchParams
     * @return
     */
    @Override
    public List<GoodsCategory> getAllCategory(Map<String, Object> searchParams) {
        List<GoodsCategory> goodsCategoryList = goodsCategoryDao.select(searchParams);
        return goodsCategoryList;
    }

    @Override
    public Result addOrUptGoodsCategory(GoodsCategory category) {
        if(null == category.getId() || category.getId() < 1) {
            goodsCategoryDao.insert(category);
            return Result.wrapSuccessfulResult("新增成功");
        } else {
            if(goodsCategoryDao.updateById(category) > 0) {
                return Result.wrapSuccessfulResult("修改成功");
            } else {
                log.error("[配件分类]修改失败,category={}", category);
                return Result.wrapSuccessfulResult("修改失败");
            }
        }
    }

    @Override
    public Result deletedById(Long id) {
        if(goodsDao.deleteById(id) > 0) {
            return Result.wrapSuccessfulResult("删除成功");
        } else {
            return Result.wrapErrorResult("", "删除失败");
        }
    }
}
