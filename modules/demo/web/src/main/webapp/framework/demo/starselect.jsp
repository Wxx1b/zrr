<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>星级选择器</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;星级选择器 - ui:starSelect</b></div>
<layout:tabs>
<layout:tab title="范例">
    默认：<ui:starSelect id="demo1"/><br><br>

    带参：<ui:starSelect id="demo2" defaultValue="3" maxStar="10"/><br><br>

    自定提示：<ui:starSelect id="demo3" title=" ['很差','差','中','好','很好']"/><br><br>


    <input type="button" value="设置值" onclick="$('#demo1').stk_val(3)">
    <input type="button" value="获得值" onclick="alert($('#demo1').stk_val())">
    <input type="button" value="禁用" onclick="$('#demo1').stk_disabled(true)">
    <input type="button" value="恢复" onclick="$('#demo1').stk_disabled(false)">


    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    默认：<ui:starSelect id=\"demo1\"/><br><br>\n" +
        "\n" +
        "    带参：<ui:starSelect id=\"demo2\" defaultValue=\"3\" maxStar=\"10\"/><br><br>\n" +
        "    \n" +
        "    自定提示：<ui:starSelect id=\"demo3\" title=\" ['很差','差','中','好','很好']\"/><br><br>\n" +
        "\n" +
        "    <input type=\"button\" value=\"设置值\" onclick=\"$('#demo1').stk_val(3)\">\n" +
        "    <input type=\"button\" value=\"获得值\" onclick=\"alert($('#demo1').stk_val())\">\n" +
        "    <input type=\"button\" value=\"禁用\" onclick=\"$('#demo1').stk_disabled(true)\">\n" +
        "    <input type=\"button\" value=\"恢复\" onclick=\"$('#demo1').stk_disabled(false))\"><br><br>"));%>
    </pre>
    </layout:fieldSet>
</layout:tab>
<layout:tab title="参数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="params/param_component.jsp" %>
    <%@ include file="params/param_starselect.jsp" %>
</layout:tab>
<layout:tab title="事件">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="event/event_component.jsp" %>
</layout:tab>
<layout:tab title="函数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="function/func_component.jsp" %>
    <%@ include file="function/func_field.jsp" %>
</layout:tab>
</layout:tabs>
</body>
</html>