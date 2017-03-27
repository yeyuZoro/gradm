package com.manager.gradm.entity.user;

import com.manager.gradm.common.util.DateUtil;
import com.manager.gradm.entity.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Created by lifeilong on 2016/5/16.
 */
@EqualsAndHashCode(callSuper = false)
@Data
public class BackUser extends BaseEntity{
    private Long managerId;  //用户id
    private Long roleId;    //角色id
    private Long isAdmin;   //是否为超级管理员，1为超级管理员，0为普通管理员
    private String permissionIds;   //权限ID列表，以，隔开
    private String userName;    //登陆名
    private String password;    //密码
    private String name;    //用户姓名

    //临时字段
    private String gmtCreateStr;
    private String roleName;
    //修改人姓名
    private String modifierName;
    //创建人姓名
    private String creatorName;

    public String getGmtCreateStr(){
        return DateUtil.convertDateToYMDHMStr(super.getGmtCreate());
    }
}
