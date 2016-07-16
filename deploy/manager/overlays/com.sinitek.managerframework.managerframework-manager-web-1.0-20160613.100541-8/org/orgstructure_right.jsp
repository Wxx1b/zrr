<%--
  Created by IntelliJ IDEA.
  User: HF.fay
  Date: 14-8-5
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/orgincludes.jsp" %>
<sirm:page clazz="com.sinitek.managerframework.org.action.OrgStructureRightAction" method="loadpage"/>
<%--<html>--%>
<%--<head>--%>
    <%--<title></title>--%>
<%--</head>--%>
<%--<body>--%>
<c:if test="${flag == true}">
    <jsp:include page="${directurl}"/>
</c:if>

<%--</body>--%>
<%--</html>--%>
