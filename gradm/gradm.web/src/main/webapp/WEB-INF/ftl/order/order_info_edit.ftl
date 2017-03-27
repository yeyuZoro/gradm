<#include "layout/header.ftl">

<div class="page-content">
    <ul class="breadcrumb" style="clear:both;">
        <li>
            <i class="icon-home"></i>
            <a href="${BASE_PATH}/admin/article/cat">配件管理</a> >
            <a href="${BASE_PATH}/admin/article/cat">配件列表</a> >
        </li>
        <li style="float:right;">
            <button type="button" style="padding:0px 5px" class="btn blue" onclick="window.history.go(-1)">返回</button>
        </li>
    </ul>
    <div class="portlet-body form">
        <form action="#" class="form-horizontal">
            <div class="control-group">
                <label class="control-label">配件名称</label>
                <div class="controls">
                    <input type="text" id="name" value="${goods.name}">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">配件编号</label>
                <div class="controls">
                    <input type="text" id="goodsSn" value="${goods.goodsSn}">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">最小单位</label>
                <div class="controls">
                    <input type="text" id="measureUnit" value="${goods.measureUnit}">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">销售价格</label>
                <div class="controls">
                    <input type="text" id="price" value="${goods.price}">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">库存</label>
                <div class="controls">
                    <input type="text" id="stock" value="${goods.stock}">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">所属父分类</label>
                <div class="controls">
                    <select class="small m-wrap" id="goodsType">
                        <option value="0">请选择</option>
                    <#list goodsCategoryList as goodsCategory>
                        <option value="${goodsCategory.id}"<#if goods.goodsType==goodsCategory.id>selected</#if>>
                        ${goodsCategory.catName}
                        </option>
                    </#list>
                    </select>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">配件品牌</label>
                <div class="controls">
                    <input type="text" id="goodsBrand" value="${goods.goodsBrand}">
                </div>
            </div>

            <div class="form-actions">
                <button type="button" class="btn blue" id="saveGoods">保存</button>
                <button type="button" class="btn" onclick='window.location.href="${BASE_PATH}/admin/goods"'>取消</button>
            </div>
            <input type="hidden" id="id" value="${goods.id}">
        </form>
    </div>
    <!-- BEGIN PAGE -->
</div>
<!-- END CONTAINER -->
<#include "layout/footer.ftl" >
<script type="text/javascript" src="${BASE_PATH}/resources/js/goods/goods_edit.js"></script>
<script type="text/javascript" src="${BASE_PATH}/resources/js/common/popup.js"></script>
