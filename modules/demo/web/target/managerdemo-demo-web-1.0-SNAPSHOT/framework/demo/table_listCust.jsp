<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>表格控件</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
    <style type="text/css">
        .list li
        {
            padding-bottom:10px;
        }
    </style>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;表格控件:自定义分页List - ui:table/ui:col</b></div>
<layout:tabs>
<layout:tab title="范例">
<plugin:colCheckbox id="checkBoxPlugin" name="check" checkedVar="checked"/>
<ui:table id="testTable" actionClass="com.sinitek.spirit.webcontrol.demo.DemoTableListCustAction" pageSize="10" subList="false">
    <ui:col plugin="checkBoxPlugin" width="20px"/>
    <ui:col property="DemoString" title="字符串" allowTip="true" align="right"/>
    <ui:colNumber property="DemoInteger" title="数字" isMoney="true" afterText="(元)" allowTip="true"/>
    <ui:colDate property="DemoDate" title="日期" format="yyyy-MM-dd"/>
</ui:table>

</layout:tab>
<layout:tab title="代码">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("<plugin:colCheckbox id=\"checkBoxPlugin\" name=\"check\" checkedVar=\"checked\"/>\n" +
                                  "<ui:table id=\"testTable\" actionClass=\"com.sinitek.spirit.webcontrol.demo.DemoTableListCustAction\" pageSize=\"10\" subList=\"false\">\n" +
                                  "    <ui:col plugin=\"checkBoxPlugin\" width=\"20px\"/>\n" +
                                  "    <ui:col property=\"DemoString\" title=\"字符串\" allowTip=\"true\" align=\"right\"/>\n" +
                                  "    <ui:colNumber property=\"DemoInteger\" title=\"数字\" isMoney=\"true\" afterText=\"(元)\" allowTip=\"true\"/>\n" +
                                  "    <ui:colDate property=\"DemoDate\" title=\"日期\" format=\"yyyy-MM-dd\"/>\n" +
                                  "</ui:table>"));%>
    </pre>

    <pre name="code" class="java">
<%out.print( HtmlUtils.htmlEscape("public class DemoTableAction implements ITableAware{\n" +
"    public Object getResult(Map<String, String> map, HttpServletRequest request) throws Exception {\n" +
"        List list = new ArrayList();\n" +
"        //可从map获取pageSize和pageNum，如下\n" +
"        Integer pageSize = new Integer(map.get( \"__pageSize\" ));\n" +
"        Integer pageNum = new Integer(map.get( \"__pageNum\" ));\n" +
"        for ( int i = 1; i <= 10; i++ )\n" +
"        {\n" +
"            Map obj = new CaseInsensitiveMap();\n" +
"            obj.put( \"objid\",(pageNum)*10+i );\n" +
"            obj.put( \"DemoString\", \"String\" + (pageNum)*10+i );\n" +
"            obj.put( \"DemoInteger\", i );\n" +
"            obj.put( \"DemoDate\", new Date() );\n" +
"            list.add( obj );\n" +
"        }\n" +
"        //必须告诉控件总共多少行数据，如下\n" +
"        map.put( \"__allRow\", \"100\" );\n" +
"        return list;\n" +
"    }\n" +
"\n" +
"    public String setDefaultOrderBy(Map<String, String> map, HttpServletRequest request) {\n" +
"        return \"\";\n" +
"    }\n" +
"}"));%>
    </pre>
 </layout:tab>
<layout:tab title="Table参数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="params/param_component.jsp" %>
    <%@ include file="params/param_table.jsp" %>
</layout:tab>
<layout:tab title="Col参数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="params/param_col.jsp" %>
</layout:tab>
<layout:tab title="事件">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="event/event_component.jsp" %>
    <%@ include file="event/event_table.jsp" %>
</layout:tab>
<layout:tab title="函数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="function/func_component.jsp" %>
    <%@ include file="function/func_table.jsp" %>
</layout:tab>
<layout:tab title="列插件">
    <%@ include file="table_plugin.jsp" %>
</layout:tab>
<layout:tab title="常见问题">
    <%@ include file="table_question.jsp" %>
</layout:tab>
</layout:tabs>
</body>
</html>