<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>多选框</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;多选框 - ui:multiselect</b></div>
<!-- 主要内容 -->
<layout:tabs>
<layout:tab title="范例">
    复杂用法与<a href="select.jsp">下拉选择框</a>相同<br><br>

    <%
        Map map = new HashMap();
        for(int i = 0; i < 10; i++)
        {
            map.put("key"+i,"value"+i);
        }
        pageContext.setAttribute("test",map);
    %>
    <ui:multiselect list="#attr.test" id="testId" name="testName" textWidth="150px"  width="300px" columnWidth="150px"/>
    <input type="button" value="获得值" onclick="alert($('#testId').stk_val());"/>
    <input type="button" value="设置值" onclick="$('#testId').stk_val(['key1','key2']);"/>
    <input type="button" value="添加" onclick="$('#testId').stk_addOptions({aaa:'1111'});">
    <input type="button" value="删除" onclick="$('#testId').stk_removeOptions(['aaa']);">
    <input type="button" value="全部删除" onclick="$('#testId').stk_removeOptions();">


    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    < %\n" +
"        Map map = new HashMap();\n" +
"        for(int i = 0; i < 10; i++)\n" +
"        {\n" +
"            map.put(\"key\"+i,\"value\"+i);\n" +
"        }\n" +
"        pageContext.setAttribute(\"test\",map);\n" +
"    % >\n" +
"    <ui:multiselect list=\"#attr.test\" id=\"testId\" name=\"testName\" textWidth=\"150px\"  width=\"300px\" columnWidth=\"150px\"/>\n" +
"\n" +
"    <input type=\"button\" value=\"获得值\" onclick=\"alert($('#testId').stk_val());\"/>\n" +
"    <input type=\"button\" value=\"设置值\" onclick=\"$('#testId').stk_val(['key1','key2']);\"/>\n" +
"    <input type=\"button\" value=\"添加\" onclick=\"$('#testId').stk_addOptions({aaa:'1111'});\">\n" +
"    <input type=\"button\" value=\"删除\" onclick=\"$('#testId').stk_removeOptions(['aaa']);\">\n" +
"    <input type=\"button\" value=\"全部删除\" onclick=\"$('#testId').stk_removeOptions();\">"));%>
    </pre>
    </layout:fieldSet>
</layout:tab>
<layout:tab title="参数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="params/param_component.jsp" %>
    <%@ include file="params/param_field.jsp" %>
    <%@ include file="params/param_multiselect.jsp" %>
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
    <%@ include file="function/func_checkRadioGroup.jsp" %>
</layout:tab>
</layout:tabs>
</body>
</html>