<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>分类选择器</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;分类选择器 - ui:classifiedSelect</b></div>
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
    单选：<ui:classifiedSelect id="testId" target="t1" clazz="com.sinitek.spirit.webcontrol.selector.DemoSelector" jsParam="setParam" interactFunction="interactCall" height="300px" allowSelectClass="true"/>
    <ui:textfield id="t1" readOnly="true"/><input type="hidden" id="t1_value">
    <ui:button icon="ui-icon-search">
        <event:onclick>
            $('#testId').stk_show();
        </event:onclick>
    </ui:button>

    <br><br>
    <%
        pageContext.setAttribute("t2_default",new String[]{"0_0","0_1"});
    %>
    多选2：<ui:classifiedSelect defaultValue="${t2_default}" id="testId2" target="t2" clazz="com.sinitek.spirit.webcontrol.selector.DemoSelector" multiple="true" interactFunction="interactCall2"/>
    <ui:removableSelect list="#{'0_0':'内容0_0','0_1':'内容0_1'}" id="t2" name="t2" width="300px" height="52px" removeFunction="removeCallBack"/>&nbsp;
    <ui:button icon="ui-icon-search">
        <event:onclick>
            $('#testId2').stk_show();
        </event:onclick>
    </ui:button>
    <input type="button" value="获得map" onclick="stk.debug($('#testId2').stk_map())">
    <input type="button" onclick="$('#testId2').stk_refresh();" value="刷新"/>

    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("<script type=\"text/javascript\">\n" +
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
        "    单选：<ui:classifiedSelect id=\"testId\" target=\"t1\" clazz=\"com.sinitek.spirit.webcontrol.selector.DemoSelector\" jsParam=\"setParam\" interactFunction=\"interactCall\" height=\"300px\"/>\n" +
        "    <ui:textfield id=\"t1\" readOnly=\"true\"/><input type=\"hidden\" id=\"t1_value\">\n" +
        "    <ui:button icon=\"ui-icon-search\">\n" +
        "        <event:onclick>\n" +
        "            $('#testId').stk_show();\n" +
        "        </event:onclick>\n" +
        "    </ui:button>\n" +
        "\n" +
        "    <br><br>" +
        "多选：<ui:classifiedSelect defaultValue=\"${t2_default}\" id=\"testId2\" target=\"t2\" clazz=\"com.sinitek.spirit.webcontrol.selector.DemoSelector\" multiple=\"true\" interactFunction=\"interactCall2\"/>\n" +
        "    <ui:removableSelect list=\"#{'0_0':'内容0_0','0_1':'内容0_1'}\" id=\"t2\" name=\"t2\" width=\"300px\" height=\"52px;\" removeFunction=\"removeCallBack\"/>&nbsp;\n" +
        "    <ui:button icon=\"ui-icon-search\">\n" +
        "        <event:onclick>\n" +
        "            $('#testId2').stk_show();\n" +
        "        </event:onclick>\n" +
        "    </ui:button>\n" +
        "    <input type=\"button\" onclick=\"$('#testId2').stk_refresh();\" value=\"刷新\"/>"));%>
    </pre>
<pre name="code" class="java">
    <%out.print( HtmlUtils.htmlEscape("public class DemoSelector implements IClassifiedSelectorAware{\n" +
"\n" +
"    public List<ClassifiedObject> genClassifiedSelector(Map<String, String> options, Map params, HttpServletRequest request) throws Exception {\n" +
"        List<ClassifiedObject> result = new ArrayList<ClassifiedObject>();\n" +
"        for (int i = 0; i < 5; i++) {\n" +
"            ClassifiedObject object = new ClassifiedObject(\"\"+i,\"分类\"+i);\n" +
"            for (int j = 0; j < 10; j++) {\n" +
"                object.add(new SelectorData(i+\"_\" +j, \"内容\"+i+\"_\"+j));\n" +
"            }\n" +
"            result.add(object);\n" +
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