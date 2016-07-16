<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>模板 - 按钮</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body><td colspan="2"></td>
<div class="pt10 pl10 pr10">

<div class="stk-table-list-st4">
<div class="choose-box clearfix">
    <div style="float:left;line-height: 25px;height: 25px;display:inline-block;*display:inline;*zoom:1;">券商：</div>
    <div style="float:left;display:inline-block;*display:inline;*zoom:1;" readonly="false" hidemode="display" _hidden="false" id="t2_wrap" cn="removableselect" type="component">
        <div name="t2" id="t2" style="height:25px;;min-height:25px;border: none" class="stk-person-select"><span class="stk-child-o"><input type="hidden" value="10" name="t2"><span style="float:left;white-space:nowrap;">股</span><b onclick="$(this).parent().remove();t2_removeFunction('10');" class="stk-button-icon stk-child-close"></b></span><span class="stk-child-o"><input type="hidden" value="1" name="t2"><span style="float:left;white-space:nowrap;">较</span><b onclick="$(this).parent().remove();t2_removeFunction('1');" class="stk-button-icon stk-child-close"></b></span><span class="stk-child-o"><input type="hidden" value="23" name="t2"><span style="float:left;white-space:nowrap;">姥</span><b onclick="$(this).parent().remove();t2_removeFunction('23');" class="stk-button-icon stk-child-close"></b></span></div>
    </div>
    <span style="" readonly="false" hidemode="display" _hidden="false" id="UUID10503ee68bb6410c8e443d62fee1cbc4_wrap" cn="button" type="component">
    <button id="UUID10503ee68bb6410c8e443d62fee1cbc4" icon="ui-icon-search" type="button" class="stk-button stk-button-st-3"><span class="stk-button-icon ui-icon-search"></span></button>
    <div targetid="UUID10503ee68bb6410c8e443d62fee1cbc4" evt="click" type="event" style="display:none;">
    </div>
    </span>
</div>
<div class="choose-date">
    <div class="list-year-main">
        <a class="dropdown-toggle"href="#">
            2013年
            <b class="common-bg-icon arrow-down"></b>
        </a>
        <div class="month-main">
            <a class="hover">01月</a><a href="#">02月</a><a href="#">03月</a><a href="#">04月</a><a href="#">05月</a><a href="#">06月</a><a href="#">07月</a><a href="#">08月</a><a href="#">09月</a><a href="#">10月</a><a href="#">11月</a><a href="#">12月</a>
        </div>
    </div>
    <div class="list-year-main week">
        <span class="dropdown-toggle">
            按周查看
        </span>
        <div class="month-main">
            <a href="#" class="hover">第一周(12/30~1/5)</a>
            <a href="#">第二周(1/6~1/12)</a>
            <a href="#">第三周(1/13~1/19)</a>
            <a href="#">第四周(1/20~1/26)</a>
            <a href="#">第五周(1/27~2/2)</a>
        </div>
    </div>
    <div class="list-year-main day">
        <span class="dropdown-toggle">
            按天查看
        </span>
        <div class="month-main">
            <a href="#" class="hover weekend">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <a href="#">6</a>
            <a href="#" class="weekend">7</a>
            <a href="#" class="weekend">8</a>
            <a href="#">9</a>
            <a href="#">10</a>
            <a href="#">11</a>
            <a href="#">12</a>
            <a href="#">13</a>
            <a href="#" class="weekend">14</a>
            <a href="#" class="weekend">15</a>
            <a href="#">16</a>
            <a href="#">17</a>
            <a href="#">18</a>
            <a href="#">19</a>
            <a href="#">20</a>
            <a href="#" class="weekend">21</a>
            <a href="#" class="weekend">22</a>
            <a href="#">23</a>
            <a href="#">24</a>
            <a href="#">25</a>
            <a href="#">26</a>
            <a href="#">27</a>
            <a href="#" class="weekend">28</a>
            <a href="#" class="weekend">29</a>
            <a href="#">30</a>
            <a href="#">31</a>
        </div>
    </div>
</div>
<div>
<table class="stk-table-st4 w100p">
<thead>
	<tr>
    	<th>时间</th>
        <th>会议主题</th>
        <th>相关证券/行业</th>
    </tr>
</thead>
<tbody>
	<tr>
    	<td>周一（12/30）</td>
        <td><a href="#">海通证券＊＊上门路</a></td>
        <td>深圳国际(00152)</td>
    </tr>
    <tr class="stk-table-tr-even">
        <td>周二（12/31）</td>
        <td><a href="#">国元（香港）＊＊路演＊＊深圳国际</a></td>
        <td>深圳国际(00152)</td>
    </tr>
    <tr>
        <td>周三（1/1）</td>
        <td><a href="#">长江证券**联合调研**青岛双星</a></td>
        <td>深圳国际(00152)</td>
    </tr>
</tbody>
</table>
</div>
<div class="stk-page-bar-st1 stk-table-page-st4">
    <div class="stk-fl pl10">共11个记录&nbsp;&nbsp;<select><option>10</option><option>20</option></select>/页</div>
    <div class="stk-fr page-list pr10"><a href="#first" class="p-first p-first-invalid">首页</a><a href="#prev" class="p-prev p-prev-invalid">上一页</a><a href="#" class="p-select">1</a><a href="#">2</a><a href="#">3</a><a href="#next" class="p-next p-next-invalid">下一页</a><a href="#last" class="p-last p-last-invalid">尾页</a>
    </div>
</div>
</div>
</div>
</body>
</html>