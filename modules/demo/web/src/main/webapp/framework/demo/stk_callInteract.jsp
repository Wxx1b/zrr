<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>stk_callInteract</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>stk_callInteract：调用控件互动函数</b></div>
<ol class="demoApiStyle">
    <li>
        <b> $(jquery).stk_callInteract(callBack)</b><br>
        适用于ui:select,ui:combobox,ui:multiselect<br>
        callBack - 回调函数<br>
    </li>
</ol>
</body>
</html>