<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>多行文本输入栏</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;多行文本输入栏 - ui:textarea</b></div>
<layout:tabs>
<layout:tab title="范例">
    <ui:textarea width="300px" rows="5" defaultValue="aaa"/>

    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("<ui:textarea width=\"300px\" rows=\"5\" defaultValue=\"aaa\"/>"));%>
    </pre>
    </layout:fieldSet>
</layout:tab>
<layout:tab title="参数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="params/param_component.jsp" %>
    <%@ include file="params/param_field.jsp" %>
    <%@ include file="params/param_textarea.jsp" %>
</layout:tab>
<layout:tab title="事件">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="event/event_component.jsp" %>
    <%@ include file="event/event_field.jsp" %>
    <%@ include file="event/event_textfield.jsp" %>
</layout:tab>
<layout:tab title="函数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="function/func_component.jsp" %>
    <%@ include file="function/func_field.jsp" %>
</layout:tab>
</layout:tabs>
</body>
</html>