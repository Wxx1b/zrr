<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>stk_selectHtmlData</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>stk_selectHtmlData：获取选中的Html数据</b></div>
<ol class="demoApiStyle">
    <li>
        <b> $(jquery).stk_selectHtmlData()</b><br>
        适用于ui:table<br>
        获取表格行被点击高亮的Html数据<br>
        比如:var data = $("#tableId").stk_selectHtmlData();<br>
    </li>
</ol>
</body>
</html>