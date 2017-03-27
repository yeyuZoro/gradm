package com.manager.gradm.web.pvg;

import com.manager.gradm.biz.common.DefaultPage;
import com.manager.gradm.biz.pvg.BackRoleService;
import com.manager.gradm.biz.user.BackUserService;
import com.manager.gradm.common.Result;
import com.manager.gradm.common.util.ServletUtils;
import com.manager.gradm.entity.user.BackRole;
import com.manager.gradm.entity.user.BackUser;
import com.manager.gradm.web.utils.BackUserUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.BeanParam;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by feilong.li on 2016/5/29.
 */
@Controller
@RequestMapping("admin/pvg/user")
@Slf4j
public class BackUserController {

    @Autowired
    private BackRoleService backRoleService;

    @Autowired
    private BackUserService backUserService;

    /**
     * 用户列表页面跳转
     *
     * @return
     */
    @RequestMapping("")
    public String index(Model model) {
        List<BackRole> backRoleList = backRoleService.select(null);
        model.addAttribute("roleList", backRoleList);
        return "pvg/back_user_list";
    }

    /**
     * 用户列表数据查询
     *
     * @param pageable
     * @param request
     * @return
     */
    @RequestMapping("/list")
    @ResponseBody
    public Object backUserList(@PageableDefault(page = 1, value = 10, sort = "id", direction = Sort.Direction.DESC) Pageable pageable,
                               HttpServletRequest request) {
        Map<String, Object> searchParams = ServletUtils.getParametersMapStartWith(request);
        DefaultPage<BackUser> page = null;
        page = (DefaultPage<BackUser>) backUserService.getPage(pageable, searchParams);
        page.setPageUri(request.getRequestURI());
        return Result.wrapSuccessfulResult(page);
    }

    /**
     * 编辑用户页面跳转
     *
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("edit")
    public String userEdit(Model model, @RequestParam(value = "id", required = false) Long id) {
        List<BackRole> roleList = backRoleService.select(null);
        model.addAttribute("roleList", roleList);
        if (id != null) {
            BackUser backUser = backUserService.selectById(id);
            model.addAttribute("backUser", backUser);
        }
        return "pvg/back_user_edit";
    }

    /**
     * 更新或者添加
     *
     * @param request
     * @param backUser
     * @return
     */
    @RequestMapping(value = "updateAdd", method = RequestMethod.POST)
    @ResponseBody
    public Result updateAdd(HttpServletRequest request, @BeanParam BackUser backUser) {
        BackUser user = BackUserUtils.getBackUserInfo(request);
        try {
            if (backUser != null) {
                backUser.setModifier(user.getId());
                if (backUser.getId() != null && backUser.getId() > 0) {
                    //更新操作
                    //判断登录名是否重复
                    Map<String, Object> map = new HashMap<>();
                    map.put("userName", backUser.getUserName());
                    List<BackUser> backUserList = backUserService.select(map);
                    if (backUserList != null && backUserList.size() > 0) {
                        if (backUserList.size() == 1 && backUserList.get(0).getId().equals(backUser.getId())) {
                            //没有修改登录名，可继续更新
                        } else {
                            return Result.wrapErrorResult("", "登录名重复，无法添加");
                        }
                    }
                    BackRole backRole = backRoleService.selectById(backUser.getRoleId());
                    if (backRole != null) {
                        backUser.setPermissionIds(backRole.getPermissionIds());
                    } else {
                        backUser.setPermissionIds("");
                        backUser.setRoleId(0L);
                    }
                    Result result = backUserService.updateById(backUser);
                    log.info("更新用户" + backUser.getName());
                    return result;
                } else {
                    //添加操作
                    //判断登录名是否重复
                    Map<String, Object> map = new HashMap<>();
                    map.put("userName", backUser.getUserName());
                    List<BackUser> backUserList = backUserService.select(map);
                    if (!CollectionUtils.isEmpty(backUserList)) {
                        return Result.wrapErrorResult("", "登录名重复，无法添加");
                    }

                    backUser.setCreator(user.getId());
                    backUser.setIsAdmin(0L);
                    BackRole backRole = backRoleService.selectById(backUser.getRoleId());
                    if (backRole != null) {
                        backUser.setPermissionIds(backRole.getPermissionIds());
                    }
                    Result result = backUserService.insert(backUser);
                    log.info("添加用户" + backUser.getName());
                    return result;
                }
            }
            log.error("数据为空");
            return Result.wrapErrorResult("", "数据为空");
        } catch (Exception e) {
            log.error(e.getMessage());
            return Result.wrapErrorResult("", "系统错误，编辑失败");
        }
    }
    /**
     * 根据id删除用户
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    public Result delete(@RequestParam Long id) {
        try {
            if (id != null) {
                BackUser backUser = backUserService.selectById(id);
                if (backUser != null) {
                    if (backUser.getIsAdmin() == 1) {
                        return Result.wrapErrorResult("", "无法删除超级管理员");
                    } else {
                        backUserService.deleteById(id);
                        log.info("根据id:" + id + " 删除成功");
                        return Result.wrapSuccessfulResult(true);
                    }
                }
            }
            log.error("传递参数不对");
            return Result.wrapErrorResult("", "传递参数不对");
        } catch (Exception e) {
            log.error(e.getMessage());
            return Result.wrapErrorResult("", "出现异常，删除失败");
        }
    }
}
