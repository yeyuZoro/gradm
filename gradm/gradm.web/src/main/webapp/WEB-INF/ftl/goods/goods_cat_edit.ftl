<#include "layout/header.ftl">

<div class="page-content">
    <ul class="breadcrumb" style="clear:both;">
        <li>
            <i class="icon-home"></i>
            <a href="${BASE_PATH}/admin/article/cat">配件管理</a> >
            <a href="${BASE_PATH}/admin/article/cat">配件分类</a> >
        </li>
        <li style="float:right;">
            <button type="button" style="padding:0px 5px" class="btn blue" onclick="window.history.go(-1)">返回</button>
        </li>
    </ul>
    <div class="portlet-body form">
        <form action="#" class="form-horizontal">
            <div class="control-group">
                <label class="control-label">分类名称</label>
                <div class="controls">
                    <input type="text" id="catName" value="${category.catName}">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">所属父分类</label>
                <div class="controls">
                    <select class="small m-wrap" id="parentId">
                    <option value="0">请选择</option>
                    <#list goodsCategoryList as parentCategoryCat>
                        <option value="${parentCategoryCat.id}"<#if category.parentId==parentCategoryCat.id>selected</#if>>
                            ${parentCategoryCat.catName}
                        </option>
                    </#list>
                    </select>
                </div>
            </div>

            <div class="form-actions">
                <button type="button" class="btn blue" id="saveArticleCat">保存</button>
                <button type="button" class="btn" onclick='window.location.href="${BASE_PATH}/admin/goods/category"'>取消</button>
            </div>
            <input type="hidden" id="id" value="${category.id}">
        </form>
    </div>
    <!-- BEGIN PAGE -->
</div>
<!-- END CONTAINER -->
<#include "layout/footer.ftl" >
<script type="text/javascript" src="${BASE_PATH}/resources/js/goods/goods_cat_edit.js"></script>
