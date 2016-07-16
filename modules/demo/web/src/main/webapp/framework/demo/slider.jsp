<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>滑动条</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;滑动条 - ui:slider</b></div>
<layout:tabs>
<layout:tab title="范例">

    普通：
    <ui:slider id="s1"/>
    <input type="button" value="设置值" onclick="$('#s1').stk_val(30);">
    <input type="button" value="获得值" onclick="alert($('#s1').stk_val());">
    <input type="button" value="只读" onclick="$('#s1').stk_disabled(true);">
    <input type="button" value="可编辑" onclick="$('#s1').stk_disabled(false);">

    <br><br>间隔10：
    <ui:slider id="s2" step="10"/>

    <br><br>事件:
    <ui:slider id="s3">
        <event:onsliderchange dataVar="data">
            $('#showValue3').stk_val(data.value)
        </event:onsliderchange>
    </ui:slider>
    <input type="text" id="showValue3"/>

    <br><br>范围:
    <ui:slider id="s4" range="true">
        <event:onsliderchange dataVar="data">
            if(data.values)
                $('#showValue4').html(""+data.values)
        </event:onsliderchange>
    </ui:slider>
    <span id="showValue4"></span><input type="button" value="设置值" onclick="$('#s4').stk_val([10,60]);$('#showValue4').html([10,60].join(','))">

     <br><br>垂直：
    <ui:slider id="s5" orientation="vertical"/>

    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    普通：\n" +
        "    <ui:slider id=\"s1\"/>\n" +
        "    <input type=\"button\" value=\"设置值\" onclick=\"$('#s1').stk_val(30);\">\n" +
        "    <input type=\"button\" value=\"获得值\" onclick=\"alert($('#s1').stk_val());\">\n" +
        "    <input type=\"button\" value=\"只读\" onclick=\"$('#s1').stk_disabled(true);\">\n" +
        "    <input type=\"button\" value=\"可编辑\" onclick=\"$('#s1').stk_disabled(false);\">\n" +
        "\n" +
        "    <br><br>间隔10：\n" +
        "    <ui:slider id=\"s2\" step=\"10\"/>\n" +
        "\n" +
        "    <br><br>事件:\n" +
        "    <ui:slider id=\"s3\">\n" +
        "        <event:onsliderchange dataVar=\"data\">\n" +
        "            $('#showValue3').stk_val(data.value)\n" +
        "        </event:onsliderchange>\n" +
        "    </ui:slider>\n" +
        "    <input type=\"text\" id=\"showValue3\"/>\n" +
        "\n" +
        "    <br><br>范围:\n" +
        "    <ui:slider id=\"s4\" range=\"true\">\n" +
        "        <event:onsliderchange dataVar=\"data\">\n" +
        "            if(data.values)\n" +
        "                $('#showValue4').html(\"\"+data.values)\n" +
        "        </event:onsliderchange>\n" +
        "    </ui:slider>\n" +
        "    <span id=\"showValue4\"></span><input type=\"button\" value=\"设置值\" onclick=\"$('#s4').stk_val([10,60]);$('#showValue4').html([10,60].join(','))\">\n" +
        "\n" +
        "     <br><br>垂直：\n" +
        "    <ui:slider id=\"s5\" orientation=\"vertical\"/>"));%>
    </pre>
    </layout:fieldSet>
</layout:tab>
<layout:tab title="参数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="params/param_component.jsp" %>
    <%@ include file="params/param_field.jsp" %>
    <%@ include file="params/param_slider.jsp" %>

</layout:tab>
<layout:tab title="事件">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="event/event_component.jsp" %>
    <%@ include file="event/event_slider.jsp" %>

</layout:tab>
<layout:tab title="函数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="function/func_component.jsp" %>
    <%@ include file="function/func_field.jsp" %>
</layout:tab>
</layout:tabs>
</body>
</html>