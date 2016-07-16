<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>stk_checkForm</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>stk_checkForm：表单控件检查</b></div>
<ol class="demoApiStyle">
    <li>
        <b> $(jquery).stk_checkForm()</b><br>
        表单控件检查，适用于ui:form<br>
        配合func:checkers标签使用，jquery是form对象<br>
    </li>
    <li>
        <b> $(jquery).stk_checkForm(ignor)</b><br>
        表单控件过滤检查，适用于ui:form<br>
        配合func:checkers标签使用，jquery是form对象，其中ignor是不需要检查的target数组<br>
        比如：$('#form').stk_check(['id1','id2'])
    </li>
</ol>
</body>
</html>