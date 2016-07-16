<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>模板 - 按钮</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
方式1（不换行）：<br>
<div class="search-params-bar">
<table>
<tr>
	<td class="tit"><label>投资池</label></td>
    <td class="bd"><input type="text" class="stk-input"></td>
    <td class="tit"><label>证券代码</label></td>
    <td class="bd"><input type="text" class="stk-input"></td>
    <td class="tit"><label>截止日期</label></td>
    <td class="bd"><input type="text" class="stk-input"></td>
    <td>&nbsp;&nbsp;<button class="stk-button stk-ext-button">查询</button></td>
</tr>
</table>
</div>

方式2（自动换行）:<br>
<div class="search-params-bar">
<table>
<tr>
	<td>
        <ul>
            <li><label>查询条件</label><input type="text" class="stk-input" style="width:130px" /></li>
            <li><label>查询条件</label><input type="text" class="stk-input" style="width:130px" /></li>
            <li><label>时间</label><input type="text" class="stk-input" style="width:70px" />至<input type="text" class="stk-input" style="width:70px" /></li>
            <li><label>查询条件</label><input type="text" class="stk-input" style="width:130px" /></li>
        </ul>
    </td>
    <td><button class="stk-button stk-button-search" style="margin-right: 15px"><span>查询</span></button><a href="#" style="white-space:nowrap;">高级查询</a></td>
</tr>
</table>
</div>

<p></p>


</body>
</html>