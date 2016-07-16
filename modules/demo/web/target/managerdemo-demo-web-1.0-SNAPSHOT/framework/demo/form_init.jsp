<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>表单</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;表单:异步初始化 - ui:form</b></div>
<layout:tabs>
<layout:tab title="范例">
    <script type="text/javascript">
        $(document).ready(function(){
            $("#objid").stk_val("1111");
            $("#testForm").stk_submit("init",function(result){
                $("#DemoString").stk_val(result.demostring);
            });
        });
    </script>
    <ui:form id="testForm" clazz="com.sinitek.spirit.webcontrol.demo.DemoFormAction">
        <input type='hidden' id="objid" name="objid"/>

        <ui:textfield id="DemoString" name="DemoString"/>
    </ui:form>

    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    <script type=\"text/javascript\">\n" +
"        $(document).ready(function(){\n" +
"            $(\"#objid\").stk_val(\"1111\");\n" +
"            $(\"#testForm\").stk_submit(\"init\",function(result){\n" +
"                $(\"#DemoString\").stk_val(result.demostring);\n" +
"            });\n" +
"        });\n" +
"    </script>\n" +
"    <ui:form id=\"testForm\" clazz=\"com.sinitek.spirit.webcontrol.demo.DemoFormAction\">\n" +
"        <input type='hidden' id=\"objid\" name=\"objid\"/>\n" +
"\n" +
"        <ui:textfield id=\"DemoString\" name=\"DemoString\"/>\n" +
"    </ui:form>"));%>
    </pre>
    DemoFormAction.java
    <pre name="code" class="java">
<%out.print( HtmlUtils.htmlEscape("    public static Map init(Map<String,String> param, HttpServletRequest request) throws Exception\n" +
"    {\n" +
"        Map result = new HashMap();\n" +
"\n" +
"        //自造数据\n" +
"        String objid = param.get(\"objid\");\n" +
"        if(\"1111\".equals(objid))\n" +
"        {\n" +
"            result.put(\"demostring\",\"获得成功\");\n" +
"        }\n" +
"        return result;\n" +
"    }"));%>
    </pre>
    </layout:fieldSet>
</layout:tab>
<layout:tab title="表单参数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="params/param_component.jsp" %>
    <%@ include file="params/param_form.jsp" %>
</layout:tab>
<layout:tab title="检查器参数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="params/param_checker.jsp" %>
</layout:tab>
<layout:tab title="事件">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="event/event_component.jsp" %>
    <%@ include file="event/event_form.jsp" %>
</layout:tab>
<layout:tab title="函数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="function/func_component.jsp" %>
    <%@ include file="function/func_form.jsp" %>
</layout:tab>
</layout:tabs>

</body>
</html>