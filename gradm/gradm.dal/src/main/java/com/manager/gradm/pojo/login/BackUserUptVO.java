package com.manager.gradm.pojo.login;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;

/**
 * Created by lifeilong on 2016/5/19.
 */
@Data
@EqualsAndHashCode(callSuper = false)
@JsonIgnoreProperties(ignoreUnknown = true)
public class BackUserUptVO {
    private Long id;
    private String oldPwd;
    private String newPwd;
    private String confirmPwd;
}
