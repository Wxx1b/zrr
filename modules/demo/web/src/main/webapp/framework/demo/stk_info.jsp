<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>stk_info</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>stk_info：获取控件信息</b></div>
<ol class="demoApiStyle">
    <li>
        <b> $(jquery).stk_info()</b><br>
        适用于ui:table<br>
        返回控件所有参数，请用stk.debug查看<br>
    </li>
</ol>
</body>
</html>