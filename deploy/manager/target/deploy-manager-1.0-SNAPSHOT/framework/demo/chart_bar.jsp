<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>线状图表</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;横木图表</b></div>
<layout:tabs>
<layout:tab title="范例">
    <chart:define id="bar" name="bar" type="bar" dataVar="result" clazz="com.sinitek.spirit.webcontrol.demo.DemoChart" width="100%" height="400px">
        <chart:title text="世界人口图"/>

        <chart:subtitle text="横木图表范例"/>

        <chart:xAxis categories="['非洲', '美洲', '亚洲', '欧洲', '大洋洲']">
            <chart:title text="大洲"/>
        </chart:xAxis>

        <chart:yAxis>
            <chart:title text="人口(百万)"/>
        </chart:yAxis>

        <chart:plotOptions>
            <chart:plotOption type="bar">
                dataLabels: {
                    enabled: true
                },
            </chart:plotOption>
        </chart:plotOptions>

        <chart:legend layout="vertical" align="right" x="-10" y="-180"/>

        <chart:tooltip>
            formatter: function() {
                return '<b>'+ this.series.name +'</b><br/>'+ this.y +  '(百万)';
            },
        </chart:tooltip>

        <chart:series>
            result.data
        </chart:series>
    </chart:define>

    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    <chart:define id=\"line\" name=\"bar\" type=\"bar\" dataVar=\"result\" clazz=\"com.sinitek.spirit.webcontrol.demo.DemoChart\" width=\"100%\" height=\"400px\">\n" +
        "        <chart:title text=\"世界人口图\"/>\n" +
        "\n" +
        "        <chart:subtitle text=\"横木图表范例\"/>\n" +
        "\n" +
        "        <chart:xAxis categories=\"['非洲', '美洲', '亚洲', '欧洲', '大洋洲']\">\n" +
        "            <chart:title text=\"大洲\"/>\n" +
        "        </chart:xAxis>\n" +
        "\n" +
        "        <chart:yAxis>\n" +
        "            <chart:title text=\"人口(百万)\"/>\n" +
        "        </chart:yAxis>\n" +
        "\n" +
        "        <chart:plotOptions>\n" +
        "            <chart:plotOption type=\"bar\">\n" +
        "                dataLabels: {\n" +
        "                    enabled: true\n" +
        "                },\n" +
        "            </chart:plotOption>\n" +
        "        </chart:plotOptions>\n" +
        "\n" +
        "        <chart:legend layout=\"vertical\" align=\"right\" x=\"-10\" y=\"-180\"/>\n" +
        "\n" +
        "        <chart:tooltip>\n" +
        "            return '<b>'+ this.series.name +'</b><br/>'+ this.y +  '(百万)';\n" +
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
                    "        map1.put(\"name\",\"1800年\");\n" +
                    "        map1.put(\"data\",new Integer[]{107,31,635,203,2});\n" +
                    "\n" +
                    "        Map map2 = new HashMap();\n" +
                    "        map2.put(\"name\",\"1900年\");\n" +
                    "        map2.put(\"data\",new Integer[]{133,156,497,408,6});\n" +
                    "\n" +
                    "        Map map3 = new HashMap();\n" +
                    "        map3.put(\"name\",\"2008年\");\n" +
                    "        map3.put(\"data\",new Integer[]{973,194,4054,732,34});\n" +
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