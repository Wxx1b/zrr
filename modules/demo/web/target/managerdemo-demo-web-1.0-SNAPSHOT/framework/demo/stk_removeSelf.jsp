<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>stk_removeSelf</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>stk_removeSelf：去除当前tab</b></div>
<ol class="demoApiStyle">
    <li>
        <b> $(jquery).stk_removeSelf(refreshParent)</b><br>
        适用于document<br>
        refreshParent - 是否刷新父Tab，默认false<br>
        比如：$(document).stk_removeSelf();
    </li>
</ol>
</body>
</html>