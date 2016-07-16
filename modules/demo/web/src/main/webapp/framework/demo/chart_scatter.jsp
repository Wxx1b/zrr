<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>散布图表</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;散布图表</b></div>
<layout:tabs>
<layout:tab title="范例">
    <chart:define id="scatter" name="scatter" type="scatter" dataVar="result" clazz="com.sinitek.spirit.webcontrol.demo.DemoChart" width="100%" height="400px">
        <chart:title text="美国人口体重身高分布"/>

        <chart:subtitle text="散布图表范例"/>

        <chart:xAxis>
            <chart:title text="身高（厘米）"/>
        </chart:xAxis>

        <chart:yAxis>
            <chart:title text="体重（公斤）"/>
        </chart:yAxis>

        <chart:tooltip>
            formatter: function() {
                return this.x +'（厘米） '+ this.y +'（公斤）';
            },
        </chart:tooltip>

        <chart:legend layout="vertical" align="right" x="-10" y="-180"/>

        <chart:plotOptions>
            <chart:plotOption type="scatter">
                <chart:marker radius="5">
                    states: {
                        hover: {
                            enabled: true,
                            lineColor: 'rgb(100,100,100)'
                        }
                    },
                </chart:marker>
                states: {
                    hover: {
                        marker: {
                            enabled: false
                        }
                    }
                },
            </chart:plotOption>
        </chart:plotOptions>
        
        <chart:series>
            [{
						name: '女',
						color: 'rgba(223, 83, 83, .5)',
						data: [[161.2, 51.6], [167.5, 59.0], [159.5, 49.2], [157.0, 63.0], [155.8, 53.6],
							[170.0, 59.0], [159.1, 47.6], [166.0, 69.8], [176.2, 66.8], [160.2, 75.2],
							[172.5, 55.2], [170.9, 54.2], [172.9, 62.5], [153.4, 42.0], [160.0, 50.0],
							[147.2, 49.8], [168.2, 49.2], [175.0, 73.2], [157.0, 47.8], [167.6, 68.8],
							[159.5, 50.6], [175.0, 82.5], [166.8, 57.2], [176.5, 87.8], [170.2, 72.8],
							[174.0, 54.5], [173.0, 59.8], [179.9, 67.3], [170.5, 67.8], [160.0, 47.0],
							[154.4, 46.2], [162.0, 55.0], [176.5, 83.0], [160.0, 54.4], [152.0, 45.8],
							[162.1, 53.6], [170.0, 73.2], [160.2, 52.1], [161.3, 67.9], [166.4, 56.6],
							[168.9, 62.3], [163.8, 58.5], [167.6, 54.5], [160.0, 50.2], [161.3, 60.3],
							[167.6, 58.3], [165.1, 56.2], [160.0, 50.2], [170.0, 72.9], [157.5, 59.8],
							[167.6, 61.0], [160.7, 69.1], [163.2, 55.9], [152.4, 46.5], [157.5, 54.3],
							[168.3, 54.8], [180.3, 60.7], [165.5, 60.0], [165.0, 62.0], [164.5, 60.3],
							[156.0, 52.7], [160.0, 74.3], [163.0, 62.0], [165.7, 73.1], [161.0, 80.0],
							[162.0, 54.7], [166.0, 53.2], [174.0, 75.7], [172.7, 61.1], [167.6, 55.7],
							[151.1, 48.7], [164.5, 52.3], [163.5, 50.0], [152.0, 59.3], [169.0, 62.5],
							[164.0, 55.7], [161.2, 54.8], [155.0, 45.9], [170.0, 70.6], [176.2, 67.2],
							[170.0, 69.4], [162.5, 58.2], [170.3, 64.8], [164.1, 71.6], [169.5, 52.8],
							[163.2, 59.8], [154.5, 49.0], [159.8, 50.0], [173.2, 69.2], [170.0, 55.9],
							[161.4, 63.4], [169.0, 58.2], [166.2, 58.6], [159.4, 45.7], [162.5, 52.2],
							[159.0, 48.6], [162.8, 57.8], [159.0, 55.6], [179.8, 66.8], [162.9, 59.4],
							[161.0, 53.6], [151.1, 73.2], [168.2, 53.4], [168.9, 69.0], [173.2, 58.4],
							[171.8, 56.2], [178.0, 70.6], [164.3, 59.8], [163.0, 72.0], [168.5, 65.2],
							[166.8, 56.6], [172.7, 105.2], [163.5, 51.8], [169.4, 63.4], [167.8, 59.0]]

					}, {
						name: '男',
						color: 'rgba(119, 152, 191, .5)',
						data: [[174.0, 65.6], [175.3, 71.8], [193.5, 80.7], [186.5, 72.6], [187.2, 78.8],
							[181.5, 74.8], [184.0, 86.4], [184.5, 78.4], [175.0, 62.0], [184.0, 81.6],
							[180.0, 76.6], [177.8, 83.6], [192.0, 90.0], [176.0, 74.6], [174.0, 71.0],
							[184.0, 79.6], [192.7, 93.8], [171.5, 70.0], [173.0, 72.4], [176.0, 85.9],
							[176.0, 78.8], [180.5, 77.8], [172.7, 66.2], [176.0, 86.4], [173.5, 81.8],
							[178.0, 89.6], [180.3, 82.8], [180.3, 76.4], [164.5, 63.2], [173.0, 60.9],
							[183.5, 74.8], [175.5, 70.0], [188.0, 72.4], [189.2, 84.1], [172.8, 69.1],
							[170.0, 59.5], [182.0, 67.2], [170.0, 61.3], [177.8, 68.6], [184.2, 80.1],
							[186.7, 87.8], [171.4, 84.7], [172.7, 73.4], [175.3, 72.1], [180.3, 82.6],
							[182.9, 88.7], [188.0, 84.1], [177.2, 94.1], [172.1, 74.9], [167.0, 59.1],
							[169.5, 75.6], [174.0, 86.2], [172.7, 75.3], [182.2, 87.1], [164.1, 55.2],
							[163.0, 57.0], [171.5, 61.4], [184.2, 76.8], [174.0, 86.8], [174.0, 72.2],
							[177.0, 71.6], [186.0, 84.8], [167.0, 68.2], [171.8, 66.1], [182.0, 72.0],
							[167.0, 64.6], [177.8, 74.8], [164.5, 70.0], [192.0, 101.6], [175.5, 63.2],
							[171.2, 79.1], [181.6, 78.9], [167.4, 67.7], [181.1, 66.0], [177.0, 68.2],
							[174.5, 63.9], [177.5, 72.0], [170.5, 56.8], [182.4, 74.5], [197.1, 90.9],
							[180.1, 93.0], [175.5, 80.9], [180.6, 72.7], [184.4, 68.0], [175.5, 70.9],
							[180.6, 72.5], [177.0, 72.5], [177.1, 83.4], [181.6, 75.5], [176.5, 73.0],
							[175.0, 70.2], [174.0, 73.4], [165.1, 70.5], [177.0, 68.9], [192.0, 102.3],
							[176.5, 68.4], [169.4, 65.9], [182.1, 75.7], [179.8, 84.5], [175.3, 87.7],
							[184.9, 86.4], [177.3, 73.2], [167.4, 53.9], [178.1, 72.0], [168.9, 55.5],
							[157.2, 58.4], [180.3, 83.2], [170.2, 72.7], [177.8, 64.1], [172.7, 72.3],
							[165.1, 65.0], [186.7, 86.4], [165.1, 65.0], [174.0, 88.6], [175.3, 84.1],
							[185.4, 66.8], [177.8, 75.5], [180.3, 93.2], [180.3, 82.7], [177.8, 58.0],
							[177.8, 79.5], [177.8, 78.6], [177.8, 71.8], [177.8, 116.4], [163.8, 72.2],
							[188.0, 83.6], [198.1, 85.5], [175.3, 90.9], [166.4, 85.9], [190.5, 89.1],
							[166.4, 75.0], [177.8, 77.7], [179.7, 86.4], [172.7, 90.9], [190.5, 73.6],
							[185.4, 76.4], [168.9, 69.1], [167.6, 84.5], [175.3, 64.5], [170.2, 69.1],
							[190.5, 108.6], [177.8, 86.4], [190.5, 80.9], [177.8, 87.7], [184.2, 94.5]]

					}]
        </chart:series>
    </chart:define>

    <layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    <chart:define id=\"scatter\" name=\"scatter\" type=\"scatter\" dataVar=\"result\" clazz=\"com.sinitek.spirit.webcontrol.demo.DemoChart\" width=\"100%\" height=\"400px\">\n" +
        "        <chart:title text=\"美国人口体重身高分布\"/>\n" +
        "\n" +
        "        <chart:subtitle text=\"散布图表范例\"/>\n" +
        "\n" +
        "        <chart:xAxis>\n" +
        "            <chart:title text=\"身高（厘米）\"/>\n" +
        "        </chart:xAxis>\n" +
        "\n" +
        "        <chart:yAxis>\n" +
        "            <chart:title text=\"体重（公斤）\"/>\n" +
        "        </chart:yAxis>\n" +
        "\n" +
        "        <chart:tooltip>\n" +
        "            formatter: function() {\n" +
        "                return this.x +'（厘米） '+ this.y +'（公斤）';\n" +
        "            },\n" +
        "        </chart:tooltip>\n" +
        "\n" +
        "        <chart:legend layout=\"vertical\" align=\"right\" x=\"-10\" y=\"-180\"/>\n" +
        "\n" +
        "        <chart:plotOptions>\n" +
        "            <chart:plotOption type=\"scatter\">\n" +
        "                marker: {\n" +
        "                    radius: 5,\n" +
        "                    states: {\n" +
        "                        hover: {\n" +
        "                            enabled: true,\n" +
        "                            lineColor: 'rgb(100,100,100)'\n" +
        "                        }\n" +
        "                    }\n" +
        "                },\n" +
        "                states: {\n" +
        "                    hover: {\n" +
        "                        marker: {\n" +
        "                            enabled: false\n" +
        "                        }\n" +
        "                    }\n" +
        "                },\n" +
        "            </chart:plotOption>\n" +
        "        </chart:plotOptions>\n" +
        "        \n" +
        "        <chart:series>\n" +
        "            [{\n" +
        "\t\t\t\t\t\tname: '女',\n" +
        "\t\t\t\t\t\tcolor: 'rgba(223, 83, 83, .5)',\n" +
        "\t\t\t\t\t\tdata: [[161.2, 51.6], [167.5, 59.0], [159.5, 49.2], [157.0, 63.0], [155.8, 53.6],\n" +
        "\t\t\t\t\t\t\t[170.0, 59.0], [159.1, 47.6], [166.0, 69.8], [176.2, 66.8], [160.2, 75.2],\n" +
        "\t\t\t\t\t\t\t[172.5, 55.2], [170.9, 54.2], [172.9, 62.5], [153.4, 42.0], [160.0, 50.0],\n" +
        "\t\t\t\t\t\t\t[147.2, 49.8], [168.2, 49.2], [175.0, 73.2], [157.0, 47.8], [167.6, 68.8],\n" +
        "\t\t\t\t\t\t\t[159.5, 50.6], [175.0, 82.5], [166.8, 57.2], [176.5, 87.8], [170.2, 72.8],\n" +
        "\t\t\t\t\t\t\t[174.0, 54.5], [173.0, 59.8], [179.9, 67.3], [170.5, 67.8], [160.0, 47.0],\n" +
        "\t\t\t\t\t\t\t[154.4, 46.2], [162.0, 55.0], [176.5, 83.0], [160.0, 54.4], [152.0, 45.8],\n" +
        "\t\t\t\t\t\t\t[162.1, 53.6], [170.0, 73.2], [160.2, 52.1], [161.3, 67.9], [166.4, 56.6],\n" +
        "\t\t\t\t\t\t\t[168.9, 62.3], [163.8, 58.5], [167.6, 54.5], [160.0, 50.2], [161.3, 60.3],\n" +
        "\t\t\t\t\t\t\t[167.6, 58.3], [165.1, 56.2], [160.0, 50.2], [170.0, 72.9], [157.5, 59.8],\n" +
        "\t\t\t\t\t\t\t[167.6, 61.0], [160.7, 69.1], [163.2, 55.9], [152.4, 46.5], [157.5, 54.3],\n" +
        "\t\t\t\t\t\t\t[168.3, 54.8], [180.3, 60.7], [165.5, 60.0], [165.0, 62.0], [164.5, 60.3],\n" +
        "\t\t\t\t\t\t\t[156.0, 52.7], [160.0, 74.3], [163.0, 62.0], [165.7, 73.1], [161.0, 80.0],\n" +
        "\t\t\t\t\t\t\t[162.0, 54.7], [166.0, 53.2], [174.0, 75.7], [172.7, 61.1], [167.6, 55.7],\n" +
        "\t\t\t\t\t\t\t[151.1, 48.7], [164.5, 52.3], [163.5, 50.0], [152.0, 59.3], [169.0, 62.5],\n" +
        "\t\t\t\t\t\t\t[164.0, 55.7], [161.2, 54.8], [155.0, 45.9], [170.0, 70.6], [176.2, 67.2],\n" +
        "\t\t\t\t\t\t\t[170.0, 69.4], [162.5, 58.2], [170.3, 64.8], [164.1, 71.6], [169.5, 52.8],\n" +
        "\t\t\t\t\t\t\t[163.2, 59.8], [154.5, 49.0], [159.8, 50.0], [173.2, 69.2], [170.0, 55.9],\n" +
        "\t\t\t\t\t\t\t[161.4, 63.4], [169.0, 58.2], [166.2, 58.6], [159.4, 45.7], [162.5, 52.2],\n" +
        "\t\t\t\t\t\t\t[159.0, 48.6], [162.8, 57.8], [159.0, 55.6], [179.8, 66.8], [162.9, 59.4],\n" +
        "\t\t\t\t\t\t\t[161.0, 53.6], [151.1, 73.2], [168.2, 53.4], [168.9, 69.0], [173.2, 58.4],\n" +
        "\t\t\t\t\t\t\t[171.8, 56.2], [178.0, 70.6], [164.3, 59.8], [163.0, 72.0], [168.5, 65.2],\n" +
        "\t\t\t\t\t\t\t[166.8, 56.6], [172.7, 105.2], [163.5, 51.8], [169.4, 63.4], [167.8, 59.0]]\n" +
        "\n" +
        "\t\t\t\t\t}, {\n" +
        "\t\t\t\t\t\tname: '男',\n" +
        "\t\t\t\t\t\tcolor: 'rgba(119, 152, 191, .5)',\n" +
        "\t\t\t\t\t\tdata: [[174.0, 65.6], [175.3, 71.8], [193.5, 80.7], [186.5, 72.6], [187.2, 78.8],\n" +
        "\t\t\t\t\t\t\t[181.5, 74.8], [184.0, 86.4], [184.5, 78.4], [175.0, 62.0], [184.0, 81.6],\n" +
        "\t\t\t\t\t\t\t[180.0, 76.6], [177.8, 83.6], [192.0, 90.0], [176.0, 74.6], [174.0, 71.0],\n" +
        "\t\t\t\t\t\t\t[184.0, 79.6], [192.7, 93.8], [171.5, 70.0], [173.0, 72.4], [176.0, 85.9],\n" +
        "\t\t\t\t\t\t\t[176.0, 78.8], [180.5, 77.8], [172.7, 66.2], [176.0, 86.4], [173.5, 81.8],\n" +
        "\t\t\t\t\t\t\t[178.0, 89.6], [180.3, 82.8], [180.3, 76.4], [164.5, 63.2], [173.0, 60.9],\n" +
        "\t\t\t\t\t\t\t[183.5, 74.8], [175.5, 70.0], [188.0, 72.4], [189.2, 84.1], [172.8, 69.1],\n" +
        "\t\t\t\t\t\t\t[170.0, 59.5], [182.0, 67.2], [170.0, 61.3], [177.8, 68.6], [184.2, 80.1],\n" +
        "\t\t\t\t\t\t\t[186.7, 87.8], [171.4, 84.7], [172.7, 73.4], [175.3, 72.1], [180.3, 82.6],\n" +
        "\t\t\t\t\t\t\t[182.9, 88.7], [188.0, 84.1], [177.2, 94.1], [172.1, 74.9], [167.0, 59.1],\n" +
        "\t\t\t\t\t\t\t[169.5, 75.6], [174.0, 86.2], [172.7, 75.3], [182.2, 87.1], [164.1, 55.2],\n" +
        "\t\t\t\t\t\t\t[163.0, 57.0], [171.5, 61.4], [184.2, 76.8], [174.0, 86.8], [174.0, 72.2],\n" +
        "\t\t\t\t\t\t\t[177.0, 71.6], [186.0, 84.8], [167.0, 68.2], [171.8, 66.1], [182.0, 72.0],\n" +
        "\t\t\t\t\t\t\t[167.0, 64.6], [177.8, 74.8], [164.5, 70.0], [192.0, 101.6], [175.5, 63.2],\n" +
        "\t\t\t\t\t\t\t[171.2, 79.1], [181.6, 78.9], [167.4, 67.7], [181.1, 66.0], [177.0, 68.2],\n" +
        "\t\t\t\t\t\t\t[174.5, 63.9], [177.5, 72.0], [170.5, 56.8], [182.4, 74.5], [197.1, 90.9],\n" +
        "\t\t\t\t\t\t\t[180.1, 93.0], [175.5, 80.9], [180.6, 72.7], [184.4, 68.0], [175.5, 70.9],\n" +
        "\t\t\t\t\t\t\t[180.6, 72.5], [177.0, 72.5], [177.1, 83.4], [181.6, 75.5], [176.5, 73.0],\n" +
        "\t\t\t\t\t\t\t[175.0, 70.2], [174.0, 73.4], [165.1, 70.5], [177.0, 68.9], [192.0, 102.3],\n" +
        "\t\t\t\t\t\t\t[176.5, 68.4], [169.4, 65.9], [182.1, 75.7], [179.8, 84.5], [175.3, 87.7],\n" +
        "\t\t\t\t\t\t\t[184.9, 86.4], [177.3, 73.2], [167.4, 53.9], [178.1, 72.0], [168.9, 55.5],\n" +
        "\t\t\t\t\t\t\t[157.2, 58.4], [180.3, 83.2], [170.2, 72.7], [177.8, 64.1], [172.7, 72.3],\n" +
        "\t\t\t\t\t\t\t[165.1, 65.0], [186.7, 86.4], [165.1, 65.0], [174.0, 88.6], [175.3, 84.1],\n" +
        "\t\t\t\t\t\t\t[185.4, 66.8], [177.8, 75.5], [180.3, 93.2], [180.3, 82.7], [177.8, 58.0],\n" +
        "\t\t\t\t\t\t\t[177.8, 79.5], [177.8, 78.6], [177.8, 71.8], [177.8, 116.4], [163.8, 72.2],\n" +
        "\t\t\t\t\t\t\t[188.0, 83.6], [198.1, 85.5], [175.3, 90.9], [166.4, 85.9], [190.5, 89.1],\n" +
        "\t\t\t\t\t\t\t[166.4, 75.0], [177.8, 77.7], [179.7, 86.4], [172.7, 90.9], [190.5, 73.6],\n" +
        "\t\t\t\t\t\t\t[185.4, 76.4], [168.9, 69.1], [167.6, 84.5], [175.3, 64.5], [170.2, 69.1],\n" +
        "\t\t\t\t\t\t\t[190.5, 108.6], [177.8, 86.4], [190.5, 80.9], [177.8, 87.7], [184.2, 94.5]]\n" +
        "\n" +
        "\t\t\t\t\t}]\n" +
        "        </chart:series>\n" +
        "    </chart:define>"));%>
    </pre>
    java类：
    <pre name="code" class="java">
<%out.print( HtmlUtils.htmlEscape("public class DemoChart implements IChartAware {\n" +
                    "    public Object getChartResult(Map<String, String> options, Map params, HttpServletRequest request) throws Exception {\n" +
                    "        //数据过多，仅用js做范例\n" +
                    "        return null;\n" +
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