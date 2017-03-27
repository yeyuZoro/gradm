<#include "layout/header.ftl">
<link rel="stylesheet" type="text/css" href="${BASE_PATH}/resources/css/pagination.css"/>
<link href="${BASE_PATH}/frontapp/media/css/glyphicons.css" rel="stylesheet"/>

<div class="page-content">
    <ul class="breadcrumb" style="clear:both;">
        <li>
            <i class="icon-home"></i>
            <a href="${BASE_PATH}/admin/goods">配件管理</a> > <a href="#">分类列表</a>
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
                        <form name="searchForm" id="searchForm" action="${BASE_PATH}/admin/goods/category/list">
                            <div class="clearfix">
                                <input type="hidden" name="page" value="1"/>

                                <div class="control-group pull-left">
                                    <label class="control-label">配件名称:</label>

                                    <div class="controls" style="margin-right: 20px">
                                        <input type="text" class="selcont " name="search_contentLike" id="search_contentLike" value=""
                                               placeholder="请输入你要搜索的内容"/>
                                    </div>
                                </div>


                                <div class="control-group pull-left margin-right-10">
                                    <label class="control-label">&nbsp;</label>
                                    <div class="controls" style="margin-right: 10px">
                                        <input type="submit" class="btn blue btn_small" value="搜索"/>
                                        <input type="button" class="btn blue btn_small pull-rigth" id="add" value="添加分类"/>
                                    </div>
                                </div>

                            </div>
                        </form>
                    </div>
                    <div id="sample_2_wrapper" class="dataTables_wrapper form-inline" style="margin-top: 20px">
                        <table class="table table-striped table-bordered table-hover table-full-width dataTable"
                               id="table-list" style="font-size: 12px;">
                            <thead>
                            <tr>
                                <th>配件名称</th>
                                <th>父分类</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="content">
                            </tbody>
                            <script type="text/html" id="contentTemplate">
                                <% for(var i in templateData){%>
                                <% var goodsCatVO = templateData[i]%>
                                <tr>
                                    <td><%= goodsCatVO.catName%></td>
                                    <td><%= goodsCatVO.parentName%></td>
                                    <td>
                                        <a href="${BASE_PATH}/admin/goods/category/edit?id=<%=goodsCatVO.id%>" class="btn mini purple edit"><i class="icon-edit"></i>编辑</a>
                                        <a href="javascript:void(0)" class="btn mini grey remove" value="<%= goodsCatVO.id%>"><i
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
<script type="text/javascript" src="${BASE_PATH}/resources/js/goods/goods_cat_list.js"></script>