<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>柱状图表</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;柱状图表 - 标签旋转</b></div>
<layout:tabs>
<layout:tab title="范例">
    <chart:define id="column_rotation" name="column_rotation" type="column" dataVar="result" clazz="com.sinitek.spirit.webcontrol.demo.DemoChart" width="100%" height="400px">
        <chart:title text="每月平均降雨量"/>

        <chart:subtitle text="柱状图表 - 标签旋转范例"/>

        <chart:xAxis categories="['2011-01','2011-02','2011-03','2011-04','2011-05','2011-06','2011-07','2011-08','2011-09','2011-10','2011-11','2011-12']">
            <chart:title text="年月"/>
            <chart:labels rotation="-45" y="25">
                style: {
                    font: 'normal 12px 宋体'
                },
            </chart:labels>
        </chart:xAxis>

        <chart:yAxis>
            <chart:title text="降雨量（毫升）"/>
        </chart:yAxis>

        <chart:legend layout="vertical" align="right" x="-10" y="-180"/>

        <chart:tooltip>
            formatter: function() {
                return '<b>'+ this.series.name +'</b><br/>'+ this.x +': '+ this.y + '（毫升）';
            },
        </chart:tooltip>

        <chart:series>
            [{
                name: '降雨量',
                data: result.data,
                dataLabels: {
                    enabled: true,
                    rotation: -90,
                    color: '#FFFFFF',
                    align: 'right',
                    x: -3,
                    y: 10,
                    formatter: function() {
                        return this.y;
                    }
                }
            }]
        </chart:series>
    </chart:define>

    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    <chart:define id=\"column_rotation\" name=\"column_rotation\" type=\"column\" dataVar=\"result\" clazz=\"com.sinitek.spirit.webcontrol.demo.DemoChart\" width=\"100%\" height=\"400px\">\n" +
        "        <chart:title text=\"每月平均降雨量\"/>\n" +
        "\n" +
        "        <chart:subtitle text=\"柱状图表 - 标签旋转范例\"/>\n" +
        "\n" +
        "        <chart:xAxis categories=\"['2011-01','2011-02','2011-03','2011-04','2011-05','2011-06','2011-07','2011-08','2011-09','2011-10','2011-11','2011-12']\">\n" +
        "            <chart:title text=\"年月\"/>\n" +
        "            <chart:labels rotation=\"-45\" y=\"25\">\n" +
        "                style: {\n" +
        "                    font: 'normal 12px 宋体'\n" +
        "                },\n" +
        "            </chart:labels>\n" +
        "        </chart:xAxis>\n" +
        "\n" +
        "        <chart:yAxis>\n" +
        "            <chart:title text=\"降雨量（毫升）\"/>\n" +
        "        </chart:yAxis>\n" +
        "\n" +
        "        <chart:legend layout=\"vertical\" align=\"right\" x=\"-10\" y=\"-180\"/>\n" +
        "\n" +
        "        <chart:tooltip>\n" +
        "            formatter: function() {\n" +
        "                return '<b>'+ this.series.name +'</b><br/>'+ this.x +': '+ this.y + '（毫升）';\n" +
        "            },\n" +
        "        </chart:tooltip>\n" +
        "\n" +
        "        <chart:series>\n" +
        "            [{\n" +
        "                name: '降雨量',\n" +
        "                data: result.data,\n" +
        "                dataLabels: {\n" +
        "                    enabled: true,\n" +
        "                    rotation: -90,\n" +
        "                    color: '#FFFFFF',\n" +
        "                    align: 'right',\n" +
        "                    x: -3,\n" +
        "                    y: 10,\n" +
        "                    formatter: function() {\n" +
        "                        return this.y;\n" +
        "                    }\n" +
        "                }\n" +
        "            }]\n" +
        "        </chart:series>\n" +
        "    </chart:define>"));%>
    </pre>
    java类：
    <pre name="code" class="java">
<%out.print( HtmlUtils.htmlEscape("public class DemoChart implements IChartAware {\n" +
                    "    public Object getChartResult(Map<String, String> options, Map params, HttpServletRequest request) throws Exception {\n" +
                    "        Map result = new HashMap();\n" +
                    "\n" +
                    "        result.put(\"data\",new Double[]{49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4});\n" +
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