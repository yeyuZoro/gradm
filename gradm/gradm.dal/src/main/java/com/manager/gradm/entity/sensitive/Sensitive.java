package com.manager.gradm.entity.sensitive;


import com.manager.gradm.entity.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Created by Administrator on 2017/3/17.
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class Sensitive extends BaseEntity {
    private String sensitiveContent;
    private Long sensitiveLevel;
}
