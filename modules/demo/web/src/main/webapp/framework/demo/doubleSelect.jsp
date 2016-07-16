<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>双向选择器</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;双向选择器 - ui:doubleSelect</b></div>
<layout:tabs>
<layout:tab title="范例">

	<%
        String[] defaultValue = new String[]{"021"};
        pageContext.setAttribute("defaultValue",defaultValue);
    %>
    <ui:doubleSelect id="demo" list="#{'020':'北京','021':'上海','022':'广州'}" title="左侧" selectTitle="右侧" defaultValue="${defaultValue}"/>

    <input type="button" value="设置值" onclick="$('#demo').stk_val(['022']);">
    <input type="button" value="获得值" onclick="alert($('#demo').stk_val());">
    <input type="button" value="初始化" onclick="$('#demo').stk_init({'020':'北京','021':'上海','022':'广州','023':'深圳'},['023','022']);">
    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("< %\n"+
        "        String[] defaultValue = new String[]{\"021\"};\n"
        +
        "        pageContext.setAttribute(\"defaultValue\",defaultValue);\n"+
    "% >\n" +
"    <ui:doubleSelect id=\"demo\" list=\"#{'020':'北京','021':'上海','022':'广州'}\" title=\"左侧\" selectTitle=\"右侧\" defaultValue=\"${defaultValue}\"/>\n" +
"\n" +
"    <input type=\"button\" value=\"设置值\" onclick=\"$('#demo').stk_val(['022']);\">\n" +
        "    <input type=\"button\" value=\"获得值\" onclick=\"alert($('#demo').stk_val());\">\n" +
        "    <input type=\"button\" value=\"初始化\" onclick=\"$('#demo').stk_init({'020':'北京','021':'上海','022':'广州','023':'深圳'},['023','022']);\">"));%>
    </pre>
    </layout:fieldSet>
</layout:tab>
<layout:tab title="参数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="params/param_component.jsp" %>
    <%@ include file="params/param_doubleSelect.jsp" %>
</layout:tab>
<layout:tab title="事件">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="event/event_component.jsp" %>
</layout:tab>
<layout:tab title="函数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="function/func_component.jsp" %>
    <%@ include file="function/func_doubleselect.jsp" %>
</layout:tab>
</layout:tabs>
</body>
</html>