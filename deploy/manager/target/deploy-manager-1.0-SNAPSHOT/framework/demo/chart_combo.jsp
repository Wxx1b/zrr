<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>组合图表</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;组合图表</b></div>
<layout:tabs>
<layout:tab title="范例">
    <chart:define id="combo" name="combo" dataVar="result" clazz="com.sinitek.spirit.webcontrol.demo.DemoChart" width="100%" height="400px">
        <chart:title text="组合图表范例"/>

        <chart:xAxis categories="['苹果', '橘子', '梨', '香蕉', '李子']"/>

        <chart:tooltip>
            formatter: function() {
                var s;
                if (this.point.name) { //饼图
                    s = ''+
                    this.point.name +': '+ this.y +' 个水果';
                } else {
                    s = ''+
                    this.x +': '+ this.y;
                }
                return s;
            },
        </chart:tooltip>

        <chart:labels>
            items: [{
                html: '水果总计',
                style: {
                    left: '40px',
                    top: '8px',
                    color: 'black'
                }
            }],
        </chart:labels>

        <chart:plotOptions>
            <chart:plotOption type="area" pointStart="1940">
                <chart:marker enabled="false" symbol="circle" radius="2">
                    states: {
                        hover: {
                            enabled: true
                        }
                    },
                </chart:marker>
            </chart:plotOption>
        </chart:plotOptions>

        <chart:series>
            [{
						type: 'column',
						name: '方佳玮',
						data: [3, 2, 1, 3, 4]
					}, {
						type: 'column',
						name: '何立勇',
						data: [2, 3, 5, 7, 6]
					}, {
						type: 'column',
						name: '刘晓翔',
						data: [4, 3, 3, 9, 0]
					}, {
						type: 'spline',
						name: '平均',
						data: [3, 2.67, 3, 6.33, 3.33]
					}, {
						type: 'pie',
						name: 'Total consumption',
						data: [{
							name: '方佳玮',
							y: 13,
							color: '#4572A7'
						}, {
							name: '何立勇',
							y: 23,
							color: '#AA4643'
						}, {
							name: '刘晓翔',
							y: 19,
							color: '#89A54E'
						}],
						center: [100, 80],
						size: 100,
						showInLegend: false,
						dataLabels: {
							enabled: false
						}
					}]
        </chart:series>
    </chart:define>

    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    <chart:define id=\"combo\" name=\"combo\" dataVar=\"result\" clazz=\"com.sinitek.spirit.webcontrol.demo.DemoChart\" width=\"100%\" height=\"400px\">\n" +
        "        <chart:title text=\"组合图表范例\"/>\n" +
        "\n" +
        "        <chart:xAxis categories=\"['苹果', '橘子', '梨', '香蕉', '李子']\"/>\n" +
        "\n" +
        "        <chart:tooltip>\n" +
        "            formatter: function() {\n" +
        "                var s;\n" +
        "                if (this.point.name) { //饼图\n" +
        "                    s = ''+\n" +
        "                    this.point.name +': '+ this.y +' 个水果';\n" +
        "                } else {\n" +
        "                    s = ''+\n" +
        "                    this.x +': '+ this.y;\n" +
        "                }\n" +
        "                return s;\n" +
        "            },\n" +
        "        </chart:tooltip>\n" +
        "\n" +
        "        <chart:labels>\n" +
        "            items: [{\n" +
        "                html: '水果总计',\n" +
        "                style: {\n" +
        "                    left: '40px',\n" +
        "                    top: '8px',\n" +
        "                    color: 'black'\n" +
        "                }\n" +
        "            }],\n" +
        "        </chart:labels>\n" +
        "\n" +
        "        <chart:plotOptions>\n" +
        "            <chart:plotOption type=\"area\" pointStart=\"1940\">\n" +
        "                <chart:marker enabled=\"false\" symbol=\"circle\" radius=\"2\">\n" +
        "                    states: {\n" +
        "                        hover: {\n" +
        "                            enabled: true\n" +
        "                        }\n" +
        "                    },\n" +
        "                </chart:marker>\n" +
        "            </chart:plotOption>\n" +
        "        </chart:plotOptions>\n" +
        "\n" +
        "        <chart:series>\n" +
        "            [{\n" +
        "\t\t\t\t\t\ttype: 'column',\n" +
        "\t\t\t\t\t\tname: '方佳玮',\n" +
        "\t\t\t\t\t\tdata: [3, 2, 1, 3, 4]\n" +
        "\t\t\t\t\t}, {\n" +
        "\t\t\t\t\t\ttype: 'column',\n" +
        "\t\t\t\t\t\tname: '何立勇',\n" +
        "\t\t\t\t\t\tdata: [2, 3, 5, 7, 6]\n" +
        "\t\t\t\t\t}, {\n" +
        "\t\t\t\t\t\ttype: 'column',\n" +
        "\t\t\t\t\t\tname: '刘晓翔',\n" +
        "\t\t\t\t\t\tdata: [4, 3, 3, 9, 0]\n" +
        "\t\t\t\t\t}, {\n" +
        "\t\t\t\t\t\ttype: 'spline',\n" +
        "\t\t\t\t\t\tname: '平均',\n" +
        "\t\t\t\t\t\tdata: [3, 2.67, 3, 6.33, 3.33]\n" +
        "\t\t\t\t\t}, {\n" +
        "\t\t\t\t\t\ttype: 'pie',\n" +
        "\t\t\t\t\t\tname: 'Total consumption',\n" +
        "\t\t\t\t\t\tdata: [{\n" +
        "\t\t\t\t\t\t\tname: '方佳玮',\n" +
        "\t\t\t\t\t\t\ty: 13,\n" +
        "\t\t\t\t\t\t\tcolor: '#4572A7'\n" +
        "\t\t\t\t\t\t}, {\n" +
        "\t\t\t\t\t\t\tname: '何立勇',\n" +
        "\t\t\t\t\t\t\ty: 23,\n" +
        "\t\t\t\t\t\t\tcolor: '#AA4643'\n" +
        "\t\t\t\t\t\t}, {\n" +
        "\t\t\t\t\t\t\tname: '刘晓翔',\n" +
        "\t\t\t\t\t\t\ty: 19,\n" +
        "\t\t\t\t\t\t\tcolor: '#89A54E'\n" +
        "\t\t\t\t\t\t}],\n" +
        "\t\t\t\t\t\tcenter: [100, 80],\n" +
        "\t\t\t\t\t\tsize: 100,\n" +
        "\t\t\t\t\t\tshowInLegend: false,\n" +
        "\t\t\t\t\t\tdataLabels: {\n" +
        "\t\t\t\t\t\t\tenabled: false\n" +
        "\t\t\t\t\t\t}\n" +
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