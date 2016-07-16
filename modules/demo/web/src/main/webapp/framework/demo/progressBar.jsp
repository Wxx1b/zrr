<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>进度条</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;进度条 - ui:progressBar</b></div>
<layout:tabs>
    <layout:tab title="范例">
        普通：<ui:progressBar id="pb1" defaultValue="65"/><a href="#" onclick='alert($("#pb1").stk_val())'>获得值</a><br>
        无文字：<ui:progressBar id="pb2" defaultValue="80" showText="false"/><br>
        分数模式：<ui:progressBar id="pb3" defaultValue="500" max="2000" textFormat="fraction"/><br>
        回调：
        <ui:progressBar id="pb4" name="pb5">
            <event:callback dataVar="data">
                var rValue = data.running_value; //增长过程中的值
                var value = data.value; //设置的值
                if (rValue == 100) alert("完成");
            </event:callback>
        </ui:progressBar>
        <a href="#" onclick="$('#pb4').stk_progress(100)">增长到100%</a>

        <layout:VSpacing height="20px"/>

        <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%
    out.print(HtmlUtils.htmlEscape("        普通：<ui:progressBar id=\"pb1\" defaultValue=\"65\"/><a href=\"#\" onclick='alert($(\"#pb1\").stk_val())'>获得值</a><br>\n" +
            "        无文字：<ui:progressBar id=\"pb2\" defaultValue=\"80\" showText=\"false\"/><br>\n" +
            "        分数模式：<ui:progressBar id=\"pb3\" defaultValue=\"500\" max=\"2000\" textFormat=\"fraction\"/><br>\n" +
            "        回调：\n" +
            "        <ui:progressBar id=\"pb4\">\n" +
            "            <event:callback dataVar=\"data\">\n" +
            "                var rValue = data.running_value; //增长过程中的值\n" +
            "                var value = data.value; //设置的值\n" +
            "                if (rValue == 100) alert(\"完成\");\n" +
            "            </event:callback>\n" +
            "        </ui:progressBar>\n" +
            "        <a href=\"#\" onclick=\"$('#pb4').stk_progress(100)\">增长到100%</a>"));
%>
    </pre>
        </layout:fieldSet>
    </layout:tab>
    <layout:tab title="参数">
        <font color="red">带*表示功能尚未实现</font>
        <%@ include file="params/param_component.jsp" %>
        <%@ include file="params/param_progressBar.jsp" %>

    </layout:tab>
    <layout:tab title="事件">
        <font color="red">带*表示功能尚未实现</font>
        <%@ include file="event/event_component.jsp" %>
        <%@ include file="event/event_progressBar.jsp" %>

    </layout:tab>
    <layout:tab title="函数">
        <font color="red">带*表示功能尚未实现</font>
        <%@ include file="function/func_component.jsp" %>
        <%@ include file="function/func_progressBar.jsp" %>
    </layout:tab>
</layout:tabs>
</body>
</html>