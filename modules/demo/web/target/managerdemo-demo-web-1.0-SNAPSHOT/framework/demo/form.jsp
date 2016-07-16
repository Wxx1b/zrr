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
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;表单:普通 - ui:form/func:checkers/func:checker</b></div>
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
    <font color="red">表单提交为了避免','问题,java参数把第一个参数换成RequestData比如：public [static] String test(RequestData requestData,HttpServletRequest request)
    </font>
    <ui:form id="testForm" clazz="com.sinitek.spirit.webcontrol.demo.DemoFormAction" method="test" htmlConvertIgnore="">
        <layout:box>
            <layout:boxcell label="不允许为空:"><ui:textfield name="t1" emptyText="aaa"/></layout:boxcell>
            <layout:boxcell label="不允许为空:"><ui:textfield name="t1" emptyText="aaa"/></layout:boxcell>

            <layout:boxcell label="长度验证"><ui:textfield name="t2"/></layout:boxcell>
            <layout:boxcell label="正则验证"><ui:textfield name="t3"/></layout:boxcell>
            <layout:boxcell label="自定义验证"><ui:textfield id="t4" name="t4"/></layout:boxcell>
            <layout:boxcell label="选择框"><ui:select name="s1" list="#{1:'aaa',2:'bbb'}" headerKey="" headerValue="--请选择--"/></layout:boxcell>
            <layout:boxcell label="checkbox组"><ui:checkboxgroup id="c1" name="c1" list="#{1:'aaa',2:'bbb'}"/></layout:boxcell>
            <layout:boxcell label="复合"><ui:combobox list="#{1:'aaa',2:'bbb'}" headerKey="" headerValue="--请选择--" name="s2"/></layout:boxcell>
            <layout:boxcell label="多选"><ui:multiselect list="#{1:'aaa',2:'bbb',3:'ccc',4:'ddd'}" id="s3" name="s3name" width="300px" columnWidth="150px"/></layout:boxcell>
            <layout:boxcell label="可删除选择"><ui:removableSelect list="#{}" id="s4" name="s4name"/>
            <input type="button" value="添加" onclick="$('#s4').stk_addOptions({'022':'广州'});"></layout:boxcell>
        </layout:box>
        <layout:boxcell align="center" width="100%">
            <ui:button text="提交">
                <event:onclick>
                    if($("#testForm").stk_checkForm())
                    {
                        $("#testForm").stk_submit(function(result){
                            stk.alert(result);
                        });
                    }
                </event:onclick>
            </ui:button>
            <ui:button type="reset" text="重置"/>
        </layout:boxcell>
        <func:checkers>
            <func:checker target="t1" allowBlank="false" blankText="为空啦为空啦"/>
            <func:checker target="t2" maxLength="5" minLength="3" maxLengthText="太长了" minLengthText="太短了"/>
            <func:checker target="t3" regex="^[0-9]*$" regexText="必须为数字"/>
            <func:checker target="t4" validator="checkT4()"/>
            <func:checker target="s1" allowBlank="false" blankText="请选择"/>
            <func:checker target="s2" allowBlank="false" blankText="请选择"/>
            <func:checker target="s3" allowBlank="false" blankText="请选择"/>
            <func:checker target="s4" allowBlank="false" blankText="请选择"/>
            <func:checker target="c1" allowBlank="false" blankText="请选择"/>
        </func:checkers>
    </ui:form>
    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    <script type=\"text/javascript\">\n" +
"    function checkT4()\n" +
"    {\n" +
"        if($(\"#t4\").stk_val() == \"携宁\")\n" +
"            return true;\n" +
"        else\n" +
"            return \"请输入“携宁”\";\n" +
"    }\n" +
"    </script>\n" +
"    <ui:form id=\"testForm\" clazz=\"com.sinitek.spirit.webcontrol.demo.DemoFormAction\" method=\"test\">\n" +
"        <layout:box>\n" +
"            <layout:boxcell label=\"不允许为空:\"><ui:textfield name=\"t1\" emptyText=\"aaa\"/></layout:boxcell>\n" +
"            <layout:boxcell label=\"长度验证\"><ui:textfield name=\"t2\"/></layout:boxcell>\n" +
"            <layout:boxcell label=\"正则验证\"><ui:textfield name=\"t3\"/></layout:boxcell>\n" +
"            <layout:boxcell label=\"自定义验证\"><ui:textfield id=\"t4\" name=\"t4\"/></layout:boxcell>\n" +
"            <layout:boxcell label=\"选择框\"><ui:select name=\"s1\" list=\"#{1:'aaa',2:'bbb'}\" headerKey=\"\" headerValue=\"--请选择--\"/></layout:boxcell>\n" +
"            <layout:boxcell label=\"checkbox组\"><ui:checkboxgroup id=\"c1\" name=\"c1\" list=\"#{1:'aaa',2:'bbb'}\"/></layout:boxcell>\n" +
"            <layout:boxcell label=\"复合\"><ui:combobox list=\"#{1:'aaa',2:'bbb'}\" headerKey=\"\" headerValue=\"--请选择--\" name=\"s2\"/></layout:boxcell>\n" +
"            <layout:boxcell label=\"多选\"><ui:multiselect list=\"#{1:'aaa',2:'bbb',3:'ccc',4:'ddd'}\" id=\"s3\" name=\"s3name\" width=\"300px\" columnWidth=\"150px\"/></layout:boxcell>\n" +
"            <layout:boxcell label=\"可删除选择\"><ui:removableSelect list=\"#{}\" id=\"s4\" name=\"s4name\"/>\n" +
"            <input type=\"button\" value=\"添加\" onclick=\"$('#s4').stk_addOptions({'022':'广州'});\"></layout:boxcell>\n" +
"        </layout:box>\n" +
"        <layout:boxcell align=\"center\" width=\"100%\">\n" +
"            <ui:button text=\"提交\">\n" +
"                <event:onclick>\n" +
"                    if($(\"#testForm\").stk_checkForm())\n" +
"                    {\n" +
"                        $(\"#testForm\").stk_submit(function(result){\n" +
"                            stk.alert(result);\n" +
"                        });\n" +
"                    }\n" +
"                </event:onclick>\n" +
"            </ui:button>\n" +
"            <ui:button type=\"reset\" text=\"重置\"/>\n" +
"        </layout:boxcell>\n" +
"        <func:checkers>\n" +
"            <func:checker target=\"t1\" allowBlank=\"false\" blankText=\"为空啦为空啦\"/>\n" +
"            <func:checker target=\"t2\" maxLength=\"5\" minLength=\"3\" maxLengthText=\"太长了\" minLengthText=\"太短了\"/>\n" +
"            <func:checker target=\"t3\" regex=\"^[0-9]*$\" regexText=\"必须为数字\"/>\n" +
"            <func:checker target=\"t4\" validator=\"checkT4()\"/>\n" +
"            <func:checker target=\"s1\" allowBlank=\"false\" blankText=\"请选择\"/>\n" +
"            <func:checker target=\"s2\" allowBlank=\"false\" blankText=\"请选择\"/>\n" +
"            <func:checker target=\"s3\" allowBlank=\"false\" blankText=\"请选择\"/>\n" +
"            <func:checker target=\"c1\" allowBlank=\"false\" blankText=\"请选择\"/>\n" +
"        </func:checkers>\n" +
"    </ui:form>"));%>
    </pre>
    <pre name="code" class="java">
<%out.print( HtmlUtils.htmlEscape("public class DemoFormAction{\n" +
"    public static String test(Map<String,String> param, HttpServletRequest request) throws Exception\n" +
"    {\n" +
"        String t1 = param.get(\"t1\");\n" +
"        return \"提交了t1:\"+t1;\n" +
"    }\n" +
"}"));%>
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