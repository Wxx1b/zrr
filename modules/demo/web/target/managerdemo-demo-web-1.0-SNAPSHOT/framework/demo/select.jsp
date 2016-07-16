<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>下拉选择框</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>

</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;下拉选择框 - ui:select</b></div>
<layout:tabs>
<layout:tab title="范例">
    <%
        Map map = new HashMap();
        for(int i = 0; i < 10; i++)
        {
            map.put("key"+i,"value"+i);
        }
        pageContext.setAttribute("test",map);
    %>

静态：
<ui:select list="#{'020':'北京','021':'上海'}" headerKey="" headerValue="--请选择--" defaultValue="key5"/>

<br>动态Map + 事件：
<ui:select list="#attr.test" headerKey="" headerValue="--请选择--">
    <event:onchange valVar="value">
        alert(value);
    </event:onchange>
</ui:select>

<br>动态标签取值(推荐)：
<param:enumList clazz="com.sinitek.spirit.webcontrol.demo.DemoEnum" var="enumList"/>
<ui:select list="#attr.enumList" headerKey="" headerValue="--请选择--" listKey="enumItemName" listValue="enumItemInfo"/>

<br>默认值：
<ui:select list="#attr.test" headerKey="" headerValue="--请选择--" defaultValue="key5"/>

<br>多项：
<ui:select list="#attr.test" multiple="true" size="10" width="120px" id="multiId"/>
<input type="button" value="添加" onclick="$('#multiId').stk_addOptions({aaa:'1111'});">
<input type="button" value="删除" onclick="$('#multiId').stk_removeOptions(['aaa']);">
<input type="button" value="删除选择" onclick="alert($('#multiId').stk_removeSelected());">

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
"\n" +
"静态：\n" +
"<ui:select list=\"#{'020':'北京','021':'上海'}\" headerKey=\"\" headerValue=\"--请选择--\" defaultValue=\"key5\"/>\n" +
"\n" +
"<br>动态Map + 事件：\n" +
"<ui:select list=\"#attr.test\" headerKey=\"\" headerValue=\"--请选择--\">\n" +
"    <event:onchange valVar=\"value\">\n" +
"        alert(value);\n" +
"    </event:onchange>\n" +
"</ui:select>\n" +
"\n" +
"<br>动态标签取值(推荐)：\n" +
"<param:enumList clazz=\"com.sinitek.spirit.webcontrol.demo.DemoEnum\" var=\"enumList\"/>\n" +
"<ui:select list=\"#attr.enumList\" headerKey=\"\" headerValue=\"--请选择--\" listKey=\"enumItemName\" listValue=\"enumItemInfo\"/>\n" +
"\n" +
"<br>默认值：\n" +
"<ui:select list=\"#attr.test\" headerKey=\"\" headerValue=\"--请选择--\" defaultValue=\"key5\"/>\n" +
"\n" +
"\n" +
"<br>多项：\n" +
"<ui:select list=\"#attr.test\" multiple=\"true\" size=\"10\" width=\"120px\" id=\"multiId\"/>\n" +
"<input type=\"button\" value=\"添加\" onclick=\"$('#multiId').stk_addOptions({aaa:'1111'});\">\n" +
"<input type=\"button\" value=\"删除\" onclick=\"$('#multiId').stk_removeOptions(['aaa']);\">\n" +
"<input type=\"button\" value=\"删除选择\" onclick=\"alert($('#multiId').stk_removeSelected());\">"));%>
    </pre>
    </layout:fieldSet>
</layout:tab>
<layout:tab title="参数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="params/param_component.jsp" %>
    <%@ include file="params/param_field.jsp" %>
    <%@ include file="params/param_select.jsp" %>
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