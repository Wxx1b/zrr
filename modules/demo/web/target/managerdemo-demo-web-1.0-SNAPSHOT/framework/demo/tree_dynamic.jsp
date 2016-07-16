<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>动态树</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;动态树 - ui:tree</b></div>
<!-- 主要内容 -->
<layout:tabs>
<layout:tab title="范例">
    <script type="text/javascript">
        function aaa()
        {
            //如果需要传参
            return {a:1};
        }
    </script>
    <ui:tree id="testTree" clazz="com.sinitek.spirit.webcontrol.demo.DemoTree" rootText="测试" jsParam="aaa"/>
    <input type="button" onclick="$('#testTree').stk_refresh();" value="刷新整树">
    <input type="button" onclick="$('#testTree').stk_refresh('3');" value="刷新节点3">
    <input type="button" onclick="$('#testTree').stk_refresh('399',true);" value="先刷父节点再刷自己" title="先展开层3">

    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    <script type=\"text/javascript\">\n" +
"        function aaa()\n" +
"        {\n" +
"            //如果需要传参\n" +
"            return {a:1};\n" +
"        }\n" +
"    </script>\n" +
"    <ui:tree id=\"testTree\" clazz=\"com.sinitek.spirit.webcontrol.demo.DemoTree\" rootText=\"测试\" jsParam=\"aaa\"/>\n" +
"    <input type=\"button\" onclick=\"$('#testTree').stk_refresh();\" value=\"刷新整树\">\n" +
"    <input type=\"button\" onclick=\"$('#testTree').stk_refresh('3');\" value=\"刷新节点3\">\n" +
"    <input type=\"button\" onclick=\"$('#testTree').stk_refresh('399',true);\" value=\"先刷父节点再刷自己\" title=\"先展开层3\">"));%>
    </pre>
    <pre name="code" class="java">
<%out.print( HtmlUtils.htmlEscape("public class DemoTree implements ITreeAware {\n" +
"\n" +
"    public void genTree(TreeNode root,Map<String, String> map, HttpServletRequest request) throws Exception {\n" +
"        TreeNode level1 = new TreeNode(\"1\",\"层1\");\n" +
"        TreeNode level2 = new TreeNode(\"2\",\"层2\");\n" +
"        TreeNode level3 = new TreeNode(\"3\",\"层3\");\n" +
"\n" +
"        level1.setGenChildren(true);\n" +
"        level2.setGenChildren(true);\n" +
"        level3.setGenChildren(true);\n" +
"\n" +
"        root.addChildren(level1);\n" +
"        root.addChildren(level2);\n" +
"        root.addChildren(level3);\n" +
"    }\n" +
"\n" +
"    public void genChildren(TreeNode parent, Map<String, String> map, HttpServletRequest request) throws Exception {\n" +
"        String parentId = parent.getId();\n" +
"        for(int i = 0; i < 10; i++)\n" +
"        {\n" +
"            parent.addChildren(new TreeNode(parentId+i,\"层\"+parentId+i,\"\"+parentId+i+\".jsp\"));\n" +
"        }\n" +
"    }\n" +
"}"));%>
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