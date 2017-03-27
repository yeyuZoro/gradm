<#include "layout/header.ftl">

<div class="page-content">
    <ul class="breadcrumb" style="clear:both;">
        <li>
            <i class="icon-home"></i>
            <a href="${BASE_PATH}/admin/user">员工管理</a> >
            <a href="${BASE_PATH}/admin/user">员工列表</a> >
        </li>
        <li style="float:right;">
            <button type="button" style="padding:0px 5px" class="btn blue" onclick="window.history.go(-1)">返回</button>
        </li>
    </ul>
    <div class="portlet-body form">
        <form action="#" class="form-horizontal">
            <div class="control-group">
                <label class="control-label">员工姓名</label>
                <div class="controls">
                    <input type="text" id="name" value="${manager.name} ">
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">手机号码</label>
                <div class="controls">
                    <input type="text" id="mobile" value="${manager.mobile}">
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">是否是管理员</label>
                <div class="controls">
                    <select class="small m-wrap" id="isAdmin">
                        <option value="0" selected>否</option>
                        <option value="1" <#if manager.isAdmin == 1>selected</#if>>是</option>
                    </select>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">性别</label>
                <div class="controls">
                    <select class="small m-wrap" id="gender">
                        <option value="1" selected>男</option>
                        <option value="0" <#if manager.gender == 0>selected</#if>>女</option>
                    </select>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">身份证号码</label>
                <div class="controls">
                    <input type="text" id="identityCard" value="${manager.identityCard}">
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">年龄</label>
                <div class="controls">
                    <input type="text" id="age" value="${manager.age}">
                </div>
            </div>

            <div class="form-actions">
                <button type="button" class="btn blue" id="save">保存</button>
                <button type="button" class="btn" onclick='window.location.href="${BASE_PATH}/admin/user"'>取消</button>
            </div>
            <input type="hidden" id="id" value="${manager.id}">
        </form>
    </div>
    <!-- BEGIN PAGE -->
</div>
<!-- END CONTAINER -->
<#include "layout/footer.ftl" >
<script type="text/javascript" src="${BASE_PATH}/resources/js/user/user_info_edit.js"></script>
