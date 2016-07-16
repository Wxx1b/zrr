<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>颜色选择器</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;颜色选择器 - ui:colorSelect</b></div>
<layout:tabs>
<layout:tab title="范例">
    <%--<input id="element_id" type="text" class="input_color" readonly="true"  value="#ff0000">--%>
    默认：<ui:colorSelect id="cs" defaultValue="#ff0000">
        <event:oncolorselect dataVar="color">
            alert(color)
        </event:oncolorselect>
    </ui:colorSelect>
    <input type="button" onclick="alert($('#cs').stk_val())" value="获得值">
    <input type="button" onclick="$('#cs').stk_val('#0000ff')" value="设置值"><br>

    简单：<ui:colorSelect id="cs2"  simple="true"/>
    <br><br><br><br><br><br><br><br>

    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    默认：<ui:colorSelect id=\"cs\" defaultValue=\"#ff0000\">\n" +
                                  "        <event:oncolorselect dataVar=\"color\">\n" +
                                  "            alert(color)\n" +
                                  "        </event:oncolorselect>\n" +
                                  "    </ui:colorSelect>\n" +
                                  "    <input type=\"button\" onclick=\"alert($('#cs').stk_val())\" value=\"获得值\">\n" +
                                  "    <input type=\"button\" onclick=\"$('#cs').stk_val('#0000ff')\" value=\"设置值\">\n" +
                                  "    \n" +
                                  "    简单：<ui:colorSelect id=\"cs\"  simple=\"true\"/>"));%>
    </pre>
    </layout:fieldSet>
</layout:tab>
<layout:tab title="参数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="params/param_component.jsp" %>
    <%@ include file="params/param_field.jsp" %>
    <%@ include file="params/param_colorSelect.jsp" %>
</layout:tab>
<layout:tab title="事件">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="event/event_component.jsp" %>
    <%@ include file="event/event_field.jsp" %>
    <%@ include file="event/event_colorSelect.jsp" %>
</layout:tab>
<layout:tab title="函数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="function/func_component.jsp" %>
    <%@ include file="function/func_field.jsp" %>
</layout:tab>
</layout:tabs>
</body>
</html>