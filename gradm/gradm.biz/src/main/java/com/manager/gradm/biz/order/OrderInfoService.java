package com.manager.gradm.biz.order;

import com.manager.gradm.entity.order.OrderInfo;
import com.manager.gradm.pojo.order.OrderInfoVO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Map;

/**
 * Created by lifeilong on 2016/5/17.
 */
public interface OrderInfoService {

    public Page<OrderInfoVO> getPage(Pageable pageable, Map<String, Object> searchParams);

    public OrderInfo selectById(Long id);
}
