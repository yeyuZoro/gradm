<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>员工信息</title>
</head>

<body>
<table id="tableExcel" width="100%" border="1" cellspacing="0" cellpadding="0">
    <tr><td colspan="5" style="text-align: center ;font-size: larger">员工信息</td></tr>
    <thead>
        <th class="th1">员工姓名</th>
        <th class="th2">手机号码</th>
        <th class="th3">是否是管理员</th>
        <th class="th4">性别</th>
        <th class="th5">身份证号码</th>
        <th class="th6">年龄</th>
    </thead>
    <tbody>
    <#if page.content>
        <#list page.content as manager>
        <tr style="text-align: left">
            <td>${manager.name}</td>
            <td>${manager.mobile}</td>
            <td>${manager.isAdminName}</td>
            <td>${manager.genderName}</td>
            <td style="vnd.ms-excel.numberformat:@">${manager.identityCard}</td>
            <td>${manager.age}</td>
        </tr>
        </#list>
    </#if>
    </tbody>
</table>
</body>
</html>

