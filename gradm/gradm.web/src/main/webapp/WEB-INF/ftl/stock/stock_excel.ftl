<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>库存信息</title>
</head>

<body>
<table id="tableExcel" width="100%" border="1" cellspacing="0" cellpadding="0">
    <tr><td colspan="8" style="text-align: center ;font-size: larger">库存信息</td></tr>
    <thead>
    <th class="th1">配件名称</th>
    <th class="th2">最小单位</th>
    <th class="th3">创建时间</th>
    <th class="th4">上次更新时间</th>
    <th class="th5">当前库存数量</th>
    <th class="th6">实盘库存数量</th>
    <th class="th7">库存差额</th>
    <th class="th8">原因</th>
    </thead>
    <tbody>
    <#if page.content>
        <#list page.content as stock>
        <tr style="text-align: left">
            <td>${stock.goodsName}</td>
            <td>${stock.measureUnit}</td>
            <td>${stock.gmtCreateStr}</td>
            <td>${stock.gmtModifiedStr}</td>
            <td>${stock.currentStock}</td>
            <td>${stock.realStock}</td>
            <td>${stock.diffStock}</td>
            <td>${stock.reason}</td>
        </tr>
        </#list>
    </#if>
    </tbody>
</table>
</body>
</html>

