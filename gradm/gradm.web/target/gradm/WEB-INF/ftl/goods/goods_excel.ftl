<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>配件列表</title>
</head>

<body>
<table id="tableExcel" width="100%" border="1" cellspacing="0" cellpadding="0">
    <tr><td colspan="2" style="text-align: center ;font-size: larger">配件列表</td></tr>
    <thead>
    <th>配件名称</th>
    <th>配件编号</th>
    <th>最小单位</th>
    <th>销售价格</th>
    <th>库存</th>
    <th>配件类型</th>
    <th>配件品牌</th>
    </thead>
    <tbody>
    <#if page.content>
        <#list page.content as goods>
        <tr style="text-align: left">
            <td>${goods.name}</td>
            <td>${goods.goodsSn}</td>
            <td>${goods.measureUnit}</td>
            <td>${goods.price}</td>
            <td>${goods.stock}</td>
            <td>${goods.categoryName}</td>
            <td>${goods.goodsBrand}</td>
        </tr>
        </#list>
    </#if>
    </tbody>
</table>
</body>
</html>

