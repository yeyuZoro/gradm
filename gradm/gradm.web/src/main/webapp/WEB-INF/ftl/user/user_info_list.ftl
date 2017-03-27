<#include "layout/header.ftl">
<link rel="stylesheet" type="text/css" href="${BASE_PATH}/resources/css/pagination.css"/>
<div class="page-content">
    <ul class="breadcrumb" style="clear:both;">
        <li>
            <i class="icon-home"></i>
            <a href="javascript:void(0)">用户管理</a> > <a href="javascript:void(0)">员工信息</a>
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
                              action="${BASE_PATH}/admin/user/list"
                              style="height: 70px;">
                            <div class="clearfix">

                                <div class="control-group pull-left">
                                    <label class="control-label">员工姓名:</label>

                                    <div class="controls" style="margin-right: 20px">
                                        <input type="text" class="selcont " name="search_nameLike" id="search_nameLike" value=""
                                               placeholder="请输入员工姓名"/>
                                    </div>
                                </div>

                                <div class="control-group pull-left">
                                    <label class="control-label">手机号码:</label>

                                    <div class="controls" style="margin-right: 20px">
                                        <input type="text" class="selcont " name="search_mobileLike" id="search_contentLike" value=""
                                               placeholder="请输入手机号码"/>
                                    </div>
                                </div>
                                <div class="control-group pull-left">
                                    <label class="control-label">身份证号码:</label>

                                    <div class="controls" style="margin-right: 20px">
                                        <input type="text" class="selcont " name="search_identityCard" id="search_identityCard" value=""
                                               placeholder="请输入身份证号码"/>
                                    </div>
                                </div>

                                <div class="control-group pull-left">
                                    <label class="control-label">&nbsp;</label>

                                    <div class="controls" style="margin-right: 20px">
                                        <input type="submit" class="btn blue btn_small" value="搜索"/>
                                        <input type="button" class="btn blue btn_small pull-rigth" id="addUser" value="添加员工"/>
                                    </div>
                                </div>

                                <div class="control-group pull-right">
                                    <label class="control-label">&nbsp;</label>

                                    <div class="controls" style="margin-right: 20px">
                                        <input type="button" id = "export" class="btn blue btn_small" id="export" value="导出"/>
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
                                    <th class="th1">员工姓名</th>
                                    <th class="th2">手机号码</th>
                                    <th class="th3">是否是管理员</th>
                                    <th class="th4">性别</th>
                                    <th class="th5">身份证号码</th>
                                    <th class="th6">年龄</th>
                                    <th class="th7">操作</th>
                                </tr>
                                </thead>
                                <tbody id="content">
<#--                                    <tr>
                                        <td> </td>
                                        <td>15633321547</td>
                                        <td>是</td>
                                        <td>男</td>
                                        <td>362012198905301543</td>
                                        <td>
                                            <a href="${BASE_PATH}/admin/pvg/permission/edit?id=<%= permission.id%>" class="btn mini purple edit"><i
                                                    class=""></i>编辑</a>
                                            <a href="javascript:void(0)" class="btn mini grey remove"
                                               value="<%= permission.id%>"><i
                                                    class=""></i>移除</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>王五</td>
                                        <td>13255697851</td>
                                        <td>否</td>
                                        <td>男</td>
                                        <td>360112198804112365</td>
                                        <td>
                                            <a href="${BASE_PATH}/admin/pvg/permission/edit?id=<%= permission.id%>" class="btn mini purple edit"><i
                                                    class=""></i>编辑</a>
                                            <a href="javascript:void(0)" class="btn mini grey remove"
                                               value="<%= permission.id%>"><i
                                                    class=""></i>移除</a>
                                        </td>
                                    </tr>
                                    <tr>
                                            <td>陈丽</td>
                                        <td>18722023657</td>
                                        <td>否</td>
                                        <td>女</td>
                                        <td>450114199205051235</td>
                                        <td>
                                            <a href="${BASE_PATH}/admin/pvg/permission/edit?id=<%= permission.id%>" class="btn mini purple edit"><i
                                                    class=""></i>编辑</a>
                                            <a href="javascript:void(0)" class="btn mini grey remove"
                                               value="<%= permission.id%>"><i
                                                    class=""></i>移除</a>
                                        </td>
                                    </tr>-->
                                </tbody>
                                <script type="text/html" id="contentTemplate">
                                    <% for(var i in templateData){%>
                                    <% var manager = templateData[i]%>
                                    <tr>
                                        <td><%= manager.name%></td>
                                        <td><%= manager.mobile%></td>
                                        <%if(manager.isAdmin == 1){%>
                                        <td>是</td>
                                        <%} else {%>
                                        <td>否</td>
                                        <%}%>
                                        <td><%= manager.genderName%></td>
                                        <td><%= manager.identityCard%> </td>
                                        <td><%= manager.age%></td>>
                                        <td>
                                            <a href="${BASE_PATH}/admin/user/edit?id=<%=manager.id%>" class="btn mini purple edit"><i class="icon-edit"></i>编辑</a>
                                            <a href="javascript:void(0)" class="btn mini grey remove" value="<%= manager.id%>"><i
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
    </div>
</div>

<#include "layout/footer.ftl" >
<script type="text/javascript" src="${BASE_PATH}/resources/js/common/pagination.js"></script>
<script type="text/javascript" src="${BASE_PATH}/resources/js/user/user_info_list.js"></script>
