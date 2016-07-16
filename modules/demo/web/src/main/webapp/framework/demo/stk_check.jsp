<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>stk_check</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>stk_check：单独控件检查</b></div>
<ol class="demoApiStyle">
    <li>
        <b> $(jquery).stk_check(target)</b><br>
        适用于ui:form<br>
        配合func:checkers标签使用，jquery是form对象，target表示目标控件的id或name<br>
    </li>
</ol>
</body>
</html>