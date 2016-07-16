<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>日期输入栏</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
    <script>
        $(document).ready(function ()
        {
            Calendar.setup({

                dateFormat: "%Y-%m-%d",
                inputField: "d8",
                trigger: "d8_icon",
                minuteStep: 1,
                onSelect: function ()
                {
                    //选择触发
                    this.hide();
                },
                titleFormat: "%Y %B"
            });
        })
    </script>
</head>
<body>
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;日期输入栏 - ui:datefield</b></div>
<!-- 主要内容 -->
<layout:tabs>
<layout:tab title="范例">
    <%
        pageContext.setAttribute("defaultDate",new Date());
    %>
    日期：<ui:datefield id="d1"/><input type="button" onclick="$('#d1').stk_val(new Date().format('yyyy-MM-dd'));" value="设置日期"><br>
    日期+时间：<ui:datefield id="d3" type="datetime"/><br>
    现在：<ui:datefield id="d4" defaultDate="${defaultDate}"/><br>
    事件：
    <ui:datefield id="d5">
        <event:ondateselect>
            alert($('#d5').stk_val())
        </event:ondateselect>
    </ui:datefield>


    <br>起始结束：起始<ui:datefield id="d6" endDate="d7"/>结束<ui:datefield id="d7" startDate="d6"/><br>


    手动渲染：
    <div class="stk-date-search" style="display:inline-block;*display:inline;*zoom:1;float:none">
        <div class="stk-date-aside">
            <div id="d8_icon" class="stk-ui-icon stk-date-aside-icon"></div>
        </div>
        <input class="stk-input stk-date-search-input" type="_date" id="d8" style="width:90px;">
    </div>

    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    <script>\n" +
        "        //手动渲染用\n"+
        "        $(document).ready(function ()\n" +
        "        {\n" +
        "            Calendar.setup({\n" +
        "\n" +
        "                dateFormat: \"%Y-%m-%d\",\n" +
        "                inputField: \"d8\",\n" +
        "                trigger: \"d8_icon\",\n" +
        "                minuteStep: 1,\n" +
        "                onSelect: function ()\n" +
        "                {\n" +
        "                    //选择触发\n" +
        "                    this.hide();\n" +
        "                },\n" +
        "                titleFormat: \"%Y %B\"\n" +
        "            });\n" +
        "        })\n" +
        "    </script>\n" +
"    < %\n" +
"        pageContext.setAttribute(\"defaultDate\",new Date());\n" +
"    % >\n" +
"    日期：<ui:datefield id=\"d1\"/><input type=\"button\" onclick=\"$('#d1').stk_val(new Date().format('yyyy-MM-dd'));\" value=\"设置日期\"><br>\n" +
        " 日期+时间：<ui:datefield id=\"d3\" type=\"datetime\"/><br>\n" +
        " 现在：<ui:datefield id=\"d4\" defaultDate=\"${defaultDate}\"/><br>\n" +
        " 事件：\n" +
        " <ui:datefield id=\"d5\">\n" +
        " <event:ondateselect>\n" +
        " alert($('#d5').stk_val())\n" +
        " </event:ondateselect>\n" +
        " </ui:datefield>\n" +
    "\n" +
    " <br>起始结束：起始<ui:datefield id=\"d6\" endDate=\"d7\"/>结束<ui:datefield id=\"d7\" startDate=\"d6\"/>\n\n" +
        "    手动渲染：\n" +
        "    <div class=\"stk-date-search\" style=\"display:inline-block;*display:inline;*zoom:1;float:none\">\n" +
        "        <div class=\"stk-date-aside\">\n" +
        "            <div id=\"d8_icon\" class=\"stk-ui-icon stk-date-aside-icon\"></div>\n" +
        "        </div>\n" +
        "        <input class=\"stk-input stk-date-search-input\" type=\"_date\" id=\"d8\" style=\"width:90px;\">\n" +
        "    </div>"));%>    </pre>
    </layout:fieldSet>
</layout:tab>
<layout:tab title="参数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="params/param_component.jsp" %>
    <%@ include file="params/param_field.jsp" %>
    <%@ include file="params/param_datefield.jsp" %>
</layout:tab>
<layout:tab title="事件">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="event/event_component.jsp" %>
    <%@ include file="event/event_field.jsp" %>
    <%@ include file="event/event_textfield.jsp" %>
    <%@ include file="event/event_datefield.jsp" %>
</layout:tab>
<layout:tab title="函数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="function/func_component.jsp" %>
    <%@ include file="function/func_field.jsp" %>
</layout:tab>
</layout:tabs>

</body>
</html>