<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>对话框</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;对话框 - stk.alert/stk.confirm</b></div>
<!-- 主要内容 -->
<layout:tabs>
<layout:tab title="范例">
<ui:button text="alert">
    <event:onclick>
        stk.alert("你好")
    </event:onclick>
</ui:button>

<ui:button text="alert带标题">
    <event:onclick>
        stk.alert("你好","这里是标题")
    </event:onclick>
</ui:button>

<ui:button text="alert带函数">
    <event:onclick>
        stk.alert("你好",{
            "确认":function(){
                alert("确认");
                stk.closeDialog();
            },
            "取消":function(){
                stk.closeDialog();
            }
        })
    </event:onclick>
</ui:button>

<ui:button text="alert带标题和按钮">
    <event:onclick>
        stk.alert("你好","这里是标题",{
            "确认":function(){
                alert("确认");
                stk.closeDialog();
            }
        })
    </event:onclick>
</ui:button>
<br><br>
<ui:button text="confirm">
    <event:onclick>
        stk.confirm("确认吗",function(){
            stk.alert("确认");
        })
    </event:onclick>
</ui:button>
<br><br>
<ui:button text="提示">
    <event:onclick>
        stk.info("你好")
    </event:onclick>
</ui:button>
<ui:button text="警告">
    <event:onclick>
        stk.warn("你好")
    </event:onclick>
</ui:button>
<ui:button text="错误">
    <event:onclick>
        stk.error("你好")
    </event:onclick>
</ui:button>
    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("<ui:button text=\"alert\">\n" +
"    <event:onclick>\n" +
"        stk.alert(\"你好\")\n" +
"    </event:onclick>\n" +
"</ui:button>\n" +
"\n" +
"<ui:button text=\"alert带标题\">\n" +
"    <event:onclick>\n" +
"        stk.alert(\"你好\",\"这里是标题\")\n" +
"    </event:onclick>\n" +
"</ui:button>\n" +
"\n" +
"<ui:button text=\"alert带函数\">\n" +
"    <event:onclick>\n" +
"        stk.alert(\"你好\",{\n" +
"            \"确认\":function(){\n" +
"                alert(\"确认\");\n" +
"                stk.closeDialog();\n" +
"            },\n" +
"            \"取消\":function(){\n" +
"                stk.closeDialog();\n" +
"            }\n" +
"        })\n" +
"    </event:onclick>\n" +
"</ui:button>\n" +
"\n" +
"<ui:button text=\"alert带标题和按钮\">\n" +
"    <event:onclick>\n" +
"        stk.alert(\"你好\",\"这里是标题\",{\n" +
"            \"确认\":function(){\n" +
"                alert(\"确认\");\n" +
"                stk.closeDialog();\n" +
"            }\n" +
"        })\n" +
"    </event:onclick>\n" +
"</ui:button>\n" +
"<br><br>\n" +
"<ui:button text=\"confirm\">\n" +
"    <event:onclick>\n" +
"        stk.confirm(\"确认吗\",function(){\n" +
"            alert(\"确认\");\n" +
"        })\n" +
"    </event:onclick>\n" +
"</ui:button>" +
"<br><br>\n" +
"<ui:button text=\"提示\">\n" +
"    <event:onclick>\n" +
"        stk.info(\"你好\")\n" +
"    </event:onclick>\n" +
"</ui:button>\n" +
"<ui:button text=\"警告\">\n" +
"    <event:onclick>\n" +
"        stk.warn(\"你好\")\n" +
"    </event:onclick>\n" +
"</ui:button>\n" +
"<ui:button text=\"错误\">\n" +
"    <event:onclick>\n" +
"        stk.error(\"你好\")\n" +
"    </event:oncl"));%>
    </pre>
    </layout:fieldSet>
</layout:tab>
</layout:tabs>
</body>
</html>