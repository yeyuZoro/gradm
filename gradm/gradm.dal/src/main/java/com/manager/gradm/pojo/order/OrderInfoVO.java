package com.manager.gradm.pojo.order;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

/**
 * Created by lifeilong on 2016/5/17.
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class OrderInfoVO {

    private String orderSn;  //订单编号
    private String gmtCreateStr;  //开单时间
    private String orderName;   //订单名称
    private String customerName;    //客户名称
    private String customerMobile;  //客户手机号码
    private String orderStatusName; //订单状态：DDCJ 订单创建，DDYFK订单已付款，WXDD无效订单
    private String payStatusName;  //支付状态，0为未支付，2为已支付
    private BigDecimal orderAmount; //订单金额
    private BigDecimal discount;    //优惠金额
    private BigDecimal payAmount;   //实付金额
    private String contactName; //联系人姓名
    private String contactMobile;   //联系人电话
    private String customerAddress; //收货地址
    private String postscript;  //备注
}
