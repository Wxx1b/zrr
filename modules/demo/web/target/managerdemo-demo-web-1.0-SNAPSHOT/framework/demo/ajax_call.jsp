<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>stk_check</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>stk.call：ajax直接调用</b></div>
<ol class="demoApiStyle">
    <li>
        <b>stk.call(config)</b><br>
        className - 类路径<br>
        method - 方法名<br>
        param - 参数map<br>
        exceptionHandler - 异常处理<br>
        async - 是否异步调用，默认true，设置false为同步<br>
        比如：<br>
        <pre>
        stk.call({
           className:"com.sinitek.managerdemo.demo.action.DemoDwr",
           method:'test',
           param:{para1:0},
           callBack:function(result){
               stk.alert(result)
           },
           exceptionHandler:function(message,e)
           {
               stk.error(message)
           }
        })
        </pre>
    </li>
</ol>
</body>
</html>