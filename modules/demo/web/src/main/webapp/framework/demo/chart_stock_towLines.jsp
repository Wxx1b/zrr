<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>
 
<html>
<head>
    <meta charset="UTF-8">
    <title>股票图表</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
    <script type="text/javascript" src="stock.js"></script>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;股票图表-多条线</b></div>
<layout:tabs>
<layout:tab title="范例">
    <chart:define id="stock" name="stock" type="stock" width="100%" height="400px">
        <chart:title text="美元兑换欧元比率"/>
 
        <chart:subtitle text="股票图表-多条线范例"/>
 
        <chart:rangeSelector selected="1"/>

        <chart:xAxis maxZoom="14 * 24 * 3600000">
            <chart:labels rotation="-45"/>
        </chart:xAxis>

        yAxis: [{
            title: {
                    text: '兑换率',
                    style: {
                        color: '#89A54E'
                    }
                },
            plotLines: [
                {
                    value: 0.6738,
                    color: 'green',
                    dashStyle: 'shortdash',
                    width: 2,
                    label: {
                        text: '绿线'
                    }
                },
                {
                    value: 0.7419,
                    color: 'red',
                    dashStyle: 'shortdash',
                    width: 2,
                    label: {
                        text: '红线'
                    }
                }]
            },
            {
                gridLineWidth: 0,
                title: {
                    text: '线2',
                    style: {
                        color: '#4572A7'
                    }
                },
                opposite: true
            }],
        <chart:tooltip>
            formatter: function() {
                var s = '<b>'+ Highcharts.dateFormat('%Y-%m-%d,%A', this.x) +'</b>';

                $.each(this.points, function(i, point) {
                    s += '<br/>'+point.y+(i==0?'兑换率':'线2');
                });

                return s;
            },
        </chart:tooltip>

        <chart:series>
            [{
                name: '美元兑换欧元',
                data:usdeur,
                color: '#89A54E',
                yAxis: 0
            },
            {
                name: '线2',
                type:'spline',
                color: '#4572A7',
                data:data2,
                yAxis: 1
            }]
        </chart:series>
    </chart:define>
    <layout:VSpacing height="20px"/>
 
    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    <script type=\"text/javascript\">\n" +
        "    var usdeur = [\n" +
        "        [Date.UTC(2003,8,24),0.8709],\n" +
        "        [Date.UTC(2003,9,15),0.8607],......\n" +
        "   ];\n" +
        "    var data2 = [\n" +
        "        [Date.UTC(2003,8,24),0.8709],\n" +
        "        [Date.UTC(2003,9,15),0.8607],......\n" +
        "   ];\n" +
        "    </script>\n" +
        "    <chart:define id=\"stock\" name=\"stock\" type=\"stock\" width=\"100%\" height=\"400px\">\n" +
        "        <chart:title text=\"美元兑换欧元比率\"/>\n" +
        " \n" +
        "        <chart:subtitle text=\"股票图表-多条线范例\"/>\n" +
        " \n" +
        "        <chart:rangeSelector selected=\"1\"/>\n" +
        "\n" +
        "        <chart:xAxis maxZoom=\"14 * 24 * 3600000\">\n" +
        "            <chart:labels rotation=\"-45\" y=\"30\"/>\n" +
        "        </chart:xAxis>\n" +
        "\n" +
        "        yAxis: [{\n" +
        "            title: {\n" +
        "                    text: '兑换率',\n" +
        "                    style: {\n" +
        "                        color: '#89A54E'\n" +
        "                    }\n" +
        "                }\n" +
        "            }, {\n" +
        "                gridLineWidth: 0,\n" +
        "                title: {\n" +
        "                    text: '线2',\n" +
        "                    style: {\n" +
        "                        color: '#4572A7'\n" +
        "                    }\n" +
        "                },\n" +
        "                opposite: true\n" +
        "            }],\n" +
        "\n" +
        "      \n" +
        "\n" +
        "        <chart:tooltip>\n" +
        "            formatter: function() {\n" +
        "                var s = '<b>'+ Highcharts.dateFormat('%Y-%m-%d,%A', this.x) +'</b>';\n" +
        "\n" +
        "                $.each(this.points, function(i, point) {\n" +
        "                    s += '<br/>'+point.y+(i==0?'兑换率':'线2');\n" +
        "                });\n" +
        "\n" +
        "                return s;\n" +
        "            },\n" +
        "        </chart:tooltip>\n" +
        "\n" +
        "        <chart:series>\n" +
        "            [{\n" +
        "                name: '美元兑换欧元',\n" +
        "                data:usdeur,\n" +
        "                yAxis: 0\n" +
        "            },\n" +
        "            {\n" +
        "                name: '线2',\n" +
        "                type:'spline',\n" +
        "                data:data2,\n" +
        "                yAxis: 1\n" +
        "            }]\n" +
        "        </chart:series>\n" +
        "    </chart:define>"));%>
    </pre>
    </layout:fieldSet>
</layout:tab>
<layout:tab title="参数">
    <a href="http://www.highcharts.com/stock/ref" target="_blank">官方文档</a>
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
