<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>stk_renderRow</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>stk_renderRow：调整表格行样式</b></div>
<ol class="demoApiStyle">
    <li>
        <b> $(jquery).stk_renderRow(config)</b><br>
        适用于ui:table和ui:tablefix<br>
        比如：$('#testTable').stk_renderRow({1:{background:'red'},3:{background:'blue'}});
        把第2和第4行背景颜色修改，和event:aftertablequery配合
    </li>
</ol>
</body>
</html>