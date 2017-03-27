package com.manager.gradm.entity.order;

/**
 * Created by lifeilong on 2016/5/17.
 */
public enum PayStatusEnum {
    UNPAY(Integer.valueOf(0), "未支付"),
    PAYED(Integer.valueOf(2), "已支付");

    private final Integer code;
    private final String message;

    private PayStatusEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

    public Integer getCode() {
        return this.code;
    }

    public String getMessage() {
        return this.message;
    }

    public static String getMesByCode(int code) {
        PayStatusEnum[] arr$ = values();
        int len$ = arr$.length;

        for(int i$ = 0; i$ < len$; ++i$) {
            PayStatusEnum iEnum = arr$[i$];
            if(iEnum.getCode().intValue() == code) {
                return iEnum.getMessage();
            }
        }
        return null;
    }
}
