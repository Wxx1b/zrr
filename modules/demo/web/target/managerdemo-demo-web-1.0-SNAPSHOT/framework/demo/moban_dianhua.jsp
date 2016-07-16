<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>模板 - 电话沟通</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<!-- 主要内容 -->
<div style="border:1px solid #ccc;width:625px; position:absolute; top:30px; left:100px">
	<div>
    <table width="100%" class="phone-result-table">
    <tr>
    	<th width="100"><label>电话自动拨号</label></th>
        <td width="auto"><input type="text" class="stk-input" /></td>
    </tr>
    <tr>
    	<th><label>客户</label></th>
        <td><input type="text" class="stk-input "  />&nbsp;&nbsp;<label>拜访人员</label><input type="text" class="stk-input"/></td>
    </tr>
    <tr>
    	<th><label>沟通方式</label></th>
        <td><label><input type="radio" />拨打电话，MSN等</label>&nbsp;<label><input type="radio" />接听电话，MSN等</label></td>
    </tr>
    <tr>
    	<th><label>时间</label></th>
        <td><input type="text" class="stk-input" style="width:100px" />至<input type="text" class="stk-input" style="width:100px"/></td>
    </tr>
    <tr>
    	<th><label>服务自我评价</label></th>
        <td><label><input type="radio" />优秀</label>&nbsp;<label><input type="radio" />较好</label>&nbsp;<label><input type="radio" />一般</label>&nbsp;<label><input type="radio" />较差</label></td>
    </tr>
    <tr>
    	<th><label>推荐情况</label></th>
        <td>
        <div>
        <p style="margin-bottom:5px"><label>推荐股票：<input type="text"class="stk-input"  /></label>&nbsp;&nbsp;<label>比例：<input type="text" class="stk-input" style="width:30px"/>&nbsp;%&nbsp;</label><label><input type="radio" />买入</label><label><input type="radio" />卖出</label><button type="button" class="stk-button stk-button-st-3"><span class="stk-button-icon ui-icon-circle-plus"></span><span>新增</span></button></p>
        <p style="margin-bottom:5px"><span class="t-sl">买入_浦发银行<b class="stk-button-icon ui-icon-close"></b></span><span class="t-sl">买入_浦发银行<b class="stk-button-icon ui-icon-close"></b></span><span class="t-sl">买入_浦发银行<b class="stk-button-icon ui-icon-close"></b></span></p>
        </div>
        <div>
        <p style="margin-bottom:5px"><label>推荐行业：<select><option>交通运输行业</option></select></label>&nbsp;&nbsp;<label>比例：<input type="text" class="stk-input" style="width:30px"/>&nbsp;%&nbsp;</label><label><input type="radio" />买入</label><label><input type="radio" />卖出</label><button class="stk-button stk-button-st-3"><span class="stk-button-icon ui-icon-circle-plus"></span><span>新增</span></button></p>
        <p style="margin-bottom:5px"><span class="t-sl">买入_浦发银行<b class="stk-button-icon ui-icon-close"></b></span><span class="t-sl">买入_浦发银行<b class="stk-button-icon ui-icon-close"></b></span><span class="t-sl">买入_浦发银行<b class="stk-button-icon ui-icon-close"></b></span></p>
        </div>
        </td>
    </tr>
    <tr>
    	<th>&nbsp;</th>
        <td>
        <div>
        <p style="margin-bottom:5px"><label>推荐股票：<input type="text"class="stk-input"  /></label>&nbsp;&nbsp;<label>比例：<input type="text" class="stk-input" style="width:30px"/>&nbsp;%&nbsp;</label><label><input type="radio" />买入</label><label><input type="radio" />卖出</label><button class="stk-button stk-button-st-3"><span class="stk-button-icon ui-icon-circle-plus"></span><span>新增</span></button></p>
        <p style="margin-bottom:5px"><span class="t-sl">买入_浦发银行<b class="stk-button-icon ui-icon-close"></b></span><span class="t-sl">买入_浦发银行<b class="stk-button-icon ui-icon-close"></b></span><span class="t-sl">买入_浦发银行<b class="stk-button-icon ui-icon-close"></b></span></p>
        </div>
        <div>
        <p style="margin-bottom:5px"><label>推荐行业：<select><option>交通运输行业</option></select></label>&nbsp;&nbsp;<label>比例：<input type="text" class="stk-input" style="width:30px"/>&nbsp;%&nbsp;</label><label><input type="radio" />买入</label><label><input type="radio" />卖出</label><button class="stk-button stk-button-st-3"><span class="stk-button-icon ui-icon-circle-plus"></span><span>新增</span></button></p>
        <p style="margin-bottom:5px"><span class="t-sl">买入_浦发银行<b class="stk-button-icon ui-icon-close"></b></span><span class="t-sl">买入_浦发银行<b class="stk-button-icon ui-icon-close"></b></span><span class="t-sl">买入_浦发银行<b class="stk-button-icon ui-icon-close"></b></span></p>
        </div>
        </td>
    </tr>
    </table>
    </div>
</div>
</body>
</html>