<%--
  File Desc:      
  Product Name: SIRM
  Module Name: indicator
  Author:      潘虹
  History:     11-4-27 created by 潘虹
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/orgincludes.jsp" %>
<html>
<head>
    <title></title>
</head>
<%
    request.setAttribute("hasGrantAuth", true);
%>
<body>

<jsp:include page="/common/include/treemenu.jsp">
    <jsp:param name="page" value="${contextPath}/org/orgstructure_right.jsp"/>
    <jsp:param name="clazz" value="com.sinitek.managerframework.org.action.OrgTreeAction"/>
    <jsp:param name="maxlevel" value="-1"/>
    <jsp:param name="rootid" value="0"/>
</jsp:include>

</body>
</html>