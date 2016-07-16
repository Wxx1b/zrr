<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>右键菜单</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
    <script type="text/javascript">
        $(function ()
        {
            var option = { width: 150, items: [
                { text: "第一项", icon: "../css/common/images/icon/add16.gif", alias: "1-1", action: menuAction },
                { text: "第二项", alias: "1-2", action: menuAction },
                { text: "第三项", alias: "1-3", action: menuAction },
                { type: "splitLine" },
                { text: "组一集合", alias: "1-4", type: "group", width: 170, items: [
                    { text: "组三集合", alias: "2-2", type: "group", width: 190, items: [
                        { text: "组3一项", alias: "3-1", action: menuAction },
                        { text: "组3二项", alias: "3-2", action: menuAction }
                    ]
                    },
                    { text: "组1一项", alias: "2-1", action: menuAction },
                    { text: "组1二项", alias: "2-3", action: menuAction },
                    { text: "组1三项", alias: "2-4", action: menuAction }
                ]
                },
                { type: "splitLine" },
                { text: "第四项", alias: "1-5", action: menuAction },
                { text: "组二集合", alias: "1-6", type: "group", width: 180, items: [
                    { text: "组2一项", alias: "4-1", action: menuAction },
                    { text: "组2二项", alias: "4-2", action: menuAction }
                ]
                }
            ], onShow: applyrule,
                onContextMenu: BeforeContextMenu
            };

            function menuAction()
            {
                alert(this.data.alias);
            }

            function applyrule(menu)
            {
                if (this.id == "target2")
                {
                    menu.applyrule({ name: "target2",
                        disable: true,
                        items: ["1-2", "2-3", "2-4", "1-6"]
                    });
                }
                else
                {
                    menu.applyrule({ name: "all",
                        disable: true,
                        items: []
                    });
                }
            }

            function BeforeContextMenu()
            {
                return this.id != "target3";
            }

            $("#target,#target2,#target3").contextmenu(option);
        });
    </script>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;右键菜单</b></div>
<layout:tabs>
    <layout:tab title="范例">
        <div class="box1" panelWidth="800">
            <fieldset>
                <legend>1、显示所有菜单</legend>
                <div id="target" style="width:200px;border:solid 1px #ccc;">在这里右击</div>
            </fieldset>
            <div class="height_50"></div>

            <fieldset>
                <legend>2、禁用某些项</legend>
                <div id="target2" style="width:200px;border:solid 1px #ccc;">在这里右击</div>
            </fieldset>
            <div class="height_50"></div>

            <fieldset>
                <legend>3、禁用右键</legend>
                <div id="target3" style="width:200px;border:solid 1px #ccc;">在这里右击</div>
            </fieldset>
        </div>

        <layout:VSpacing height="20px"/>

        <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print(HtmlUtils.htmlEscape("    <script type=\"text/javascript\">\n" +
        "        $(function ()\n" +
        "        {\n" +
        "            var option = { width: 150, items: [\n" +
        "                { text: \"第一项\", icon: \"../css/common/images/icon/add16.gif\", alias: \"1-1\", action: menuAction },\n" +
        "                { text: \"第二项\", alias: \"1-2\", action: menuAction },\n" +
        "                { text: \"第三项\", alias: \"1-3\", action: menuAction },\n" +
        "                { type: \"splitLine\" },\n" +
        "                { text: \"组一集合\", alias: \"1-4\", type: \"group\", width: 170, items: [\n" +
        "                    { text: \"组三集合\", alias: \"2-2\", type: \"group\", width: 190, items: [\n" +
        "                        { text: \"组3一项\", alias: \"3-1\", action: menuAction },\n" +
        "                        { text: \"组3二项\", alias: \"3-2\", action: menuAction }\n" +
        "                    ]\n" +
        "                    },\n" +
        "                    { text: \"组1一项\", alias: \"2-1\", action: menuAction },\n" +
        "                    { text: \"组1二项\", alias: \"2-3\", action: menuAction },\n" +
        "                    { text: \"组1三项\", alias: \"2-4\", action: menuAction }\n" +
        "                ]\n" +
        "                },\n" +
        "                { type: \"splitLine\" },\n" +
        "                { text: \"第四项\", alias: \"1-5\", action: menuAction },\n" +
        "                { text: \"组二集合\", alias: \"1-6\", type: \"group\", width: 180, items: [\n" +
        "                    { text: \"组2一项\", alias: \"4-1\", action: menuAction },\n" +
        "                    { text: \"组2二项\", alias: \"4-2\", action: menuAction }\n" +
        "                ]\n" +
        "                }\n" +
        "            ], onShow: applyrule,\n" +
        "                onContextMenu: BeforeContextMenu\n" +
        "            };\n" +
        "\n" +
        "            function menuAction()\n" +
        "            {\n" +
        "                alert(this.data.alias);\n" +
        "            }\n" +
        "\n" +
        "            function applyrule(menu)\n" +
        "            {\n" +
        "                if (this.id == \"target2\")\n" +
        "                {\n" +
        "                    menu.applyrule({ name: \"target2\",\n" +
        "                        disable: true,\n" +
        "                        items: [\"1-2\", \"2-3\", \"2-4\", \"1-6\"]\n" +
        "                    });\n" +
        "                }\n" +
        "                else\n" +
        "                {\n" +
        "                    menu.applyrule({ name: \"all\",\n" +
        "                        disable: true,\n" +
        "                        items: []\n" +
        "                    });\n" +
        "                }\n" +
        "            }\n" +
        "\n" +
        "            function BeforeContextMenu()\n" +
        "            {\n" +
        "                return this.id != \"target3\";\n" +
        "            }\n" +
        "\n" +
        "            $(\"#target,#target2,#target3\").contextmenu(option);\n" +
        "        });\n" +
        "    </script>\n\n" +
        "        <div class=\"box1\" panelWidth=\"800\">\n" +
        "            <fieldset>\n" +
        "                <legend>1、显示所有菜单</legend>\n" +
        "                <div id=\"target\" style=\"width:200px;border:solid 1px #ccc;\">在这里右击</div>\n" +
        "            </fieldset>\n" +
        "            <div class=\"height_50\"></div>\n" +
        "\n" +
        "            <fieldset>\n" +
        "                <legend>2、禁用某些项</legend>\n" +
        "                <div id=\"target2\" style=\"width:200px;border:solid 1px #ccc;\">在这里右击</div>\n" +
        "            </fieldset>\n" +
        "            <div class=\"height_50\"></div>\n" +
        "\n" +
        "            <fieldset>\n" +
        "                <legend>3、禁用右键</legend>\n" +
        "                <div id=\"target3\" style=\"width:200px;border:solid 1px #ccc;\">在这里右击</div>\n" +
        "            </fieldset>\n" +
        "        </div>"));%>
    </pre>
        </layout:fieldSet>
    </layout:tab>
</layout:tabs>
</body>
</html>