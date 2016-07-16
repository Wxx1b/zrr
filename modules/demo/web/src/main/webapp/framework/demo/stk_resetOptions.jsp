<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>stk_resetOptions</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>stk_resetOptions：重置选项</b></div>
<ol class="demoApiStyle">
    <li>
        <b> $(jquery).stk_resetOptions(data,defalutValue)</b><br>
        适用于ui:select<br>
        data - 选项map<br>
        defalutValue - 默认选中值,可选<br>
        比如: $('#id').stk_resetOptions({1:'上海',2:'北京'},2);<br>
    </li>
</ol>
</body>
</html>