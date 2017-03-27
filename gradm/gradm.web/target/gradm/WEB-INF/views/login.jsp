<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Log in</title>
</head>


<body>

<div style="display:none">
    <h2>Enter the issuer to log in with:</h2>
    <form action="openid_connect_login111" method="get">
        <input type="text" name="identifier" value="${idpurl}"/>
        <input type="submit" />
    </form>
</div>
<script type="text/javascript">
    document.forms[0].submit();
</script>
</body>
</html>
