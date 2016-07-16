<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>stk_refreshHomeModule</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>stk_refreshHomeModule：刷新个人中心某个模块</b></div>
<ol class="demoApiStyle">
    <li>
        <b> $(jquery).stk_refreshHomeModule(moudleId)</b><br>
        刷新个人中心某个模块<br>
        moudleId - 模块的objid<br>
        比如：$(document).stk_refreshHomeModule(1)
    </li>
</ol>
</body>
</html>