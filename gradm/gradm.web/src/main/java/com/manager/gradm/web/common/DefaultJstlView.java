package com.manager.gradm.web.common;

import org.springframework.web.servlet.view.JstlView;

import java.io.File;
import java.util.Locale;

/**
 * 解决多个ViewResolver时jsp获取不到时,跳转到下一个ViewResolver
 * Created by yi.yang on 2014/8/5.
 */
public class DefaultJstlView extends JstlView {

    @Override
    public boolean checkResource(Locale locale) throws Exception {
        File file = new File(this.getServletContext().getRealPath("/") + getUrl());
        return file.exists();//判断该jsp页面是否存在
    }
}
