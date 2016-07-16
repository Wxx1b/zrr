<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>stk_val</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>stk_val：设置/获取值</b></div>
<ol class="demoApiStyle">
    <li>
        <b> $(jquery).stk_val()</b><br>
        获得控件当前值，适用于所有表单类控件<br>
        有些控件返回string，有些返回返回array<br>
    </li>
    <li>
        <b> $(jquery).stk_val(array)</b><br>
        设置控件当前值，适用于ui:checkboxgroup,ui:multiselect,ui:classifiedselect(多选模式),ui:letterselect(多选模式),ui:removableselect<br>
        比如:$(jquery).stk_val(['1','2']);
    </li>
    <li>
        <b> $(jquery).stk_val(string)</b><br>
        设置控件当前值，适用于除上面的其它控件<br>
    </li>
</ol>
</body>
</html>