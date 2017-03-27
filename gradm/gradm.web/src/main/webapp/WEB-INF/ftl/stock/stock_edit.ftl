<#include "layout/header.ftl">

<div class="page-content">
    <ul class="breadcrumb" style="clear:both;">
        <li>
            <i class="icon-home"></i>
            <a href="${BASE_PATH}/admin/stock">库存管理</a> >
            <a href="${BASE_PATH}/admin/stock">库存列表</a> >
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
                    <input type="text" readonly= "readonly" id="goodsName" value="${stock.goodsName} ">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">最小单位</label>
                <div class="controls">
                    <input type="text" id="measureUnit" value="${stock.measureUnit}">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">当前库存数量</label>
                <div class="controls">
                    <input type="text" id="currentStock" value="${stock.currentStock}">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">实盘库存</label>
                <div class="controls">
                    <input type="text" id="realStock" value="${stock.realStock}">
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">库存差额</label>
                <div class="controls">
                    <input type="text" id="diffStock" value="${stock.diffStock}">
                </div>
            </div>

            <div class="form-actions">
                <button type="button" class="btn blue" id="save">保存</button>
                <button type="button" class="btn" onclick='window.location.href="${BASE_PATH}/admin/stock"'>取消</button>
            </div>
            <input type="hidden" id="id" value="${stock.id}">
            <input type="hidden" id="goodsId" value="${stock.goodsId}">
        </form>
    </div>
    <!-- BEGIN PAGE -->
</div>
<!-- END CONTAINER -->
<#include "layout/footer.ftl" >
<script type="text/javascript" src="${BASE_PATH}/resources/js/stock/stock_edit.js"></script>
<script type="text/javascript" src="${BASE_PATH}/resources/js/common/popup.js"></script>
