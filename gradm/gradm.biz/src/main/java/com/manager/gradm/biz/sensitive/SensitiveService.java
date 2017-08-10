package com.manager.gradm.biz.sensitive;

import com.manager.gradm.entity.sensitive.Sensitive;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Map;

/**
 * Created by Administrator on 2017/3/17.
 */
public interface SensitiveService {
    public Page<Sensitive> getSensitiveList(Pageable pageable, Map<String, Object> searchPage);

    Sensitive selectById(Long id);
}
