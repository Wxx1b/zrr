<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>stk_removeTab</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>stk_removeTab：去除外框tab</b></div>
<ol class="demoApiStyle">
    <li>
        <b> $(jquery).stk_removeTab(url,title)</b><br>
        适用于document<br>
        url - 外框tab的url地址<br>
        title - 外框tab的标题<br>
    </li>
    <li>
        <b> $(jquery).stk_removeTab(url,title,config)</b><br>
        适用于document<br>
        url - 外框tab的url地址<br>
        title - 外框tab的标题<br>
        这里的config必须和stk_go()打开时的param参数一致，才能正确关闭
    </li>
</ol>
</body>
</html>