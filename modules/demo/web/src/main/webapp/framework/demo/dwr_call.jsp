<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>自定义Ajax调用</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;自定义Dwr调用</b></div>
<!-- 主要内容 -->
<layout:tabs>
<layout:tab title="范例">
    <div id='test'></div>
    <script type="text/javascript">
        var count;
        function call_ajax() {
            count = 0;
            stk.call({
                className:"com.sinitek.managerdemo.demo.action.DemoDwr",
                method:'test',
                param:{para1:0},
                callBack:function(result) {
                    stk.alert(result);
                    count++;
                },
                exceptionHandler:function(message, e) {
                    stk.error(message)
                }
            });
            alert(count);
        }

        function call_ajax2(){
            count = 0;
            stk.call({
                className:"com.sinitek.managerdemo.demo.action.DemoDwr",
                method:'test',
                async:false,
                param:{para1:0},
                callBack:function(result) {
                    stk.alert(result);
                    count++;
                },
                exceptionHandler:function(message, e) {
                    stk.error(message)
                }
            });
            alert(count);
        }
    </script>
    <br>
    <input type="button" value="异步调用" onclick="call_ajax();">
    <input type="button" value="同步调用" onclick="call_ajax2();">

    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("<div id='test'></div>\n" +
        "    <script type=\"text/javascript\">\n" +
        "        var count;\n" +
        "        function call_ajax() {\n" +
        "            count = 0;\n" +
        "            stk.call({\n" +
        "                className:\"com.sinitek.managerdemo.demo.action.DemoDwr\",\n" +
        "                method:'test',\n" +
        "                param:{para1:0},\n" +
        "                callBack:function(result) {\n" +
        "                    stk.alert(result);\n" +
        "                    count++;\n" +
        "                },\n" +
        "                exceptionHandler:function(message, e) {\n" +
        "                    stk.error(message)\n" +
        "                }\n" +
        "            });\n" +
        "            alert(count);\n" +
        "        }\n" +
        "\n" +
        "        function call_ajax2(){\n" +
        "            count = 0;\n" +
        "            stk.call({\n" +
        "                className:\"com.sinitek.managerdemo.demo.action.DemoDwr\",\n" +
        "                method:'test',\n" +
        "                async:false,\n" +
        "                param:{para1:0},\n" +
        "                callBack:function(result) {\n" +
        "                    stk.alert(result);\n" +
        "                    count++;\n" +
        "                },\n" +
        "                exceptionHandler:function(message, e) {\n" +
        "                    stk.error(message)\n" +
        "                }\n" +
        "            });\n" +
        "            alert(count);\n" +
        "        }\n" +
        "    </script>\n" +
        "    <br>\n" +
        "    <input type=\"button\" value=\"异步调用\" onclick=\"call_ajax();\">\n" +
        "    <input type=\"button\" value=\"同步调用\" onclick=\"call_ajax2();\">"));%>
    </pre>
    DemoDwr.java
    <pre name="code" class="java">
<%out.print( HtmlUtils.htmlEscape("public class DemoDwr {\n" +
        "    public String test(Map<String,String> param, HttpServletRequest request)\n" +
        "    {\n" +
        "        return \"HelloWorld\";\n" +
        "    }\n" +
        "}"));%>
    </pre>
    </layout:fieldSet>
</layout:tab>
</layout:tabs>
</body>
</html>