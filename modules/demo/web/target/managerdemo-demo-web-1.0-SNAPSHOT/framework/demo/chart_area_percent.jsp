<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>面积图表</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;面积图表 - 百分比</b></div>
<layout:tabs>
<layout:tab title="范例">
    <chart:define id="area_percent" name="area_percent" type="area" dataVar="result" clazz="com.sinitek.spirit.webcontrol.demo.DemoChart" width="100%" height="400px">
        <chart:title text="世界人口百分比图"/>

        <chart:subtitle text="面积图表 - 百分比范例"/>

        <chart:xAxis>
            <chart:title text="年份"/>
            categories:result.categories,
        </chart:xAxis>

        <chart:yAxis>
            <chart:title text="百分比"/>
        </chart:yAxis>

        <chart:tooltip>
            formatter: function() {
                return ''+ this.x +': '+ Highcharts.numberFormat(this.percentage, 1) +'% ('+ Highcharts.numberFormat(this.y, 0, ',') +' 百万)';
            },
        </chart:tooltip>

        <chart:plotOptions>
            <chart:plotOption type="area" stacking="percent"/>
        </chart:plotOptions>

        <chart:series>
            result.data
        </chart:series>
    </chart:define>

    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    <chart:define id=\"area\" name=\"area\" type=\"area\" dataVar=\"result\" clazz=\"com.sinitek.spirit.webcontrol.demo.DemoChart\" width=\"100%\" height=\"400px\">\n" +
        "        <chart:title text=\"美国和俄罗斯核武器存储量\"/>\n" +
        "\n" +
        "        <chart:subtitle text=\"面积图表范例\"/>\n" +
        "\n" +
        "        <chart:xAxis>\n" +
        "            <chart:title text=\"年份\"/>\n" +
        "            <chart:labels>\n" +
        "                formatter: function() {\n" +
        "                    return this.value;\n" +
        "                 },\n" +
        "            </chart:labels>\n" +
        "        </chart:xAxis>\n" +
        "\n" +
        "        <chart:yAxis>\n" +
        "            <chart:title text=\"核武器存储量\"/>\n" +
        "            <chart:labels>\n" +
        "                formatter: function() {\n" +
        "                    return this.value / 1000 +'k';\n" +
        "                },\n" +
        "            </chart:labels>\n" +
        "        </chart:yAxis>\n" +
        "\n" +
        "        <chart:tooltip>\n" +
        "            return this.series.name +' 拥有 <b>'+ Highcharts.numberFormat(this.y, 0) +'</b><br/>在'+ this.x+'年';\n" +
        "        </chart:tooltip>\n" +
        "\n" +
        "        <chart:plotOptions>\n" +
        "            <chart:plotOption type=\"area\" stacking=\"percent\"/>\n" +
        "        </chart:plotOptions>\n" +
        "\n" +
        "        <chart:series>\n" +
        "            result.data\n" +
        "        </chart:series>\n" +
        "    </chart:define>"));%>
    </pre>
    java类：
    <pre name="code" class="java">
<%out.print( HtmlUtils.htmlEscape("public class DemoChart implements IChartAware {\n" +
                    "    public Object getChartResult(Map<String, String> options, Map params, HttpServletRequest request) throws Exception {\n" +
                    "        Map result = new HashMap();\n" +
        "        List data = new ArrayList();\n" +
        "\n" +
        "        Map map1 = new HashMap();\n" +
        "        map1.put(\"name\",\"美国\");\n" +
        "        map1.put(\"data\",new Integer[]{null, null, null, null, null, 6 , 11, 32, 110, 235, 369, 640,\n" +
        "            1005, 1436, 2063, 3057, 4618, 6444, 9822, 15468, 20434, 24126,\n" +
        "            27387, 29459, 31056, 31982, 32040, 31233, 29224, 27342, 26662,\n" +
        "            26956, 27912, 28999, 28965, 27826, 25579, 25722, 24826, 24605,\n" +
        "            24304, 23464, 23708, 24099, 24357, 24237, 24401, 24344, 23586,\n" +
        "            22380, 21004, 17287, 14747, 13076, 12555, 12144, 11009, 10950,\n" +
        "            10871, 10824, 10577, 10527, 10475, 10421, 10358, 10295, 10104});\n" +
        "\n" +
        "        Map map2 = new HashMap();\n" +
        "        map2.put(\"name\",\"俄罗斯\");\n" +
        "        map2.put(\"data\",new Integer[]{null, null, null, null, null, null, null , null , null ,null,\n" +
        "         5, 25, 50, 120, 150, 200, 426, 660, 869, 1060, 1605, 2471, 3322,\n" +
        "         4238, 5221, 6129, 7089, 8339, 9399, 10538, 11643, 13092, 14478,\n" +
        "         15915, 17385, 19055, 21205, 23044, 25393, 27935, 30062, 32049,\n" +
        "         33952, 35804, 37431, 39197, 45000, 43000, 41000, 39000, 37000,\n" +
        "         35000, 33000, 31000, 29000, 27000, 25000, 24000, 23000, 22000,\n" +
        "         21000, 20000, 19000, 18000, 18000, 17000, 16000});\n" +
        "\n" +
        "        data.add(map1);\n" +
        "        data.add(map2);\n" +
        "\n" +
        "        result.put(\"data\",data);\n" +
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