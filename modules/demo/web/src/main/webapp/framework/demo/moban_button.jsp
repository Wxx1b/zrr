<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>模板 - 按钮</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
纯文字：<button type="button" class="stk-button stk-button-st-3"><span>新增</span></button> <br>
纯图标：<button type="button" class="stk-button stk-button-st-3"><span class="stk-button-icon ui-icon-circle-plus"></span></button> <br>
文字+图标：<button type="button" class="stk-button stk-button-st-3"><span class="stk-button-icon ui-icon-circle-plus"></span><span>新增</span></button><br>
菜单按钮：<div class="stk-button stk-ext-button"   onclick='alert(1)'>
<span class="stk-button-icon ui-icon-gear"></span><span>按钮</span><b onClick="$.stopBubble(event);" class="stk-button-icon stk-button-icon-bi1 ui-icon-triangle-b"></b>
</div>
</body>
</html>