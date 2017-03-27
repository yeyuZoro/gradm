package com.manager.gradm.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by lifeilong on 2016/5/17.
 */
public class DateUtil {


    /**
     * 把时间类型转化为规定格式的字符串
     * "yyyy-MM-dd hh:MM"
     *
     * @param date 时间
     * @return 格式化以后的时间字符串
     */
    public static String convertDateToYMDHMStr(Date date) {
        if (date == null) {
            return null;
        }
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        return f.format(date);
    }
}
