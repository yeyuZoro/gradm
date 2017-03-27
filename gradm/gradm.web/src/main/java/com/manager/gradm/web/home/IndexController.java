package com.manager.gradm.web.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by lifeilong on 2016/4/28.
 */
@Controller
@RequestMapping("index")
public class IndexController {

    @RequestMapping
    public String homepage() {
        return "home/index_show";
    }
}
