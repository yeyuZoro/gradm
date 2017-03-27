package com.manager.gradm.web.login;

import com.manager.gradm.biz.pvg.BackPermissionService;
import com.manager.gradm.biz.pvg.BackRoleService;
import com.manager.gradm.biz.user.BackUserService;
import com.manager.gradm.biz.user.ManagerService;
import com.manager.gradm.common.Constants;
import com.manager.gradm.common.Result;
import com.manager.gradm.entity.pvg.BackPermission;
import com.manager.gradm.entity.user.BackRole;
import com.manager.gradm.entity.user.BackUser;
import com.manager.gradm.entity.user.Manager;
import com.manager.gradm.pojo.login.BackUserUptVO;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lifeilong on 2016/4/29.
 */
@Controller
@Slf4j
@RequestMapping("login")
public class LoginController {

    @Autowired
    private BackUserService backUserService;

    @Autowired
    private BackRoleService backRoleService;

    @Autowired
    private BackPermissionService backPermissionService;

    @RequestMapping
    public String toLogin(){
        return "login/login2";
    }

    @RequestMapping("/check")
    @ResponseBody
    public Result check(@RequestParam(value = "userName", required = false) String userName,
                        @RequestParam(value = "password", required = false) String password,HttpServletRequest request){
        log.info("[登陆] 校验");
        if (StringUtils.isBlank(userName)) {
            log.error("[登陆] 用户名为空");
            return Result.wrapErrorResult("", "密码不能为空");
        }
        if (StringUtils.isBlank(password)) {
            log.error("[登陆] 密码为空");
            return Result.wrapErrorResult("", "密码不能为空");
        }
        Result result = backUserService.checkLogin(userName, password);
        if (null != result && result.isSuccess()) {
            BackUser backUser = (BackUser)result.getData();
/*            Manager manager = managerService.selectById(backUser.getManagerId());*/
            HttpSession session = request.getSession();
            session.setAttribute(Constants.SESSION_USER_ID, backUser.getId());
            session.setAttribute(Constants.SESSION_NAME, backUser.getName());
            session.setAttribute(Constants.SESSION_USER_INFO, backUser);
            List<BackPermission> backPermissionList = new ArrayList<>();

            if(backUser.getIsAdmin().equals(1L)) {
                //超级管理员
                Map<String, Object> permissionParams = new HashMap<>();
                permissionParams.put("sorts", new String[]{"sort asc"});
                backPermissionList = backPermissionService.select(permissionParams);
            } else {
                //普通用户
                BackRole role = backRoleService.selectById(backUser.getRoleId());
                if(null != role) {
                    String permissionIdsStr = role.getPermissionIds();
                    if(!StringUtils.isBlank(permissionIdsStr)) {
                        String[] idsStrArr = permissionIdsStr.split(",");
                        List<Long> permissionIdsArr = new ArrayList<>();
                        if(idsStrArr.length > 0) {
                            for(String idStr : idsStrArr) {
                                permissionIdsArr.add(Long.parseLong(idStr));
                            }
                        }
                        Map<String, Object> permissionParams = new HashMap<>();
                        permissionParams.put("permissionIds", permissionIdsArr);
                        permissionParams.put("sorts", new String[]{"sort asc"});
                        backPermissionList = backPermissionService.select(permissionParams);
                    }
                }
            }
            session.setAttribute(Constants.SESSION_PVG_LIST, backPermissionList);
        }
        return result;
    }

    @RequestMapping("/show/uptPwd")
    public String toUptPassword(@RequestParam("id") Long id, Model model){
        BackUser backUser = backUserService.selectById(id);
        if(null != backUser) {
            model.addAttribute("backUser", backUser);
        }
        return "login/update_password";
    }
    @RequestMapping(value = "updatePassword", method = RequestMethod.POST)
    @ResponseBody
    public Result updatePassword(@RequestBody BackUserUptVO backUserUptVO){
        if (StringUtils.isBlank(backUserUptVO.getOldPwd())) {
            log.error("[修改密码] 原密码为空");
            return Result.wrapErrorResult("","原密码不能为空");
        }
        if (StringUtils.isBlank(backUserUptVO.getNewPwd())) {
            log.error("[修改密码] 新密码为空");
            return Result.wrapErrorResult("","新密码不能为空");
        }
        if (StringUtils.isBlank(backUserUptVO.getConfirmPwd())) {
            log.error("[修改密码] 确认密码为空");
            return Result.wrapErrorResult("","确认密码不能为空");
        }
        Result result = backUserService.uptPassword(backUserUptVO.getId(), backUserUptVO.getOldPwd(), backUserUptVO.getNewPwd(), backUserUptVO.getConfirmPwd());
        return result;
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    @ResponseBody
    public Result logout(HttpServletRequest request){
        try {
            request.getSession().removeAttribute(Constants.SESSION_PVG_LIST);
            request.getSession().removeAttribute(Constants.SESSION_USER_INFO);
            request.getSession().removeAttribute(Constants.SESSION_NAME);
            request.getSession().removeAttribute(Constants.SESSION_USER_ID);
            return Result.wrapSuccessfulResult("");
        } catch (Exception e) {
            log.error("[退出] 删除session失败 e={}", e);
            return Result.wrapErrorResult("","登出失败");
        }

    }
}
