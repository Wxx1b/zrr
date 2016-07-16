<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>stk_hasSelect</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>stk_hasSelect：是否选中</b></div>
<ol class="demoApiStyle">
    <li>
        <b> $(jquery).stk_hasSelect()</b><br>
        适用于表格控件的单选/多选插件<br>
        比如：if($("#checkBoxPlugin").stk_hasSelect()) ......
    </li>
    <li>
        <b> $(jquery).stk_hasSelect("tableId")</b><br>
        适用于表格控件的多选插件,而且开启allowCache='true'<br>
        比如：if($("#checkBoxPlugin").stk_hasSelect("tableId")) ......
    </li>
</ol>
</body>
</html>