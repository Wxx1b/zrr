<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>stk_show</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>stk_show：显示控件</b></div>
<ol class="demoApiStyle">
    <li>
        <b> $(jquery).stk_show()</b><br>
        适用于全部控件<br>
    </li>
    <li>
        <b> $(jquery).stk_show(id/obj)</b><br>
        适用于字母选择器和分类选择器，用于显示在目标控件的位置<br>
        参数如果是字符串就认为是目标id，否则就是对象<br>
    </li>
    <li>
        <b> $(jquery).stk_show(id/index)</b><br>
        适用于ui:tabs，用于显示每个tab<br>
        参数如果是字符串就认为是ui:tab的id，数字就是第index个<br>
    </li>
</ol>
</body>
</html>