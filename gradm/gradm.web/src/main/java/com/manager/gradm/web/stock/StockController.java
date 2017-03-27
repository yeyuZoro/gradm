package com.manager.gradm.web.stock;

import com.manager.gradm.biz.common.DefaultPage;
import com.manager.gradm.biz.stock.StockService;
import com.manager.gradm.common.Result;
import com.manager.gradm.common.util.ServletUtils;
import com.manager.gradm.entity.goods.Goods;
import com.manager.gradm.entity.stock.Stock;
import com.manager.gradm.entity.user.BackUser;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
@RequestMapping("admin/stock")
public class StockController {

    @Autowired
    private StockService stockService;

    @RequestMapping
    public String show(HttpServletRequest request) {

        return "stock/stock_list";
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result getStockList(@PageableDefault(page = 1, value = 10, sort = "gmt_create", direction = Sort.Direction.DESC) Pageable pageable, HttpServletRequest request) {
        Map<String, Object> searchParam = new HashMap<>();
        searchParam = ServletUtils.getParametersMapStartWith(request);
        DefaultPage<Stock> page = (DefaultPage<Stock>) stockService.getStockList(pageable, searchParam);
        page.setPageUri(request.getRequestURI());
        return Result.wrapSuccessfulResult(page);
    }

    @RequestMapping("/edit")
    public String goodsEdit(@RequestParam(value = "id", required = false) Long id, Model model) {
        log.info("[配件列表]");
        if (null != id) {
            Stock stock = stockService.selectById(id);
            if (null != stock) {
                model.addAttribute("stock", stock);
            }
        }
        return "stock/stock_edit";
    }

    @RequestMapping("/saveOrUpt")
    @ResponseBody
    public Result saveOrUpt(@RequestBody Stock stock) {
        log.info("[库存更新] 修改库存信息");
        if (null == stock) {
            return Result.wrapErrorResult("", "更新库存信息为空");
        } else if (null == stock.getGoodsId()) {
            log.error("[库存更新] goodsId为空");
            return Result.wrapErrorResult("", "配件信息错误");
        } else if (StringUtils.isBlank(stock.getGoodsName())) {
            return Result.wrapErrorResult("", "配件名称不能为空");
        } else if (StringUtils.isBlank(stock.getMeasureUnit())) {
            return Result.wrapErrorResult("", "最小单位不能为空");
        } else if (null == stock.getCurrentStock()) {
            return Result.wrapErrorResult("", "当前库存数量不能为空");
        }
        return stockService.saveOrUpt(stock);
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
        log.info("Begin 导出库存信息列表...操作人： id={},name={}", backUser.getId(), backUser.getUserName());
        Pageable pageable;
        Map<String, Object> searchParams = ServletUtils.getParametersMapStartWith(request);
        response.setContentType("application/x-msdownload");
        String filename = "stock_excel";
        try {
            filename = java.net.URLEncoder.encode("库存信息", "UTF-8");
        } catch (UnsupportedEncodingException e) {
        }
        response.setHeader("Content-Disposition", "attachment;filename=" + filename + ".xls");
        List<String> sorts = new ArrayList<>();
        sorts.add("id asc");
        searchParams.put("sorts", sorts);
        pageable = new PageRequest(1, 5000);
        DefaultPage<Stock> page = (DefaultPage<Stock>) stockService.getStockList(pageable, searchParams);
        ModelAndView mav = new ModelAndView("stock/stock_excel");
        mav.addObject("page", page);
        return mav;
    }
}
