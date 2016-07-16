<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>stk_text</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>stk_text：设置/获取文本</b></div>
<ol class="demoApiStyle">
    <li>
        <b> $(jquery).stk_text()</b><br>
        获得控件当前文本，适用于ui:autocomplete,ui:a,ui:label,ui:checkboxgroup,ui:multiselect,ui:radioboxgroup,ui:select,ui:checkbox,ui:radiobox,ui:autocomplete</b>
        有些控件返回string，有些返回返回array<br>
    </li>
    <li>
        <b> $(jquery).stk_text(string)</b><br>
        设置控件当前文本，适用于ui:autocomplete,ui:a,ui:label,ui:button,ui:buttonMenu,ui:toolbarbutton,uiLtoolbarButtonMenu<br>
    </li>
</ol>
</body>
</html>