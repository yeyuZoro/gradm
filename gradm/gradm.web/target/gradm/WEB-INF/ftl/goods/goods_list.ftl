<#include "layout/header.ftl">
<link rel="stylesheet" type="text/css" href="${BASE_PATH}/resources/css/pagination.css"/>
<div class="page-content">
    <ul class="breadcrumb" style="clear:both;">
        <li>
            <i class="icon-home"></i>
            <a href="javascript:void(0)">配件管理</a> > <a href="javascript:void(0)">配件列表</a>
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
                              action="${BASE_PATH}/admin/goods/list"
                              style="height: 70px;">
                            <div class="clearfix">

                                <div class="control-group pull-left">
                                    <label class="control-label">搜索内容:</label>

                                    <div class="controls" style="margin-right: 20px">
                                        <input type="text" class="selcont " name="search_contentLike" id="search_contentLike" value=""
                                               placeholder="请输入配件名称、配件编号、配件品牌"/>
                                    </div>
                                </div>

                                <div class="control-group pull-left">
                                    <label class="control-label">&nbsp;</label>

                                    <div class="controls" style="margin-right: 20px">
                                        <input type="submit" class="btn blue btn_small" value="搜索"/>
                                        <input type="button" class="btn blue btn_small pull-rigth" id="addGoods" value="添加配件"/>
                                    </div>
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
                                    <th class="th1">配件名称</th>
                                    <th class="th1">配件编号</th>
                                    <th class="th2">最小单位</th>
                                    <th class="th2">销售价格</th>
                                    <th class="th2">库存</th>
                                    <th class="th2">配件类型</th>
                                    <th class="th2">配件品牌</th>
                                    <th class="th4">操作</th>
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
                                    <% var goods = templateData[i]%>
                                    <tr>
                                        <td><%= goods.name%></td>
                                        <td><%= goods.goodsSn%></td>
                                        <td><%= goods.measureUnit%></td>
                                        <td><%= goods.price%></td>
                                        <td><%= goods.stock%></td>
                                        <td><%= goods.categoryName%></td>
                                        <td><%= goods.goodsBrand%></td>
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
