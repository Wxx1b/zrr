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
<div class="rep-alert-top">
    	<span class="con">您有&nbsp;&nbsp;<a href="#">6条新闻为查看</a></span>
        <span class="opt"><a class="o-l" href="javascript:void(0);"></a><a class="o-r" href="javascript:void(0);"></a></span>
    </div>
<div class="report-in-all">
    <div>
    	<table class="stk-form-ui-st1">
            <tr>
                <td class="hd" width="110"><label>标题<em>*</em></label></td>
                <td class="bd" width="auto"><input class="stk-input w630" type="text"></td>
            </tr>
            <tr>
                <td class="hd"><label>副标题<em>*</em></label></td>
                <td class="bd"><input class="stk-input w630" type="text"></td>
            </tr>
            <tr>
                <td class="hd"><label>报告作者<em>*</em></label></td>
                <td class="bd">
                <div><input class="stk-input w210" type="text"><span class="asi-note">(实际参与报告撰写工作)</span></div>
                <div style="display:block">
                <div class="stk-person-select" style="width:">
                <span class="stk-child-o"><span>李刚，权重<input class="stk-input w20 ml5 mr5" type="text">%，顺序<input class="stk-input w20 ml5 mr5" type="text"></span><b class="stk-button-icon stk-child-close"></b></span>
                <span class="stk-child-o"><span>李刚，权重<input class="stk-input w20 ml5 mr5" type="text">%，顺序<input class="stk-input w20 ml5 mr5" type="text"></span><b class="stk-button-icon stk-child-close"></b></span>
                <span class="stk-child-o"><span>李刚，权重<input class="stk-input w20 ml5 mr5" type="text">%，顺序<input class="stk-input w20 ml5 mr5" type="text"></span><b class="stk-button-icon stk-child-close"></b></span>
                </div>
                </div>
                </td>
            </tr>
            <tr>
                <td class="hd"><label>报告署名作者<em>*</em></label></td>
                <td class="bd">
                <input class="stk-input w210" type="text"><span class="asi-note">(具有证券投资咨询业务资格)</span>
                </td>
            </tr>
            <tr>
                <td class="hd"><label>报告摘要</label></td>
                <td class="bd"><textarea class="stk-textarea w630 h80"></textarea></td>
            </tr>
             <tr>
                <td class="hd"><label>短信摘要</label></td>
                <td class="bd"><textarea class="stk-textarea w630 h80"></textarea></td>
            </tr>
            <tr>
                <td colspan="2">
                <table class="w100p">
                    <tr>
                        <td class="hd" width="110"><label>文档密级<em>*</em></label></td>
                        <td class="bd" width="200"><select><option>无</option></select></td>
                        <td class="hd" width="110"><label>文档重要程度<em>*</em></label></td>
                        <td class="bd">
                        <div>
                        <div id="J_starts" class="stk-starts-ui fl">
                        <b class="b-s b-sc"></b>
                        <b class="b-s b-sc"></b>
                        <b class="b-s b-sc"></b>
                        <b class="b-s b-sc"></b>
                        <b class="b-s b-sc"></b>
                        </div>
                        </div>
                        </td>
                    </tr>
                </table>
                </td>
            </tr>
            <tr>
                <td class="hd"><label>上传文件</label></td>
                <td class="bd"><textarea class="stk-textarea w630 h80"></textarea></td>
            </tr>
            <tr class="btn-bar">
                <td class="hd"></td>
                <td class="bd">
                    <button class="stk-button stk-ext-button">继续新增</button>
                    &nbsp;&nbsp;
                    <button class="stk-button stk-ext-button">保存并关闭</button>
                    &nbsp;&nbsp;
                    <button class="stk-button stk-ext-button">直接关闭</button>
                </td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>