<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>stk_call</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>stk_call：调用</b></div>
<ol class="demoApiStyle">
    <li>
        <b> $(jquery).stk_call(callback)</b><br>
        适用于表格控件的单选/多选插件<br>
        把插件选中的行数据提交到action处理，目标action实现了ICheckBoxPluginAware或IRadioBoxPluginAware接口<br>
        比如：$("#checkBoxPlugin").stk_call(function(result){ result是返回对象 });<br>
    </li>
    <li>
        <b> $(jquery).stk_call(param, callback)</b><br>
        带参数的调用，适用于表格控件的单选/多选插件<br>
        把插件选中的行数据提交到action处理，目标action实现了ICheckBoxPluginAware或IRadioBoxPluginAware接口<br>
        比如：$("#checkBoxPlugin").stk_call({param1:'xxxx'},function(result){ result是返回对象 });<br>
    </li>
</ol>
</body>
</html>