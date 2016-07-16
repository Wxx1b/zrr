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
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;表格控件:汇总 - ui:table/ui:col </b></div>
<layout:tabs>
<layout:tab title="范例">
 <ui:button text="获得汇总数据">
     <event:onclick>
         stk.debug($("#testTable").stk_collectData());
     </event:onclick>
 </ui:button>
<ui:table id="testTable" actionClass="com.sinitek.spirit.webcontrol.demo.DemoTableAction" pageSize="6">
    <ui:col property="DemoString" title="字符串" group="组1"/>
    <ui:colNumber property="DemoInteger" title="数字" width="200px" isMoney="true" afterText="(元)" group="组1" collect="SUM,AVG" align="right"/>
    <ui:colDate property="DemoDate" title="日期" format="yyyy-MM-dd HH:mm:ss" group="组1"/>
    <ui:colEnum property="DemoEnum" title="枚举" format="value - info" clazz="com.sinitek.spirit.webcontrol.demo.DemoEnum" group="组1"/>
    <ui:colEntity property="DemoForeign" title="实体" format="{objid} - {name}" entityName="DEMOOBJECT2" foreignProperty="objid" group="组2"/>
    <ui:colForeign property="DemoForeign" title="外键" format="{objid} - {name}" tableName="DEMOOBJECT2" columnName="objid" group="组2"/>
    <ui:colCust title="自定义" method="testCustCol" group="组2"/>
</ui:table>
</layout:tab>
<layout:tab title="代码">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("<ui:table id=\"testTable\" actionClass=\"com.sinitek.spirit.webcontrol.demo.DemoTableAction\" pageSize=\"6\">\n" +
"    <ui:col property=\"DemoString\" title=\"字符串\" group=\"组1\"/>\n" +
"    <ui:colNumber property=\"DemoInteger\" title=\"数字\" isMoney=\"true\" afterText=\"(元)\" group=\"组1\" collect=\"SUM,AVG\" align=\"right\"/>\n" +
"    <ui:colDate property=\"DemoDate\" title=\"日期\" format=\"yyyy-MM-dd HH:mm:ss\" group=\"组1\"/>\n" +
"    <ui:colEnum property=\"DemoEnum\" title=\"枚举\" format=\"value - info\" clazz=\"com.sinitek.spirit.webcontrol.demo.DemoEnum\" group=\"组1\"/>\n" +
"    <ui:colEntity property=\"DemoForeign\" title=\"实体\" format=\"{objid} - {name}\" entityName=\"DEMOOBJECT2\" foreignProperty=\"objid\" group=\"组2\"/>\n" +
"    <ui:colForeign property=\"DemoForeign\" title=\"外键\" format=\"{objid} - {name}\" tableName=\"DEMOOBJECT2\" columnName=\"objid\" group=\"组2\"/>\n" +
"    <ui:colCust title=\"自定义\" method=\"testCustCol\" group=\"组2\"/>\n" +
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