<#include "layout/header.ftl">
<link rel="stylesheet" type="text/css" href="${BASE_PATH}/resources/css/pagination.css"/>

<div class="page-content">
    <ul class="breadcrumb" style="clear:both;">
        <li>
            <i class="icon-home"></i>
            <a href="${BASE_PATH}/admin/pvg/permission">权限管理</a> > <a href="#">角色列表</a>
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
                        <form name="searchForm" id="searchForm" action="${BASE_PATH}/admin/pvg/role/list">
                            <div class="clearfix">
                                <input type="hidden" name="page" value="1"/>
                            </div>
                        </form>
                    </div>
                    <div class="clearfix">
                        <div class="pull-right margin-right-20">
                            <a style="float:left" href="${BASE_PATH}/admin/pvg/role/edit" class="btn blue"><i
                                    class="icon-plus"></i>&nbsp;添加角色</a>
                        </div>
                    </div>
                    <div id="sample_2_wrapper" class="dataTables_wrapper form-inline" style="margin-top: 20px">
                        <table class="table table-striped table-bordered table-hover table-full-width dataTable"
                               id="table-list" style="font-size: 12px;">
                            <thead>
                            <tr>
                                <th>角色名</th>
                                <th style="width: 65%">权限</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="content">
                            </tbody>
                            <script type="text/html" id="contentTemplate">
                                <% for(var i in templateData){%>
                                <% var role = templateData[i]%>
                                <tr>
                                    <td><%= role.name%></td>
                                    <td><%= role.permissionNames%></td>
                                    <td>
                                        <a href="${BASE_PATH}/admin/pvg/role/edit?id=<%= role.id%>"" class="btn mini purple edit"><i
                                            class="icon-edit"></i>编辑</a>
                                        <a href="javascript:void(0)" class="btn mini grey remove" value="<%= role.id%>"><i
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
<script type="text/javascript" src="${BASE_PATH}/resources/js/pvg/back_role_list.js"></script>