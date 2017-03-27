package com.manager.gradm.entity.user;

import com.manager.gradm.entity.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Created by lifeilong on 2016/5/19.
 */
@EqualsAndHashCode(callSuper = false)
@Data
public class BackRole extends BaseEntity{

    private String name;    //角色名称
    private String permissionIds;   //权限id列表

    private String permissionNames; //所有权限名

}
