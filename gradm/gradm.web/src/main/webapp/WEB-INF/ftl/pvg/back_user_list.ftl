<#include "layout/header.ftl">
<link rel="stylesheet" type="text/css" href="${BASE_PATH}/resources/css/pagination.css"/>

<div class="page-content">
    <ul class="breadcrumb" style="clear:both;">
        <li>
            <i class="icon-home"></i>
            <a href="${BASE_PATH}/admin/pvg/user">权限管理</a> > <a href="#">用户列表</a>
        </li>
        <li style="float:right;">
            <button type="button" style="padding:0px 5px" class="btn blue" onclick="window.history.go(-1)">返回</button>
        </li>
    </ul>
    <div class="container-fluid" style="background-color: #fff;">
        <div class="tab-content">
            <div class="tab-pane active">
                <div class="portlet box">
                    <div class="s_box">
                        <form name="searchForm" id="searchForm" action="${BASE_PATH}/admin/pvg/user/list">
                            <div class="clearfix">
                                <div class="control-group pull-left">
                                    <label class="control-label">角色列表:</label>
                                    <div class="controls" style="margin-right: 20px">
                                        <select name="search_roleId" class="chosen">
                                            <option value="">请选择</option>
                                        <#list roleList as role>
                                            <option value=${role.id}>${role.name}</option>
                                        </#list>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group pull-left">
                                    <label class="control-label">账号</label>
                                    <div class="controls" style="margin-right: 20px">
                                        <input id="search_staffNo" name="search_userName" value="" class="small"/>
                                    </div>
                                </div>
                                <div class="control-group pull-left">
                                    <label class="control-label">用户姓名</label>
                                    <div class="controls" style="margin-right: 20px">
                                        <input id="search_nameLike" name="search_nameLike" value="" class="small"/>
                                    </div>
                                </div>
                                <div class="control-group pull-left margin-right-20">
                                    <label class="control-label">&nbsp;</label>
                                    <div class="controls" style="margin-left: 20px">
                                        <input type="submit" class="btn blue btn_small" value="搜索"/>
                                    </div>
                                </div>
                                <div class="control-group pull-left margin-right-20">
                                    <label class="control-label">&nbsp;</label>
                                    <div class="controls" style="margin-left: 20px">
                                        <a style="float:left" href="${BASE_PATH}/admin/pvg/user/edit" class="btn blue"><i
                                                class="icon-plus"></i>&nbsp;添加用户</a>
                                    </div>
                                </div>
                                <input type="hidden" name="page" value="1"/>
                            </div>

                        </form>
                    </div>
                    <div id="sample_2_wrapper" class="dataTables_wrapper form-inline" style="margin-top: 20px;min-height: 300px">
                        <table class="table table-striped table-bordered table-hover table-full-width dataTable"
                               id="table-list" style="font-size: 12px;">
                            <thead>
                            <tr>
                                <th><input type="checkbox" id="selectAll"/></th>
                                <th>账号/用户名</th>
                                <th>角色</th>
                                <th>创建时间</th>
                                <th>创建人</th>
                                <th>修改人</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="content">
                            </tbody>
                            <script type="text/html" id="contentTemplate">
                                <% for(var i in templateData){%>
                                <% var user = templateData[i]%>
                                <tr>
                                    <td><input type="checkbox" name="checkboxId" class="checkboxId"
                                               value="<%= user.id%>"></td>
                                    <td><%= user.userName%>/<%= user.name%></td>
                                    <td>

                                        <%if(user.isAdmin==1){%>
                                        超级管理员
                                        <%}else{%>
                                        <a href="${BASE_PATH}/admin/pvg/role/edit?id=<%=user.roleId%>">
                                            <%= user.roleName%>
                                        </a>
                                        <%}%>

                                    </td>
                                    <td><%= user.gmtCreateStr%></td>
                                    <td><%= user.creatorName%></td>
                                    <td><%= user.modifierName%></td>
                                    <td>
                                        <a href="${BASE_PATH}/admin/pvg/user/edit?id=<%= user.id%>" class="btn mini purple edit"><i
                                                class="icon-edit"></i>编辑</a>
                                        <a href="javascript:void(0)" class="btn mini grey remove" value="<%= user.id%>"><i
                                                class="icon-remove"></i>移除</a>
                                    </td>
                                </tr>
                                <%}%>
                            </script>
                        </table>
                    </div>
                    <div id="pageDiv" class="text-center">
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- BEGIN PAGE -->
</div>
<!-- END CONTAINER -->
<#include "layout/footer.ftl" >
<script type="text/javascript" src="${BASE_PATH}/resources/js/common/pagination.js"></script>
<script type="text/javascript" src="${BASE_PATH}/resources/js/pvg/back_user_list.js"></script>