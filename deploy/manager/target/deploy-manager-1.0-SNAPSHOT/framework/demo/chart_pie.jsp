<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>饼状图表</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;饼状图表</b></div>
<layout:tabs>
<layout:tab title="范例">
    <chart:define id="pie" name="pie" type="pie" dataVar="result" clazz="com.sinitek.spirit.webcontrol.demo.DemoChart" width="100%" height="400px">
        <chart:title text="浏览器市场份额:2011年5月"/>

        <chart:subtitle text="饼状图表范例"/>

        <chart:plotOptions>
            <chart:plotOption type="pie" allowPointSelect="true" cursor="pointer">
                dataLabels: {
                    enabled: true,
                    formatter: function() {
                         return '<b>'+ this.point.name +'</b>: '+ this.y +' %';
                    }
                },
            </chart:plotOption>
        </chart:plotOptions>

        <chart:tooltip>
            formatter: function() {
                return '<b>'+ this.point.name +'</b>: '+ this.y +' %';
            },
        </chart:tooltip>

        <chart:series>
            [{
                data:result
            }]
        </chart:series>
    </chart:define>

    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    <chart:define id=\"pie\" name=\"pie\" type=\"pie\" dataVar=\"result\" clazz=\"com.sinitek.spirit.webcontrol.demo.DemoChart\" width=\"100%\" height=\"400px\">\n" +
        "        <chart:title text=\"浏览器市场份额:2011年5月\"/>\n" +
        "\n" +
        "        <chart:subtitle text=\"饼状图表范例\"/>\n" +
        "\n" +
        "        <chart:plotOptions>\n" +
        "            <chart:plotOption type=\"pie\" allowPointSelect=\"true\" cursor=\"pointer\">\n" +
        "                dataLabels: {\n" +
        "                    enabled: true,\n" +
        "                    formatter: function() {\n" +
        "                         return '<b>'+ this.point.name +'</b>: '+ this.y +' %';\n" +
        "                    }\n" +
        "                },\n" +
        "            </chart:plotOption>\n" +
        "        </chart:plotOptions>\n" +
        "\n" +
        "        <chart:tooltip>\n" +
        "            formatter: function() {\n" +
        "                return '<b>'+ this.point.name +'</b>: '+ this.y +' %';\n" +
        "            },\n" +
        "        </chart:tooltip>\n" +
        "\n" +
        "        <chart:series>\n" +
        "            [{\n" +
        "                data:result\n" +
        "            }]\n" +
        "        </chart:series>\n" +
        "    </chart:define>"));%>
    </pre>
    java类：
    <pre name="code" class="java">
<%out.print( HtmlUtils.htmlEscape("public class DemoChart implements IChartAware {\n" +
                    "    public Object getChartResult(Map<String, String> options, Map params, HttpServletRequest request) throws Exception {\n" +
                    "        List result = new ArrayList();\n" +
        "\n" +
        "        Map map1 = new HashMap();\n" +
        "        map1.put(\"name\",\"Firefox\");\n" +
        "        map1.put(\"y\",21.71);\n" +
        "\n" +
        "        Map map2 = new HashMap();\n" +
        "        map2.put(\"name\",\"IE\");\n" +
        "        map2.put(\"y\",54.27);\n" +
        "\n" +
        "        Map map3 = new HashMap();\n" +
        "        map3.put(\"name\",\"Safari\");\n" +
        "        map3.put(\"y\",7.28);\n" +
        "\n" +
        "        Map map4 = new HashMap();\n" +
        "        map4.put(\"name\",\"Opera\");\n" +
        "        map4.put(\"y\",3.30);\n" +
        "\n" +
        "        Map map5 = new HashMap();\n" +
        "        map5.put(\"name\",\"Others\");\n" +
        "        map5.put(\"y\",0.9);\n" +
        "\n" +
        "        Map map6 = new HashMap();\n" +
        "        map6.put(\"name\",\"Chrome\");\n" +
        "        map6.put(\"y\",12.52);\n" +
        "\n" +
        "        result.add(map1);\n" +
        "        result.add(map2);\n" +
        "        result.add(map3);\n" +
        "        result.add(map4);\n" +
        "        result.add(map5);\n" +
        "        result.add(map6);\n" +
        "\n" +
        "        return result;\n" +
                    "    }\n" +
                    "}"));%>
    </pre>
    </layout:fieldSet>
</layout:tab>
<layout:tab title="参数">
    <a href="http://www.highcharts.com/ref" target="_blank">官方文档</a>
</layout:tab>
<layout:tab title="事件">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="event/event_component.jsp" %>
</layout:tab>
<layout:tab title="函数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="function/func_component.jsp" %>
</layout:tab>
</layout:tabs>
</body>
</html>