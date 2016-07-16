<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>复/单选框</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;复/单选框 - ui:checkbox/ui:radiobox</b></div>
<!-- 主要内容 -->
<layout:tabs>
<layout:tab title="范例">
    <ui:checkbox id="test1" name="test" value="1" label="复选框"/>
    <input type="button" onclick="$('#test1').stk_checked(true);" value="选中">

    <br><br>
    <ui:checkbox id="test2" name="test" value="1" label="带事件">
    <event:onchange checkedVar="b">
        alert(b)
    </event:onchange>
    </ui:checkbox>

    <br><br>
    <ui:radiobox name="test3" value="1" label="单选框"/>

    <br><br>
    样式1：
    <ui:checkbox id="test4" name="test4" swichStyle="1"/>

    <br><br>
    样式2：
    <ui:checkbox id="test5" name="test6" checked="true" swichStyle="2"/>

    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    <ui:checkbox id=\"test1\" name=\"test\" value=\"1\" label=\"复选框\"/>\n" +
        "    <input type=\"button\" onclick=\"$('#test1').stk_checked(true);\" value=\"选中\">\n" +
        "\n" +
        "    <br><br>\n" +
        "    <ui:checkbox id=\"test2\" name=\"test\" value=\"1\" label=\"带事件\">\n" +
        "    <event:onchange checkedVar=\"b\">\n" +
        "        alert(b)\n" +
        "    </event:onchange>\n" +
        "    </ui:checkbox>\n" +
        "\n" +
        "    <br><br>\n" +
        "    <ui:radiobox name=\"test3\" value=\"1\" label=\"单选框\"/>\n" +
        "\n" +
        "    <br><br>\n" +
        "    样式1：\n" +
        "    <ui:checkbox id=\"test4\" name=\"test4\" swichStyle=\"1\"/>\n" +
        "\n" +
        "    <br><br>\n" +
        "    样式2：\n" +
        "    <ui:checkbox id=\"test5\" name=\"test6\" checked=\"true\" swichStyle=\"2\"/>"));%>    </pre>
    </layout:fieldSet>
</layout:tab>
<layout:tab title="参数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="params/param_component.jsp" %>
    <%@ include file="params/param_field.jsp" %>
    <%@ include file="params/param_checkRadio.jsp" %>
</layout:tab>
<layout:tab title="事件">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="event/event_component.jsp" %>
    <%@ include file="event/event_field.jsp" %>
</layout:tab>
<layout:tab title="函数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="function/func_component.jsp" %>
    <%@ include file="function/func_field.jsp" %>
    <%@ include file="function/func_checkRadio.jsp" %>
</layout:tab>
</layout:tabs>
</body>
</html>