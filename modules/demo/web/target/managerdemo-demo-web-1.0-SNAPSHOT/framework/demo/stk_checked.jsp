<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>stk_checked</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>stk_checked：勾选单/复选框</b></div>
<ol class="demoApiStyle">
    <li>
        <b> $(jquery).stk_checked(boolean)</b><br>
        适用于ui:checkbox, ui:radiobox<br>
        boolean为true选中，为false不选<br>
    </li>
</ol>
</body>
</html>