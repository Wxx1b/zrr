<%@ page import="java.io.PrintWriter" %>
<%@ page import="org.apache.log4j.Logger" %>
<%--
  描述:
  User: 王志华
  Date: 12-4-4
  Time: 上午8:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>错误提示</title>
</head>
<body>
    <c:if test="${empty currentUser}">
        <h5>用户会话超时请重新登录!</h5>
    </c:if>
    <c:if test="${not empty currentUser}">
        <h5>发生错误，请联系管理员!</h5>
    </c:if>
    <%
        Logger.getLogger("com.sinitek.managerframework.errorpage").error("error occured", exception);
    %>
</body>
</html>