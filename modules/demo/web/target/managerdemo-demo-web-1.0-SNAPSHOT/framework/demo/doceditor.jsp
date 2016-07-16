<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>文本编辑器</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;文本编辑器 - ui:doceditor</b></div>
<layout:tabs>
<layout:tab title="范例">
    默认：
    <ui:doceditor id="testId" imageUploadJson="/imageUpload"/>
    <input type="button" value="设置值" onclick="$('#testId').stk_val('aaaa');">
    <input type="button" value="获得值" onclick="alert($('#testId').stk_val());">
    <input type="button" value="只读" onclick="$('#testId').stk_readonly(true);">
    <input type="button" value="可编辑" onclick="$('#testId').stk_readonly(false);">

    <br><br>简单：
    <ui:doceditor id="testId2" imageUploadJson="/imageUpload" items="'fontname', 'fontsize', '|', 'textcolor', 'bgcolor', 'bold', 'italic', 'underline','removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist','insertunorderedlist', '|', 'emoticons', 'image', 'link'"/>

    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    默认：\n" +
"    <ui:doceditor id=\"testId\" imageUploadJson=\"/imageUpload\"/>\n" +
"    <input type=\"button\" value=\"设置值\" onclick=\"$('#testId').stk_val('aaaa');\">\n" +
"    <input type=\"button\" value=\"获得值\" onclick=\"alert($('#testId').stk_val());\">\n" +
"    <input type=\"button\" value=\"只读\" onclick=\"$('#testId').stk_readonly(true);\">\n" +
"    <input type=\"button\" value=\"可编辑\" onclick=\"$('#testId').stk_readonly(false);\">\n" +
"\n" +
"    <br><br>简单：\n" +
"    <ui:doceditor id=\"testId2\" imageUploadJson=\"/imageUpload\" items=\"'fontname', 'fontsize', '|', 'textcolor', 'bgcolor', 'bold', 'italic', 'underline','removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist','insertunorderedlist', '|', 'emoticons', 'image', 'link'\"/>"));%>
    </pre>
    </layout:fieldSet>
</layout:tab>
<layout:tab title="参数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="params/param_component.jsp" %>
    <%@ include file="params/param_field.jsp" %>
    <%@ include file="params/param_doceditor.jsp" %>
</layout:tab>
<layout:tab title="事件">
    <font color="red">该控件暂不支持事件</font>
    <%--<%@ include file="event/event_component.jsp" %>
    <%@ include file="event/event_field.jsp" %>--%>
</layout:tab>
<layout:tab title="函数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="function/func_component.jsp" %>
    <%@ include file="function/func_field.jsp" %>
</layout:tab>
</layout:tabs>
</body>
</html>