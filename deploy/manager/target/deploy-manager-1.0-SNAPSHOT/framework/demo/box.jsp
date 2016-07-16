<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>布局盒</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;布局盒 - layout:box</b></div>
<!-- 主要内容 -->
<layout:tabs>
<layout:tab title="范例">
    <br>列布局：
<layout:box layout="column">
    <ui:textfield/>
    <ui:textfield/>
    <ui:textfield/>
    <ui:textfield/>
</layout:box>

<br><br><hr>
行布局：
<layout:box layout="row">
    <ui:textfield/>
    <ui:textfield/>
    <ui:textfield/>
    <ui:textfield/>
</layout:box>

<br><br><hr>
行列混合布局：
<layout:box layout="column">
    <ui:textfield/>

    <layout:box layout="row">
        <ui:textfield/>
        <ui:textfield/>
        <ui:textfield/>
        <ui:textfield/>
    </layout:box>

    <ui:textfield/>
</layout:box>

<br><br><hr style="clear:both;">
列表单布局：
<layout:box layout="column" width="900px" cellHeight="30px" cellWidth="300px">
    <layout:boxcell label="字段1：" underLine="true"><ui:textfield/></layout:boxcell>
    <layout:boxcell label="字段2：" underLine="true"><ui:textfield/></layout:boxcell>
    <layout:boxcell label="字段3：" underLine="true"><ui:textfield/></layout:boxcell>
    <layout:boxcell label="字段4：" width="600px"><ui:textfield width="430px"/></layout:boxcell>
    <layout:boxcell label="字段5："><ui:textfield/></layout:boxcell>
    <layout:boxcell label="字段6：" width="600px"><ui:textarea width="430px" rows="3"/></layout:boxcell>
    <layout:boxcell label="字段7："><ui:textfield/></layout:boxcell>
    <layout:boxcell label="字段8："><ui:textfield/></layout:boxcell>
    <layout:boxcell label="字段9："><ui:textfield/></layout:boxcell>
</layout:box>

    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("<br>列布局：\n" +
"<layout:box layout=\"column\">\n" +
"    <ui:textfield/>\n" +
"    <ui:textfield/>\n" +
"    <ui:textfield/>\n" +
"    <ui:textfield/>\n" +
"</layout:box>\n" +
"\n" +
"<br><br><hr>\n" +
"行布局：\n" +
"<layout:box layout=\"row\">\n" +
"    <ui:textfield/>\n" +
"    <ui:textfield/>\n" +
"    <ui:textfield/>\n" +
"    <ui:textfield/>\n" +
"</layout:box>\n" +
"\n" +
"<br><br><hr>\n" +
"行列混合布局：\n" +
"<layout:box layout=\"column\">\n" +
"    <ui:textfield/>\n" +
"\n" +
"    <layout:box layout=\"row\">\n" +
"        <ui:textfield/>\n" +
"        <ui:textfield/>\n" +
"        <ui:textfield/>\n" +
"        <ui:textfield/>\n" +
"    </layout:box>\n" +
"    \n" +
"    <ui:textfield/>\n" +
"</layout:box>\n" +
"\n" +
"<br><br><hr style=\"clear:both;\">\n" +
"列表单布局：\n" +
"<layout:box layout=\"column\" width=\"900px\" cellHeight=\"30px\" cellWidth=\"300px\">\n" +
"    <layout:boxcell label=\"字段1：\" underLine=\"true\"><ui:textfield/></layout:boxcell>\n" +
"    <layout:boxcell label=\"字段2：\" underLine=\"true\"><ui:textfield/></layout:boxcell>\n" +
"    <layout:boxcell label=\"字段3：\" underLine=\"true\"><ui:textfield/></layout:boxcell>\n" +
"    <layout:boxcell label=\"字段4：\" width=\"600px\"><ui:textfield width=\"430px\"/></layout:boxcell>\n" +
"    <layout:boxcell label=\"字段5：\"><ui:textfield/></layout:boxcell>\n" +
"    <layout:boxcell label=\"字段6：\" width=\"600px\"><ui:textarea width=\"430px\" rows=\"3\"/></layout:boxcell>\n" +
"    <layout:boxcell label=\"字段7：\"><ui:textfield/></layout:boxcell>\n" +
"    <layout:boxcell label=\"字段8：\"><ui:textfield/></layout:boxcell>\n" +
"    <layout:boxcell label=\"字段9：\"><ui:textfield/></layout:boxcell>\n" +
"</layout:box>"));%>
    </pre>
    </layout:fieldSet>
</layout:tab>
<layout:tab title="参数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="params/param_component.jsp" %>
    <%@ include file="params/param_box.jsp" %>
</layout:tab>
<layout:tab title="事件">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="event/event_component.jsp" %>
</layout:tab>
<layout:tab title="函数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="function/func_component.jsp" %>
</layout:tab>
</layout:tabs>
</body>
</html>