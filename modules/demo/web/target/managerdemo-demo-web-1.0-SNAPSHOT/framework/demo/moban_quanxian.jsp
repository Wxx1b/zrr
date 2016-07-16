<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>模板 - 权限管理</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<script>

$(function(){
	if($.browser.msie && $.browser.version == '6.0'){
		$('.menu-list li').hover(function(){
			$(this).addClass('hover');
		},function(){
			$(this).removeClass('hover');
		})
	}
	$('.menu-list li').click(function(){
		$('.menu-list .selected').removeClass('selected');
		$(this).addClass('selected');
        $(".prem-menu").find("li[selected='selected']").css("background-color","").removeAttr("selected");
        $(this).attr("selected","selected").css("background-color",stk.table_td_select_color);
	})
	var _wh = $.offHeight();
	var _m = $('.prem-menu');
	var _h = _m.height();
	_h = (_h+45)>_wh ? _wh : _h;
	if((_h+45)>_wh){
		_m.css({"height" : (_wh-45)+"px","overflow-y" : "auto","overflow-x" : "hidden","position":"relative"})
	}
})

function getSelected()
{
    return $(".prem-menu").find("li[selected='selected']")[0];
}
</script>
<div>
<!-- 开始 -->

<div class="prem-bar">
<table class="w100p">
<tr>
<td width="250">
<button class="stk-button stk-button-st-3 mr10" onclick="alert($(getSelected()).attr('id'))">获得选中行id</button>
<button class="stk-button stk-button-st-3 mr10"><span>新增</span></button>
<button class="stk-button stk-button-st-3 mr10"><span>删除</span></button>
<button class="stk-button stk-button-st-3 mr10"><span>设置权限</span></button></td>
<td width="auto">
当前位置：<a href="#">根节点</a>  &gt;&gt;  <a href="#">内部研究报告</a>  &gt;&gt;  <a href="#"><b class="icon-st23 mr5"></b>经济研究</a>
</td>
</tr>
</table>
</div>
<div class="prem-box">
<table class="w100p">
<tr>
<td width="250">
<div class="prem-menu">
<ul>
<li class="menu-item">
    <ul class="menu-list">
    <li id="1"><span><b class="icon-st25 mr5"></b>栏目一</span><span class="opt-bar"><b class="icon-st16"></b><b class="icon-st17"></b><b class="icon-st15"></b></span></li>
    <li id="11"><span style="margin-left:20px"><b class="icon-st25 mr5"></b>栏目1.1</span><span class="opt-bar"><b class="icon-st16"></b><b class="icon-st17"></b><b class="icon-st15"></b></span></li>
    <li id="12"><span style="margin-left:20px"><b class="icon-st25 mr5"></b>栏目1.2</span><span class="opt-bar"><b class="icon-st16"></b><b class="icon-st17"></b><b class="icon-st15"></b></span></li>
    <li id="13"><span style="margin-left:20px"><b class="icon-st25 mr5"></b>栏目1.3</span><span class="opt-bar"><b class="icon-st16"></b><b class="icon-st17"></b><b class="icon-st15"></b></span></li>
    </ul>
</li>
</ul>
</div>
</td>
<td width="5" class="split-bar frbar-st1"></td>
<td width="auto" valign="top">
<div class="prem-sec-box">
<div class="title-bar"><span class="tit">设置权限</span><a href="#">&lt;&lt;返回</a></div>
<div class="opt-bar"><span class="mr10"><b class="icon-st18 mr5"></b><a href="#">授权</a></span><span><b class="icon-st19 mr5"></b><a href="#">保存</a></span></div>
<div class="conlist">
<table class="stk-table stk-table-st2" width="100%">
<thead>
<tr>
<th class="stk-table-th">组织结构</th>
<th class="stk-table-th"><input type="checkbox">查看</th>
<th class="stk-table-th"><input type="checkbox">撰写</th>
</tr>
</thead>
<tbody>
<tr>
<td><b class="icon-st20 mr5"></b>部门</td>
<td><input type="checkbox"></td>
<td><input type="checkbox"></td>
</tr>
<tr class="stk-table-tr-even">
<td><b class="icon-st21 mr5"></b>岗位</td>
<td><input type="checkbox"></td>
<td><input type="checkbox"></td>
</tr>
<tr>
<td><b class="icon-st22 mr5"></b>小组</td>
<td><input type="checkbox"></td>
<td><input type="checkbox"></td>
</tr>
<tr class="stk-table-tr-even">
<td><b class="icon-st2 mr5"></b>员工</td>
<td><input type="checkbox"></td>
<td><input type="checkbox"></td>
</tr>
</tbody>
</table>
</div>
</div>
</td>
</tr>
</table>
</div>
<!-- 结束 -->
</div>
</body>
</html>