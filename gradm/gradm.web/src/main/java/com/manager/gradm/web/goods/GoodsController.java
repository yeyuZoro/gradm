package com.manager.gradm.web.goods;

import com.manager.gradm.biz.common.DefaultPage;
import com.manager.gradm.biz.goods.GoodsService;
import com.manager.gradm.common.Result;
import com.manager.gradm.web.utils.BackUserUtils;
import com.manager.gradm.common.util.ServletUtils;
import com.manager.gradm.entity.goods.Goods;
import com.manager.gradm.entity.goods.GoodsCategory;
import com.manager.gradm.entity.user.BackUser;
import com.manager.gradm.pojo.goods.GoodsCategoryVO;
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
 * Created by lifeilong on 2016/4/28.
 */
@Controller
@Slf4j
@RequestMapping("admin/goods")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;

    @RequestMapping
    public String showGoods(HttpServletRequest request) {

        return "goods/goods_list";
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result getGoodsList(@PageableDefault(page = 1, value = 10, sort = "gmt_create", direction = Sort.Direction.DESC) Pageable pageable, HttpServletRequest request) {
        Map<String, Object> searchParam = new HashMap<>();
        searchParam = ServletUtils.getParametersMapStartWith(request);
        DefaultPage<Goods> page = (DefaultPage<Goods>) goodsService.getGoodsList(pageable, searchParam);
        page.setPageUri(request.getRequestURI());
        return Result.wrapSuccessfulResult(page);
    }

    @RequestMapping("/edit")
    public String goodsEdit(@RequestParam(value = "id", required = false) Long id, Model model) {
        log.info("[配件列表]");
        if (null != id) {
            Goods goods = goodsService.selectById(id);
            if (null != goods) {
                model.addAttribute("goods", goods);
            }
        }

        Map<String, Object> searchParam = new HashMap<>();
        List<GoodsCategory> goodsCategoryList = goodsService.getAllCategory(searchParam);
        model.addAttribute("goodsCategoryList", goodsCategoryList);
        return "goods/goods_edit";
    }

    @RequestMapping(value = "/saveOrUpt", method = RequestMethod.POST)
    @ResponseBody
    public Result saveOrUptGoods(@RequestBody Goods goods) {
        log.info("[配件更新]添加或更新");
        if (null != goods) {
            if (null != goods.getId() && goods.getId() < 1) {
                goods.setId(null);
            }
            if (StringUtils.isBlank(goods.getName())) {
                log.error("[配件更新] 新增或更新配件失败，配件名称为空");
                return Result.wrapErrorResult("", "请输入配件名称");
            }
            if (StringUtils.isBlank(goods.getGoodsSn())) {
                log.error("[配件更新] 新增或更新配件失败，配件编号为空");
                return Result.wrapErrorResult("", "请输入配件编号");
            }
        } else {
            return Result.wrapErrorResult("", "新建对象为空");
        }
        Result result = goodsService.addOrUptGoods(goods);
        return result;
    }

    @RequestMapping("/category")
    public String showCategory(HttpServletRequest request) {
        log.info("[配件分类]");
        return "goods/goods_cat_list";
    }

    @RequestMapping("/category/list")
    @ResponseBody
    public Result getGoodsCategory(@PageableDefault(page = 1, value = 10, sort = "gmt_create", direction = Sort.Direction.DESC) Pageable pageable, HttpServletRequest request) {
        Map<String, Object> searchParam = new HashMap<>();
        DefaultPage<GoodsCategoryVO> page = (DefaultPage<GoodsCategoryVO>) goodsService.getGoodsCategory(pageable, searchParam);
        page.setPageUri(request.getRequestURI());
        return Result.wrapSuccessfulResult(page);
    }

    @RequestMapping("/category/edit")
    public String categoryEdit(@RequestParam(value = "id", required = false) Long id, Model model) {
        log.info("[配件分类] ");
        if (null != id) {
            GoodsCategory category = goodsService.catSelectById(id);
            if (null != category) {
                model.addAttribute("category", category);
            }
        }
        Map<String, Object> searchParam = new HashMap<>();
        List<GoodsCategory> goodsCategoryList = goodsService.getAllCategory(searchParam);
        model.addAttribute("goodsCategoryList", goodsCategoryList);
        return "goods/goods_cat_edit";
    }

    @RequestMapping(value = "/category/saveOrUpt", method = RequestMethod.POST)
    @ResponseBody
    public Result saveOrUptGoodsCategory(@RequestBody GoodsCategory goodsCategory) {
        log.info("[配件分类]添加或更新");
        if (null != goodsCategory) {
            if (null != goodsCategory.getId() && goodsCategory.getId() < 1) {
                goodsCategory.setId(null);
            }
            if (StringUtils.isBlank(goodsCategory.getCatName())) {
                log.error("[配件分类] 新增或更新分类失败，配件名称为空");
                return Result.wrapErrorResult("", "请输入配件名称");
            }
        } else {
            return Result.wrapErrorResult("", "新建对象为空");
        }
        Result result = goodsService.addOrUptGoodsCategory(goodsCategory);
        return result;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Result deleted(@RequestParam(value = "id", required = true) Long id){
        return goodsService.deletedById(id);
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
        String filename = "goods_excel";
        try {
            filename = java.net.URLEncoder.encode("配件列表", "UTF-8");
        } catch (UnsupportedEncodingException e) {
        }
        response.setHeader("Content-Disposition", "attachment;filename=" + filename + ".xls");
        List<String> sorts = new ArrayList<>();
        sorts.add("id asc");
        searchParams.put("sorts", sorts);
        pageable = new PageRequest(1, 5000);
        DefaultPage<Goods> page = (DefaultPage<Goods>) goodsService.getGoodsList(pageable, searchParams);
        ModelAndView mav = new ModelAndView("goods/goods_excel");
        mav.addObject("page", page);
        return mav;
    }

}
