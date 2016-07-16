<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>字母选择器</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;字母选择器 - ui:letterSelect</b></div>
<layout:tabs>
<layout:tab title="范例">
    <script type="text/javascript">
        function setParam()
        {
            return {111:'aaa'};
        }

        function interactCall(value,text)
        {
            $("#t1").stk_val(text);
            $("#t1_value").stk_val(value);
        }

        function interactCall2(data)
        {
            $("#t2").stk_emptyOptions();
            $("#t2").stk_addOptions(data);
        }

        function removeCallBack(value)
        {
            $("#testId2").stk_removeOptions(value);
        }
    </script>
    单选：<ui:letterSelect id="testId" target="t1" clazz="com.sinitek.spirit.webcontrol.selector.DemoSelector" jsParam="setParam" interactFunction="interactCall" height="300px"/>
    <ui:textfield id="t1" readOnly="true"/><input type="hidden" id="t1_value">
    <ui:button icon="ui-icon-search">
        <event:onclick>
            $('#testId').stk_show();
        </event:onclick>
    </ui:button>

    <br><br>
    多选：<ui:letterSelect id="testId2" target="t2" clazz="com.sinitek.spirit.webcontrol.selector.DemoSelector" multiple="true" interactFunction="interactCall2"/>
    <ui:removableSelect list="#{}" id="t2" name="t2" width="300px" height="52px;" removeFunction="removeCallBack"/>&nbsp;
    <ui:button icon="ui-icon-search">
        <event:onclick>
            $('#testId2').stk_show();
        </event:onclick>
    </ui:button>

    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    <script type=\"text/javascript\">\n" +
"        function setParam()\n" +
"        {\n" +
"            return {111:'aaa'};\n" +
"        }\n" +
"\n" +
"        function interactCall(value,text)\n" +
"        {\n" +
"            $(\"#t1\").stk_val(text);\n" +
"            $(\"#t1_value\").stk_val(value);\n" +
"        }\n" +
"\n" +
"        function interactCall2(data)\n" +
"        {\n" +
"            $(\"#t2\").stk_emptyOptions();\n" +
"            $(\"#t2\").stk_addOptions(data);\n" +
"        }\n" +
"\n" +
"        function removeCallBack(value)\n" +
"        {\n" +
"            $(\"#testId2\").stk_removeOptions(value);\n" +
"        }\n" +
"    </script>\n" +
"    单选：<ui:letterSelect id=\"testId\" target=\"t1\" clazz=\"com.sinitek.spirit.webcontrol.selector.DemoSelector\" jsParam=\"setParam\" interactFunction=\"interactCall\" height=\"300px\"/>\n" +
        "    <ui:textfield id=\"t1\" readOnly=\"true\"/><input type=\"hidden\" id=\"t1_value\">\n" +
        "    <ui:button icon=\"ui-icon-search\">\n" +
        "        <event:onclick>\n" +
        "            $('#testId').stk_show();\n" +
        "        </event:onclick>\n" +
        "    </ui:button>\n" +
        "\n" +
        "    <br><br>\n" +
        "    多选：<ui:letterSelect id=\"testId2\" target=\"t2\" clazz=\"com.sinitek.spirit.webcontrol.selector.DemoSelector\" multiple=\"true\" interactFunction=\"interactCall2\"/>\n" +
        "    <ui:removableSelect list=\"#{}\" id=\"t2\" name=\"t2\" width=\"300px\" height=\"52px;\" removeFunction=\"removeCallBack\"/>&nbsp;\n" +
        "    <ui:button icon=\"ui-icon-search\">\n" +
        "        <event:onclick>\n" +
        "            $('#testId2').stk_show();\n" +
        "        </event:onclick>\n" +
        "    </ui:button>"));%>
    </pre>
<pre name="code" class="java">
    <%out.print( HtmlUtils.htmlEscape("public class DemoSelector implements ILetterSelectorAware{\n" +
"\n" +
"    public List<SelectorData> genLetterSelector(Map<String, String> options, Map params, HttpServletRequest request) throws Exception {\n" +
"        List<SelectorData> result = new ArrayList<SelectorData>();\n" +
"        for (int i = 0; i < 50; i++) {\n" +
"            result.add(new SelectorData(i+\"\", getChinese(i)));\n" +
"        }\n" +
"        return result;\n" +
"    }\n" +
"}"));%>
</pre>
    </layout:fieldSet>
</layout:tab>
<layout:tab title="参数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="params/param_component.jsp" %>
    <%@ include file="params/param_field.jsp" %>
    <%@ include file="params/param_classifiedselect.jsp" %>
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
</layout:tab>
</layout:tabs>
</body>
</html>