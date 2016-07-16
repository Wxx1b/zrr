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
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;饼状图表 - 面包圈</b></div>
<layout:tabs>
<layout:tab title="范例">
    <chart:define id="pie_donut" name="pie_donut" type="pie" dataVar="result" clazz="com.sinitek.spirit.webcontrol.demo.DemoChart" width="100%" height="400px">
        <chart:title text="浏览器市场份额"/>

        <chart:subtitle text="饼状图表 - 面包圈范例"/>

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
                return '<b>'+ this.series.name +'</b><br/>'+ this.point.name +': '+ this.y +' %';
            },
        </chart:tooltip>

        <chart:series>
            [{
                type: 'pie',
                name: '2008',
                size: '45%',
                innerSize: '20%',
                data: result.data2008,
                dataLabels: {
                    enabled: false
                }
              }, {
                type: 'pie',
                name: '2010',
                innerSize: '45%',
                data: result.data2010,
                dataLabels: {
                    enabled: true,
                    color: '#000000',
                    connectorColor: '#000000'
                }
            }]
        </chart:series>
    </chart:define>

    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    <chart:define id=\"pie\" name=\"pie\" type=\"pie\" dataVar=\"result\" clazz=\"com.sinitek.spirit.webcontrol.demo.DemoChart\" width=\"100%\" height=\"400px\">\n" +
        "        <chart:define id=\"pie_donut\" name=\"pie_donut\" type=\"pie\" dataVar=\"result\" clazz=\"com.sinitek.spirit.webcontrol.demo.DemoChart\" width=\"100%\" height=\"400px\">\n" +
        "        <chart:title text=\"浏览器市场份额\"/>\n" +
        "\n" +
        "        <chart:subtitle text=\"饼状图表 - 面包圈范例\"/>\n" +
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
        "                return '<b>'+ this.series.name +'</b><br/>'+ this.point.name +': '+ this.y +' %';\n" +
        "            },\n" +
        "        </chart:tooltip>\n" +
        "\n" +
        "        <chart:series>\n" +
        "            [{\n" +
        "                type: 'pie',\n" +
        "                name: '2008',\n" +
        "                size: '45%',\n" +
        "                innerSize: '20%',\n" +
        "                data: result.data2008,\n" +
        "                dataLabels: {\n" +
        "                    enabled: false\n" +
        "                }\n" +
        "              }, {\n" +
        "                type: 'pie',\n" +
        "                name: '2010',\n" +
        "                innerSize: '45%',\n" +
        "                data: result.data2010,\n" +
        "                dataLabels: {\n" +
        "                    enabled: true,\n" +
        "                    color: '#000000',\n" +
        "                    connectorColor: '#000000'\n" +
        "                }\n" +
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
                    "        Map result = new HashMap();\n" +
                    "\n" +
                    "        List result2008 = new ArrayList();\n" +
                    "\n" +
                    "        Map map1 = new HashMap();\n" +
                    "        map1.put(\"name\",\"Firefox\");\n" +
                    "        map1.put(\"y\",21.71);\n" +
                    "        map1.put(\"color\",\"#4572A7\");\n" +
                    "\n" +
                    "        Map map2 = new HashMap();\n" +
                    "        map2.put(\"name\",\"IE\");\n" +
                    "        map2.put(\"y\",54.27);\n" +
                    "        map2.put(\"color\",\"#AA4643\");\n" +
                    "\n" +
                    "        Map map3 = new HashMap();\n" +
                    "        map3.put(\"name\",\"Safari\");\n" +
                    "        map3.put(\"y\",7.28);\n" +
                    "        map3.put(\"color\",\"#89A54E\");\n" +
                    "\n" +
                    "        Map map4 = new HashMap();\n" +
                    "        map4.put(\"name\",\"Opera\");\n" +
                    "        map4.put(\"y\",3.30);\n" +
                    "        map4.put(\"color\",\"#80699B\");\n" +
                    "\n" +
                    "        Map map5 = new HashMap();\n" +
                    "        map5.put(\"name\",\"Others\");\n" +
                    "        map5.put(\"y\",0.9);\n" +
                    "        map5.put(\"color\",\"#3D96AE\");\n" +
                    "\n" +
                    "        Map map6 = new HashMap();\n" +
                    "        map6.put(\"name\",\"Chrome\");\n" +
                    "        map6.put(\"y\",12.52);\n" +
                    "        map6.put(\"color\",\"#DB843D\");\n" +
                    "\n" +
                    "        result2008.add(map1);\n" +
                    "        result2008.add(map2);\n" +
                    "        result2008.add(map3);\n" +
                    "        result2008.add(map4);\n" +
                    "        result2008.add(map5);\n" +
                    "        result2008.add(map6);\n" +
                    "\n" +
                    "        List result2010 = new ArrayList();\n" +
                    "\n" +
                    "        Map map7 = new HashMap();\n" +
                    "        map7.put(\"name\",\"Firefox\");\n" +
                    "        map7.put(\"y\",31.71);\n" +
                    "        map7.put(\"color\",\"#4572A7\");\n" +
                    "\n" +
                    "        Map map8 = new HashMap();\n" +
                    "        map8.put(\"name\",\"IE\");\n" +
                    "        map8.put(\"y\",46.27);\n" +
                    "        map8.put(\"color\",\"#AA4643\");\n" +
                    "\n" +
                    "        Map map9 = new HashMap();\n" +
                    "        map9.put(\"name\",\"Safari\");\n" +
                    "        map9.put(\"y\",5.28);\n" +
                    "        map9.put(\"color\",\"#89A54E\");\n" +
                    "\n" +
                    "        Map map10 = new HashMap();\n" +
                    "        map10.put(\"name\",\"Opera\");\n" +
                    "        map10.put(\"y\",0.30);\n" +
                    "        map10.put(\"color\",\"#80699B\");\n" +
                    "\n" +
                    "        Map map11 = new HashMap();\n" +
                    "        map11.put(\"name\",\"Others\");\n" +
                    "        map11.put(\"y\",0.9);\n" +
                    "        map11.put(\"color\",\"#3D96AE\");\n" +
                    "\n" +
                    "        Map map12 = new HashMap();\n" +
                    "        map12.put(\"name\",\"Chrome\");\n" +
                    "        map12.put(\"y\",15.52);\n" +
                    "        map12.put(\"color\",\"#DB843D\");\n" +
                    "\n" +
                    "        result2010.add(map7);\n" +
                    "        result2010.add(map8);\n" +
                    "        result2010.add(map9);\n" +
                    "        result2010.add(map10);\n" +
                    "        result2010.add(map11);\n" +
                    "        result2010.add(map12);\n" +
                    "\n" +
                    "        result.put(\"data2008\",result2008);\n" +
                    "        result.put(\"data2010\",result2010);\n" +
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