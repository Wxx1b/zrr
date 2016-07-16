<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>模板 - 日程模式</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
    <style type="text/css">
        body, td, th {
            font-family: tahoma, helvetica, \5b8b\4f53, "bitstream vera sans", arial, sans-serif;
        }
    </style>
</head>
<body>
<div class="cooperatio-opt-bar mb10 mr10 ml10">
    <button class="stk-button stk-button-st-4 ml5 w60">添加</button>
</div>
<div class="stk-box-s1 mb10 mr10 ml10">
    <div class="stk-ui-bar stk-hd"><span class="stk-tit">国泰基金管理有限公司--郑杰</span><span class="fr mr10"><a href="#">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">删除</a> </span></div>
    <div class="stk-bd cooperatio-con-box">
        <div class="aside">
            <span class="date fwb"><b>服务人员：</b>张三、李四、管理员</span>
            <span class="opt-bax">2011-05-29 22:22 至2011-06-05 20:20&nbsp;&nbsp;路演-随访(<span class="colorRed">否</span>)</span>
        </div>
        <div class="article">
            <table class="table w100p">
                <tr>
                    <td width="auto">
                        地点：上海 上海市  世纪大道2000号
                    </td>
                    <td width="auto" class="alignR">浦发银行(600000)招商银行(600036)--银行业</td>
                </tr>
                <tr>
                    <td width="auto" colspan="2">
                        备注：国泰基金管理有限公司\国泰基金管理有限公司\国泰基金管理有限公司\国泰基金管理有限公司\国泰基金管理有限公司\国泰基金管理有限公司\国泰基金管理有限公司\国泰基金管理有限公司\国泰基金管理有限公司\国泰基金管理有限公司\
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<div class="stk-box-s1 mb10 mr10 ml10">
    <div class="stk-ui-bar stk-hd"><span class="stk-tit">浦发银行(600000)</span><span class="fr mr10"><a href="#">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">删除</a> </span></div>
    <div class="stk-bd cooperatio-con-box">
        <div class="aside">
            <span class="date fwb"><b>服务人员：</b>张三、李四、管理员</span>
            <span class="opt-bax">2011-05-29 22:22 至2011-06-05 20:20&nbsp;&nbsp;路演-随访(<span class="colorRed">否</span>)</span>
        </div>
        <div class="article">
            <table class="table w100p">
                <tr>
                    <td width="auto">
                        地点：上海 上海市  世纪大道2000号
                    </td>
                    <td width="auto" class="alignR">国泰基金管理有限公司--郑杰--银行业</td>
                </tr>
                <tr>
                    <td width="auto" colspan="2">
                        备注：国泰基金管理有限公司\国泰基金管理有限公司\国泰基金管理有限公司\国泰基金管理有限公司\国泰基金管理有限公司\国泰基金管理有限公司\国泰基金管理有限公司\国泰基金管理有限公司\国泰基金管理有限公司\国泰基金管理有限公司\
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<div class="overlay">
    <div class="scheduling_bg stk-corner-all">
        <table width="500">
            <tr>
                <td class="alignR w100">客户</td><td><input type="text" value="请输入名称首字母" class="w210"/><button class="stk-button stk-button-st-4 ml5 w80">选择客户</button></td>
             </tr>
            <tr>
                <td class="alignR w100">服务人员</td><td><input type="text" value="请输入名称首字母" class="w210"/><button class="stk-button stk-button-st-4 ml5 w80">选择人员</button></td>

            </tr>
            <tr>
                <td class="alignR w100">联系人</td><td><input type="text" value="请输入名称首字母" class="w210"/><button class="stk-button stk-button-st-4 ml5 w80">选择人员</button></td>

            </tr>
            <tr>
                <td class="alignR w100">时间</td><td><input type="text"/></td>

            </tr>
            <tr>
                <td class="alignR w100">日程类型</td><td><select><option>路演</option></select><input type="checkbox">是否路演</td>
            </tr>
            <tr>
                <td class="alignR w100">地点</td><td><select><option>北京</option></select><select><option>北京</option></select></td>
            </tr>
            <tr>
                <td class="alignR w100">股票/上市公司</td><td><input type="text" value="请输入名称首字母" class="w210"/></td>

            </tr>
            <tr>
                <td class="alignR w100">行业</td><td><input type="text" value="请输入名称首字母" class="w210"/></td>

            </tr>
            <tr>
                <td class="alignR w100">备注</td><td><textarea class="w320">请输入备注，如：需完成合同签订</textarea></td>

            </tr>
        </table>
        <div class="alignC mt10"> <button class="stk-button stk-button-st-4 ml5 w80">提交</button><button class="stk-button stk-button-st-4 ml5 w80">取消</button></div>
    </div>
</div>
</body>
</html>