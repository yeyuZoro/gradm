<#include "layout/header.ftl">

<div class="page-content">
    <ul class="breadcrumb" style="clear:both;">
        <li>
            <i class="icon-home"></i>
            <a href="${BASE_PATH}/login/show/uptPwd">修改密码</a>
        </li>
        <li style="float:right;">
            <button type="button" style="padding:0px 5px" class="btn blue" onclick="window.history.go(-1)">返回</button>
        </li>
    </ul>
    <div class="portlet-body form">
        <form action="#" class="form-horizontal">
            <div class="control-group">
                <label class="control-label">原密码：</label>
                <div class="controls">
                    <input type="password" id="oldPwd" ">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">新密码：</label>
                <div class="controls">
                    <input type="password" id="newPwd" ">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">确认密码：</label>
                <div class="controls">
                    <input type="password" id="confirmPwd"">
                </div>
            </div>

            <div class="form-actions">
                <button type="button" class="btn blue" id="saveUpt">确定</button>
            </div>
            <input type="hidden" id="id" value="${backUser.id}">
        </form>
    </div>
    <!-- BEGIN PAGE -->
</div>
<!-- END CONTAINER -->
<#include "layout/footer.ftl" >
<script type="text/javascript" src="${BASE_PATH}/resources/js/login/update_password.js"></script>
