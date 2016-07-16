<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>浮动层</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
    <script type="text/javascript">
        $(document).ready(function ()
        {
            $("#demo1").stk_float({
                target: $("#targetBox")
            });

            $("#demo2").stk_float({
                targetMode: "ajax"
            });

            $("#demo3").stk_float({
                target: "a.jsp",
                targetMode: "ajax"
            });

            $("#demo4").stk_float({
                eventType: "click",
                target: $("#targetBox")
            });

            $("#demo5").stk_float({
                width: "inherit",
                target: ["<a href='#'>唐丽霞</a>", "<a href='#'>徐栋梁</a>", "<a href='#'>成霞</a>", "<a href='#'>王庆花</a>", "<a href='#'>王腊梅</a>", "<a href='#'>更多 >></a>"],
                targetMode: "list"
            });

            $("#demo6").click(function(){
                $(this).stk_showMenu("menuId");
            })
        })
    </script>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;浮动层</b></div>
<layout:tabs>
<layout:tab title="范例">

    <a href="#" id="demo1">范例：普通</a><br><br>
    <a href="#" id="demo2" rel="../css/common/images/logo.png">范例：加载外部图片</a><br><br>
    <a href="#" id="demo3">范例：加载外部网页</a><br><br>
    <a href="#" id="demo4">范例：点击时显示</a><br><br>
    <a href="#" id="demo5">范例：下拉列表▼</a><br><br>
    <a href="#" id="demo6">扩展范例：下拉菜单▼</a><br><br>

    <div id="targetBox" class="float_box">
        哈哈哈，我出来了<br>
        霸气外露
    </div>

    <div id="menuId" style="display: none">
        <a href="javascript:alert('删除');"><b style="width: 16px;height: 16px;background-image: url('../css/common/images/icon/delete.gif')" ></b>删除</a>
        <a  href="javascript:alert('修改');"><b style="width: 16px;height: 16px;background-image: url('../css/common/images/icon/edit.gif')" ></b>修改</a>
    </div>

    <font color="red">范例用a来举例，其实可以任何元素</font>


    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    <script type=\"text/javascript\">\n" +
        "        $(document).ready(function ()\n" +
        "        {\n" +
        "            $(\"#demo1\").stk_float({\n" +
        "                target: $(\"#targetBox\")\n" +
        "            });\n" +
        "\n" +
        "            $(\"#demo2\").stk_float({\n" +
        "                targetMode: \"ajax\"\n" +
        "            });\n" +
        "\n" +
        "            $(\"#demo3\").stk_float({\n" +
        "                target: \"a.jsp\",\n" +
        "                targetMode: \"ajax\"\n" +
        "            });\n" +
        "\n" +
        "            $(\"#demo4\").stk_float({\n" +
        "                eventType: \"click\",\n" +
        "                target: $(\"#targetBox\")\n" +
        "            });\n" +
        "\n" +
        "            $(\"#demo5\").stk_float({\n" +
        "                width: \"inherit\",\n" +
        "                target: [\"<a href='#'>唐丽霞</a>\", \"<a href='#'>徐栋梁</a>\", \"<a href='#'>成霞</a>\", \"<a href='#'>王庆花</a>\", \"<a href='#'>王腊梅</a>\", \"<a href='#'>更多 >></a>\"],\n" +
        "                targetMode: \"list\"\n" +
        "            });\n" +
        "\n" +
        "            $(\"#demo6\").click(function(){\n" +
        "                $(this).stk_showMenu(\"menuId\");\n" +
        "            })\n" +
        "        })\n" +
        "    </script>\n" +
        "    <a href=\"#\" id=\"demo1\">范例：普通</a><br><br>\n" +
        "    <a href=\"#\" id=\"demo2\" rel=\"../css/common/images/logo.png\">范例：加载外部图片</a><br><br>\n" +
        "    <a href=\"#\" id=\"demo3\">范例：加载外部网页</a><br><br>\n" +
        "    <a href=\"#\" id=\"demo4\">范例：点击时显示</a><br><br>\n" +
        "    <a href=\"#\" id=\"demo5\">范例：下拉列表▼</a><br><br>\n" +
        "    <a href=\"#\" id=\"demo6\">扩展范例：下拉菜单▼</a><br><br>\n" +
        "\n" +
        "    <div id=\"targetBox\" class=\"float_box\">\n" +
        "        哈哈哈，我出来了<br>\n" +
        "        霸气外露\n" +
        "    </div>\n" +
        "\n" +
        "    <div id=\"menuId\" style=\"display: none\">\n" +
        "        <a href=\"javascript:alert('删除');\"><b style=\"width: 16px;height: 16px;background-image: url('../css/common/images/icon/delete.gif')\" ></b>删除</a>\n" +
        "        <a  href=\"javascript:alert('修改');\"><b style=\"width: 16px;height: 16px;background-image: url('../css/common/images/icon/edit.gif')\" ></b>修改</a>\n" +
        "    </div>"));%>
    </pre>
    </layout:fieldSet>
</layout:tab>
</layout:tabs>
</body>
</html>