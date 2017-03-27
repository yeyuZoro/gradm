package com.manager.gradm.web.pvg;

import com.manager.gradm.biz.common.DefaultPage;
import com.manager.gradm.biz.pvg.BackRoleService;
import com.manager.gradm.common.Result;
import com.manager.gradm.common.util.ServletUtils;
import com.manager.gradm.entity.user.BackRole;
import com.manager.gradm.entity.user.BackUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by lifeilong on 2016/5/19.
 */
@Controller
@Slf4j
@RequestMapping("admin/pvg/role")
public class RoleController {

    @Autowired
    private BackRoleService backRoleService;

    @RequestMapping
    public String show(){
        return "pvg/back_role_list";
    }

    /**
     * 角色列表
     */
    @RequestMapping("list")
    @ResponseBody
    public Object roleList(@PageableDefault(page = 1, value = 20, sort = "id", direction = Sort.Direction.DESC) Pageable pageable,
                           HttpServletRequest request) {
        Map<String, Object> searchParams = ServletUtils.getParametersMapStartWith(request);
        DefaultPage<BackRole> page = null;
        page = (DefaultPage<BackRole>) backRoleService.getPage(pageable, searchParams);
        page.setPageUri(request.getRequestURI());
        return Result.wrapSuccessfulResult(page);
    }

    /**
     * 角色编辑
     */
    @RequestMapping("edit")
    public String roleEdit(Model model, @RequestParam(value = "id", required = false) Long id) {
        //跳到更新页面
        if (id != null) {
            BackRole backRole = backRoleService.selectById(id);
            model.addAttribute("backRole", backRole);
        }
        return "pvg/back_role_edit";
    }

    /**
     * 角色更新或者添加
     * @param backRole
     * @param request
     * @return
     */
    @RequestMapping("update")
    @ResponseBody
    public Result update(BackRole backRole, HttpServletRequest request) {
        BackUser backUser = (BackUser) request.getSession().getAttribute("SESSION_USER_INFO");
        try {
            if (backRole != null) {
                backRole.setModifier(backUser.getId());
                if (backRole.getId() != null && backRole.getId() > 0) {

                    log.info("更新角色" + backRole.getName());
                    Result result = backRoleService.update(backRole);
                    return result;
                } else {
                    backRole.setCreator(backUser.getId());
                    log.info("新增角色" + backRole.getName());
                    Result result = backRoleService.insert(backRole);
                    return result;
                }
            }
        } catch (Exception e) {
            log.error(e.getMessage());

        }
        return Result.wrapErrorResult("", "系统错误");
    }

}
