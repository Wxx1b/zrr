<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>间距</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;间距 - layout:HSpacing / layout:VSpacing</b></div>
<layout:tabs>
<layout:tab title="范例">
    水平间距：
    <input type="text">
    <layout:HSpacing width="100px"/>
    <input type="text">

    <br><br>垂直间距：<br>
    <input type="text">
    <layout:VSpacing height="50px"/>
    <input type="text">
    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    水平间距：\n" +
"    <input type=\"text\">\n" +
"    <layout:HSpacing width=\"100px\"/>\n" +
"    <input type=\"text\">\n" +
"\n" +
"    <br><br>垂直间距：<br>\n" +
"    <input type=\"text\">\n" +
"    <layout:VSpacing height=\"50px\"/>\n" +
"    <input type=\"text\">"));%>
    </pre>
    </layout:fieldSet>
</layout:tab>
<layout:tab title="参数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="params/param_component.jsp" %>
    <%@ include file="params/param_spacing.jsp" %>
</layout:tab>
</layout:tabs>
</body>
</html>