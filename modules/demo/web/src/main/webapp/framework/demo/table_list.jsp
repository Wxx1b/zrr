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
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;表格控件:List - ui:table/ui:col</b></div>
<layout:tabs>
<layout:tab title="范例">
<ui:table id="testTable" actionClass="com.sinitek.spirit.webcontrol.demo.DemoTableListAction" pageSize="10">
    <ui:col property="DemoString" title="字符串" group="组1"/>
    <ui:colNumber property="DemoInteger" title="数字" isMoney="true" afterText="(元)" group="组1"/>
    <ui:colDate property="DemoDate" title="日期" format="yyyy-MM-dd" group="组1"/>
</ui:table>
</layout:tab>
<layout:tab title="代码">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("<ui:table id=\"testTable\" actionClass=\"com.sinitek.spirit.webcontrol.demo.DemoTableListAction\" pageSize=\"10\">\n" +
"    <ui:col property=\"DemoString\" title=\"字符串\" group=\"组1\"/>\n" +
"    <ui:colNumber property=\"DemoInteger\" title=\"数字\" isMoney=\"true\" afterText=\"(元)\" group=\"组1\"/>\n" +
"    <ui:colDate property=\"DemoDate\" title=\"日期\" format=\"yyyy-MM-dd\" group=\"组1\"/>\n" +
"</ui:table>"));%>
    </pre>

    <pre name="code" class="java">
<%out.print( HtmlUtils.htmlEscape("public class DemoTableListAction implements ITableAware{\n" +
"    public Object getResult(Map<String, String> map, HttpServletRequest request) throws Exception {\n" +
"        List list = new ArrayList();\n" +
"        for(int i = 0; i < 100; i++)\n" +
"        {\n" +
"            Map obj = new CaseInsensitiveMap();\n" +
"            obj.put(\"DemoString\",\"String\"+i);\n" +
"            obj.put(\"DemoInteger\",i);\n" +
"            obj.put(\"DemoDate\",new Date());\n" +
"            list.add(obj);\n" +
"        }\n" +
"\n" +
"        return list;\n" +
"    }\n" +
"\n" +
"    //暂时无用\n" +
"    public String setDefaultOrderBy(Map<String, String> map, HttpServletRequest request) {\n" +
"        return \"\";\n" +
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