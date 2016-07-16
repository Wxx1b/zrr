<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>stk_checkedHtmlData</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>stk_checkedData：获取勾选的Html数据</b></div>
<ol class="demoApiStyle">
    <li>
        <b> $(jquery).stk_checkedHtmlData(name)</b><br>
        适用于ui:table<br>
        获取表格控件单选/多选插件勾选的Html数据<br>
        name - checkbox或radiobox的name<br>
        比如:var datas = $("#tableId").stk_checkedHtmlData(name);<br>
    </li>
    <li>
        <b> $(jquery).stk_checkedHtmlData(name,allowCache)</b><br>
        适用于ui:table<br>
        获取表格控件缓存的单选/多选插件勾选的Html数据<br>
        name - checkbox或radiobox的name<br>
        比如:var datas = $("#tableId").stk_checkedHtmlData(name,true);（前提是插件的allowCache开启）<br>
    </li>
</ol>
</body>
</html>