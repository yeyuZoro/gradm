package com.manager.gradm.entity.stock;

import com.manager.gradm.entity.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

/**
 * Created by lifeilong on 2016/5/17.
 */
@EqualsAndHashCode(callSuper = false)
@Data
public class Stock extends BaseEntity{
    private Long goodsId;
    private String goodsName;
    private String measureUnit;
    private BigDecimal currentStock;
    private BigDecimal realStock;
    private BigDecimal diffStock;
    private String reason;

    //临时字段
    private String gmtCreateStr;    //信息创建时间
    private String gmtModifiedStr;   //库存上次更新时间
}

