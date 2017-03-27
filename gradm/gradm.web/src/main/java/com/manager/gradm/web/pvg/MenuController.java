package com.manager.gradm.web.pvg;

import com.manager.gradm.biz.common.DefaultPage;
import com.manager.gradm.biz.pvg.BackPermissionService;
import com.manager.gradm.common.Constants;
import com.manager.gradm.common.Result;
import com.manager.gradm.entity.pvg.BackPermission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lifeilong on 2016/4/29.
 */
@Controller
@RequestMapping("menu")
public class MenuController {

    @Autowired
    private BackPermissionService backPermissionService;

    @RequestMapping("list")
    @ResponseBody
    public Result showList(@PageableDefault(page = 1,value = 10, sort = "gmt_create", direction = Sort.Direction.DESC) Pageable pageable,
            HttpServletRequest request, String path) {

        List<BackPermission> backPermissionList = (List<BackPermission>) request.getSession().getAttribute(Constants.SESSION_PVG_LIST);
        List<BackPermission> parentsList = new ArrayList<>();
        for (BackPermission menu1 : backPermissionList) {
            menu1.setActive(false);
            if (menu1.getParentId() == 0 && menu1.getIsMenu() == 1) {
                parentsList.add(menu1);
            }
        }
        for (BackPermission menu2 : parentsList) {
            List<BackPermission> childList = new ArrayList<>();
            for (BackPermission menu1 : backPermissionList) {

                if (menu2.getId() == menu1.getParentId()) {
                    if ((Constants.BASE_PATH + menu1.getUrl()).equals(path)) {
                        menu1.setActive(true);
                        menu2.setActive(true);
                    }
                    if (CollectionUtils.isEmpty(menu2.getChildList()) && menu1.getIsMenu() == 1) {
                        childList.add(menu1);
                    } else if (menu1.getIsMenu() == 1) {
                        childList.add(menu1);
                    }
                }
            }
            menu2.setChildList(childList);

        }
        return Result.wrapSuccessfulResult(parentsList);
    }
}
