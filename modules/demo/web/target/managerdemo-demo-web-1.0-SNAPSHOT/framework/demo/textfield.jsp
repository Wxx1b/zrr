<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>文本输入栏</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;文本输入栏 - ui:textfield</b></div>
<layout:tabs>
<layout:tab title="范例">
    普通：
    <ui:textfield id="t1"/><br><br>

    默认提示：
    <ui:textfield id="t2" emptyText="你好啊"/><br><br>

    带事件：
    <ui:textfield defaultValue="t3" id="testId">
        <event:onclick valVar="testVal">
            stk.alert(testVal);
        </event:onclick>
    </ui:textfield><br><br>

    带图标事件：
    <ui:textfield id="t4" icon="ui-icon-gear">
        <event:oniconclick valVar="value">
            alert(value)
        </event:oniconclick>
    </ui:textfield><br><br>

    AreaEdit：
    <ui:textfield id="t5" areaEdit="true" areaRows="10" areaWidth="400px"/><br><br>

    密码强度(强度div的id规则是id_ps)：<br>
    <ui:textfield type="password" id="t6" passwordStrength="true"/>
    <a href="#" onclick="alert($('#t6').stk_strength())">获得强度</a>&nbsp;
    <a href="#" onclick="$('#t6').val('123qwe').stk_checkStrength()">js赋值触发验证</a><br>
    <div id="t6_ps"></div>

    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    普通：\n" +
        "    <ui:textfield id=\"t1\"/><br>\n" +
        "\n" +
        "    默认提示：\n" +
        "    <ui:textfield id=\"t2\" emptyText=\"你好啊\"/><br>\n" +
        "\n" +
        "    带事件：\n" +
        "    <ui:textfield defaultValue=\"t3\" id=\"testId\">\n" +
        "        <event:onclick valVar=\"testVal\">\n" +
        "            stk.alert(testVal);\n" +
        "        </event:onclick>\n" +
        "    </ui:textfield><br>\n" +
        "\n" +
        "    带图标事件：\n" +
        "    <ui:textfield id=\"t4\" icon=\"ui-icon-gear\">\n" +
        "        <event:oniconclick valVar=\"value\">\n" +
        "            alert(value)\n" +
        "        </event:oniconclick>\n" +
        "    </ui:textfield><br>\n" +
        "\n" +
        "    AreaEdit：\n" +
        "    <ui:textfield id=\"t5\" areaEdit=\"true\" areaRows=\"10\" areaWidth=\"400px\"/><br>\n" +
        "\n" +
        "    密码强度：\n" +
        "    <ui:textfield type=\"password\" id=\"t6\" passwordStrength=\"true\"/>\n" +
        "    <a href=\"#\" onclick=\"alert($('#t6').stk_strength())\">获得强度</a>&nbsp;\n" +
        "    <a href=\"#\" onclick=\"$('#t6').val('123qwe').stk_checkStrength()\">js赋值触发验证</a><br>\n" +
        "    <div id=\"t6_ps\"></div>"));%>
    </pre>
    </layout:fieldSet>
</layout:tab>
<layout:tab title="参数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="params/param_component.jsp" %>
    <%@ include file="params/param_field.jsp" %>
    <%@ include file="params/param_textfield.jsp" %>
</layout:tab>
<layout:tab title="事件">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="event/event_component.jsp" %>
    <%@ include file="event/event_field.jsp" %>
    <%@ include file="event/event_textfield.jsp" %>
</layout:tab>
<layout:tab title="函数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="function/func_component.jsp" %>
    <%@ include file="function/func_field.jsp" %>
</layout:tab>
</layout:tabs>
</body>
</html>