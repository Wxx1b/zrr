<%--
  Created by IntelliJ IDEA.
  Author: 冯奕骅
  Date: 2015/4/2
  Time: 10:37
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/commonincludes.jsp" %>
<sirm:page clazz="com.sinitek.managerframework.org.action.RoleNodeAction"/>

<jsp:include page="${page}">
    <jsp:param name="roleid" value="${param.id}"/>
</jsp:include>