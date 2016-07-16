<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>模板 - 报告审批</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
    <script type="text/javascript">
    function toggleDiv(targetId,obj){
    	$('#'+targetId).toggle();
    	$(obj).find('.stk-ui-sort-desc').toggleClass('stk-ui-sort-asc');
    }

    $(function() {
    	$('table.pat8-table tr:odd').addClass('bgcolorGray');
    });
    </script>
</head>
<body>
<div class="stock-view-page pt10 pl10 pr10">
  <div class="stk-fyh size16 stk-tc">业务审批</div>
  <div class="main-huaxia-box">
    <table class="pat7-table pat7-table-td-balck">
        <tr>
          <th class="stk-tr bgcolorGray w120">报告附件</th>
          <td colspan="3"><p><span class="colorSkyblue mr5 stk-fb">[报告模板]</span><em class="icon-st47 mr5"></em><a href="#">中程基金帐务表.doc</a></p>
            <p><span class="colorOrg mr5 stk-fb">[普通附件]</span><em class="icon-st47 mr5"></em><a href="#">中程基金帐务表.doc</a></p></td>
        </tr>
        <tr>
          <td colspan="4" class="bgcolorGray">&nbsp;
            </td>
        </tr>
        <tr>
          <th class="stk-tr bgcolorGray">股票/行业</th>
          <td colspan="3"><a href="#">白云机场</a> / <a href="#">机场及航空运输辅助业</a></td>
        </tr>
        <tr>
          <th class="stk-tr bgcolorGray">标题</th>
          <td colspan="3">提交报告 －－公司类普通报告</td>
        </tr>
        <tr>
          <th class="stk-tr bgcolorGray">副标题</th>
          <td colspan="3">&nbsp;</td>
        </tr>
        <tr>
          <th class="stk-tr bgcolorGray">报告作者</th>
          <td colspan="3">Sirm管理员</td>
        </tr>
        <tr>
          <th class="stk-tr bgcolorGray">关键字</th>
          <td colspan="3">&nbsp;</td>
        </tr>
        <tr>
          <th class="stk-tr bgcolorGray">摘要</th>
          <td colspan="3">提交报告－－公司类普通报告</td>
        </tr>
        <tr>
          <th class="stk-tr bgcolorGray">文档密级</th>
          <td colspan="3"><span class="mr20">无</span><span class="mr20">立即发送（<strong>是</strong>）</span><span class="mr20"> 加急（<strong>否</strong>）</span></td>
        </tr>
        <tr>
          <th class="stk-tr bgcolorGray">文档重要度</th>
          <td colspan="3"><div>
              <div id="J_starts" class="stk-starts-ui fl"> <b class="b-s b-sc"></b> <b class="b-s b-sc"></b> <b class="b-s b-sc"></b> <b class="b-s b-sc"></b> <b class="b-s"></b> </div>
            </div></td>
        </tr>
        <tr>
          <th class="stk-tr bgcolorGray">短信内容</th>
          <td colspan="3">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="4" class="stk-tr bgcolorGray">&nbsp;</td>
        </tr>
        <tr>
          <th class="stk-tr bgcolorGray">投资评级</th>
          <td>强买</td>
          <th  class="stk-tr  bgcolorGray w120">6月目标价格（元）</th>
          <td>&nbsp;</td>
        </tr>
    </table>
    <table class="pat8-table">
      <tr>
        <th class="stk-fb">预测项目</th>
        <th class="stk-fb stk-tr">-2A</th>
        <th class="stk-fb stk-tr">-1A</th>
        <th class="stk-fb stk-tr">0E</th>
        <th class="stk-fb stk-tr">2E</th>
      </tr>
      <tr>
        <td>总股本（百万）</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>营业收入（百万）</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>净利润（百万）</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>EPS</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
  </div>
  <div class="mt5 clearfix">
    <table class="pat7-table pat7-table-td-balck pat7-table-border-balck">
      <tr>
        <th class="stk-fb">合规/业务检测</th>
        <th class="stk-fb">检测结果</th>
        <th class="stk-fb">备注</th>
      </tr>
      <tr>
        <td>盈利预测检查</td>
        <td>合规</td>
        <td>null</td>
      </tr>
      <tr>
        <td>持仓检查</td>
        <td>合规</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>评级检查</td>
        <td>合规</td>
        <td>null</td>
      </tr>
      <tr>
        <td>目标价检查</td>
        <td>合规</td>
        <td>&nbsp;</td>
      </tr>
    </table>
  </div>
  <div class="mt10 report-examine">
  	<div class="hd">
    	<span class="stk-fb">处理结果</span> / 写出通过或驳回的理由
        <div class="font-maxSize">还可以输入<strong>100</strong>字</div>
    </div>
    <div class="content">
    	<div class="mb10"><textarea class="w630 h80"></textarea></div>
        <div><button class="stk-button stk-button-st-3 mr20"><span>审批通过</span></button> <button class="stk-button stk-button-st-3"><span>审批驳回</span></button></div>
    </div>
  </div>
</div>
</body>
</html>