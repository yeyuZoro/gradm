package com.manager.gradm.biz.user;

import com.manager.gradm.common.Result;
import com.manager.gradm.entity.user.BackUser;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

/**
 * Created by lifeilong on 2016/5/19.
 */
public interface BackUserService {


    public Result checkLogin(String userName, String password);

    public BackUser selectById(Long id);

    public Result uptPassword(Long id, String oldPwd, String newPwd, String confirmPwd);

    public Page<BackUser> getPage(Pageable pageable, Map<String, Object> searchParams);

    public List<BackUser> select(Map<String, Object> searchParams);

    public Result updateById(BackUser backUser);

    public Result insert(BackUser backUser);

    public Result deleteById(Long id);
}
