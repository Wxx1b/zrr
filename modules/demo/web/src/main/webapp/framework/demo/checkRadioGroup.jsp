<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>复/单选框组</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;复/单选框组 - ui:checkboxgroup/ui:radioboxgroup</b></div>
<!-- 主要内容 -->
<layout:tabs>
<layout:tab title="范例">
    <%
        Map map = new HashMap();
        for (int i = 0; i < 10; i++) {
            map.put("key" + i, "value" + i);
        }
        pageContext.setAttribute("test", map);

        String[] values = new String[]{"key3", "key5"};
        pageContext.setAttribute("values", values);
    %>
    <ui:checkboxgroup list="#attr.test" id="testId1" name="aaa" defaultValue="${values}" columnWidth="300px" width="600px">
        <event:ongroupchange valVar="a">
            alert(a);
        </event:ongroupchange>
    </ui:checkboxgroup>
    <input type="button" value="设置值" onclick="$('#testId1').stk_val(['key1','key2']);">
    <input type="button" value="获得值" onclick="alert($('#testId1').stk_val());">

    <br><br>

    <ui:radioboxgroup list="#attr.test" id="testId2" name="bbb" defaultValue="key3" columnWidth="300px" width="600px">
        <event:ongroupchange valVar="value" textVar="text">
            alert(value+":"+text);
        </event:ongroupchange>
    </ui:radioboxgroup>
    <input type="button" value="获得值" onclick="alert($('#testId2').stk_val());">
    <input type="button" value="设置值" onclick="$('#testId2').stk_val('key1');">

    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    < %\n" +
"        Map map = new HashMap();\n" +
"        for (int i = 0; i < 10; i++) {\n" +
"            map.put(\"key\" + i, \"value\" + i);\n" +
"        }\n" +
"        pageContext.setAttribute(\"test\", map);\n" +
"\n" +
"        String[] values = new String[]{\"key3\", \"key5\"};\n" +
"        pageContext.setAttribute(\"values\", values);\n" +
"    % >\n" +
"    <ui:checkboxgroup list=\"#attr.test\" id=\"testId1\" name=\"aaa\" defaultValue=\"${values}\" columnWidth=\"300px\" width=\"600px\">\n" +
"        <event:ongroupchange valVar=\"a\">\n" +
"            alert(a);\n" +
"        </event:ongroupchange>\n" +
"    </ui:checkboxgroup>\n" +
"    <input type=\"button\" value=\"设置值\" onclick=\"$('#testId1').stk_val(['key1','key2']);\">\n" +
"    <input type=\"button\" value=\"获得值\" onclick=\"alert($('#testId1').stk_val());\">\n" +
"\n" +
"    <br><br>\n" +
"\n" +
"    <ui:radioboxgroup list=\"#attr.test\" id=\"testId2\" name=\"bbb\" defaultValue=\"key3\" columnWidth=\"300px\" width=\"600px\">\n" +
"        <event:ongroupchange valVar=\"value\" textVar=\"text\">\n" +
"            alert(value+\":\"+text);\n" +
"        </event:ongroupchange>\n" +
"    </ui:radioboxgroup>\n" +
"    <input type=\"button\" value=\"获得值\" onclick=\"alert($('#testId2').stk_val());\">\n" +
"    <input type=\"button\" value=\"设置值\" onclick=\"$('#testId2').stk_val('key1');\">"));%>    </pre>
    </layout:fieldSet>
</layout:tab>
<layout:tab title="参数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="params/param_component.jsp" %>
    <%@ include file="params/param_field.jsp" %>
    <%@ include file="params/param_checkRadioGroup.jsp" %>
</layout:tab>
<layout:tab title="事件">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="event/event_component.jsp" %>
    <%@ include file="event/event_field.jsp" %>
    <%@ include file="event/event_checkRadioGroup.jsp" %>
</layout:tab>
<layout:tab title="函数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="function/func_component.jsp" %>
    <%@ include file="function/func_field.jsp" %>
    <%@ include file="function/func_checkRadioGroup.jsp" %>
</layout:tab>
</layout:tabs>
</body>
</html>