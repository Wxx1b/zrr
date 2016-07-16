<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>标签面板</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;标签面板 - layout:tabs</b></div>
<layout:tabs>
<layout:tab title="范例">
<layout:tabs id="demo" width="500px">
    <layout:tab title="111" id="tab1">
        1111
    </layout:tab>
    <layout:tab title="222" id="tab2">
        2222
    </layout:tab>
    <layout:tab title="333" id="tab3">
        3333
    </layout:tab>
</layout:tabs>
    <input type="button" onclick="$('#demo').stk_select('tab2')" value="跳到222">
    <input type="button" onclick="$('#demo').stk_show('tab2')" value="显示222">
    <input type="button" onclick="$('#demo').stk_hide('tab2')" value="隐藏222">


    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("<layout:tabs id=\"demo\" width=\"500px\">\n" +
                                  "    <layout:tab title=\"111\" id=\"tab1\">\n" +
                                  "        1111\n" +
                                  "    </layout:tab>\n" +
                                  "    <layout:tab title=\"222\" id=\"tab2\">\n" +
                                  "        2222\n" +
                                  "    </layout:tab>\n" +
                                  "    <layout:tab title=\"333\" id=\"tab3\">\n" +
                                  "        3333\n" +
                                  "    </layout:tab>\n" +
                                  "</layout:tabs>\n" +
                                  "    <input type=\"button\" onclick=\"$('#demo').stk_select('tab2')\" value=\"跳到222\">\n" +
                                  "    <input type=\"button\" onclick=\"$('#demo').stk_show('tab2')\" value=\"显示222\">\n" +
                                  "    <input type=\"button\" onclick=\"$('#demo').stk_hide('tab2')\" value=\"隐藏222\">"));%>
    </pre>
    </layout:fieldSet>
</layout:tab>
<layout:tab title="参数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="params/param_component.jsp" %>
    <%@ include file="params/param_tabs.jsp" %>
</layout:tab>
<layout:tab title="事件">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="event/event_component.jsp" %>
    <%@ include file="event/event_tab.jsp" %>
</layout:tab>
<layout:tab title="函数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="function/func_component.jsp" %>
    <%@ include file="function/func_tabs.jsp" %>
</layout:tab>
</layout:tabs>
</body>
</html>