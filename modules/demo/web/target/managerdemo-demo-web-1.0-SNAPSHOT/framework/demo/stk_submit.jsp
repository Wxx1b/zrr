<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>stk_submit</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>stk_submit：异步提交表单</b></div>
<ol class="demoApiStyle">
    <li>
        <b> $(jquery).stk_submit()</b><br>
        适用于ui:form<br>
        使用ui:form的clazz作为目标类，method作为方法名<br>
        写个方法就能传到public static String method(Map param, HttpServletRequest request) throws Exception<br>
    </li>
    <li>
        <b> $(jquery).stk_submit(method)</b><br>
        适用于ui:form<br>
        使用ui:form的clazz作为目标类，参数method作为方法名<br>
        写个方法就能传到public static String method(Map param, HttpServletRequest request) throws Exception<br>
    </li>
    <li>
        <b> $(jquery).stk_submit(callback)</b><br>
        适用于ui:form<br>
        使用ui:form的clazz作为目标类，method作为方法名<br>
        callback - 自定义回调函数<br>
        写个方法就能传到public static String method(Map param, HttpServletRequest request) throws Exception<br>
        比如: $("#form").stk_submit(function(result){ result是返回的json对象 })<br>
    </li>
    <li>
        <b> $(jquery).stk_submit(method, callback)</b><br>
        适用于ui:form<br>
        使用ui:form的clazz作为目标类，参数method作为方法名<br>
        callback - 自定义回调函数<br>
        写个方法就能传到public static String method(Map param, HttpServletRequest request) throws Exception<br>
        比如: $("#form").stk_submit("methodName", function(result){ result是返回的json对象 })<br>
    </li>
    <li>
        <b> $(jquery).stk_submit(callback,exceptionHandler)</b><br>
        适用于ui:form<br>
        使用ui:form的clazz作为目标类，method作为方法名<br>
        callback - 自定义回调函数<br>
        exceptionHandler - 是异常函数<br>
        写个方法就能传到public static String method(Map param, HttpServletRequest request) throws Exception<br>
        比如: $("#form").stk_submit(function(result){ result是返回的json对象 },function(message,e){...})<br>
    </li>
    <li>
        <b> $(jquery).stk_submit(method, callback, exceptionHandler)</b><br>
        适用于ui:form<br>
        使用ui:form的clazz作为目标类，参数method作为方法名<br>
        callback - 自定义回调函数<br>
        exceptionHandler - 是异常函数<br>
        写个方法就能传到public static String method(Map param, HttpServletRequest request) throws Exception<br>
        比如: $("#form").stk_submit("methodName", function(result){ result是返回的json对象 },function(message,e){...})<br>
    </li>
</ol>
</body>
</html>