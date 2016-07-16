<%--
  Created by IntelliJ IDEA.
  User: sinitek
  Date: 12-5-15
  Time: 下午4:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/orgincludes.jsp" %>
<html>
<head>
    <title>配置组织结构上下级关系</title>

</head>
<body>
    <jsp:include page="/common/include/treemenu.jsp">
        <jsp:param name="page" value="${contextPath}/org/orgrelation/managescheme_right.jsp?schemeid=${param.schemeid}"/>
        <jsp:param name="clazz" value="com.sinitek.managerframework.org.action.OrgSchemeNodeAction"/>
        <jsp:param name="maxlevel" value="2"/>
        <jsp:param name="roottype" value="${param.schemeid}"/>
        <jsp:param name="rootid" value="0"/>
        <jsp:param name="ismove" value="false"/>
    </jsp:include>
</body>
</html>