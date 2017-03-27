package com.manager.gradm.common.util;

import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by lifeilong on 2016/5/17.
 */
public class ServletUtils {
    private static final String DEFAULT_SEARCH_TAG = "search_";

    public static Map<String, Object> getParametersMapStartWith(HttpServletRequest request){
        if (request == null){
            return null;
        }
        Map<String, Object> searchParams = new HashMap<String, Object>();
        @SuppressWarnings("unchecked")
        Enumeration<String> enumeration = request.getParameterNames();
        while (enumeration.hasMoreElements()) {
            String name = enumeration.nextElement();
            String value = request.getParameter(name);
            if (StringUtils.isBlank(value)) {
                continue;
            }
            if (name.startsWith(DEFAULT_SEARCH_TAG))
                searchParams.put(name.substring(DEFAULT_SEARCH_TAG.length()), value.trim());
        }
        return searchParams;
    }


}
