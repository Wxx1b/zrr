<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>stk_addOptions</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>stk_addOptions：添加选项</b></div>
<ol class="demoApiStyle">
    <li>
        <b> $(jquery).stk_addOptions(key,value)</b><br>
        适用于ui:select,ui:removableselect,ui:multiselect<br>
        key - 选项key<br>
        value - 选项文字<br>
    </li>
    <li>
        <b> $(jquery).stk_addOptions(map)</b><br>
        适用于ui:select,ui:removableselect,ui:multiselect<br>
        map - 选项key和value的json map对象<br>
    </li>
</ol>
</body>
</html>