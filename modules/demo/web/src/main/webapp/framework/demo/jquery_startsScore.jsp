<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>startsScore</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
    <script type="text/javascript">
        $(document).ready(function(){
            $('#demo').startsScore({
                name : 'starts',
                curStarts : 3,
                maxStarts : 5
            })
        });
    </script>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;星级评分</b></div>
<layout:tabs>
<layout:tab title="范例">
    说明：星级评分生成<br>
    <span id="demo"></span>
    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("<script type=\"text/javascript\">\n" +
        "        $(document).ready(function(){\n" +
        "            $('#demo').startsScore({\n" +
        "                name : 'starts',\n" +
        "                curStarts : 3,\n" +
        "                maxStarts : 5\n" +
        "            })\n" +
        "        });\n" +
        "    </script>\n" +
        "<span id=\"demo\"></span>"));%>
    </pre>
    </layout:fieldSet>
</layout:tab>
<layout:tab title="参数">
    <%@ include file="params/param_jquery_startsScore.jsp" %>
</layout:tab>
</layout:tabs>
</body>
</html>