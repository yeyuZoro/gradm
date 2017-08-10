package com.manager.gradm.web.sensitive;

import com.manager.gradm.biz.common.DefaultPage;
import com.manager.gradm.biz.sensitive.SensitiveService;
import com.manager.gradm.common.Result;
import com.manager.gradm.common.util.ServletUtils;
import com.manager.gradm.entity.sensitive.Sensitive;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2017/8/9.
 */
@Controller
@Slf4j
@RequestMapping("admin/sensitive")
public class SensitiveController {
    @Autowired
    private SensitiveService sensitiveService;

    @RequestMapping
    public String showSensitive(HttpServletRequest  request){
        return "sensitive/sensitive_list";
    }
    @RequestMapping("/list")
    @ResponseBody
    public Result getSensitiveList(@PageableDefault(page = 1,value=10,sort = "gmt_create",direction= Sort.Direction.DESC)Pageable pageable,HttpServletRequest request){
        Map<String,Object> searchParam=new HashMap<>();
        searchParam = ServletUtils.getParametersMapStartWith(request);
        DefaultPage <Sensitive>page=(DefaultPage<Sensitive>) sensitiveService.getSensitiveList(pageable,searchParam);
        return Result.wrapSuccessfulResult(page);
    }

}
