<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>复合选择框</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
    <%
        Map map = new HashMap();
        for(int i = 0; i < 10; i++)
        {
            map.put("key"+i,"value"+i);
        }
        pageContext.setAttribute("test",map);
    %>
</head>
<body>
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;复合选择框 - ui:combobox</b></div>
<!-- 主要内容 -->
<layout:tabs>
<layout:tab title="范例">
    复杂用法与<a href="select.jsp">下拉选择框</a>相同，已被自动填充栏取代<br><br>

    <ui:combobox list="#attr.test" id="testId" headerKey="" headerValue=""/>
    <input type="button" value="获得值" onclick="alert($('#testId').stk_val());"/>

    <layout:VSpacing height="20px"/>
    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    <ui:combobox list=\"#attr.test\" id=\"testId\" headerKey=\"\" headerValue=\"\"/>\n" +
"    <input type=\"button\" value=\"获得值\" onclick=\"alert($('#testId').stk_val());\"/>"));%>
    </pre>
    </layout:fieldSet>
</layout:tab>
<layout:tab title="参数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="params/param_component.jsp" %>
    <%@ include file="params/param_field.jsp" %>
    <%@ include file="params/param_combobox.jsp" %>
</layout:tab>
<layout:tab title="事件">
    <font color="red">暂不支持事件</font>
</layout:tab>
<layout:tab title="函数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="function/func_component.jsp" %>
    <%@ include file="function/func_field.jsp" %>
</layout:tab>
</layout:tabs>
</body>
</html>