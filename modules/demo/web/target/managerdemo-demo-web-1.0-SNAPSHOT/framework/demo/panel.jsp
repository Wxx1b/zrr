<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>面板</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;面板 - layout.panel</b></div>
<layout:tabs>
<layout:tab title="范例">
<layout:panel title="测试标题" collapsible="true">
    内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容
    内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容
    内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容
    内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容
    内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容
    内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容
    内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容
    内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容
</layout:panel>

    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("<layout:panel title=\"测试标题\" collapsible=\"true\">\n" +
"    内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容\n" +
"    内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容\n" +
"    内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容\n" +
"    内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容\n" +
"    内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容\n" +
"    内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容\n" +
"    内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容\n" +
"    内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容\n" +
"</layout:panel>"));%>
    </pre>
    </layout:fieldSet>
</layout:tab>
<layout:tab title="参数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="params/param_component.jsp" %>
    <%@ include file="params/param_box.jsp" %>
    <%@ include file="params/param_panel.jsp" %>
</layout:tab>
<layout:tab title="事件">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="event/event_component.jsp" %>
</layout:tab>
<layout:tab title="函数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="function/func_component.jsp" %>
</layout:tab>
</layout:tabs>
<!-- 主要内容 -->
</body>
</html>