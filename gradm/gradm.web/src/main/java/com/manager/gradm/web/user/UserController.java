package com.manager.gradm.web.user;

import com.manager.gradm.biz.common.DefaultPage;
import com.manager.gradm.biz.user.ManagerService;
import com.manager.gradm.common.Result;
import com.manager.gradm.common.util.ServletUtils;
import com.manager.gradm.entity.goods.Goods;
import com.manager.gradm.entity.stock.Stock;
import com.manager.gradm.entity.user.BackUser;
import com.manager.gradm.entity.user.Manager;
import com.manager.gradm.web.utils.BackUserUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lifeilong on 2016/5/4.
 */
@Controller
@Slf4j
@RequestMapping("admin/user")
public class UserController {

    @Autowired
    private ManagerService managerService;


    @RequestMapping
    public String userInfo(){
        return "user/user_info_list";
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result getManagerList(@PageableDefault(page = 1, value = 10, sort = "gmt_create", direction = Sort.Direction.DESC) Pageable pageable, HttpServletRequest request) {
        Map<String, Object> searchParam = new HashMap<>();
        searchParam = ServletUtils.getParametersMapStartWith(request);
        DefaultPage<Manager> page = (DefaultPage<Manager>) managerService.getPage(pageable, searchParam);
        page.setPageUri(request.getRequestURI());
        return Result.wrapSuccessfulResult(page);
    }

    @RequestMapping("/edit")
    public String goodsEdit(@RequestParam(value = "id", required = false) Long id, Model model) {
        log.info("[配件列表]");
        if (null != id) {
            Manager manager = managerService.selectById(id);
            if (null != manager) {
                model.addAttribute("manager", manager);
            }
        }
        return "user/user_info_edit";
    }

    @RequestMapping("/saveOrUpt")
    @ResponseBody
    public Result saveOrUpt(@RequestBody Manager manager) {
        log.info("[员工更新] 修改或添加员工信息");
        if (null == manager) {
            return Result.wrapErrorResult("", "更新员工信息为空");
        } else if (StringUtils.isBlank(manager.getName())) {
            return Result.wrapErrorResult("", "员工姓名不能为空");
        } else if (StringUtils.isBlank(manager.getMobile())) {
            return Result.wrapErrorResult("", "员工手机号码不能为空");
        }
        return managerService.saveOrUpt(manager);
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Result deleted(@RequestParam(value = "id", required = true) Long id){
        return managerService.deletedById(id);
    }

    /**
     * 导出文件 .xls格式
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/export")
    @ResponseBody
    public Object export(HttpServletRequest request, HttpServletResponse response) {
        BackUser backUser = BackUserUtils.getBackUserInfo(request);
        log.info("Begin 导出配件列表...操作人： id={},name={}", backUser.getId(), backUser.getUserName());
        Pageable pageable;
        Map<String, Object> searchParams = ServletUtils.getParametersMapStartWith(request);
        response.setContentType("application/x-msdownload");
        String filename = "user_excel";
        try {
            filename = java.net.URLEncoder.encode("员工列表", "UTF-8");
        } catch (UnsupportedEncodingException e) {
        }
        response.setHeader("Content-Disposition", "attachment;filename=" + filename + ".xls");
        List<String> sorts = new ArrayList<>();
        sorts.add("id asc");
        searchParams.put("sorts", sorts);
        pageable = new PageRequest(1, 5000);
        DefaultPage<Manager> page = (DefaultPage<Manager>) managerService.getPage(pageable, searchParams);
        ModelAndView mav = new ModelAndView("user/user_info_excel");
        mav.addObject("page", page);
        return mav;
    }

}
