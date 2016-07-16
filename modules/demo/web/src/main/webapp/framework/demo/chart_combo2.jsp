<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>组合图表2</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;组合图表2</b></div>
<layout:tabs>
<layout:tab title="范例">
    <chart:define id="combo" name="combo" dataVar="result" clazz="com.sinitek.spirit.webcontrol.demo.DemoChart" width="100%" height="400px">
        <chart:title text="组合图表范例2"/>

        <chart:xAxis categories="['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月']">
            <chart:title text="月份"/>
        </chart:xAxis>

        yAxis: [{//主yAxis
                labels: {
                    formatter: function() {
                        return this.value +'°C';
                    },
                    style: {
                        color: '#89A54E'
                    }
                },
                title: {
                    text: '温度',
                    style: {
                        color: '#89A54E'
                    }
                },
                opposite: true
            }, { // 第二个yAxis
                gridLineWidth: 0,
                title: {
                    text: '降水',
                    style: {
                        color: '#4572A7'
                    }
                },
                labels: {
                    formatter: function() {
                        return this.value +' mm';
                    },
                    style: {
                        color: '#4572A7'
                    }
                }
            }, { // 第三个yAxis
                gridLineWidth: 0,
                title: {
                    text: '海平面气压',
                    style: {
                        color: '#AA4643'
                    }
                },
                labels: {
                    formatter: function() {
                        return this.value +' mb';
                    },
                    style: {
                        color: '#AA4643'
                    }
                },
                opposite: true
        }],

        <chart:tooltip>
            formatter: function() {
                var unit = {
                    '降雨量': 'mm',
                    '温度': '°C',
                    '海平面气压': 'mb'
                }[this.series.name];
                return ''+
                    this.x +': '+ this.y +' '+ unit;
            },
        </chart:tooltip>

        <chart:legend layout="vertical" align="left" verticalAlign="top" x="120" y="40" floating="true"/>

        <chart:series>
                    [{
						name: '降雨量',
						color: '#4572A7',
						type: 'column',
						yAxis: 1,
						data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]

					}, {
						name: '海平面气压',
						type: 'spline',
						color: '#AA4643',
						yAxis: 2,
						data: [1016, 1016, 1015.9, 1015.5, 1012.3, 1009.5, 1009.6, 1010.2, 1013.1, 1016.9, 1018.2, 1016.7],
						marker: {
							enabled: false
						},
						dashStyle: 'shortdot'

					}, {
						name: '温度',
						color: '#89A54E',
						type: 'spline',
						data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
					}]
        </chart:series>
    </chart:define>

    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    <chart:define id=\"combo\" name=\"combo\" dataVar=\"result\" clazz=\"com.sinitek.spirit.webcontrol.demo.DemoChart\" width=\"100%\" height=\"400px\">\n" +
        "        <chart:title text=\"组合图表范例2\"/>\n" +
        "\n" +
        "        <chart:xAxis categories=\"['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月']\">\n" +
        "            <chart:title text=\"月份\"/>\n" +
        "        </chart:xAxis>\n" +
        "\n" +
        "        yAxis: [{//主yAxis\n" +
        "                labels: {\n" +
        "                    formatter: function() {\n" +
        "                        return this.value +'°C';\n" +
        "                    },\n" +
        "                    style: {\n" +
        "                        color: '#89A54E'\n" +
        "                    }\n" +
        "                },\n" +
        "                title: {\n" +
        "                    text: '温度',\n" +
        "                    style: {\n" +
        "                        color: '#89A54E'\n" +
        "                    }\n" +
        "                },\n" +
        "                opposite: true\n" +
        "            }, { // 第二个yAxis\n" +
        "                gridLineWidth: 0,\n" +
        "                title: {\n" +
        "                    text: '降水',\n" +
        "                    style: {\n" +
        "                        color: '#4572A7'\n" +
        "                    }\n" +
        "                },\n" +
        "                labels: {\n" +
        "                    formatter: function() {\n" +
        "                        return this.value +' mm';\n" +
        "                    },\n" +
        "                    style: {\n" +
        "                        color: '#4572A7'\n" +
        "                    }\n" +
        "                }\n" +
        "            }, { // 第三个yAxis\n" +
        "                gridLineWidth: 0,\n" +
        "                title: {\n" +
        "                    text: '海平面气压',\n" +
        "                    style: {\n" +
        "                        color: '#AA4643'\n" +
        "                    }\n" +
        "                },\n" +
        "                labels: {\n" +
        "                    formatter: function() {\n" +
        "                        return this.value +' mb';\n" +
        "                    },\n" +
        "                    style: {\n" +
        "                        color: '#AA4643'\n" +
        "                    }\n" +
        "                },\n" +
        "                opposite: true\n" +
        "        }],\n" +
        "\n" +
        "        <chart:tooltip>\n" +
        "            formatter: function() {\n" +
        "                var unit = {\n" +
        "                    '降雨量': 'mm',\n" +
        "                    '温度': '°C',\n" +
        "                    '海平面气压': 'mb'\n" +
        "                }[this.series.name];\n" +
        "                return ''+\n" +
        "                    this.x +': '+ this.y +' '+ unit;\n" +
        "            },\n" +
        "        </chart:tooltip>\n" +
        "\n" +
        "        <chart:legend layout=\"vertical\" align=\"left\" verticalAlign=\"top\" x=\"120\" y=\"40\" floating=\"true\"/>\n" +
        "\n" +
        "        <chart:series>\n" +
        "                    [{\n" +
        "\t\t\t\t\t\tname: '降雨量',\n" +
        "\t\t\t\t\t\tcolor: '#4572A7',\n" +
        "\t\t\t\t\t\ttype: 'column',\n" +
        "\t\t\t\t\t\tyAxis: 1,\n" +
        "\t\t\t\t\t\tdata: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]\n" +
        "\n" +
        "\t\t\t\t\t}, {\n" +
        "\t\t\t\t\t\tname: '海平面气压',\n" +
        "\t\t\t\t\t\ttype: 'spline',\n" +
        "\t\t\t\t\t\tcolor: '#AA4643',\n" +
        "\t\t\t\t\t\tyAxis: 2,\n" +
        "\t\t\t\t\t\tdata: [1016, 1016, 1015.9, 1015.5, 1012.3, 1009.5, 1009.6, 1010.2, 1013.1, 1016.9, 1018.2, 1016.7],\n" +
        "\t\t\t\t\t\tmarker: {\n" +
        "\t\t\t\t\t\t\tenabled: false\n" +
        "\t\t\t\t\t\t},\n" +
        "\t\t\t\t\t\tdashStyle: 'shortdot'\n" +
        "\n" +
        "\t\t\t\t\t}, {\n" +
        "\t\t\t\t\t\tname: '温度',\n" +
        "\t\t\t\t\t\tcolor: '#89A54E',\n" +
        "\t\t\t\t\t\ttype: 'spline',\n" +
        "\t\t\t\t\t\tdata: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]\n" +
        "\t\t\t\t\t}]\n" +
        "        </chart:series>\n" +
        "    </chart:define>"));%>
    </pre>
    java类：
    <pre name="code" class="java">
        //代码省略，用js数据代替，请组合成类似java对象
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