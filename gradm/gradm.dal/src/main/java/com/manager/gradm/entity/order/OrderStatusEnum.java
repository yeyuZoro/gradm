package com.manager.gradm.entity.order;

/**
 * Created by lifeilong on 2016/5/17.
 */
public enum OrderStatusEnum {
    DDCJ("CJDD", "订单创建"),
    DDYFK("DDYFK", "订单已付款"),
    WXDD("WXDD", "订单无效");


    private String key;
    private final String name;

    private OrderStatusEnum(String key, String value){
        this.key = key;
        this.name = value;
    }
    public String getKey(){
        return key;
    }
    public String getName(){
        return name;
    }

    public static String getOrderStatusNameByKey(String key) {
        if (key != null) {
            for (OrderStatusEnum op : OrderStatusEnum.values()) {
                if (op.getKey().equals(key)) {
                    return op.getName();
                }
            }
            return null;
        }
        return null;
    }
}
