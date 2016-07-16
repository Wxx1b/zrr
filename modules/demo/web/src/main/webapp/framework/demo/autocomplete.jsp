<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>自动填充栏</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;自动填充栏 - ui:autoComplete</b></div>
<layout:tabs>
<layout:tab title="范例">
    <script type="text/javascript">
        function getParam()
        {
            return {test:$("#testId").stk_text()};
        }
    </script>
    普通：
    <ui:autoComplete id="testId" selectWidth="500"  jsParam="getParam" emptyText="请输入编号或拼音" clazz="com.sinitek.spirit.webcontrol.autocomplete.DemoAutoComplete" delay="500">
        <event:ondataselect dataVar="data">
            stk.debug(data);
        </event:ondataselect>
    </ui:autoComplete>

    <script type="text/javascript">
        $("#testId" ).stk_val();
        $("#testId" ).stk_text("");
    </script>
    <input type="button" value="获得值" onclick="alert($('#testId').stk_val()+','+$('#testId').stk_text());">
    <input type="button" value="设置值" onclick="$('#testId').stk_val('1');$('#testId').stk_text('sinitek');">
    <input type="button" value="清空缓存" onclick="$('#testId').stk_flushCache();">


    <br><br>onfocus：
    <ui:autoComplete id="testId2" emptyText="请输入编号或拼音" clazz="com.sinitek.spirit.webcontrol.autocomplete.DemoAutoComplete" showOnFocus="true"/>

    <br><br>图标：
    <ui:autoComplete id="testId3" emptyText="请输入编号或拼音" clazz="com.sinitek.spirit.webcontrol.autocomplete.DemoAutoComplete" icon="ui-icon-gear">
        <event:oniconclick>
            alert("icon click");
        </event:oniconclick>
    </ui:autoComplete>


    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    <script type=\"text/javascript\">\n" +
        "        function getParam()\n" +
        "        {\n" +
        "            return {test:$(\"#testId\").stk_text()};\n" +
        "        }\n" +
        "    </script>\n" +
        "    普通：\n" +
        "    <ui:autoComplete id=\"testId\"  jsParam=\"getParam\" emptyText=\"请输入编号或拼音\" clazz=\"com.sinitek.spirit.webcontrol.autocomplete.DemoAutoComplete\">\n" +
        "        <event:ondataselect dataVar=\"data\">\n" +
        "            stk.debug(data);\n" +
        "        </event:ondataselect>\n" +
        "    </ui:autoComplete>\n" +
        "    <input type=\"button\" value=\"获得值\" onclick=\"alert($('#testId').stk_val()+','+$('#testId').stk_text());\">\n" +
        "    <input type=\"button\" value=\"设置值\" onclick=\"$('#testId').stk_val('1');$('#testId').stk_text('sinitek');\">\n" +
        "\n" +
        "    <br><br>onfocus：\n" +
        "    <ui:autoComplete id=\"testId2\" emptyText=\"请输入编号或拼音\" clazz=\"com.sinitek.spirit.webcontrol.autocomplete.DemoAutoComplete\" showOnFocus=\"true\"/>\n" +
        "    \n" +
        "    <br><br>图标：\n" +
        "    <ui:autoComplete id=\"testId3\" emptyText=\"请输入编号或拼音\" clazz=\"com.sinitek.spirit.webcontrol.autocomplete.DemoAutoComplete\" icon=\"ui-icon-gear\">\n" +
        "        <event:oniconclick>\n" +
        "            alert(\"icon click\");\n" +
        "        </event:oniconclick>\n" +
        "    </ui:autoComplete>"));%>
    </pre>
    <pre name="code" class="java">
<%out.print( HtmlUtils.htmlEscape("public class DemoAutoComplete implements IAutoCompleteAware{\n" +
"    public List<AutoCompleteData> match(String inputValue, Map<String, String> options, Map params, HttpServletRequest request) throws Exception {\n" +
"        List<AutoCompleteData> result = new ArrayList<AutoCompleteData>();\n" +
"        for(int i = 0; i < 10; i++)\n" +
"        {\n" +
"            AutoCompleteData data = new AutoCompleteData(inputValue+i,\"内容\"+inputValue+i,\"子内容\");\n" +
"            Map orgDate = new HashMap();\n" +
"            orgDate.put(\"aaa\",\"哈哈哈\");\n" +
"            data.setOrgData(orgDate);\n" +
"            result.add(data);\n" +
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
    <%@ include file="params/param_textfield.jsp" %>
    <%@ include file="params/param_autocomplete.jsp" %>
</layout:tab>
<layout:tab title="事件">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="event/event_component.jsp" %>
    <%@ include file="event/event_field.jsp" %>
    <%@ include file="event/event_textfield.jsp" %>
    <%@ include file="event/event_autocomplete.jsp" %>
</layout:tab>
<layout:tab title="函数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="function/func_component.jsp" %>
    <%@ include file="function/func_field.jsp" %>
</layout:tab>
</layout:tabs>
</body>
</html>