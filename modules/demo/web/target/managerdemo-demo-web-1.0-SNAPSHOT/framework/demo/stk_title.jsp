<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>stk_title</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>stk_title：设置标题</b></div>
<ol class="demoApiStyle">
    <li>
        <b> $(jquery).stk_title(tabId/index, title)</b><br>
        适用于ui:tabs<br>
        tabId/index - tab的id或者tab的序号<br>
        title - 标题<br>
        比如：$("#tabsid").stk_title('tabid','标题');
    </li>
</ol>
</body>
</html>