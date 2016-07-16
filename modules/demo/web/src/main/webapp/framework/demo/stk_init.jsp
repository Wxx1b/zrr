<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>stk_init</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>stk_init：初始化数据</b></div>
<ol class="demoApiStyle">
    <li>
        <b> $(jquery).stk_init()</b><br>
        适用于ui:table<br>
        直接调用控件初始化函数(无参查询)<br>
    </li>
    <li>
        <b> $(jquery).stk_init(map,array)</b><br>
        适用于ui:doubleSelect<br>
        map - 组成全部数据的map<br>
        array - 到右边框的数组<br>
        比如$('#demo').stk_init({'020':'北京','021':'上海','022':'广州','023':'深圳'},['023','022']);<br>
    </li>
</ol>
</body>
</html>