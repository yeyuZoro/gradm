<#include "layout/header.ftl">
<link rel="stylesheet" type="text/css" href="${BASE_PATH}/resources/css/pagination.css"/>
<div class="page-content">
    <ul class="breadcrumb" style="clear:both;">
        <li>
            <i class="icon-home"></i>
            <a href="javascript:void(0)">敏感词管理</a> > <a href="javascript:void(0)">敏感词列表</a>
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
                              action="${BASE_PATH}/admin/sensitive/list"
                              style="height: 70px;">
                            <div class="clearfix">

                                <div class="control-group pull-left">
                                    <label class="control-label">搜索内容:</label>

                                    <div class="controls" style="margin-right: 20px">
                                        <input type="text" class="selcont " name="search_contentLike" id="search_contentLike" value=""
                                               placeholder="请输入敏感词"/>
                                    </div>
                                </div>

                                <div class="control-group pull-left">
                                    <label class="control-label">&nbsp;</label>

                                    <div class="controls" style="margin-right: 20px">
                                        <input type="submit" class="btn blue btn_small" value="搜索"/>
                                        <input type="button" class="btn blue btn_small pull-rigth" id="addGoods" value="添加敏感词"/>
                                    </div>
                                </div>
                                <div class="controls">

                                </div>
                                <div class="control-group pull-right">
                                    <label class="control-label">&nbsp;</label>

                                    <div class="controls" style="margin-right: 20px">
                                        <input type="button" id = "export" class="btn blue btn_small" value="导出"/>
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
                                    <th class="th1">敏感词</th>
                                    <th class="th1">级别</th>

                                </tr>
                                </thead>
                                <tbody id="content">
                                <#--                                    <tr>
                                        <td>大众轮胎</td>
                                        <td>SP-00001</td>
                                        <td>只</td>
                                        <td>223.5</td>
                                        <td>600</td>
                                        <td>轮胎</td>
                                        <td>大众</td>
                                        <td>
                                            <a href="${BASE_PATH}/admin/pvg/permission/edit?id=<%= permission.id%>" class="btn mini purple edit"><i
                                                    class=""></i>编辑</a>
                                            <a href="javascript:void(0)" class="btn mini grey remove"
                                               value="<%= permission.id%>"><i
                                                    class=""></i>移除</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>现代索纳塔原装电池</td>
                                        <td>DC-00001</td>
                                        <td>个</td>
                                        <td>467.0</td>
                                        <td>889</td>
                                        <td>电池</td>
                                        <td>现代</td>
                                        <td>
                                            <a href="${BASE_PATH}/admin/pvg/permission/edit?id=<%= permission.id%>" class="btn mini purple edit"><i
                                                    class=""></i>编辑</a>
                                            <a href="javascript:void(0)" class="btn mini grey remove"
                                               value="<%= permission.id%>"><i
                                                    class=""></i>移除</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>12缸发动机</td>
                                        <td>FDJ-00001</td>
                                        <td>个</td>
                                        <td>2336.5</td>
                                        <td>356</td>
                                        <td>发动机</td>
                                        <td>上海一汽大众</td>
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
                                    <% var sensitive = templateData[i]%>
                                    <tr>
                                        <td><%= sensitive.sensitive%></td>
                                        <td><%= sensitive.level%></td>

                                        <td>
                                            <a href="${BASE_PATH}/admin/goods/edit?id=<%=goods.id%>" class="btn mini purple edit"><i class="icon-edit"></i>编辑</a>
                                            <a href="javascript:void(0)" class="btn mini grey remove" value="<%= goods.id%>"><i
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
<script type="text/javascript" src="${BASE_PATH}/resources/js/goods/goods_list.js"></script>
