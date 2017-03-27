<#include "layout/header.ftl">
<link rel="stylesheet" type="text/css" href="${BASE_PATH}/resources/css/pagination.css"/>
<div class="page-content">
    <ul class="breadcrumb" style="clear:both;">
        <li>
            <i class="icon-home"></i>
            <a href="javascript:void(0)">权限管理</a> > <a href="javascript:void(0)">权限列表</a>
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
                        <form name="searchForm" id="searchForm"
                              action="${BASE_PATH}/admin/pvg/permission/list"
                              style="height: 70px;">
                            <div class="clearfix">

                                <div class="control-group pull-left">
                                    <label class="control-label">&nbsp;</label>

                                    <div class="controls" style="margin-right: 20px">
                                        <a style="float:left" href="${BASE_PATH}/admin/pvg/permission/edit" class="btn blue"><i
                                                class=""></i>&nbsp;添加权限</a>
                                    </div>
                                </div>

                                <input type="hidden" name="page" id="search_page" value="1"/>
                            </div>
                        </form>

                        <div id="sample_2_wrapper" class="dataTables_wrapper form-inline"
                             style="margin-top: 20px;min-height: 300px">
                            <table class="table table-striped table-bordered table-hover table-full-width"
                                   id="table-list" style="font-size: 12px;TABLE-LAYOUT: fixed">
                                <thead>
                                <tr>
                                    <th class="th1">权限key</th>
                                    <th class="th2">权限名</th>
                                    <th class="th3">权限url</th>
                                    <th class="th4">排序</th>
                                    <th class="th4">操作</th>
                                </tr>
                                </thead>
                                <tbody id="content">
                                </tbody>
                                <!-- 模板渲染-->
                                <script type="text/html" id="contentTemplate">
                                    <% for(var i in templateData){%>
                                    <% var permission = templateData[i]%>
                                    <tr>
                                        <td><%= permission.pvgKey%></td>
                                        <td><%= permission.name%></td>
                                        <td><%= permission.url%></td>
                                        <td class="sortTd"><span class="sort"><%= permission.sort%></span></td>
                                        <td>
                                            <a href="${BASE_PATH}/admin/pvg/permission/edit?id=<%= permission.id%>" class="btn mini purple edit"><i
                                                    class=""></i>编辑</a>
                                            <a href="javascript:void(0)" class="btn mini grey remove"
                                               value="<%= permission.id%>"><i
                                                    class=""></i>移除</a>
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
    </div>
</div>

<#include "layout/footer.ftl" >
<script type="text/javascript" src="${BASE_PATH}/resources/js/common/pagination.js"></script>
<script type="text/javascript" src="${BASE_PATH}/resources/js/pvg/permission_list.js"></script>
