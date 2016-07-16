<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>文件上传</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;表单:文件上传 - ui:form allowFileUpload="true"</b></div>
<layout:tabs>
<layout:tab title="范例">
    <script type="text/javascript">
    function checkT4()
    {
        if($("#t4").stk_val() == "携宁")
            return true;
        else
            return "请输入“携宁”";
    }
    </script>
    <ui:form clazz="com.sinitek.spirit.webcontrol.demo.DemoFileUploadAction" method="upload" id="fileUploadForm" allowFileUpload="true">
        <layout:boxcell label="其他参数" width="33%">
            <ui:textfield id="DemoString" name="DemoString"/>
        </layout:boxcell>

        <layout:boxcell label="文件组" width="33%" height="50px">
            <layout:box layout="row">
                <ui:textfield type="file" name="files"/>
                <ui:textfield type="file" name="files"/>
            </layout:box>
        </layout:boxcell>

        <layout:boxcell align="center" width="100%">
            <ui:button text="提交">
                <event:onclick>
                    $("#fileUploadForm").stk_submit(function(result){
                        stk.alert(result);
                    });
                </event:onclick>
            </ui:button>
            <ui:button type="reset" text="重置"/>
        </layout:boxcell>
    </ui:form>

    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    <ui:form clazz=\"com.sinitek.spirit.webcontrol.demo.DemoFileUploadAction\" method=\"upload\" id=\"fileUploadForm\" allowFileUpload=\"true\">\n" +
"        <layout:boxcell label=\"其他参数\" width=\"33%\">\n" +
"            <ui:textfield id=\"DemoString\" name=\"DemoString\"/>\n" +
"        </layout:boxcell>\n" +
"\n" +
"        <layout:boxcell label=\"文件组\" width=\"33%\" height=\"50px\">\n" +
"            <layout:box layout=\"row\">\n" +
"                <ui:textfield type=\"file\" name=\"files\"/>\n" +
"                <ui:textfield type=\"file\" name=\"files\"/>\n" +
"            </layout:box>\n" +
"        </layout:boxcell>\n" +
"\n" +
"        <layout:boxcell align=\"center\" width=\"100%\">\n" +
"            <ui:button text=\"提交\">\n" +
"                <event:onclick>\n" +
"                    $(\"#fileUploadForm\").stk_submit(function(result){\n" +
"                        stk.alert(result);\n" +
"                    });\n" +
"                </event:onclick>\n" +
"            </ui:button>\n" +
"            <ui:button type=\"reset\" text=\"重置\"/>\n" +
"        </layout:boxcell>\n" +
"    </ui:form>"));%>
    </pre>
    <pre name="code" class="java">
<%out.print( HtmlUtils.htmlEscape("public class DemoFileUploadAction {\n" +
"    public static String upload(Map<String, String> param, Map<String, List<FileTransfer>> fileMap, HttpServletRequest request) throws Exception {\n" +
"        List<FileTransfer> files = fileMap.get(\"files\");\n" +
"        if (files != null && files.size() > 0) {\n" +
"            FileTransfer file = files.get(0);\n" +
"            return \"上传文件:\" + files.size() + \"第一个文件：\"+file.getFilename();\n" +
"        }\n" +
"        return \"没有上传\";\n" +
"    }\n" +
"}"));%>
    </pre>
    </layout:fieldSet>
</layout:tab>
<layout:tab title="参数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="params/param_component.jsp" %>
    <%@ include file="params/param_form.jsp" %>
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