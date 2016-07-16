<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>模板 - 表格带工具栏</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<div class="stk-table-list-st4">
<div class="stk-ui-bar stk-table-opt-bar">
<ul class="btn-box">
	<li><a class="normal stk-button" href="#"><b class="stk-button-icon ui-icon-trash"></b><span>删除</span></a><b class="split"></b></li>
    <li><a class="ext stk-button" href="#"><b class="stk-button-icon ui-icon-extlink"></b><span>导出</span><b class="b-down stk-button"><b class="stk-button-icon  stk-button-icon-bi1 ui-icon-triangle-1-s"></b></b></a><b class="split"></b></li>
    <li><a class="stk-button normal" href="#"><b class="stk-button-icon ui-icon-disk"></b><span>批量下载</span></a><b class="split"></b></li>
</ul>
</div>
<div>
<table class="stk-table-st4 w100p">
<thead>
	<tr>
    	<th>调查研究</th>
        <th>类型</th>
        <th>时间</th>
        <th>金额</th>
    </tr>
</thead>
<tbody>
	<tr>
    	<td>内容</td>
        <td>内容</td>
        <td>内容</td>
        <td>内容</td>
    </tr>
    <tr>
    	<td>内容</td>
        <td>内容</td>
        <td>内容</td>
        <td>内容</td>
    </tr>
    <tr>
    	<td>内容</td>
        <td>内容</td>
        <td>内容</td>
        <td>内容</td>
    </tr>
</tbody>
</table>
</div>
<div class="stk-page-bar-st1 stk-table-page-st4">
    <div class="stk-fl pl10">共11个记录&nbsp;&nbsp;<select><option>10</option><option>20</option></select>/页</div>
    <div class="stk-fr page-list pr10"><a href="#first" class="p-first p-first-invalid">首页</a><a href="#prev" class="p-prev p-prev-invalid">上一页</a><a href="#" class="p-select">1</a><a href="#">2</a><a href="#">3</a><a href="#next" class="p-next p-next-invalid">下一页</a><a href="#last" class="p-last p-last-invalid">尾页</a>
    </div>
</div>
<div class="stk-ui-bar stk-table-opt-bar">
<ul class="btn-box">
	<li><a class="normal stk-button" href="#"><b class="stk-button-icon ui-icon-trash"></b><span>删除</span></a><b class="split"></b></li>
    <li><a class="ext stk-button" href="#"><b class="stk-button-icon ui-icon-extlink"></b><span>导出</span><b class="b-down stk-button"><b class="stk-button-icon  stk-button-icon-bi1 ui-icon-triangle-1-s"></b></b></a><b class="split"></b></li>
    <li><a class="stk-button normal" href="#"><b class="stk-button-icon ui-icon-disk"></b><span>批量下载</span></a><b class="split"></b></li>
</ul>
</div>

</div>

</body>
</html>