package com.tqmall.legend.entity.order;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.tqmall.legend.entity.base.BaseEntity;

@EqualsAndHashCode(callSuper = false)
@Data
public class ${FMT.XyzAbc($table)} extends BaseEntity {

    #foreach($item in $values)#if(${FMT.xyzAbc(${item.name})} != 'id' && ${FMT.xyzAbc(${item.name})} != 'gmtCreate' && ${FMT.xyzAbc(${item.name})} != 'gmtModified' && ${FMT.xyzAbc(${item.name})} != 'creator' && ${FMT.xyzAbc(${item.name})} != 'modifier' && ${FMT.xyzAbc(${item.name})} != 'isDeleted')
private ${item.type} ${FMT.xyzAbc(${item.name})};
    #end
    #end

    }

