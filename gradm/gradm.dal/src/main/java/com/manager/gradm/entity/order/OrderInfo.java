package com.manager.gradm.entity.order;

import com.manager.gradm.entity.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by lifeilong on 2016/5/13.
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class OrderInfo extends BaseEntity{
    private Long orderType; //订单类型
    private String orderSn;  //订单编号
    private String orderName;   //订单名称
    private Long goodsId;   //配件id,关联gradm_goods表
    private Long customerId;    //用户id
    private String orderStatus; //订单状态：DDCJ 订单创建，DDYFK订单已付款，WXDD无效订单
    private String customerName;    //客户名称
    private String customerMobile;  //客户手机号码
    private BigDecimal orderAmount; //订单金额
    private BigDecimal discount;    //优惠金额
    private Date payTime;   //结算时间
    private Integer payStatus;  //支付状态，0为未支付，2为已支付
    private BigDecimal payAmount;   //实付金额
    private String contactName; //联系人姓名
    private String contactMobile;   //联系人电话
    private String customerAddress; //收货地址
    private String postscript;  //备注
}
