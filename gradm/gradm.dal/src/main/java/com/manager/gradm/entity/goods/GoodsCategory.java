package com.manager.gradm.entity.goods;

import com.manager.gradm.entity.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Created by lifeilong on 2016/5/4.
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class GoodsCategory extends BaseEntity{

    private String catName; //配件名称
    private Long parentId;  //父分类id

}
