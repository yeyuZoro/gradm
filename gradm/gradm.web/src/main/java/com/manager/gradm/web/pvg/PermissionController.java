package com.manager.gradm.web.pvg;

import com.manager.gradm.biz.common.DefaultPage;
import com.manager.gradm.biz.pvg.BackPermissionService;
import com.manager.gradm.common.Result;
import com.manager.gradm.dao.pvg.BackPermissionDao;
import com.manager.gradm.entity.pvg.BackPermission;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lifeilong on 2016/4/29.
 */
@Controller
@Slf4j
@RequestMapping("admin/pvg/permission")
public class PermissionController {

    @Autowired
    private BackPermissionService backPermissionService;

    @Autowired
    private BackPermissionDao backPermissionDao;

    @RequestMapping
    public String show(){
        return "pvg/permission_list";
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result getList(@PageableDefault(page = 1,value = 10, sort = "gmt_create", direction = Sort.Direction.DESC) Pageable pageable,
                           HttpServletRequest request) {

        Map<String, Object> searchParam = new HashMap<>();
        DefaultPage<BackPermission> page = (DefaultPage<BackPermission>)backPermissionService.getPage(pageable, searchParam);
        page.setPageUri(request.getRequestURI());
        return Result.wrapSuccessfulResult(page);

    }

    /**
     * 添加 / 编辑
     */
    @RequestMapping("edit")
    public String userEdit(Model model,  @RequestParam(value = "id", required = false) Long id) {
        Map<String,Object> map = new HashMap<>();
        map.put("parentId",0);
        List<BackPermission> permissionList = backPermissionDao.select(map);
        model.addAttribute("permissionList",permissionList);
        if (id != null) {
            BackPermission backPermission = backPermissionDao.selectById(id);
            model.addAttribute("backPermission", backPermission);
        }
        return "pvg/permission_edit";
    }

    /**
     * 更新或者添加
     */
    @RequestMapping(value="/updateAdd",method = RequestMethod.POST)
    @ResponseBody
    public Result updateAdd(HttpServletRequest request,@RequestBody BackPermission backPermission) {
        try {
            if (backPermission != null) {
                if (backPermission.getId() != null && backPermission.getId() > 0) {
                    //更新操作
                    log.info("更新id: " + backPermission.getId()+"的权限");
                    Result result = backPermissionService.updateById(backPermission);
                    return result;
                } else {
                    //添加操作
                    Result result = backPermissionService.insert(backPermission);
                    log.info("添加权限"+backPermission.getName());
                    return result;
                }
            }
            log.error("数据为空");
            return Result.wrapErrorResult("", "数据为空");
        } catch (Exception e) {
            log.error(e.getMessage());
            return Result.wrapErrorResult("", "系统错误");
        }
    }

    @RequestMapping(value="/delete",method = RequestMethod.POST)
    @ResponseBody
    public Result delete(HttpServletRequest request,@RequestParam("id")Long id) {

        return null;
    }

    /**
     * 编辑角色分配权限的二级分类
     * @param permissionIds
     * @param request
     * @return
     */
    @RequestMapping("list_second")
    @ResponseBody
    public Result list_second(@RequestParam(value = "permissionIds", required = false) String permissionIds, HttpServletRequest request) {
        List<Long> permissionIdsArr = new ArrayList<>();
        if (permissionIds != null && !permissionIds.equals("")) {
            String[] ids = permissionIds.split(",");
            for (int i = 0; i < ids.length; i++) {
                permissionIdsArr.add(Long.parseLong(ids[i]));
            }
        }
        List<BackPermission> backPermissionList = backPermissionService.select(null);
        List<BackPermission> list = new ArrayList<>();
        for (BackPermission menu1 : backPermissionList) {
            if (menu1.getParentId() == 0) {
                list.add(menu1);
            }
        }
        for (BackPermission menu2 : list) {
            List<BackPermission> childList = new ArrayList<>();
            for (BackPermission menu1 : backPermissionList) {
                if (!CollectionUtils.isEmpty(permissionIdsArr)) {
                    if (permissionIdsArr.contains(menu1.getId())) {
                        menu1.setActive(true);
                    }
                    if (permissionIdsArr.contains(menu2.getId())) {
                        menu2.setActive(true);
                    }
                }
                if (menu2.getId().equals(menu1.getParentId())) {
                    childList.add(menu1);
                    menu2.setChildList(childList);
                }
            }
        }
        return Result.wrapSuccessfulResult(list);
    }

}
