<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>表格控件</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
    <style type="text/css">
        .list li
        {
            padding-bottom:10px;
        }
    </style>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;表格控件:详细 - ui:table/ui:col</b></div>
<layout:tabs>
<layout:tab title="范例">

默认详细：<button type="button" onclick="$('#testTable').stk_detail('4')">直接调用</button><br>
<plugin:colCheckbox id="checkBoxPlugin" name="check"/>
<ui:table id="testTable" actionClass="com.sinitek.spirit.webcontrol.demo.DemoTableAction" pageSize="10" allowDetail="true">
    <ui:col plugin="checkBoxPlugin"/>
    <ui:col property="DemoString" title="字符串"/>
    <ui:colNumber property="DemoInteger" title="数字" isMoney="true" afterText="(元)"/>
    <ui:colDate property="DemoDate" title="日期" format="yyyy-MM-dd"/>
    <ui:colDate property="DemoTime" title="时间" format="yyyy-MM-dd HH:mm:ss"/>
    <ui:colEnum property="DemoEnum" title="枚举" format="value - info" clazz="com.sinitek.spirit.webcontrol.demo.DemoEnum"/>
    <ui:colForeign property="DemoForeign" title="外键" format="{objid} - {name}" tableName="DEMOOBJECT2" columnName="objid"/>
    <ui:colCust title="自定义" method="testCustCol"/>
    <ui:colBoolean property="DemoEnum" title="布尔"/>
</ui:table>


<br><br>自定义详细：<br>
<plugin:colLink id="linkPlugin" dataVar="val">
    alert(val.demostring);
</plugin:colLink>
<plugin:colCheckbox id="checkBoxPlugin2" name="check"/>
<ui:table id="testTable2" actionClass="com.sinitek.spirit.webcontrol.demo.DemoTableAction" pageSize="10" allowDetail="true">
    <ui:col plugin="checkBoxPlugin2"/>
    <ui:col property="DemoString" title="字符串"/>

    <func:tableDetail>
        <ui:col property="DemoString" title="字符串"/>
        <ui:col plugin="linkPlugin" property="DemoString" title="链接"/>
        <ui:colNumber property="DemoInteger" title="数字" isMoney="true" afterText="(元)"/>
        <ui:colDate property="DemoDate" title="日期" format="yyyy-MM-dd"/>
        <ui:colDate property="DemoTime" title="时间" format="yyyy-MM-dd HH:mm:ss"/>
        <ui:colEnum property="DemoEnum" title="枚举" format="value - info" clazz="com.sinitek.spirit.webcontrol.demo.DemoEnum"/>
        <ui:colForeign property="DemoForeign" title="外键" format="{objid} - {name}" tableName="DEMOOBJECT2" columnName="objid"/>
        <ui:colCust title="自定义" method="testCustCol"/>
        <ui:colBoolean property="DemoEnum" title="布尔"/>
    </func:tableDetail>
</ui:table>
</layout:tab>
<layout:tab title="代码">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("默认详细：<button type=\"button\" onclick=\"$('#testTable').stk_detail('4')\">直接调用</button><br>\n" +
        "<plugin:colCheckbox id=\"checkBoxPlugin\" name=\"check\"/>\n" +
        "<ui:table id=\"testTable\" actionClass=\"com.sinitek.spirit.webcontrol.demo.DemoTableAction\" pageSize=\"10\" allowDetail=\"true\">\n" +
        "    <ui:col plugin=\"checkBoxPlugin\"/>\n" +
        "    <ui:col property=\"DemoString\" title=\"字符串\"/>\n" +
        "    <ui:colNumber property=\"DemoInteger\" title=\"数字\" isMoney=\"true\" afterText=\"(元)\"/>\n" +
        "    <ui:colDate property=\"DemoDate\" title=\"日期\" format=\"yyyy-MM-dd\"/>\n" +
        "    <ui:colDate property=\"DemoTime\" title=\"时间\" format=\"yyyy-MM-dd HH:mm:ss\"/>\n" +
        "    <ui:colEnum property=\"DemoEnum\" title=\"枚举\" format=\"value - info\" clazz=\"com.sinitek.spirit.webcontrol.demo.DemoEnum\"/>\n" +
        "    <ui:colForeign property=\"DemoForeign\" title=\"外键\" format=\"{objid} - {name}\" tableName=\"DEMOOBJECT2\" columnName=\"objid\"/>\n" +
        "    <ui:colCust title=\"自定义\" method=\"testCustCol\"/>\n" +
        "    <ui:colBoolean property=\"DemoEnum\" title=\"布尔\"/>\n" +
        "</ui:table>\n" +
        "\n" +
        "\n" +
        "<br><br>自定义详细：<br>\n" +
        "<plugin:colCheckbox id=\"checkBoxPlugin2\" name=\"check\"/>\n" +
        "<ui:table id=\"testTable2\" actionClass=\"com.sinitek.spirit.webcontrol.demo.DemoTableAction\" pageSize=\"10\" allowDetail=\"true\">\n" +
        "    <ui:col plugin=\"checkBoxPlugin2\"/>\n" +
        "    <ui:col property=\"DemoString\" title=\"字符串\"/>\n" +
        "\n" +
        "    <func:tableDetail>\n" +
        "        <ui:col property=\"DemoString\" title=\"字符串\"/>\n" +
        "        <ui:col plugin=\"linkPlugin\" property=\"DemoString\" title=\"链接\"/>\n" +
        "        <ui:colNumber property=\"DemoInteger\" title=\"数字\" isMoney=\"true\" afterText=\"(元)\"/>\n" +
        "        <ui:colDate property=\"DemoDate\" title=\"日期\" format=\"yyyy-MM-dd\"/>\n" +
        "        <ui:colDate property=\"DemoTime\" title=\"时间\" format=\"yyyy-MM-dd HH:mm:ss\"/>\n" +
        "        <ui:colEnum property=\"DemoEnum\" title=\"枚举\" format=\"value - info\" clazz=\"com.sinitek.spirit.webcontrol.demo.DemoEnum\"/>\n" +
        "        <ui:colForeign property=\"DemoForeign\" title=\"外键\" format=\"{objid} - {name}\" tableName=\"DEMOOBJECT2\" columnName=\"objid\"/>\n" +
        "        <ui:colCust title=\"自定义\" method=\"testCustCol\"/>\n" +
        "        <ui:colBoolean property=\"DemoEnum\" title=\"布尔\"/>\n" +
        "    </func:tableDetail>\n" +
        "</ui:table>"));%>
    </pre>
 </layout:tab>
<layout:tab title="Table参数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="params/param_component.jsp" %>
    <%@ include file="params/param_table.jsp" %>
</layout:tab>
<layout:tab title="Col参数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="params/param_col.jsp" %>
</layout:tab>
<layout:tab title="事件">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="event/event_component.jsp" %>
    <%@ include file="event/event_table.jsp" %>
</layout:tab>
<layout:tab title="函数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="function/func_component.jsp" %>
    <%@ include file="function/func_table.jsp" %>
</layout:tab>
<layout:tab title="列插件">
    <%@ include file="table_plugin.jsp" %>
</layout:tab>
<layout:tab title="常见问题">
    <%@ include file="table_question.jsp" %>
</layout:tab>
</layout:tabs>
</body>
</html>