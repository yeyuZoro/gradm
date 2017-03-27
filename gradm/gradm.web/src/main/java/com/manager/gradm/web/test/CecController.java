package com.manager.gradm.web.test;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by lifeilong on 2016/4/27.
 */
@Controller
@RequestMapping("lifei/cec")
@Slf4j
public class CecController {

    @RequestMapping("/ft")
    public String cecFtl(){
        return "cec/cec_tst";
    }

    @RequestMapping("/msgInfo")
    @ResponseBody
    public Object getMessage(){
        List<String> list = new ArrayList<>();
        list.add("1");
        list.add("a");
        list.add("3");
        list.add("d");
        return list;
    }
}
