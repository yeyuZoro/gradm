package com.manager.gradm.dao.common;

import org.springframework.stereotype.Component;

import java.lang.annotation.*;

/**
 * Created by lifeilong on 2016/4/27.
 *
 * 标识MyBatis的DAO,方便{@link org.mybatis.spring.mapper.MapperScannerConfigurer}的扫描。
 *
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)
@Documented
@Component
public @interface MyBatisRepository {
    String value() default "";
}
