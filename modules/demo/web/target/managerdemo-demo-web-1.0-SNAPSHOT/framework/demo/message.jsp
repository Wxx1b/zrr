<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>信息提示框</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>

</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;信息提示框:stk.message</b></div>
<layout:tabs>
<layout:tab title="范例">
    <a href="#" onclick="stk.message('内容内容内容内容内容内容'); ">范例：普通</a><br><br>
    <a href="#" onclick="stk.message('内容内容内容内容内容内容',{title:'我的标题'}); ">范例：自定义标题</a><br><br>
    <a href="#" onclick="stk.message('内容内容内容内容内容内容',{timeout:500}); ">范例：带超时，默认2000</a><br><br>
    <a href="#" onclick="stk.message('内容内容内容内容内容内容',{onClose:function(){alert('提示已关闭')}}); ">范例：带回调</a><br><br>
    <a href="#" onclick="stk.message('内容内容内容内容内容内容',{icon:'add.gif'}); ">范例：自定义图标</a><font color="red"> 放在framework/css/common/images/icon/里的图标，尺寸48X48最佳</font>
    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    <a href=\"#\" onclick=\"stk.message('内容内容内容内容内容内容'); \">范例：普通</a><br><br>\n" +
        "    <a href=\"#\" onclick=\"stk.message('内容内容内容内容内容内容',{title:'我的标题'}); \">范例：自定义标题</a><br><br>\n" +
        "    <a href=\"#\" onclick=\"stk.message('内容内容内容内容内容内容',{timeout:500}); \">范例：带超时，默认2000</a><br><br>\n" +
        "    <a href=\"#\" onclick=\"stk.message('内容内容内容内容内容内容',{onClose:function(){alert('提示已关闭')}}); \">范例：带回调</a><br><br>\n" +
        "    <a href=\"#\" onclick=\"stk.message('内容内容内容内容内容内容',{icon:'add.gif'}); \">范例：自定义图标</a><font color=\"red\"> 放在framework/css/common/images/icon/里的图标，尺寸48X48最佳</font>"));%>
    </pre>
    </layout:fieldSet>
</layout:tab>
</layout:tabs>
</body>
</html>