package com.manager.gradm.pojo.goods;

import lombok.Data;

/**
 * Created by lifeilong on 2016/5/4.
 */
@Data
public class GoodsCategoryVO {
    private Long id;
    private String catName; //配件名称
    private String parentName;  //父分类id
}
