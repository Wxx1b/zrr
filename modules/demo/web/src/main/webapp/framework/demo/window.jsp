<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>窗口</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;窗口 - layout:window</b></div>
<!-- 主要内容 -->
<layout:window id="testWindow" title="标题1">
    注意：layout:window 请写在body体中而不是其它标签里<input type="button" onclick="$('#testWindow').stk_hide();" value="关闭">
    <event:onwindowclose>
        alert("关闭了");
    </event:onwindowclose>
</layout:window>

<layout:tabs>
<layout:tab title="范例">
注意：layout:window 请写在body体中而不是其它标签里
<input type="button" onclick="$('#testWindow').stk_show();" value="显示">
    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("<layout:window id=\"testWindow\" title=\"标题1\">\n" +
                                  "    注意：layout:window 请写在body体中而不是其它标签里<input type=\"button\" onclick=\"$('#testWindow').stk_hide();\" value=\"关闭\">\n" +
                                  "    <event:onwindowclose>\n" +
                                  "        alert(\"关闭了\");\n" +
                                  "    </event:onwindowclose>\n" +
                                  "</layout:window>" +
                                  "<input type=\"button\" onclick=\"$('#testWindow').stk_show();\" value=\"显示\">\n"));%>
    </pre>
    </layout:fieldSet>
</layout:tab>
<layout:tab title="参数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="params/param_component.jsp" %>
    <%@ include file="params/param_box.jsp" %>
    <%@ include file="params/param_window.jsp" %>
</layout:tab>
<layout:tab title="事件">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="event/event_component.jsp" %>
    <%@ include file="event/event_window.jsp" %>
</layout:tab>
<layout:tab title="函数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="function/func_component.jsp" %>
</layout:tab>
</layout:tabs>
</body>
</html>