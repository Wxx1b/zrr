<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>工具栏</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;工具栏 - layout:toolbar</b></div>
<layout:tabs>
<layout:tab title="范例">
    <layout:toolbar>
        <ui:toolbarButton text="文字"/>
        <ui:toolbarButton icon="ui-icon-gear" text="文字带图标"/>
        <ui:toolbarButtonMenu targetMenu="menuId" icon="ui-icon-gear" text="带菜单"/>
    </layout:toolbar>

    <div id="menuId" style="display:none">
        <a href="javascript:alert('xml');">xml</a>
        <a href="javascript:alert('doc');">doc</a>
    </div>
    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    <layout:toolbar>\n" +
        "        <ui:toolbarButton text=\"文字\"/>\n" +
        "        <ui:toolbarButton icon=\"ui-icon-gear\" text=\"文字带图标\"/>\n" +
        "        <ui:toolbarButtonMenu targetMenu=\"menuId\" icon=\"ui-icon-gear\" text=\"带菜单\"/>\n" +
        "    </layout:toolbar>\n" +
        "\n" +
        "    <div id=\"menuId\" style=\"display:none\">\n" +
        "        <a href=\"javascript:alert('xml');\">xml</a>\n" +
        "        <a href=\"javascript:alert('doc');\">doc</a>\n" +
        "    </div>"));%>
    </pre>
    </layout:fieldSet>
</layout:tab>
<layout:tab title="参数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="params/param_component.jsp" %>
    <%@ include file="params/param_toolbar.jsp" %>
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