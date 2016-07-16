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
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;表格控件:复选框高级应用 - ui:table/ui:col</b></div>
<layout:tabs>
<layout:tab title="范例">

<plugin:colCheckbox id="checkBoxPlugin" name="check"/>
<ui:table id="testTable" actionClass="com.sinitek.spirit.webcontrol.demo.DemoTableAction" pageSize="10">
    <ui:col plugin="checkBoxPlugin"/>
    <ui:col property="DemoString" title="字符串" group="组1"/>
    <ui:col plugin="linkPlugin" property="DemoString" title="链接" group="组1"/>
    <ui:colNumber property="DemoInteger" title="数字" isMoney="true" afterText="(元)" group="组1"/>
    <ui:colDate property="DemoDate" title="日期" format="yyyy-MM-dd" group="组1"/>
    <ui:colDate property="DemoTime" title="时间" format="yyyy-MM-dd HH:mm:ss" group="组1"/>
    <ui:colEnum property="DemoEnum" title="枚举" format="value - info" clazz="com.sinitek.spirit.webcontrol.demo.DemoEnum" group="组1"/>
    <ui:colForeign property="DemoForeign" title="外键" format="{objid} - {name}" tableName="DEMOOBJECT2" columnName="objid" group="组2"/>
    <ui:colCust title="自定义" method="testCustCol" group="组2"/>
    <ui:colBoolean property="DemoEnum" title="布尔"  group="组2"/>

    <event:aftertablequery dataVar="data">
        for(var i=0;i < data.length;i++)
        {
            if(data[i].objid % 2 == 0)
            {
                $('#testTable').find("tr[objid='"+data[i].objid+"']").find("input[type='checkbox']").stk_disabled(true)
            }
        }
    </event:aftertablequery>
</ui:table>

    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("<plugin:colCheckbox id=\"checkBoxPlugin\" name=\"check\"/>\n" +
        "<ui:table id=\"testTable\" actionClass=\"com.sinitek.spirit.webcontrol.demo.DemoTableAction\" pageSize=\"10\">\n" +
        "    <ui:col plugin=\"checkBoxPlugin\"/>\n" +
        "    <ui:col property=\"DemoString\" title=\"字符串\" group=\"组1\"/>\n" +
        "    <ui:col plugin=\"linkPlugin\" property=\"DemoString\" title=\"链接\" group=\"组1\"/>\n" +
        "    <ui:colNumber property=\"DemoInteger\" title=\"数字\" isMoney=\"true\" afterText=\"(元)\" group=\"组1\"/>\n" +
        "    <ui:colDate property=\"DemoDate\" title=\"日期\" format=\"yyyy-MM-dd\" group=\"组1\"/>\n" +
        "    <ui:colDate property=\"DemoTime\" title=\"时间\" format=\"yyyy-MM-dd HH:mm:ss\" group=\"组1\"/>\n" +
        "    <ui:colEnum property=\"DemoEnum\" title=\"枚举\" format=\"value - info\" clazz=\"com.sinitek.spirit.webcontrol.demo.DemoEnum\" group=\"组1\"/>\n" +
        "    <ui:colForeign property=\"DemoForeign\" title=\"外键\" format=\"{objid} - {name}\" tableName=\"DEMOOBJECT2\" columnName=\"objid\" group=\"组2\"/>\n" +
        "    <ui:colCust title=\"自定义\" method=\"testCustCol\" group=\"组2\"/>\n" +
        "    <ui:colBoolean property=\"DemoEnum\" title=\"布尔\"  group=\"组2\"/>\n" +
        "\n" +
        "    <event:aftertablequery dataVar=\"data\">\n" +
        "        for(var i=0;i < data.length;i++)\n" +
        "        {\n" +
        "            if(data[i].objid % 2 == 0)\n" +
        "            {\n" +
        "                $('#testTable').find(\"tr[objid='\"+data[i].objid+\"']\").find(\"input[type='checkbox']\").stk_disabled(true)\n" +
        "            }\n" +
        "        }\n" +
        "    </event:aftertablequery>\n" +
        "</ui:table>"));%>
    </pre>
    </layout:fieldSet>
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
</layout:tabs>
</body>
</html>