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
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;股票图表</b></div>
<layout:tabs>
<layout:tab title="范例">
    <chart:define id="stock" name="stock" type="stock" width="100%" height="400px" marginTop="30">
        <chart:title text="美元兑换欧元比率"/>
 
        <chart:subtitle text="股票图表范例"/>
 
        <chart:rangeSelector selected="1"/>

        <chart:xAxis maxZoom="14 * 24 * 3600000">
            <chart:labels rotation="-45"/>
        </chart:xAxis>

        <chart:yAxis>
            <chart:title text="兑换率"/>
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
            }],
        </chart:yAxis>
        

        <chart:tooltip>
            formatter: function() {
                var s = "";
                if(!this.points) {
                    s = '<b>'+ Highcharts.dateFormat('%Y-%m-%d,%A', this.point.x) +'</b>';
                    s += '<br/>'+ this.point.title;
                }
                else
                {
                    s = '<b>'+ Highcharts.dateFormat('%Y-%m-%d,%A', this.x) +'</b>';

                    $.each(this.points, function(i, point) {
                        s += '<br/>1美金 = '+ point.y +'欧元';
                    });
                }
                return s;
            },
        </chart:tooltip>

        <chart:series>
            [{
                name: '美元兑换欧元',
                data:usdeur,
                id:'dataId'
            },
            {
                type: 'flags',
                name: '数据标记',
                data: [{
                    x: Date.UTC(2011, 1, 14),
                    title: '高点'
                },
                {
                    x: Date.UTC(2011, 3, 28),
                    title: '低点'
                }],
                onSeries: 'dataId',
                shape: 'squarepin'
            },
            {
                type: 'flags',
                name: '坐标标记',
                data: [{
                    x: Date.UTC(2011, 2, 1),
                    title: '标记1'
                },
                {
                    x: Date.UTC(2011, 3, 1),
                    title: '标记2'
                }],
                shape: 'squarepin'
            }]
        </chart:series>
    </chart:define>
    <layout:VSpacing height="20px"/>
 
    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("    <script type=\"text/javascript\">\n" +
        "    var usdeur = [\n" +
        "        [Date.UTC(2003,8,24),0.8709],\n" +
        "        [Date.UTC(2003,8,25),0.872],\n" +
        "        [Date.UTC(2003,8,26),0.8714],\n" +
        "        [Date.UTC(2003,8,29),0.8638],\n" +
        "        [Date.UTC(2003,8,30),0.8567],\n" +
        "        [Date.UTC(2003,9,1),0.8536],\n" +
        "        [Date.UTC(2003,9,2),0.8564],\n" +
        "        [Date.UTC(2003,9,3),0.8639],\n" +
        "        [Date.UTC(2003,9,6),0.8538],\n" +
        "        [Date.UTC(2003,9,7),0.8489],\n" +
        "        [Date.UTC(2003,9,8),0.8459],\n" +
        "        [Date.UTC(2003,9,9),0.8521],\n" +
        "        [Date.UTC(2003,9,10),0.8477],\n" +
        "        [Date.UTC(2003,9,13),0.8554],\n" +
        "        [Date.UTC(2003,9,14),0.853],\n" +
        "        [Date.UTC(2003,9,15),0.8607],......\n" +
        "   ];\n" +
        "    </script>\n" +
        "    <chart:define id=\"stock\" name=\"stock\" type=\"stock\" width=\"100%\" height=\"400px\" marginTop=\"30\">\n" +
        "        <chart:title text=\"美元兑换欧元比率\"/>\n" +
        " \n" +
        "        <chart:subtitle text=\"股票图表范例\"/>\n" +
        " \n" +
        "        <chart:rangeSelector selected=\"1\"/>\n" +
        "\n" +
        "        <chart:xAxis maxZoom=\"14 * 24 * 3600000\">\n" +
        "            <chart:labels rotation=\"-45\" y=\"30\"/>\n" +
        "        </chart:xAxis>\n" +
        "\n" +
        "        <chart:yAxis>\n" +
        "            <chart:title text=\"兑换率\"/>\n" +
        "            plotLines: [\n" +
        "            {\n" +
        "                value: 0.6738,\n" +
        "                color: 'green',\n" +
        "                dashStyle: 'shortdash',\n" +
        "                width: 2,\n" +
        "                label: {\n" +
        "                    text: '绿线'\n" +
        "                }\n" +
        "            },\n" +
        "            {\n" +
        "                value: 0.7419,\n" +
        "                color: 'red',\n" +
        "                dashStyle: 'shortdash',\n" +
        "                width: 2,\n" +
        "                label: {\n" +
        "                    text: '红线'\n" +
        "                }\n" +
        "            }],\n" +
        "        </chart:yAxis>\n" +
        "        \n" +
        "\n" +
        "        <chart:tooltip>\n" +
        "            formatter: function() {\n" +
        "                var s = '<b>'+ Highcharts.dateFormat('%Y-%m-%d,%A', this.x) +'</b>';\n" +
        "\n" +
        "                $.each(this.points, function(i, point) {\n" +
        "                    s += '<br/>1美金 = '+ point.y +'欧元';\n" +
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
        "                id:'dataId'\n" +
        "            },\n" +
        "            {\n" +
        "                type: 'flags',\n" +
        "                name: '数据标记',\n" +
        "                data: [{\n" +
        "                    x: Date.UTC(2011, 1, 14),\n" +
        "                    title: '高点'\n" +
        "                },\n" +
        "                {\n" +
        "                    x: Date.UTC(2011, 3, 28),\n" +
        "                    title: '低点'\n" +
        "                }],\n" +
        "                onSeries: 'dataId',\n" +
        "                shape: 'squarepin'\n" +
        "            },\n" +
        "            {\n" +
        "                type: 'flags',\n" +
        "                name: '坐标标记',\n" +
        "                data: [{\n" +
        "                    x: Date.UTC(2011, 2, 1),\n" +
        "                    title: '标记1'\n" +
        "                },\n" +
        "                {\n" +
        "                    x: Date.UTC(2011, 3, 1),\n" +
        "                    title: '标记2'\n" +
        "                }],\n" +
        "                shape: 'squarepin'\n" +
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
