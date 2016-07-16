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
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;线状图表 - 自定义图标</b></div>
<layout:tabs>
<layout:tab title="范例">
    <chart:define id="line" name="line_icon" type="line" dataVar="result" clazz="com.sinitek.spirit.webcontrol.demo.DemoChart" width="100%" height="400px">
        <chart:title text="每月平均气温"/>

        <chart:subtitle text="线状图表 - 自定义图标范例"/>

        <chart:xAxis categories="['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月']">
            <chart:title text="月份"/>
        </chart:xAxis>

        <chart:yAxis>
            <chart:title text="温度（Ｃ°）"/>
        </chart:yAxis>

        <chart:legend layout="vertical" align="right" x="-10" y="-180"/>

        <chart:tooltip>
            formatter: function() {
            return '<b>'+ this.series.name +'</b><br/>'+ this.x +': '+ this.y + '（Ｃ°）';
            },
        </chart:tooltip>

        <chart:series>
            result.data
        </chart:series>
    </chart:define>

    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    <chart:define id=\"line\" name=\"line_icon\" type=\"line\" dataVar=\"result\" clazz=\"com.sinitek.spirit.webcontrol.demo.DemoChart\" width=\"100%\" height=\"400px\">\n" +
        "        <chart:title text=\"每月平均气温\"/>\n" +
        "\n" +
        "        <chart:subtitle text=\"线状图表 - 自定义图标范例\"/>\n" +
        "\n" +
        "        <chart:xAxis categories=\"['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月']\">\n" +
        "            <chart:title text=\"月份\"/>\n" +
        "        </chart:xAxis>\n" +
        "\n" +
        "        <chart:yAxis>\n" +
        "            <chart:title text=\"温度（Ｃ°）\"/>\n" +
        "        </chart:yAxis>\n" +
        "\n" +
        "        <chart:legend layout=\"vertical\" align=\"right\" x=\"-10\" y=\"-180\"/>\n" +
        "\n" +
        "        <chart:tooltip>\n" +
        "            return '<b>'+ this.series.name +'</b><br/>'+ this.x +': '+ this.y + '（Ｃ°）';\n" +
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
                    "        map1.put(\"name\",\"上海\");\n" +
                    "        JSONObject sun =  JSONObject.fromObject(\"{y: 32.5,marker: {symbol: 'url(\" + request.getContextPath() + \"/framework/css/default/images/icon/sun.png)'}}\");\n" +
                    "        map1.put(\"data\",new Object[]{7.0, 6.9, 9.5, 14.5, 18.2, 25.5, 30.2,sun , 29.3, 20.3, 13.9, 9.6});\n" +
                    "\n" +
                    "        Map map2 = new HashMap();\n" +
                    "        map2.put(\"name\",\"北京\");\n" +
                    "        JSONObject snow = JSONObject.fromObject( \"{y: -7.0,marker: {symbol: 'url(\"+request.getContextPath()+\"/framework/css/default/images/icon/snow.png)'}}\" );\n" +
                    "        map2.put(\"data\",new Object[]{snow, -6.9, 3.5, 8.5, 12.2, 20.5, 28.2, 30.5, 24.3, 12.2, 4.9, 0.6});\n" +
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