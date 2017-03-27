<#include "layout/header.ftl">
<div class="page-content">
    <ul class="breadcrumb" style="clear:both;">
        <li>
            <i class="icon-home"></i>
            <a href="${BASE_PATH}/admin/pvg/permission">权限管理</a> > <a href="${BASE_PATH}/admin/pvg/user">用户列表</a> >
        <#if backPermission>
            <a href="#">编辑权限</a>
        <#else>
            <a href="#">添加权限</a>
        </#if>
        </li>
        <li style="float:right;">
            <button type="button" style="padding:0px 5px" class="btn blue" onclick="window.history.go(-1)">返回</button>
        </li>
    </ul>
    <div class="portlet-body form">
        <form action="#" class="form-horizontal">
            <div class="control-group">
                <label class="control-label">菜单Key</label>
                <div class="controls">
                    <input type="text" class="span6 m-wrap" id="pvgKey" value ="${backPermission.pvgKey}"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">菜单名称</label>
                <div class="controls">
                    <input type="text" class="span6 m-wrap" id="name" value ="${backPermission.name}"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">菜单url</label>
                <div class="controls">
                    <input type="text" class="span6 m-wrap" id="url" value ="${backPermission.url}"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">父菜单名称</label>
                <div class="controls">
                    <select id="parentId">
                        <option value="0">---选择父菜单---</option>
                    <#list permissionList as permission>
                        <option value="${permission.id}" <#if backPermission.parentId==permission.id> selected </#if>>${permission.name}</option>
                    </#list>
                    </select>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">排序</label>
                <div class="controls">
                    <input type="text" class="span6 m-wrap J_input_limit" data-limit_type="number" id="sort" value ="<#if backPermission.sort>${backPermission.sort}<#else>9999</#if>"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">是否为菜单</label>
                <div class="controls">
                    <input type="radio" name="isMenu"  value ="1" <#if backPermission.isMenu==1>checked </#if>/>是
                    <input type="radio" name="isMenu" value ="0" <#if backPermission.isMenu==0 || !backPermission>checked</#if>/>否
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">是否为导航</label>
                <div class="controls">
                    <input type="radio" name="isNav" value ="1" <#if backPermission.isNav==1 >checked </#if>/>是
                    <input type="radio" name="isNav" value ="0" <#if backPermission.isNav==0 || !backPermission>checked </#if>/>否
                </div>
            </div>
            <div class="form-actions">
                <button type="button" class="btn blue" id="savePermission">保存</button>
                <button type="button" class="btn" onclick='window.location.href="${BASE_PATH}/admin/pvg/permission"'>取消</button>
            </div>
            <input type="hidden" id="id" value="${backPermission.id}">
        </form>
    </div>
    <!-- BEGIN PAGE -->
</div>
<!-- END CONTAINER -->
<#include "layout/footer.ftl" >

<script type="text/javascript" src="${BASE_PATH}/resources/js/pvg/permission_edit.js"></script>