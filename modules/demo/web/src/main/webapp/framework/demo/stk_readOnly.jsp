<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>stk_readonly</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>stk_readonly：只读控件</b></div>
<ol class="demoApiStyle">
    <li>
        <b> $(jquery).stk_readonly(boolean)</b><br>
        适用于所有表单类控件<br>
        boolean - true为只读false为解除只读<br>
    </li>
</ol>
</body>
</html>