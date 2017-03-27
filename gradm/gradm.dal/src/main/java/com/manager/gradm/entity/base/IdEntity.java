package com.manager.gradm.entity.base;

import lombok.Data;

import java.io.Serializable;

/**
 * Created by lifeilong on 2016/4/29.
 */
@Data
public abstract class IdEntity implements Serializable {
    protected Long id;
}
