package com.manager.gradm.entity.goods;

import com.manager.gradm.entity.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Created by lifeilong on 2016/4/27.
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class Goods extends BaseEntity{

    private String name;  //配件名称
    private String goodsSn; //配件编号
    private String measureUnit; //最小单位
    private BigDecimal price;   //销售价格
    private BigDecimal stock;   //库存
    private Long categoryId;    //配件类型id
    private String goodsBrand;  //配件品牌

    private String categoryName;    //配件类型名称
}
