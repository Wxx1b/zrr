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
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;表格控件:行号 - ui:table/ui:col</b></div>
<layout:tabs>
<layout:tab title="范例">

<plugin:colRowNum id="rowNumPlugin"/>
<plugin:colCheckbox id="checkBoxPlugin" name="check" checkedVar="checked"/>

<ui:table id="testTable" actionClass="com.sinitek.spirit.webcontrol.demo.DemoTableAction" pageSize="10" allowDetail="true" allowExport="true">
    <ui:col plugin="checkBoxPlugin"/>
    <ui:col plugin="rowNumPlugin"/>
    <ui:col property="DemoString" title="字符串"/>
    <ui:colNumber property="DemoInteger" title="数字" isMoney="true" afterText="(元)"/>
    <ui:colDate property="DemoDate" title="日期" format="yyyy-MM-dd"/>
    <ui:colDate property="DemoTime" title="时间" format="yyyy-MM-dd HH:mm:ss"/>
    <ui:colEnum property="DemoEnum" title="枚举" format="value - info" clazz="com.sinitek.spirit.webcontrol.demo.DemoEnum"/>
    <ui:colForeign property="DemoForeign" title="外键" format="{objid} - {name}" tableName="DEMOOBJECT2" columnName="objid"/>
    <ui:colCust title="自定义" method="testCustCol"/>
    <ui:colBoolean property="DemoEnum" title="布尔"/>
</ui:table>
</layout:tab>
<layout:tab title="代码">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("<plugin:colRowNum id=\"rowNumPlugin\"/>\n" +
        "<plugin:colCheckbox id=\"checkBoxPlugin\" name=\"check\" checkedVar=\"checked\"/>\n" +
        "    \n" +
        "<ui:table id=\"testTable\" actionClass=\"com.sinitek.spirit.webcontrol.demo.DemoTableAction\" pageSize=\"10\" allowDetail=\"true\" allowExport=\"true\">\n" +
        "    <ui:col plugin=\"checkBoxPlugin\" width=\"20px\"/>\n" +
        "    <ui:col plugin=\"rowNumPlugin\" width=\"30px\"/>\n" +
        "    <ui:col property=\"DemoString\" title=\"字符串\"/>\n" +
        "    <ui:colNumber property=\"DemoInteger\" title=\"数字\" isMoney=\"true\" afterText=\"(元)\"/>\n" +
        "    <ui:colDate property=\"DemoDate\" title=\"日期\" format=\"yyyy-MM-dd\"/>\n" +
        "    <ui:colDate property=\"DemoTime\" title=\"时间\" format=\"yyyy-MM-dd HH:mm:ss\"/>\n" +
        "    <ui:colEnum property=\"DemoEnum\" title=\"枚举\" format=\"value - info\" clazz=\"com.sinitek.spirit.webcontrol.demo.DemoEnum\"/>\n" +
        "    <ui:colForeign property=\"DemoForeign\" title=\"外键\" format=\"{objid} - {name}\" tableName=\"DEMOOBJECT2\" columnName=\"objid\"/>\n" +
        "    <ui:colCust title=\"自定义\" method=\"testCustCol\"/>\n" +
        "    <ui:colBoolean property=\"DemoEnum\" title=\"布尔\"/>\n" +
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