<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>树</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;静态树 - ui:tree</b></div>
<!-- 主要内容 -->
<layout:tabs>
<layout:tab title="范例">
    <script type="text/javascript">
       var demoData = [
        {"text":"基本控件","children":[
                {"text":"对话框","href":"/demo/message.jsp","children":[{"id":"2","text":"强化控件","children":[
                {"text":"AJAX表格","children":[
                    {"text":"简单表格","href":"/demo/ajaxTable.jsp"},
                    {"text":"表格分页","href":"/demo/ajaxTable_pageSize.jsp"},
                    {"text":"表格查询","href":"/demo/ajaxTable_search.jsp"},
                    {"text":"数据汇总","href":"/demo/ajaxTable_collect.jsp"}
                ]},
                {"text":"Tab","href":"/demo/tab.jsp"},
                {"text":"双下拉菜单","href":"/demo/doubleSelect.jsp"},
                {"text":"多选框","href":"/demo/multiSelect.jsp"},
                {"text":"高级选择框","href":"/demo/itemSelect.jsp"}
                ]}]},
                {"text":"按钮","href":"/demo/button.jsp"},
                {"text":"文本框","href":"/demo/textField.jsp"},
                {"text":"数字文本框","href":"/demo/numberField.jsp"},
                {"text":"日期文本框","href":"/demo/dateField.jsp"},
                {"text":"时间文本框","href":"/demo/timeField.jsp"},
                {"text":"下拉和复合框","href":"/demo/selectAndcomboBox.jsp"},
                {"text":"外框","href":"/demo/panel.jsp"},
                {"text":"域外框","href":"/demo/fieldSet.jsp"},
                {"text":"窗口","href":"/demo/window.jsp"},
                {"text":"Html编辑器","href":"/demo/htmlEditor.jsp"},
                {"text":"滑动条","href":"/demo/slider.jsp"},
                {"text":"菜单树","href":"/demo/tree.jsp"},
                {"text":"复选框组","href":"/demo/checkboxGroup.jsp"},
                {"text":"单选框组","href":"/demo/radioGroup.jsp"}
                ]},
        {"id":"2","text":"强化控件","children":[
                {"text":"AJAX表格","children":[
                    {"text":"简单表格","href":"/demo/ajaxTable.jsp"},
                    {"text":"表格分页","href":"/demo/ajaxTable_pageSize.jsp"},
                    {"text":"表格查询","href":"/demo/ajaxTable_search.jsp"},
                    {"text":"数据汇总","href":"/demo/ajaxTable_collect.jsp"}
                ]},
                {"text":"Tab","href":"/demo/tab.jsp"},
                {"text":"双下拉菜单","href":"/demo/doubleSelect.jsp"},
                {"text":"多选框","href":"/demo/multiSelect.jsp","children":[{"id":"2","text":"强化控件","children":[
                {"text":"AJAX表格","children":[
                    {"text":"简单表格","href":"/demo/ajaxTable.jsp"},
                    {"text":"表格分页","href":"/demo/ajaxTable_pageSize.jsp"},
                    {"text":"表格查询","href":"/demo/ajaxTable_search.jsp"},
                    {"text":"数据汇总","href":"/demo/ajaxTable_collect.jsp"}
                ]},
                {"text":"Tab","href":"/demo/tab.jsp"},
                {"text":"双下拉菜单","href":"/demo/doubleSelect.jsp"},
                {"text":"多选框","href":"/demo/multiSelect.jsp"},
                {"text":"高级选择框","href":"/demo/itemSelect.jsp"}
                ]}]},
                {"text":"高级选择框","href":"/demo/itemSelect.jsp"}
                ]},
        {"text":"常规应用","children":[
                {"text":"表单验证","href":"/demo/form.jsp"},
                {"id":"2","text":"强化控件","children":[
                {"text":"AJAX表格","children":[
                    {"text":"简单表格","href":"/demo/ajaxTable.jsp"},
                    {"text":"表格分页","href":"/demo/ajaxTable_pageSize.jsp"},
                    {"text":"表格查询","href":"/demo/ajaxTable_search.jsp"},
                    {"text":"数据汇总","href":"/demo/ajaxTable_collect.jsp"}
                ]},
                {"text":"Tab","href":"/demo/tab.jsp"},
                {"text":"双下拉菜单","href":"/demo/doubleSelect.jsp"},
                {"text":"多选框","href":"/demo/multiSelect.jsp"},
                {"text":"高级选择框","href":"/demo/itemSelect.jsp"}
                ]}
                ]},
               {"id":"2","text":"强化控件","children":[
                {"text":"AJAX表格","children":[
                    {"text":"简单表格","href":"/demo/ajaxTable.jsp"},
                    {"text":"表格分页","href":"/demo/ajaxTable_pageSize.jsp"},
                    {"text":"表格查询","href":"/demo/ajaxTable_search.jsp"},
                    {"text":"数据汇总","href":"/demo/ajaxTable_collect.jsp"}
                ]},
                {"text":"Tab","href":"/demo/tab.jsp"},
                {"text":"双下拉菜单","href":"/demo/doubleSelect.jsp"},
                {"text":"多选框","href":"/demo/multiSelect.jsp"},
                {"text":"高级选择框","href":"/demo/itemSelect.jsp"}
                ]}
        ];
       </script>
<ui:tree jsList="demoData" rootText="测试"/>

    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("<script type=\"text/javascript\">\n" +
"       var demoData = [\n" +
"        {\"text\":\"基本控件\",\"children\":[\n" +
"                {\"text\":\"对话框\",\"href\":\"/demo/message.jsp\",\"children\":[{\"id\":\"2\",\"text\":\"强化控件\",\"children\":[\n" +
"                {\"text\":\"AJAX表格\",\"children\":[\n" +
"                    {\"text\":\"简单表格\",\"href\":\"/demo/ajaxTable.jsp\"},\n" +
"                    {\"text\":\"表格分页\",\"href\":\"/demo/ajaxTable_pageSize.jsp\"},\n" +
"                    {\"text\":\"表格查询\",\"href\":\"/demo/ajaxTable_search.jsp\"},\n" +
"                    {\"text\":\"数据汇总\",\"href\":\"/demo/ajaxTable_collect.jsp\"}\n" +
"                ]},\n" +
"                {\"text\":\"Tab\",\"href\":\"/demo/tab.jsp\"},\n" +
"                {\"text\":\"双下拉菜单\",\"href\":\"/demo/doubleSelect.jsp\"},\n" +
"                {\"text\":\"多选框\",\"href\":\"/demo/multiSelect.jsp\"},\n" +
"                {\"text\":\"高级选择框\",\"href\":\"/demo/itemSelect.jsp\"}\n" +
"                ]}]},\n" +
"                {\"text\":\"按钮\",\"href\":\"/demo/button.jsp\"},\n" +
"                {\"text\":\"文本框\",\"href\":\"/demo/textField.jsp\"},\n" +
"                {\"text\":\"数字文本框\",\"href\":\"/demo/numberField.jsp\"},\n" +
"                {\"text\":\"日期文本框\",\"href\":\"/demo/dateField.jsp\"},\n" +
"                {\"text\":\"时间文本框\",\"href\":\"/demo/timeField.jsp\"},\n" +
"                {\"text\":\"下拉和复合框\",\"href\":\"/demo/selectAndcomboBox.jsp\"},\n" +
"                {\"text\":\"外框\",\"href\":\"/demo/panel.jsp\"},\n" +
"                {\"text\":\"域外框\",\"href\":\"/demo/fieldSet.jsp\"},\n" +
"                {\"text\":\"窗口\",\"href\":\"/demo/window.jsp\"},\n" +
"                {\"text\":\"Html编辑器\",\"href\":\"/demo/htmlEditor.jsp\"},\n" +
"                {\"text\":\"滑动条\",\"href\":\"/demo/slider.jsp\"},\n" +
"                {\"text\":\"菜单树\",\"href\":\"/demo/tree.jsp\"},\n" +
"                {\"text\":\"复选框组\",\"href\":\"/demo/checkboxGroup.jsp\"},\n" +
"                {\"text\":\"单选框组\",\"href\":\"/demo/radioGroup.jsp\"}\n" +
"                ]},\n" +
"        {\"id\":\"2\",\"text\":\"强化控件\",\"children\":[\n" +
"                {\"text\":\"AJAX表格\",\"children\":[\n" +
"                    {\"text\":\"简单表格\",\"href\":\"/demo/ajaxTable.jsp\"},\n" +
"                    {\"text\":\"表格分页\",\"href\":\"/demo/ajaxTable_pageSize.jsp\"},\n" +
"                    {\"text\":\"表格查询\",\"href\":\"/demo/ajaxTable_search.jsp\"},\n" +
"                    {\"text\":\"数据汇总\",\"href\":\"/demo/ajaxTable_collect.jsp\"}\n" +
"                ]},\n" +
"                {\"text\":\"Tab\",\"href\":\"/demo/tab.jsp\"},\n" +
"                {\"text\":\"双下拉菜单\",\"href\":\"/demo/doubleSelect.jsp\"},\n" +
"                {\"text\":\"多选框\",\"href\":\"/demo/multiSelect.jsp\",\"children\":[{\"id\":\"2\",\"text\":\"强化控件\",\"children\":[\n" +
"                {\"text\":\"AJAX表格\",\"children\":[\n" +
"                    {\"text\":\"简单表格\",\"href\":\"/demo/ajaxTable.jsp\"},\n" +
"                    {\"text\":\"表格分页\",\"href\":\"/demo/ajaxTable_pageSize.jsp\"},\n" +
"                    {\"text\":\"表格查询\",\"href\":\"/demo/ajaxTable_search.jsp\"},\n" +
"                    {\"text\":\"数据汇总\",\"href\":\"/demo/ajaxTable_collect.jsp\"}\n" +
"                ]},\n" +
"                {\"text\":\"Tab\",\"href\":\"/demo/tab.jsp\"},\n" +
"                {\"text\":\"双下拉菜单\",\"href\":\"/demo/doubleSelect.jsp\"},\n" +
"                {\"text\":\"多选框\",\"href\":\"/demo/multiSelect.jsp\"},\n" +
"                {\"text\":\"高级选择框\",\"href\":\"/demo/itemSelect.jsp\"}\n" +
"                ]}]},\n" +
"                {\"text\":\"高级选择框\",\"href\":\"/demo/itemSelect.jsp\"}\n" +
"                ]},\n" +
"        {\"text\":\"常规应用\",\"children\":[\n" +
"                {\"text\":\"表单验证\",\"href\":\"/demo/form.jsp\"},\n" +
"                {\"id\":\"2\",\"text\":\"强化控件\",\"children\":[\n" +
"                {\"text\":\"AJAX表格\",\"children\":[\n" +
"                    {\"text\":\"简单表格\",\"href\":\"/demo/ajaxTable.jsp\"},\n" +
"                    {\"text\":\"表格分页\",\"href\":\"/demo/ajaxTable_pageSize.jsp\"},\n" +
"                    {\"text\":\"表格查询\",\"href\":\"/demo/ajaxTable_search.jsp\"},\n" +
"                    {\"text\":\"数据汇总\",\"href\":\"/demo/ajaxTable_collect.jsp\"}\n" +
"                ]},\n" +
"                {\"text\":\"Tab\",\"href\":\"/demo/tab.jsp\"},\n" +
"                {\"text\":\"双下拉菜单\",\"href\":\"/demo/doubleSelect.jsp\"},\n" +
"                {\"text\":\"多选框\",\"href\":\"/demo/multiSelect.jsp\"},\n" +
"                {\"text\":\"高级选择框\",\"href\":\"/demo/itemSelect.jsp\"}\n" +
"                ]}\n" +
"                ]},\n" +
"               {\"id\":\"2\",\"text\":\"强化控件\",\"children\":[\n" +
"                {\"text\":\"AJAX表格\",\"children\":[\n" +
"                    {\"text\":\"简单表格\",\"href\":\"/demo/ajaxTable.jsp\"},\n" +
"                    {\"text\":\"表格分页\",\"href\":\"/demo/ajaxTable_pageSize.jsp\"},\n" +
"                    {\"text\":\"表格查询\",\"href\":\"/demo/ajaxTable_search.jsp\"},\n" +
"                    {\"text\":\"数据汇总\",\"href\":\"/demo/ajaxTable_collect.jsp\"}\n" +
"                ]},\n" +
"                {\"text\":\"Tab\",\"href\":\"/demo/tab.jsp\"},\n" +
"                {\"text\":\"双下拉菜单\",\"href\":\"/demo/doubleSelect.jsp\"},\n" +
"                {\"text\":\"多选框\",\"href\":\"/demo/multiSelect.jsp\"},\n" +
"                {\"text\":\"高级选择框\",\"href\":\"/demo/itemSelect.jsp\"}\n" +
"                ]}\n" +
"        ];\n" +
"       </script>\n" +
"<ui:tree jsList=\"demoData\" rootText=\"测试\"/>"));%>
    </pre>
    </layout:fieldSet>
</layout:tab>
<layout:tab title="参数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="params/param_component.jsp" %>
    <%@ include file="params/param_tree.jsp" %>
</layout:tab>
<layout:tab title="事件">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="event/event_component.jsp" %>
    <%@ include file="event/event_tree.jsp" %>
</layout:tab>
<layout:tab title="函数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="function/func_component.jsp" %>
    <%@ include file="function/func_tree.jsp" %>
</layout:tab>
</layout:tabs>
</body>
</html>