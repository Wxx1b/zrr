<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>联动下拉框</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>

</head>
<body>
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;联动下拉框</b></div>
<!-- 主要内容 -->
<layout:tabs>
<layout:tab title="范例">
    <%
        Map map = new HashMap();
        for(int i = 0; i < 10; i++)
        {
            map.put("key"+i,"value"+i);
        }
        pageContext.setAttribute("test",map);
    %>
下拉选择框<hr>
<ui:select list="#attr.test"
               id="s1"
               headerKey=""
               headerValue="哈哈哈哈"
               interactAction="com.sinitek.spirit.webcontrol.demo.DemoSelectInteractAction"
               interactId="testId2">
</ui:select>

<ui:select id="testId2"/>
<br><br><br><br>多选框<hr>
<ui:multiselect list="#attr.test"
               id="s2"
               name="name1"
               interactAction="com.sinitek.spirit.webcontrol.demo.DemoMultiSelectInteractAction"
               interactId="testId4">
</ui:multiselect>

<ui:select id="testId4"/>

    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    < %\n" +
"        Map map = new HashMap();\n" +
"        for(int i = 0; i < 10; i++)\n" +
"        {\n" +
"            map.put(\"key\"+i,\"value\"+i);\n" +
"        }\n" +
"        pageContext.setAttribute(\"test\",map);\n" +
"    % >\n" +
"下拉选择框<hr>\n" +
        "<ui:select list=\"#attr.test\"\n" +
        "               id=\"s1\"\n" +
        "               headerKey=\"\"\n" +
        "               headerValue=\"哈哈哈哈\"\n" +
        "               interactAction=\"com.sinitek.spirit.webcontrol.demo.DemoSelectInteractAction\"\n" +
        "               interactId=\"testId2\">\n" +
        "</ui:select>\n" +
        "\n" +
        "<ui:select id=\"testId2\"/>\n" +
        "<br><br><br><br>多选框<hr>\n" +
        "<ui:multiselect list=\"#attr.test\"\n" +
        "               id=\"s2\"\n" +
        "               name=\"name1\"\n" +
        "               interactAction=\"com.sinitek.spirit.webcontrol.demo.DemoMultiSelectInteractAction\"\n" +
        "               interactId=\"testId4\">\n" +
        "</ui:multiselect>\n" +
        "\n" +
        "<ui:select id=\"testId4\"/>"));%>
    </pre>
    <pre name="code" class="java">
<%
out.print( HtmlUtils.htmlEscape("public class DemoSelectInteractAction implements InteractiveSelectAware {\n" +
"    public Map<String,String> getData(String key) {\n" +
"        Map<String,String> map = new HashMap<String,String>();\n" +
"        for(int i = 0; i < 10; i++)\n" +
"        {\n" +
"            map.put(key+\"_sub\"+i,key+\"_val\"+i);\n" +
"        }\n" +
"        return map;\n" +
"    }\n" +
"}\n\n"));

out.print( HtmlUtils.htmlEscape("public class DemoMultiSelectInteractAction implements InteractiveMultiSelectAware {\n" +
"    public Map<String,String> getData(String[] keys) {\n" +
"        Map<String,String> map = new HashMap<String,String>();\n" +
"        for(int j = 0; j < keys.length;j++)\n" +
"        {\n" +
"            for(int i = 0; i < 10; i++)\n" +
"            {\n" +
"                map.put(keys[j]+\"_sub\"+i,keys[j]+\"_val\"+i);\n" +
"            }\n" +
"        }\n" +
"        return map;\n" +
"    }\n" +
"}"));
%>
    </pre>
    </layout:fieldSet>
</layout:tab>
</layout:tabs>
</body>
</html>