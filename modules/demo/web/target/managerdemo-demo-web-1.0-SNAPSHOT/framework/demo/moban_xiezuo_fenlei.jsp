<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>模板 - 多人协作-分类模式</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body style="color:#626262">
<div class="search-params-bar mt10 mb10 mr10 ml10">
    <table>
<tr>
	<td class="tit"><label>日期</label></td>
    <td class="bd"><input type="text"/></td>
    <td class="bd">
    <select class="mr10">
		<option>文件类型</option>
	</select>
    </td>
    <td><button class="stk-button stk-button-st-3">查询</button></td>
</tr>
</table>
</div>
<div class="con-alert-tip  mb10 mr10 ml10"><b class="icon-st28 ic-alt"></b>请先<span class="fwb">“下载模板”</span>，完成编辑后再<span class="fwb">“上传”</span></div>
<div class="cooperatio-opt-bar mb10 mr10 ml10">
<button class="stk-button stk-button-st-4"><b class="stk-button-icon stk-button-icon-bi1 ui-icon-triangle-1-w"></b></button>
<button class="stk-button stk-button-st-4"><b class="stk-button-icon stk-button-icon-bi1 ui-icon-triangle-1-e"></b></button>
<button class="stk-button stk-button-st-4 ml5">今天</button>
<button class="stk-button stk-button-st-4-dis ml5">今天</button>
<button class="stk-button stk-button-st-3 ml5">设置</button>
<a href="javascript:void(0);" class="change-model"><b class="icon-st30 mr5"></b>切换到日期模式</a>
</div>
<div class="stk-box-s1 mb10 mr10 ml10">
    <div class="stk-ui-bar stk-hd"><span class="stk-tit">经济类</span></div>
    <div class="stk-bd cooperatio-con-box">
        <div class="aside">
            <span class="date fwb">2011-05-29 至2011-06-05</span>
            <span class="opt-bax"><b class="icon-st29 mr5"></b><a href="#">合并该类文件</a></span>
        </div>
        <div class="article">
        <table class="table w100p">
        <tr>
            <td width="auto">
            <p>第一段</p>
            <p><b class="icon-st29 mr5"></b><a href="#" class="doc-name">经济类前端文件1.doc</a></p>
            </td>
            <td width="125">
            <p>上传者：李玉刚</p>
            <p>2011-07-13 12:33</p>
            </td>
            <td width="125"><a href="#">下载模板</a><em class="ml5 mr5">|</em><a href="#">重新上传</a></td>
        </tr>
        <tr>
            <td width="auto">
            <p>第一段</p>
            <p><b class="icon-st29 mr5"></b><a href="#" class="doc-name">经济类前端文件1.doc</a></p>
            </td>
            <td width="125">
            <p>上传者：李玉刚</p>
            <p>2011-07-13 12:33</p>
            </td>
            <td width="125"><a href="#">下载模板</a><em class="ml5 mr5">|</em><a href="#">重新上传</a></td>
        </tr>
        <tr>
            <td width="auto">
            <p>第一段</p>
            <p><b class="icon-st29 mr5"></b><a href="#" class="doc-name">经济类前端文件1.doc</a></p>
            </td>
            <td width="125">
            <p>上传者：李玉刚</p>
            <p>2011-07-13 12:33</p>
            </td>
            <td width="125"><a href="#">下载模板</a><em class="ml5 mr5">|</em><a href="#">重新上传</a></td>
        </tr>
        </table>
        </div>
    </div>
</div>
<div class="stk-box-s1 mb10 mr10 ml10">
    <div class="stk-ui-bar stk-hd"><span class="stk-tit">经济类</span></div>
    <div class="stk-bd cooperatio-con-box">
        <div class="aside">
            <span class="date fwb">2011-05-29 至2011-06-05</span>
            <span class="opt-bax"><b class="icon-st29 mr5"></b><a href="#">合并该类文件</a></span>
        </div>
        <div class="article">
        <table class="table w100p">
        <tr>
            <td width="auto">
            <p>第一段</p>
            <p><b class="icon-st29 mr5"></b><a href="#" class="doc-name">经济类前端文件1.doc</a></p>
            </td>
            <td width="125">
            <p>上传者：李玉刚</p>
            <p>2011-07-13 12:33</p>
            </td>
            <td width="125"><a href="#">下载模板</a><em class="ml5 mr5">|</em><a href="#">重新上传</a></td>
        </tr>
        <tr>
            <td width="auto">
            <p>第一段</p>
            <p><b class="icon-st29 mr5"></b><a href="#" class="doc-name">经济类前端文件1.doc</a></p>
            </td>
            <td width="125">
            <p>上传者：李玉刚</p>
            <p>2011-07-13 12:33</p>
            </td>
            <td width="125"><a href="#">下载模板</a><em class="ml5 mr5">|</em><a href="#">重新上传</a></td>
        </tr>
        <tr>
            <td width="auto">
            <p>第一段</p>
            <p><b class="icon-st29 mr5"></b><a href="#" class="doc-name">经济类前端文件1.doc</a></p>
            </td>
            <td width="125">
            <p>上传者：李玉刚</p>
            <p>2011-07-13 12:33</p>
            </td>
            <td width="125"><a href="#">下载模板</a><em class="ml5 mr5">|</em><a href="#">重新上传</a></td>
        </tr>
        </table>
        </div>
    </div>
</div>
<div class="step-box">
    <ul>
        <li class="step1">step1</li>
        <li class="step-select step2">step2</li>
        <li class="step3">step3</li>
        <li class="step4">step4</li>
    </ul>
</div>
</body>
</html>