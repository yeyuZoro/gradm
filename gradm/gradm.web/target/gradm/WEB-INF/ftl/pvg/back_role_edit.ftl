<#include "layout/header.ftl">

<div class="page-content">
    <ul class="breadcrumb" style="clear:both;">
        <li>
            <i class="icon-home"></i>
            <a href="${BASE_PATH}/admin/pvg/permission">权限管理</a> > <a href="${BASE_PATH}/admin/pvg/role">角色列表</a> >
        <#if backRole>
            <a href="#">编辑角色</a>
        <#else>
            <a href="#">添加角色</a>
        </#if>
        </li>
        <li style="float:right;">
            <button type="button" style="padding:0px 5px" class="btn blue" onclick="window.history.go(-1)">返回</button>
        </li>
    </ul>
    <div class="container-fluid" style="background-color: #fff;">
        <div class="tab-content">
            <div class="tab-pane  active">
                <div class="portlet box">
                    <div class="portlet-body">
                        <div id="sample_2_wrapper" class="dataTables_wrapper form-inline">
                            <form method="POST" action="#" name="theFrom" >
                                <table class="table table-striped table-bordered table-hover table-full-width dataTable" style="font-size:12px;" width="100%" id="pvgList">

                                </table>
                                <div class="form-actions">
                                    <div align="center">
                                    <#--<input type="checkbox" id="checkall" name="checkall" value="checkbox" onclick="checkAll(this.form, this);" class="checkbox" />全选-->
                                        <input type="checkbox" id="checkall" name="checkall" value="checkbox"  class="checkbox" />全选
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <button type="button" class="btn blue" id="saveRole">
                                            <i class="icon-ok"></i>
                                            保存
                                        </button>
                                        <button type="button" class="btn" onclick="location.href='${BASE_PATH}/admin/pvg/role'">
                                            取消
                                        </button>
                                        <input type="hidden" id="id" value="${backRole.id}" />
                                        <input type="hidden" id="permissionIds" value="${backRole.permissionIds}">
                                    </div>

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/html" id="pvgListTpl">
        <tr>

            <td>角色名</td>
            <td>
                <input type="text" name="name" id="name" class="small" value="${backRole.name}"><span class="require-field">*</span></td>

        </tr>
        <%
        for (var i in templateData) {
        var pvg = templateData[i];
        var id = pvg.id;
        %>
        <tr>
            <td width="18%" valign="top" class="first-cell">
            <#--<input name="chkGroup" type="checkbox" value="<%=pvg.id %>" class="checkbox permissionId" onclick="check('checkId<%=pvg.id%>',this)"-->
                <input name="chkGroup" type="checkbox" value="<%=pvg.id %>" class="checkbox permissionId parentId"
                <% if(pvg.active){%> checked="checked"<%}%>
                ><%=pvg.name%>
            </td>
            <td>
                <%
                for (var item in pvg.childList) {
                var child = pvg.childList[item];
                %>

                <label for="<%= child.id %>"><input type="checkbox" name="action_code[]"
                                                    value="<%= child.id %>" class="checkbox checkId<%=child.parentId%> permissionId"
                                                    title="<%= child.name %>"  <% if(child.active){%> checked="checked"<%}%>/> <%= child.name%></label>
                &nbsp;&nbsp;
                <% } %>
            </td>
        </tr>
        <% } %>

    </script>


</div>

</form>
</div>
<!-- BEGIN PAGE -->
</div>
<!-- END CONTAINER -->
<#include "layout/footer.ftl" >
<script type="text/javascript" src="${BASE_PATH}/resources/js/pvg/pvg_common.js"></script>
<script type="text/javascript" src="${BASE_PATH}/resources/js/pvg/back_role_edit.js"></script>