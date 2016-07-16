<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/12/14
  Time: 21:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/framework/include/head.jsp" %>
<html>
<head>
    <title></title>
    <%@ include file="/framework/include/innerHead.jsp" %>
</head>
<body>
<ui:table id="queryTable" actionClass="com.sinitek.managerdemo.demo.action.DemoQueryTableAction">
    <ui:col property="name" title="姓名"></ui:col>
    <ui:col property="age" title="年龄"></ui:col>
    <ui:colNumber property="income" isMoney="true" pointPlace="2" title="收入"></ui:colNumber>
    <ui:colEnum clazz="com.sinitek.managerdemo.demo.common.enums.GenderEnums" property="gender" title="性别"></ui:colEnum>
</ui:table>
</body>
</html>
