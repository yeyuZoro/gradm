package com.manager.gradm.biz.order.impl;

import com.manager.gradm.biz.common.DefaultPage;
import com.manager.gradm.biz.order.OrderInfoService;
import com.manager.gradm.common.util.DateUtil;
import com.manager.gradm.dao.order.OrderInfoDao;
import com.manager.gradm.entity.order.OrderInfo;
import com.manager.gradm.entity.order.OrderStatusEnum;
import com.manager.gradm.entity.order.PayStatusEnum;
import com.manager.gradm.pojo.order.OrderInfoVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Created by lifeilong on 2016/5/17.
 */
@Service
@Slf4j
public class OrderInfoServiceImpl implements OrderInfoService {

    @Autowired
    private OrderInfoDao orderInfoDao;

    @Override
    public Page<OrderInfoVO> getPage(Pageable pageable, Map<String, Object> searchParams) {
        if(pageable.getSort() != null){
            Iterator<Sort.Order> iterator = pageable.getSort().iterator();
            ArrayList<String> sorts = new ArrayList<String>();
            while (iterator.hasNext()) {
                Sort.Order order = iterator.next();
                sorts.add(order.getProperty() + " " + order.getDirection().name());
            }
            searchParams.put("sorts", sorts);
        }

        Integer totalSize = orderInfoDao.selectCount(searchParams);

        PageRequest pageRequest =
                new PageRequest((pageable.getPageNumber() < 1 ? 1 : pageable.getPageNumber()) - 1,
                        pageable.getPageSize() < 1 ? 1 : pageable.getPageSize(), pageable.getSort());

        searchParams.put("limit", pageRequest.getPageSize());
        searchParams.put("offset", pageRequest.getOffset());
        List<OrderInfoVO> orderInfoVOList = new ArrayList<>();
        List<OrderInfo> data = orderInfoDao.select(searchParams);
        if (!CollectionUtils.isEmpty(data)) {
            for (OrderInfo orderInfo : data) {
                OrderInfoVO orderInfoVO = new OrderInfoVO();
                BeanUtils.copyProperties(orderInfo, orderInfoVO);
                orderInfoVO.setGmtCreateStr(DateUtil.convertDateToYMDHMStr(orderInfo.getGmtCreate()));
                orderInfoVO.setOrderStatusName(OrderStatusEnum.getOrderStatusNameByKey(orderInfo.getOrderStatus()));
                orderInfoVO.setPayStatusName(PayStatusEnum.getMesByCode(orderInfo.getPayStatus()));
                orderInfoVOList.add(orderInfoVO);
            }
        }
        DefaultPage<OrderInfoVO> page = new DefaultPage<OrderInfoVO>(orderInfoVOList, pageRequest, totalSize);
        return page;
    }

    @Override
    public OrderInfo selectById(Long id) {
        OrderInfo orderInfo = orderInfoDao.selectById(id);
        return orderInfo;
    }
}
