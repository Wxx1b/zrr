<%--
  File Desc:   部门组织结构管理
  Product Name: SIRM
  Module Name: org
  Author:      李琦明
  History:     15-2-11 created by 李琦明
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/orgincludes.jsp" %>
<sirm:page clazz="com.sinitek.managerframework.org.action.AuthorizeAction" method="loadAuthParam"></sirm:page>
<html>
<head>
    <title>部门组织结构管理</title>
</head>
<body>
<jsp:include page="/common/include/treemenu.jsp">
    <jsp:param name="page" value="${contextPath}/org/orgstructure_right.jsp"/>
    <jsp:param name="clazz" value="com.sinitek.managerframework.org.action.OrgTreeAction"/>
    <jsp:param name="maxlevel" value="-1"/>
    <jsp:param name="rootid" value="0"/>
</jsp:include>

</body>
</html>