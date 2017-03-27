<#include "layout/header.ftl">
<link rel="stylesheet" type="text/css" href="${BASE_PATH}/resources/css/pagination.css"/>
<div class="page-content">
    <ul class="breadcrumb" style="clear:both;">
        <li>
            <i class="icon-home"></i>
            <a href="javascript:void(0)">库存管理</a> > <a href="javascript:void(0)">库存信息</a>
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
                              action="${BASE_PATH}/admin/stock/list"
                              style="height: 70px;">
                            <div class="clearfix">

                                <div class="control-group pull-left">
                                    <label class="control-label">配件名称:</label>

                                    <div class="controls" style="margin-right: 20px">
                                        <input type="text" class="selcont " name="search_contentLike" id="search_contentLike" value=""
                                               placeholder="请输入你要搜索的内容"/>
                                    </div>
                                </div>

                                <div class="control-group pull-left">
                                    <label class="control-label">&nbsp;</label>

                                    <div class="controls" style="margin-right: 20px">
                                        <input type="submit" class="btn blue btn_small" value="搜索"/>
                                        <input type="button" id="export" class="btn blue btn_small" value="导出"/>
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
                                    <th class="th2">最小单位</th>
                                    <th class="th3">创建时间</th>
                                    <th class="th4">上次更新时间</th>
                                    <th class="th5">当前库存数量</th>
                                    <th class="th6">实盘库存数量</th>
                                    <th class="th7">库存差额</th>
                                    <th class="th8">原因</th>
                                    <th class="th9">操作</th>
                                </tr>
                                </thead>
                                <tbody id="content">
<#--                                <tr>
                                    <td>大众轮胎</td>
                                    <td>只</td>
                                    <td>600</td>
                                    <td>580</td>
                                    <td>20</td>
                                    <td>正在派送</td>
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
                                    <td>个</td>
                                    <td>356</td>
                                    <td>370</td>
                                    <td>14</td>
                                    <td>退货返回</td>
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
                                    <td>个</td>
                                    <td>889</td>
                                    <td>889</td>
                                    <td>0</td>
                                    <td></td>
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
                                    <% var stock = templateData[i]%>
                                    <tr>
                                        <td><%= stock.goodsName%></td>
                                        <td><%= stock.measureUnit%></td>
                                        <td><%= stock.gmtCreateStr%></td>
                                        <td><%= stock.gmtModifiedStr%></td>
                                        <td><%= stock.currentStock%> </td>
                                        <td><%= stock.realStock%></td>
                                        <td><%= stock.diffStock%></td>
                                        <td><%= stock.reason%></td>
                                        <td>
                                        <a href="${BASE_PATH}/admin/stock/edit?id=<%=stock.id%>" class="btn mini purple edit"><i class="icon-edit"></i>编辑</a>
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
<script type="text/javascript" src="${BASE_PATH}/resources/js/stock/stock.js"></script>
