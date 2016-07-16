<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>渲染</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;渲染：stk_render()</b></div>
<layout:tabs>
<layout:tab title="范例">
    说明：只能渲染简单控件，对渲染大量控件有性能问题，不支持event事件(但可以渲染后自己写js附上事件)。<br>
    stk_render(cn,param,callBack)<br>
    cn: 控件名，就是ui:xxxx的xxxx, param参数: 标签控件的参数,参考目标控件文档， callBack: 渲染后的回调函数<br>
    <input type="text" id="demo" name="demo">
    <input type="button" value="渲染" onclick="$('#demo').stk_render('datefield',{defaultValue:'2011-01-01'},function(){alert('ok')});$(this).hide();">

    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("<input type=\"text\" id=\"demo\" name=\"demo\">\n" +
        "    <input type=\"button\" value=\"渲染\" onclick=\"$('#demo').stk_render('datefield',{defaultValue:'2011-01-01'},function(){alert('ok')});\">"));%>
    </pre>
    </layout:fieldSet>
</layout:tab>
<layout:tab title="参数">
    <%@ include file="params/param_render.jsp" %>
</layout:tab>
</layout:tabs>
</body>
</html>