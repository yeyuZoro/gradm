package com.manager.gradm.biz.user.impl;

import com.manager.gradm.biz.base.BaseServiceImpl;
import com.manager.gradm.biz.user.BackUserService;
import com.manager.gradm.common.Result;
import com.manager.gradm.dao.user.BackRoleDao;
import com.manager.gradm.dao.user.BackUserDao;
import com.manager.gradm.entity.user.BackRole;
import com.manager.gradm.entity.user.BackUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.*;

/**
 * Created by lifeilong on 2016/5/19.
 */
@Service
@Slf4j
public class BackUserServiceImpl extends BaseServiceImpl implements BackUserService {

    @Autowired
    private BackUserDao backUserDao;

    @Autowired
    private BackRoleDao backRoleDao;

    @Override
    public Result checkLogin(String userName, String password) {

        Map<String, Object> searchParams = new HashMap<>();
        searchParams.put("userName", userName);
        List<BackUser> backUserList = backUserDao.select(searchParams);
        if (!CollectionUtils.isEmpty(backUserList)) {
            BackUser backUser = backUserList.get(0);
            String pwd = backUser.getPassword();
            if (pwd.equals(password)) {
                log.info("[登陆] 账户名、密码校验成功");
                return Result.wrapSuccessfulResult(backUser);
            }
            log.error("[登陆] 密码校验失败");
        }
        log.info("[登陆] 账户名、密码校验失败userName={}, password={}, backUserList={}", userName, password, backUserList);
        return Result.wrapErrorResult("", "用户名或密码错误");
    }

    @Override
    public BackUser selectById(Long id) {
        BackUser backUser = backUserDao.selectById(id);
        return backUser;
    }

    @Override
    public Result uptPassword(Long id, String oldPwd, String newPwd, String confirmPwd) {
        BackUser backUser = backUserDao.selectById(id);
        String pwd = backUser.getPassword();
        if(!pwd.equals(oldPwd)) {
            log.error("[修改密码] 原密码错误");
            return Result.wrapErrorResult("", "原密码错误");
        }
        if (!newPwd.equals(confirmPwd)) {
            log.error("[修改密码] 两次输入密码不一致");
            return Result.wrapErrorResult("", "两次输入密码不一致");
        }
        BackUser bur = new BackUser();
        bur.setId(id);
        bur.setPassword(newPwd);
        if(backUserDao.updateById(bur) > 0) {
            log.info("[修改密码] 修改成功");
            return Result.wrapSuccessfulResult("修改成功");
        }
        return Result.wrapErrorResult("", "修改失败");
    }

    @Override
    public Page<BackUser> getPage(Pageable pageable, Map<String, Object> searchParams) {
        Page<BackUser> page = super.getPage(backUserDao,pageable,searchParams);
        Set<Long> idSet = new HashSet<Long>();
        if(page!=null && !CollectionUtils.isEmpty(page.getContent())){
            List<BackRole> roleList = backRoleDao.select(null);
            for(BackUser backUser : page.getContent()){
                if(!backUser.getIsAdmin().equals(1l)){
                    for(BackRole backRole:roleList){
                        if(backRole.getId().equals(backUser.getRoleId())){
                            backUser.setRoleName(backRole.getName());
                        }
                    }
                }
                Long modifier = backUser.getModifier();
                Long creator = backUser.getCreator();
                idSet.add(modifier);
                idSet.add(creator);
            }
            searchParams.clear();
            searchParams.put("ids", idSet);
            List<BackUser> backUsers = backUserDao.select(searchParams);
            Map<Long , BackUser> userMap = new HashMap<>();
            for (BackUser backUser : backUsers){
                userMap.put(backUser.getId(),backUser);
            }

            for(BackUser backUser : page.getContent()){
                Long modifier = backUser.getModifier();
                if (userMap.containsKey(modifier)){
                    backUser.setModifierName(userMap.get(modifier).getName());
                }
                Long creator = backUser.getCreator();
                if (userMap.containsKey(creator)){
                    backUser.setCreatorName(userMap.get(creator).getName());
                }
            }
        }
        return page;
    }

    @Override
    public List<BackUser> select(Map<String, Object> searchParams) {
        return backUserDao.select(searchParams);
    }

    @Override
    public Result updateById(BackUser backUser) {
        if(backUserDao.updateById(backUser) > 0) {
            return Result.wrapSuccessfulResult("");
        } else {
            return Result.wrapErrorResult("", "");
        }
    }

    @Override
    public Result insert(BackUser backUser) {
        if(backUserDao.insert(backUser) > 0) {
            return Result.wrapSuccessfulResult("");
        } else {
            return Result.wrapErrorResult("", "");
        }
    }

    @Override
    public Result deleteById(Long id) {
        if(backUserDao.deleteById(id) > 0) {
            return Result.wrapSuccessfulResult("");
        } else {
            return Result.wrapErrorResult("", "");
        }
    }

}
