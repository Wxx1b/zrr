<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>柱状图表 - 事件</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;柱状图表 - 事件</b></div>
<layout:tabs>
<layout:tab title="范例">
    <chart:define id="column" name="column" type="column" dataVar="result" clazz="com.sinitek.spirit.webcontrol.demo.DemoChart" width="100%" height="400px">
        <chart:title text="每月平均降雨量"/>

        <chart:subtitle text="柱状图表 - 事件范例"/>

        <chart:xAxis categories="['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月']">
            <chart:title text="月份"/>
        </chart:xAxis>

        <chart:yAxis>
            <chart:title text="降雨量（毫升）"/>
        </chart:yAxis>

        <chart:legend layout="vertical" align="right" x="-10" y="-180"/>

        <chart:plotOptions>
            <chart:plotOption type="column" cursor="pointer">
                events: {
                    click: function(e) {
                        alert(e.point.category+","+e.point.config);
                    }
                },
            </chart:plotOption>
        </chart:plotOptions>

        <chart:tooltip>
            formatter: function() {
                return '<b>'+ this.series.name +'</b><br/>'+ this.x +': '+ this.y + '（毫升）';
            },
        </chart:tooltip>

        <chart:series>
            result.data
        </chart:series>
    </chart:define>

    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    <chart:define id=\"column\" name=\"column\" type=\"column\" dataVar=\"result\" clazz=\"com.sinitek.spirit.webcontrol.demo.DemoChart\" width=\"100%\" height=\"400px\">\n" +
        "        <chart:title text=\"每月平均降雨量\"/>\n" +
        "\n" +
        "        <chart:subtitle text=\"柱状图表范例\"/>\n" +
        "\n" +
        "        <chart:xAxis categories=\"['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月']\">\n" +
        "            <chart:title text=\"月份\"/>\n" +
        "        </chart:xAxis>\n" +
        "\n" +
        "        <chart:yAxis>\n" +
        "            <chart:title text=\"降雨量（毫升）\"/>\n" +
        "        </chart:yAxis>\n" +
        "\n" +
        "        <chart:legend layout=\"vertical\" align=\"right\" x=\"-10\" y=\"-180\"/>\n" +
        "\n" +
        "        <chart:plotOptions>\n" +
        "            <chart:plotOption type=\"column\"/>\n" +
        "        </chart:plotOptions>\n" +
        "\n" +
        "        <chart:tooltip>\n" +
        "            formatter: function() {\n" +
        "                return '<b>'+ this.series.name +'</b><br/>'+ this.x +': '+ this.y + '（毫升）';\n" +
        "            },\n" +
        "        </chart:tooltip>\n" +
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
                    "        map1.put(\"name\",\"东京\");\n" +
                    "        map1.put(\"data\",new Double[]{49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4});\n" +
                    "\n" +
                    "        Map map2 = new HashMap();\n" +
                    "        map2.put(\"name\",\"纽约\");\n" +
                    "        map2.put(\"data\",new Double[]{83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3});\n" +
                    "\n" +
                    "        Map map3 = new HashMap();\n" +
                    "        map3.put(\"name\",\"伦敦\");\n" +
                    "        map3.put(\"data\",new Double[]{48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2});\n" +
                    "\n" +
                    "        data.add(map1);\n" +
                    "        data.add(map2);\n" +
                    "        data.add(map3);\n" +
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