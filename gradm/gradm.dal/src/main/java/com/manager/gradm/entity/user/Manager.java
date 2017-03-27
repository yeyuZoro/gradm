package com.manager.gradm.entity.user;

import com.manager.gradm.entity.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Created by lifeilong on 2016/5/16.
 */
@EqualsAndHashCode(callSuper = false)
@Data
public class Manager extends BaseEntity{
    private String name;    //姓名
    private String mobile;  //手机号码
    private Integer isAdmin;    //标记管理员1是管理员0不是
    private Integer gender; //性别
    private String identityCard;    //身份证号码
    private String age;     //年龄

    private String isAdminName; //标记管理员1是 0否
    private String genderName; //性别名称

}
