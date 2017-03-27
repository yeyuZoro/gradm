package com.manager.gradm.biz.goods;

import com.manager.gradm.common.Result;
import com.manager.gradm.entity.goods.Goods;
import com.manager.gradm.entity.goods.GoodsCategory;
import com.manager.gradm.pojo.goods.GoodsCategoryVO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

/**
 * Created by lifeilong on 2016/5/4.
 */
public interface GoodsService {

    public Page<Goods> getGoodsList(Pageable pageable, Map<String, Object> searchParams);

    public Goods selectById(Long id);

    public Result addOrUptGoods(Goods goods);

    public Page<GoodsCategoryVO> getGoodsCategory(Pageable pageable, Map<String, Object> searchParams);


    public GoodsCategory catSelectById(Long id);

    public List<GoodsCategory> getAllCategory(Map<String, Object> searchParams);

    public Result addOrUptGoodsCategory(GoodsCategory category);

    public Result deletedById(Long id);
}
