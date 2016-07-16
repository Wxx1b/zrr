<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>模板 - 手动批量调整step1</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<a href="moban_shoudongS1.jsp">Step1</a>，<a href="moban_shoudongS2.jsp">Step2</a>，<a href="moban_shoudongS3.jsp">Step3</a><--实际开发不需要
<div style="padding:10px">
<div class="search-params-bar">
<div class="adjust_step fwb mb10"><span class="colorBlue">Step1：</span>选择你要调入（调出）的投资池</div>
<div style="clear:both; margin-bottom:10px;">
<table class="stk-table stk-table-st2" width="100%">
<thead>
<tr>
	<th class="stk-table-th">序号</th>
    <th class="stk-table-th">投资池</th>
    <th class="stk-table-th">类型</th>
    <th class="stk-table-th">操作</th>
</tr>
</thead>
<tbody>
<tr class="stk-tc">
	<td>1</td>
    <td>投资池名称</td>
    <td>研究池（债券）</td>
    <td><a href="#">调入</a><em>|</em><a href="#">调出</a><em>|</em><a href="#">查询</a></td>
</tr>
<tr class="stk-tc">
	<td>2</td>
    <td>投资池名称</td>
    <td>研究池（债券）</td>
    <td><a href="#">调入</a><em>|</em><a href="#">调出</a><em>|</em><a href="#">查询</a></td>
</tr>
<tr class="stk-tc">
	<td>3</td>
    <td>投资池名称</td>
    <td>研究池（债券）</td>
    <td><a href="#">调入</a><em>|</em><a href="#">调出</a><em>|</em><a href="#">查询</a></td>
</tr>
<tr class="stk-tc">
	<td>4</td>
    <td>投资池名称</td>
    <td>研究池（债券）</td>
    <td><a href="#">调入</a><em>|</em><a href="#">调出</a><em>|</em><a href="#">查询</a></td>
</tr>
</tbody>
</table>
<!-- page new -->
    <div class="stk-page-bar-st1">
        <div class="stk-fl">共11个记录&nbsp;&nbsp;<select><option>10</option><option>20</option></select>/页</div>
        <div class="stk-fr"><a href="#first" class="p-first p-first-invalid">首页</a><a href="#prev" class="p-prev p-prev-invalid">上一页</a><a href="#" class="p-select">1</a><a href="#">2</a><a href="#">3</a><a href="#next" class="p-next p-next-invalid">下一页</a><a href="#last" class="p-last p-last-invalid">尾页</a>
        </div>
    </div>

</div>
</div>


</div>
</body>
</html>