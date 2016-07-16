<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>可删除选择框</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>

</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;可删除选择框 - ui:removableselect</b></div>
<layout:tabs>
<layout:tab title="范例">

<ui:removableSelect list="#{'020':'北京','021':'上海'}" id="testId" name="testName"/>
<br>
<input type="button" value="添加" onclick="$('#testId').stk_addOptions({'022':'广州','023':'其它','024':'其它2','025':'其它3','026':'其它4'});">
<input type="button" value="删除" onclick="$('#testId').stk_removeOptions(['022']);">
<input type="button" value="清空" onclick="$('#testId').stk_emptyOptions();">

    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("<ui:removableSelect list=\"#{'020':'北京','021':'上海'}\" id=\"testId\" name=\"testName\"/>\n" +
"\n" +
"<input type=\"button\" value=\"添加\" onclick=\"$('#testId').stk_addOptions({'022':'广州'});\">\n" +
"<input type=\"button\" value=\"删除\" onclick=\"$('#testId').stk_removeOptions(['022']);\">\n" +
"<input type=\"button\" value=\"清空\" onclick=\"$('#testId').stk_emptyOptions();\">"));%>
    </pre>
    </layout:fieldSet>
</layout:tab>
<layout:tab title="参数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="params/param_component.jsp" %>
    <%@ include file="params/param_field.jsp" %>
    <%@ include file="params/param_removableselect.jsp" %>
</layout:tab>
<layout:tab title="事件">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="event/event_component.jsp" %>
    <%@ include file="event/event_field.jsp" %>
</layout:tab>
<layout:tab title="函数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="function/func_component.jsp" %>
    <%@ include file="function/func_field.jsp" %>
</layout:tab>
</layout:tabs>
</body>
</html>