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
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;表格控件:分组 - ui:table/ui:col</b></div>
<layout:tabs>
<layout:tab title="范例">

<plugin:colButton id="butPlugin" text="操作" dataVar="val">
    alert(val.demotime.format('yyyy-MM-dd hh:mm:ss'));
</plugin:colButton>
<plugin:colButton id="butPlugin2" text="操作2" dataVar="val">
    alert(2);
</plugin:colButton>

<plugin:colLink id="linkPlugin" dataVar="val">
    alert(val.demostring);
</plugin:colLink>
<plugin:colCheckbox id="checkBoxPlugin" name="check" checkedVar="checked"/>
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
    <ui:col plugin="butPlugin,butPlugin2"  title="按钮" width="120px"/>
</ui:table>
</layout:tab>
<layout:tab title="代码">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("<plugin:colButton id=\"butPlugin\" text=\"操作\" dataVar=\"val\">\n" +
        "    alert(val.demotime.format('yyyy-MM-dd hh:mm:ss'));\n" +
        "</plugin:colButton>\n" +
        "<plugin:colButton id=\"butPlugin2\" text=\"操作2\" dataVar=\"val\">\n" +
        "    alert(2);\n" +
        "</plugin:colButton>\n" +
        "\n" +
        "<plugin:colLink id=\"linkPlugin\" dataVar=\"val\">\n" +
        "    alert(val.demostring);\n" +
        "</plugin:colLink>\n" +
        "<plugin:colCheckbox id=\"checkBoxPlugin\" name=\"check\" checkedVar=\"checked\"/>\n" +
        "<ui:table id=\"testTable\" actionClass=\"com.sinitek.spirit.webcontrol.demo.DemoTableAction\" pageSize=\"10\" tableWidth=\"150%\">\n" +
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
        "    <ui:col plugin=\"butPlugin,butPlugin2\"  title=\"按钮\" width=\"120px\"/>\n" +
        "</ui:table>"));%>
    </pre>

    <pre name="code" class="java">
<%out.print( HtmlUtils.htmlEscape("public class DemoTableAction implements ITableAware{\n" +
"    public Object getResult(Map<String, String> map, HttpServletRequest request) throws Exception {\n" +
"        StringBuilder sql = new StringBuilder(\"select t.*,CAST(t.demodate AS TIMESTAMP) as demoTime from DemoObject t where 1 = 1\");\n" +
"        return new MetaDBTemplate().createSqlQuery( sql.toString());\n" +
"    }\n" +
"\n" +
"    public String setDefaultOrderBy(Map<String, String> map, HttpServletRequest request) {\n" +
"        return \"\";\n" +
"    }\n" +
"    \n" +
"    public static String testCustCol(Map data)\n" +
"    {\n" +
"        return \"哈哈\";\n" +
"    }\n" +
"}"));%>
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