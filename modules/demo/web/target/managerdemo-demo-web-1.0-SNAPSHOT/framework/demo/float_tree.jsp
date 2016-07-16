<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>浮动树多选</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
    <script type="text/javascript">
        var demoTree;
        var treeNodes = [
            { id: 1, name: "随意勾选 1", open: true, children: [
                { id: 11, name: "随意勾选 1-1", open: true, children: [
                    { id: 111, name: "随意勾选 1-1-1"},
                    { id: 112, name: "随意勾选 1-1-2"}
                ]}
            ]},
            { id: 12, name: "随意勾选 1-2", open: true, children: [
                { id: 121, name: "随意勾选 1-2-1"},
                { id: 122, name: "随意勾选 1-2-2"}
            ]},
            { id: 2, pId: 0, name: "随意勾选 2", open: true, children: [
                { id: 21, name: "随意勾选 2-1"},
                { id: 22, name: "随意勾选 2-2", open: true, children: [
                    { id: 221, name: "随意勾选 2-2-1", checked: true},
                    { id: 222, name: "随意勾选 2-2-2"}
                ]},
                { id: 23, name: "随意勾选 2-3"}
            ]}
        ];

        var treeSetting = {
            check: {
                enable: true
            },
            callback: {
                onCheck: function ()
                {
                    var nodes = demoTree.getCheckedNodes();
                    var val = [];
                    var text = [];
                    $.each(nodes, function (i, n)
                    {
                        if (!n.isParent)
                        {
                            val.push(n.id);
                            text.push(n.name);
                        }
                    })
                    $("#demoText").stk_val(text.join(","));
                    $("#demoVal").stk_val(val.join(","));

                }
            }
        };

        $(document).ready(function ()
        {
            demoTree = $.fn.zTree.init($("#treeDemo"), treeSetting, treeNodes);

            $("#demoText_icon").stk_float({
                eventType: "click",
                target: $("#targetBox")
            });
        })

        function setTreeVal()
        {
            $("#demoText").stk_val("随意勾选 1-1-1,随意勾选 1-1-2");
            $("#demoVal").stk_val("111,112");
            demoTree.checkAllNodes(false);//取消全部勾选
            demoTree.checkNode(demoTree.getNodesByParam("id", 111)[0], true, true);
            demoTree.checkNode(demoTree.getNodesByParam("id", 112)[0], true, true);
        }
    </script>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;浮动树多选</b></div>
<layout:tabs>
    <layout:tab title="范例">

        <ui:textfield id="demoText" icon="ui-icon-triangle-1-s" readOnly="true" width="300px" defaultValue="随意勾选 2-2-1"/>
        <input type="hidden" id="demoVal" value="221">
        <button onclick="alert($('#demoVal').stk_val())">获得值</button>
        <button onclick="alert($('#demoText').stk_val())">获得文本</button>
        <button onclick="setTreeVal()">设置值</button>

        <div id="targetBox" class="float_box">
            <ul id="treeDemo" class="ztree"></ul>
        </div>

        <layout:VSpacing height="20px"/>

        <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%
    out.print(HtmlUtils.htmlEscape("    <script type=\"text/javascript\">\n" +
            "        var demoTree;\n" +
            "        var treeNodes = [\n" +
            "            { id: 1, name: \"随意勾选 1\", open: true, children: [\n" +
            "                { id: 11, name: \"随意勾选 1-1\", open: true, children: [\n" +
            "                    { id: 111, name: \"随意勾选 1-1-1\"},\n" +
            "                    { id: 112, name: \"随意勾选 1-1-2\"}\n" +
            "                ]}\n" +
            "            ]},\n" +
            "            { id: 12, name: \"随意勾选 1-2\", open: true, children: [\n" +
            "                { id: 121, name: \"随意勾选 1-2-1\"},\n" +
            "                { id: 122, name: \"随意勾选 1-2-2\"}\n" +
            "            ]},\n" +
            "            { id: 2, pId: 0, name: \"随意勾选 2\", open: true, children: [\n" +
            "                { id: 21, name: \"随意勾选 2-1\"},\n" +
            "                { id: 22, name: \"随意勾选 2-2\", open: true, children: [\n" +
            "                    { id: 221, name: \"随意勾选 2-2-1\", checked: true},\n" +
            "                    { id: 222, name: \"随意勾选 2-2-2\"}\n" +
            "                ]},\n" +
            "                { id: 23, name: \"随意勾选 2-3\"}\n" +
            "            ]}\n" +
            "        ];\n" +
            "\n" +
            "        var treeSetting = {\n" +
            "            check: {\n" +
            "                enable: true\n" +
            "            },\n" +
            "            callback:{\n" +
            "                onCheck:function()\n" +
            "                {\n" +
            "                    var nodes = demoTree.getCheckedNodes();\n" +
            "                    var val = [];\n" +
            "                    var text = [];\n" +
            "                    $.each(nodes,function(i,n){\n" +
            "                        if(!n.isParent)\n" +
            "                        {\n" +
            "                            val.push(n.id);\n" +
            "                            text.push(n.name);\n" +
            "                        }\n" +
            "                    })\n" +
            "                    $(\"#demoText\").stk_val(text.join(\",\"));\n" +
            "                    $(\"#demoVal\").stk_val(val.join(\",\"));\n" +
            "\n" +
            "                }\n" +
            "            }\n" +
            "        };\n" +
            "\n" +
            "        $(document).ready(function ()\n" +
            "        {\n" +
            "            demoTree = $.fn.zTree.init($(\"#treeDemo\"), treeSetting, treeNodes);\n" +
            "\n" +
            "            $(\"#demoText_icon\").stk_float({\n" +
            "                eventType: \"click\",\n" +
            "                target: $(\"#targetBox\")\n" +
            "            });\n" +
            "        })\n" +
            "\n" +
            "        function setTreeVal()\n" +
            "        {\n" +
            "            $(\"#demoText\").stk_val(\"随意勾选 1-1-1,随意勾选 1-1-2\");\n" +
            "            $(\"#demoVal\").stk_val(\"111,112\");\n" +
            "            demoTree.checkAllNodes(false);//取消全部勾选\n" +
            "            demoTree.checkNode(demoTree.getNodesByParam(\"id\", 111)[0],true, true);\n" +
            "            demoTree.checkNode(demoTree.getNodesByParam(\"id\", 112)[0], true, true);\n" +
            "\n" +
            "        }\n" +
            "    </script>\n" +
            "    <ui:textfield id=\"demoText\" icon=\"ui-icon-triangle-1-s\" readOnly=\"true\" width=\"300px\" defaultValue=\"随意勾选 2-2-1\"/>\n" +
            "    <input type=\"hidden\" id=\"demoVal\" value=\"221\">\n" +
            "    <button onclick=\"alert($('#demoVal').stk_val())\">获得值</button>\n" +
            "    <button onclick=\"alert($('#demoText').stk_val())\">获得文本</button>\n" +
            "    <button onclick=\"setTreeVal()\">设置值</button>\n" +
            "\n" +
            "    <div id=\"targetBox\" class=\"float_box\">\n" +
            "        <ul id=\"treeDemo\" class=\"ztree\"></ul>\n" +
            "    </div>"));
%>
    </pre>
        </layout:fieldSet>
    </layout:tab>
    <layout:tab title="zTtee文档">
        <a href="http://www.ztree.me/v3/api.php" target="_blank">zTtee官方文档</a>
    </layout:tab>
</layout:tabs>
</body>
</html>