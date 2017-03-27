<#include "layout/header.ftl">
<link rel="stylesheet" type="text/css" href="${BASE_PATH}/resources/css/pagination.css"/>

<div class="page-content">
    <ul class="breadcrumb" style="clear:both;">
        <li>
            <i class="icon-home"></i>
            <a href="${BASE_PATH}/admin/orderInfo">销售管理</a> > <a href="#">订单列表</a>
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
                        <form name="searchForm" id="searchForm" action="${BASE_PATH}/admin/order/list"
                              style="height: 70px;">
                            <div class="clearfix">

                                <div class="control-group pull-left">
                                    <label class="control-label">订单号:</label>
                                    <div class="controls" style="margin-right: 20px">
                                        <input id="search_orderSnLike" name="search_orderSnLike" value="" class="small"/>
                                    </div>
                                </div>
                                <div class="control-group pull-left">
                                    <label class="control-label">订单名称:</label>

                                    <div class="controls" style="margin-right: 20px">
                                        <input id="search_orderNameLike" name="search_orderNameLike" value=""class="small"/>
                                    </div>
                                </div>
                                <div class="control-group pull-left">
                                    <label class="control-label">联系人名称:</label>
                                    <div class="controls" style="margin-right: 20px">
                                        <input id="search_contactNameLike" name="search_contactNameLike" value=""class="small"/>
                                    </div>
                                </div>
                                <div class="control-group pull-left">
                                    <label class="control-label">联系电话:</label>
                                    <div class="controls" style="margin-right: 20px">
                                        <input id="search_contactMobileLike" name="search_contactMobileLike" value=""class="small"/>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix">
                                <div class="control-group pull-left">
                                    <label class="control-label">时间范围:</label>
                                    <div class="controls" style="margin-right: 20px">
                                        <input type="text" class="selcont w_ge startTime" name="search_startTime" id="d4311" value=""
                                               onFocus="WdatePicker({doubleCalendar:true,maxDate:'#F{$dp.$D(\'d4312\')}'})"
                                               placeholder="开始时间"/>至<input
                                            type="text" class="selcont w_ge endTime" name="search_endTime" id="d4312" value=""
                                            onFocus="WdatePicker({doubleCalendar:true,minDate:'#F{$dp.$D(\'d4311\')}'})"
                                            placeholder="结束时间"/>
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
                    </div>
                    <div id="sample_2_wrapper" class="dataTables_wrapper form-inline" style="margin-top: 20px;min-height: 300px">
                        <table class="table table-striped table-bordered table-hover table-full-width dataTable"
                               id="table-list" style="font-size: 12px;">
                            <thead>
                            <tr>
                                <th>订单号</th>
                                <th>商品名称</th>
                                <th>开单时间</th>
                                <th>客户/手机号</th>
                                <th>订单/支付状态</th>
                                <th>应付金额</th>
                                <th>优惠金额</th>
                                <th>实付金额</th>
                                <th>联系人/联系电话</th>
                                <th>收货地址</th>
                                <th>备注</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="content">
                            </tbody>
                            <script type="text/html" id="contentTemplate">
                                <% for(var i in templateData){%>
                                <% var orderInfoVO = templateData[i]%>
                                <tr>
                                    <td><%= orderInfoVO.orderSn%></td>
                                    <td><%= orderInfoVO.orderName%></td>
                                    <td><%= orderInfoVO.gmtCreateStr%></td>
                                    <td><%= orderInfoVO.customerName%> / <%= orderInfoVO.customerMobile%></td>
                                    <td><%= orderInfoVO.orderStatusName%> / <%= orderInfoVO.payStatusName%></td>
                                    <td><%= orderInfoVO.orderAmount%></td>
                                    <td><%= orderInfoVO.discount%></td>
                                    <td><%= orderInfoVO.payAmount%></td>
                                    <td><%= orderInfoVO.contactName%> / <%= orderInfoVO.contactMobile%></td>
                                    <td><%= orderInfoVO.customerAddress%></td>
                                    <td><%= orderInfoVO.postscript%></td>
                                    <td>
                                        <#--<a href="${BASE_PATH}/admin/order/edit?id=<%=orderInfoVO.id%>" class="btn mini purple edit"><i class="icon-edit"></i>编辑</a>-->
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
<script type="text/javascript" src="${BASE_PATH}/resources/js/order/order_info_list.js"></script>