<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>stk_hide</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>stk_hide：隐藏控件</b></div>
<ol class="demoApiStyle">
    <li>
        <b> $(jquery).stk_hide()</b><br>
        适用于全部控件<br>
    </li>
    <li>
        <b> $(jquery).stk_hide(id/index)</b><br>
        适用于ui:tabs，用于隐藏每个tab<br>
        参数如果是字符串就认为是ui:tab的id，数字就是第index个<br>
    </li>
</ol>
</body>
</html>