package com.manager.gradm.web.utils;

import com.manager.gradm.common.Constants;
import com.manager.gradm.entity.user.BackUser;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by feilong.li on 2016/5/29.
 */
public class BackUserUtils {

    /**
     * 从session中获取用户信息
     *
     * @param request
     * @return
     */
    public static BackUser getBackUserInfo(HttpServletRequest request) {
        BackUser backUser = new BackUser();
        HttpSession session = request.getSession();
        if (null != session) {
            backUser = (BackUser) session.getAttribute(Constants.SESSION_USER_INFO);

        }
        return backUser;
    }
}
