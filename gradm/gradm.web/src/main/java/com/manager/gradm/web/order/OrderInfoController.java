package com.manager.gradm.web.order;

import com.manager.gradm.biz.common.DefaultPage;
import com.manager.gradm.biz.order.OrderInfoService;
import com.manager.gradm.common.Result;
import com.manager.gradm.web.utils.BackUserUtils;
import com.manager.gradm.common.util.ServletUtils;
import com.manager.gradm.entity.order.OrderInfo;
import com.manager.gradm.entity.user.BackUser;
import com.manager.gradm.pojo.order.OrderInfoVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by lifeilong on 2016/5/2.
 */
@Controller
@Slf4j
@RequestMapping("admin/order")
public class OrderInfoController {

    @Autowired
    private OrderInfoService orderInfoService;

    @RequestMapping
    public String index(){
        return "order/order_info_list";
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result getList(@PageableDefault(page = 1, value = 10, sort = "gmt_create", direction = Sort.Direction.DESC) Pageable pageable
                            ,HttpServletRequest request){
        log.info("[销售管理]订单列表.getList().");
        Map<String, Object> searchParams = ServletUtils.getParametersMapStartWith(request);
        if (searchParams.containsKey("startTime")) {
            searchParams.put("startTime", searchParams.get("startTime") +" 00:00:00");
        }
        if (searchParams.containsKey("endTime")) {

            searchParams.put("endTime", searchParams.get("endTime") +" 23:59:59");
        }
        DefaultPage<OrderInfoVO> page = (DefaultPage<OrderInfoVO>)orderInfoService.getPage(pageable, searchParams);
        return Result.wrapSuccessfulResult(page);
    }

    @RequestMapping("/edit")
    public String edit(@RequestParam(value = "id", required = true) Long id,Model model){
        if(null == id || id < 1) {
            log.error("[订单编辑] 该记录id错误，id={}", id);
            return "redirect:";
        }
        OrderInfo orderInfo = orderInfoService.selectById(id);
        if (null == orderInfo) {
            log.error("[订单编辑] 没有找到该订单，id={}", id);
            return "redirect:";
        }
        model.addAttribute("orderInfo", orderInfo);
        return "order/order_info_edit";
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
        log.info("Begin 导出订单信息... 操作人：id={},name={}", backUser.getId(), backUser.getUserName());
        Pageable pageable;
        Map<String, Object> searchParams = ServletUtils.getParametersMapStartWith(request);
        if (searchParams.containsKey("startTime")) {
            searchParams.put("startTime", searchParams.get("startTime") +" 00:00:00");
        }
        if (searchParams.containsKey("endTime")) {

            searchParams.put("endTime", searchParams.get("endTime") +" 23:59:59");
        }
        response.setContentType("application/x-msdownload");
        String filename = "order_excel";
        try {
            filename = java.net.URLEncoder.encode("订单信息", "UTF-8");
        } catch (UnsupportedEncodingException e) {
        }
        response.setHeader("Content-Disposition", "attachment;filename=" + filename + ".xls");
        List<String> sorts = new ArrayList<>();
        sorts.add("id asc");
        searchParams.put("sorts", sorts);
        pageable = new PageRequest(1, 5000);
        DefaultPage<OrderInfoVO> page = (DefaultPage<OrderInfoVO>)orderInfoService.getPage(pageable, searchParams);
        ModelAndView mav = new ModelAndView("order/order_info_excel");
        mav.addObject("page", page);
        return mav;
    }

}
