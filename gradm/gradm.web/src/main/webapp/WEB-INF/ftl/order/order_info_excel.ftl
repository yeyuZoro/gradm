<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>订单信息</title>
</head>

<body>
<table id="tableExcel" width="100%" border="1" cellspacing="0" cellpadding="0">
    <tr><td colspan="11" style="text-align: center ;font-size: larger">订单信息</td></tr>
    <thead>
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
    </thead>
    <tbody>
    <#if page.content>
        <#list page.content as orderInfoVO>
        <tr style="text-align: left">
            <td>${orderInfoVO.orderSn}</td>
            <td>${orderInfoVO.orderName}</td>
            <td>${orderInfoVO.gmtCreateStr}</td>
            <td>${orderInfoVO.customerName} / ${orderInfoVO.customerMobile}</td>
            <td>${orderInfoVO.orderStatusName} / ${orderInfoVO.payStatusName}</td>
            <td>${orderInfoVO.orderAmount}</td>
            <td>${orderInfoVO.discount}</td>
            <td>${orderInfoVO.payAmount}</td>
            <td>${orderInfoVO.contactName} / ${orderInfoVO.contactMobile}</td>
            <td>${orderInfoVO.customerAddress}</td>
            <td>${orderInfoVO.postscript}</td>
        </tr>
        </#list>
    </#if>
    </tbody>
</table>
</body>
</html>

