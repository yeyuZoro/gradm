<#include "layout/header.ftl">
<link rel="stylesheet" type="text/css" href="${BASE_PATH}/resources/css/page/manage_base.css"/>
<div class="page-content">
    <ul class="breadcrumb" style="clear:both;">
        <li>
            <i class="icon-home"></i>
            <a href="${BASE_PATH}/admin/pvg/user">权限管理</a> > <a href="${BASE_PATH}/admin/pvg/user">用户列表</a> >
        <#if backUser>
            <a href="#">编辑用户</a>
        <#else>
            <a href="#">添加用户</a>
        </#if>
        </li>
        <li style="float:right;">
            <button type="button" style="padding:0px 5px" class="btn blue" onclick="window.history.go(-1)">返回</button>
        </li>
    </ul>
    <div class="portlet-body form">
        <form action="#" class="form-horizontal">
            <div class="control-group">
                <label class="control-label">帐号<span class="required">*</span></label>
                <div class="controls">
                    <input type="text" class="small" id="userName" value ="${backUser.userName}"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">姓名<span class="required">*</span></label>
                <div class="controls">
                    <input type="text" class="small" id="name" value ="${backUser.name}"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">密码<span class="required">*</span></label>
                <div class="controls">
                    <input type="password" class="small" id="password" value ="${backUser.password}"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">角色</label>
                <div class="controls">
                <#if backUser.isAdmin==1>
                    <label class="control-label">超级管理员</label>
                <#else>
                    <select id="roleId">
                        <option value="">---选择角色---</option>
                        <#list roleList as role>
                            <option value="${role.id}" <#if role.id==backUser.roleId> selected </#if>>${role.name}</option>
                        </#list>
                    </select>
                </#if>
                </div>
            </div>
            <div class="form-actions">
                <button type="button" class="btn blue" id="saveUser">保存</button>
                <button type="button" class="btn" onclick='window.location.href="${BASE_PATH}/admin/pvg/user"'>取消</button>
            </div>
            <input type="hidden" id="id" value="${backUser.id}">
            <input type="hidden" id="isAdmin" value="${backUser.isAdmin}">
        </form>
    </div>
    <!-- BEGIN PAGE -->
</div>
<!-- END CONTAINER -->
<#include "layout/footer.ftl" >
<script type="text/javascript" src="${BASE_PATH}/resources/js/pvg/back_user_edit.js"></script>