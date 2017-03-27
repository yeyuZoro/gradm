package com.manager.gradm.entity.pvg;

import com.manager.gradm.entity.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * Created by lifeilong on 2016/4/29.
 */
@EqualsAndHashCode(callSuper = false)
@Data
public class BackPermission extends BaseEntity{

    private String pvgKey;
    private String name;
    private String url;
    private Long parentId;
    private Long sort;
    private Integer isMenu;
    private Integer isNav;

    //临时字段
    private boolean active;

    private List<BackPermission> childList;
}
