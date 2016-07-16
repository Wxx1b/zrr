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
<ui:form id="queryForm">
<div class="search-params-bar">
    <table>
        <tr>
            <td>
                <ul>
                    <li><label>姓名</label><ui:textfield name="name"/></li>
                    <%--
                    <li><label>性别</label>
                        <param:enumList clazz="com.sinitek.managerdemo.demo.common.enums.GenderEnums" var="GenderList"/>
                        <ui:select list="#attr.GenderList" name="gender" headerKey="" headerValue="--请选择--"
                                   listKey="enumItemName" listValue="enumItemInfo"></ui:select>
                    </li>
                    --%>
                </ul>
            </td>
            <td>
                <ui:button text="查询">
                    <event:onclick>
                        $("#queryTable").stk_query();
                    </event:onclick>
                </ui:button>

            </td>
        </tr>
    </table>
    </ui:form>
    <ui:table id="queryTable" actionClass="com.sinitek.managerdemo.demo.action.DemoQueryTableMultiAction" queryForm="queryForm">
        <ui:col property="name" title="姓名"></ui:col>
        <ui:col property="age" title="年龄"></ui:col>
        <ui:colNumber property="income" isMoney="true" pointPlace="2" title="收入"></ui:colNumber>
        <ui:colEnum clazz="com.sinitek.managerdemo.demo.common.enums.GenderEnums" property="gender"
                    title="性别"></ui:colEnum>
    </ui:table>
</body>
</html>
