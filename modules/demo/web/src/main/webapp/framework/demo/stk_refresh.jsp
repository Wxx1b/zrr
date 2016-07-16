<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>stk_refresh</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>stk_refresh：刷新控件</b></div>
<ol class="demoApiStyle">
    <li>
        <b> $(jquery).stk_refresh()</b><br>
        适用于ui:classifiedselect,ui:letterselect,ui:tree,ui:chart<br>
    </li>
    <li>
        <b> $(jquery).stk_refresh(callBack)</b><br>
        适用于ui:classifiedselect,ui:letterselect,ui:chart<br>
        callBack - 回调函数<br>
    </li>
    <li>
        <b> $(jquery).stk_refresh(nodeId)</b><br>
        刷新指定ID节点，适用于ui:tree<br>
        nodeId - 节点ID<br>
    </li>
    <li>
        <b> $(jquery).stk_refresh(nodeId, boolean)</b><br>
        刷新指定ID节点，适用于ui:tree<br>
        nodeId - 节点ID<br>
        boolean - 是否先刷新父节点<br>
    </li>
</ol>
</body>
</html>