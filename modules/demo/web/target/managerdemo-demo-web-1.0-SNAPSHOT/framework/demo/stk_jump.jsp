<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>stk_jump</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>stk_jump：翻页跳转</b></div>
<ol class="demoApiStyle">
    <li>
        <b> $(jquery).stk_jump(targetPage)</b><br>
        适用于ui:table<br>
        直接调用控件翻页跳转函数<br>
        targetPage - 跳转目标页数<br>
    </li>
</ol>
</body>
</html>