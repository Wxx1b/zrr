<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>标题</title>
    <%@ include file="../include/innerHead.jsp" %>
</head>
<body style="padding: 10px">
<ui:form id="DemoCurdActionForm">
    <div class="search-params-bar">
    <table>
    <tr><td><ul>
        <li><label>日期</label>
            <ui:datefield name="DemoDate"/>
        </li>
        <li><label>枚举</label>
            <param:enumList clazz="com.sinitek.spirit.webcontrol.demo.DemoEnum" var="DemoEnumList"/>
            <ui:select list="#attr.DemoEnumList" name="DemoEnum" headerKey="" headerValue="--请选择--" listKey="enumItemName" listValue="enumItemInfo"/>
        </li>
        <li><label>外键</label>
            <ui:textfield name="DemoForeign"/>
        </li>
        <li><label>字符串</label>
            <ui:textfield name="DemoString"/>
        </li>
        <li><label>整型</label>
            <ui:textfield name="DemoInteger"/>
        </li>
        </ul></td>
        <td>
            <ui:button text="查询">
                <event:onclick>
                    $("#DemoCurdActionTable").stk_query();
                </event:onclick>
            </ui:button>
        </td>
        </tr>
        </table>
        </div>
        <event:onkeypress keyCodeVar="code">
            if(code == 13) $("#DemoCurdActionTable").stk_query();
        </event:onkeypress>
</ui:form>
<ui:tablefix id="DemoCurdActionTable" actionClass="com.sinitek.spirit.webcontrol.demo.DemoCurdAction" pageSize="10" queryForm="DemoCurdActionForm" tableWidth="150%" fixWidth="0">
    <ui:colDate property="DemoDate" title="日期"/>
    <ui:colEnum property="DemoEnum" title="枚举" clazz="com.sinitek.spirit.webcontrol.demo.DemoEnum"/>
    <ui:col property="DemoForeign" title="外键"/>
    <ui:col property="DemoString" title="字符串"/>
    <ui:colNumber property="DemoInteger" title="整型"/>
</ui:tablefix>
</body>
</html>