<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>模板 - 按钮</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
    <style type="text/css">
        body, td, th {
            font-family: tahoma, helvetica, \5b8b\4f53, "bitstream vera sans", arial, sans-serif;
        }
    </style>

</head>
<body>
<div class="week-box mb10 mr10 ml10">
  <div class="stk-ui-bar week-hd"><a href="#" class="icon-left"></a><span class="week-tit">周日程展示界面效果图</span><a href="#" class="icon-right ml5"></a></div>
  <table class="stk-table-st6 w100p">
  <tr>
    <td class="td_first-child">
    <td class="td_first-child" >周一（2012/06/04）</td>
    <td class="td_first-child">周二（2012/06/05）</td>
    <td class="td_first-child">周三（2012/06/06）</td>
    <td class="td_first-child">周四（2012/06/07）</td>
    <td class="td_first-child">周五（2012/06/08）</td>
    <td class="td_first-child">周六（2012/06/09）</td>
    <td class="td_first-child">周日（2012/06/010）</td>
    <td class="td_first-child">周一（2012/06/09）</td>
    </tr>
  <tr>
    <th rowspan="3">张三</th>
    <td colspan="4"><a href="#" class="calendar_selfinput">手工录入－本人录入</a></td>
    <td><a href="#" class="calendar_selfinput">手工录入－本人录入</a></td>
    <td class="colorbgGray">&nbsp;</td>
    <td class="colorbgGray">&nbsp;</td>
    <td><a href="#" class="calendar_auto">自动生成</a></td>
    </tr>
  <tr>
    <td colspan="2"><a href="#" class="calendar_otherinput">手工录入－他人录入</a></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td class="colorbgGray">&nbsp;</td>
    <td class="colorbgGray">&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><a href="#" class="calendar_selfinput">手工录入－本人录入</a></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td class="colorbgGray">&nbsp;</td>
    <td class="colorbgGray">&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <th rowspan="2">李四</th>
    <td colspan="4"><a href="#" class="calendar_otherinput">手工录入－他人录入</a></td>
    <td>&nbsp;</td>
    <td class="colorbgGray">&nbsp;</td>
    <td class="colorbgGray">&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><a href="#" class="calendar_auto">自动生成</a></td>
    <td class="colorbgGray">&nbsp;</td>
    <td class="colorbgGray">&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <th>王五</th>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><a href="#" class="calendar_auto">自动生成</a></td>
    <td class="colorbgGray">&nbsp;</td>
    <td class="colorbgGray">&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <th rowspan="3">张三</th>
    <td colspan="4"><a href="#" class="calendar_selfinput">手工录入－本人录入</a></td>
    <td><a href="#" class="calendar_auto">自动生成</a></td>
    <td class="colorbgGray">&nbsp;</td>
    <td class="colorbgGray">&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td colspan="2"><a href="#" class="calendar_otherinput">手工录入－他人录入</a></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td class="colorbgGray">&nbsp;</td>
    <td class="colorbgGray">&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><a href="#" class="calendar_otherinput">手工录入－他人录入</a></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td class="colorbgGray">&nbsp;</td>
    <td class="colorbgGray">&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <th rowspan="2">李四</th>
    <td colspan="4"><a href="#" class="calendar_otherinput">手工录入－他人录入</a></td>
    <td>&nbsp;</td>
    <td class="colorbgGray">&nbsp;</td>
    <td class="colorbgGray">&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><a href="#" class="calendar_auto">自动生成</a></td>
    <td class="colorbgGray">&nbsp;</td>
    <td class="colorbgGray">&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <th>王五</th>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><a href="#" class="calendar_auto">自动生成</a></td>
    <td class="colorbgGray">&nbsp;</td>
    <td class="colorbgGray">&nbsp;</td>
    <td><a href="#" class="calendar_auto">自动生成</a></td>
    </tr>
</table>
	<div class="prompt-date"><b class="stk-button-icon stk-child-close"></b>

    <p class="colorGray">12年5月8日 9:00-12:00</p>
    <p>今天内部会议内容提要：今天内部会议内容，今天内部会议内容。今天内部会议内容，今天内部会议内容。今天内部会议内容，今天内部会议内容。</p>

    </div>

</div>
</body>
</html>