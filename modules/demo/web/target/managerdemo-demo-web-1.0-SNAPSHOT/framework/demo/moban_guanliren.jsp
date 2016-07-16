<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>模板 -管理人全景图</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
    <script type="text/javascript">
    function toggleDiv(targetId,obj){
    	$('#'+targetId).toggle();
    	$(obj).find('.stk-ui-sort-desc').toggleClass('stk-ui-sort-asc');
    }
    </script>
</head>
<body>
<div class="stock-view-page p10">
  <div class="search-params-bar mb5">
    <table>
      <tr>
        <td class="tit"><label>基金公司</label></td>
        <td class="bd"><input type="text" class="stk-input w100"/></td>
      </tr>
    </table>
  </div>
  <div class="main-huaxia-title stk-ui-bar"> <span class="tit colorRed mr10 ml10">华夏基金(代码000235)</span> <span class="mr10">资产规模:<strong class="stk-fb colorRed">1790.88亿</strong></span> <span class="mr10">(<span class="colorGray">截止日期2012-12-30</span>)</span> <span class="mr10">旗下基金<a href="#" class="stk-fb">29只</a></span> <span class="mr10">基金经理<a href="#" class="stk-fb">28位</a></span> </div>


  <div class="sv-sec-box zoom clearfix mt5">
    <div class="left-part">
      <div class="main-huaxia-box">
      	<div class="hd"><span class="tit pl10">基本信息</span></div>
        <table class="pat5-table mb2">
        <tbody>
          <tr>
            <th class="pl10">公司名称</th>
            <td>华夏基金管理有限公司</td>
            <th>成立日期</th>
            <td>2,315.63</td>
          </tr>
          <tr>
            <th class="pl10">注册资本(万)</th>
            <td>23800</td>
            <th>组织形式</th>
            <td>中外合资企业</td>
          </tr>
          <tr>
            <th class="pl10">官网地址</th>
            <td colspan="3">http://www.chinaamc.com</td>
          </tr>
          <tr>
            <th class="pl10">公司地址</th>
            <td colspan="3">北京市西城区金融大街33号通泰大厦B座</td>
          </tr>
        </tbody>
      </table>
	  <div class="hd"><span class="tit pl10">资产规模（<span>截止2011-12-31</span>）</span></div>
      <table  class="pat5-table  mb2">
        <tbody>
          <tr>
            <th class="pl10">总资产规模</th>
            <td>1790.88亿元</td>
            <th>排名</th>
            <td>1/67</td>
            <th>规模变化</th>
            <td class="stk-tr stk-fb colorGreen">-9.0%</td>
          </tr>
          <tr>
            <th class="pl10">总资产规模</th>
            <td>1790.88亿元</td>
            <th>排名</th>
            <td>1/67</td>
            <th>规模变化</th>
            <td class="stk-tr stk-fb colorGreen">-9.0%</td>
          </tr>
          <tr>
            <th class="pl10">总资产规模</th>
            <td>1790.88亿元</td>
            <th>排名</th>
            <td>1/67</td>
            <th>规模变化</th>
            <td class="stk-tr stk-fb colorGreen">-9.0%</td>
          </tr>
          <tr>
            <th rowspan="2" class="pl10">股票资产</th>
            <td rowspan="2">1790.88亿元</td>
            <th>排名</th>
            <td>1/67</td>
            <th>环比</th>
            <td class="stk-tr stk-fb colorGreen">-9.0%</td>
          </tr>
          <tr>
            <th>市场平均</th>
            <td>644.20亿元</td>
            <th>差异</th>
            <td class="stk-tr stk-fb colorGreen">-9.0%</td>
          </tr>
          <tr>
            <th rowspan="2" class="pl10">债券资产</th>
            <td rowspan="2">1790.88亿元</td>
            <th>排名</th>
            <td>1/67</td>
            <th>环比</th>
            <td class="stk-tr stk-fb colorGreen">-9.0%</td>
          </tr>
          <tr>
            <th>市场平均</th>
            <td>644.20亿元</td>
            <th>差异</th>
            <td class="stk-tr stk-fb colorGreen">-9.0%</td>
          </tr>
          <tr>
            <th rowspan="2" class="pl10">现金</th>
            <td rowspan="2">1790.88亿元</td>
            <th>排名</th>
            <td>1/67</td>
            <th>环比</th>
            <td class="stk-tr stk-fb colorRed">9.0%</td>
          </tr>
          <tr>
            <th>市场平均</th>
            <td>644.20亿元</td>
            <th>差异</th>
            <td class="stk-tr stk-fb colorRed">9.0%</td>
          </tr>
        </tbody>
      </table>
      </div>

      <div class="p10 stk-tc"> <img src="../css/blue/images/config/stockview6.jpg"> </div>
    </div>

    <div class="right-part">
      <div class="box-sta pl5 mb5">
        <div class="hd"> <span class="tit stk-fb">最新内部报告</span> <b class="more-btn"><a href="#">更多&gt;&gt;</a></b> </div>
        <div class="bd zoom clearfix pt10" style="height:115px;">
          <table class="pat4-table">
            <tbody>
              <tr>
                <td><span class="mr5">[调查报告]</span><a href="#">华夏基金管理有限公司1季度调研报告...</a></td>
                <td class="stk-tr">2012-03-30</td>
              </tr>
              <tr>
                <td><span class="mr5">[调查报告]</span><a href="#">华夏基金管理有限公司1季度调研报告...</a></td>
                <td class="stk-tr">2012-03-30</td>
              </tr>
              <tr>
                <td><span class="mr5">[调查报告]</span><a href="#">华夏基金管理有限公司1季度调研报告...</a></td>
                <td class="stk-tr">2012-03-30</td>
              </tr>
              <tr>
                <td><span class="mr5">[调查报告]</span><a href="#">华夏基金管理有限公司1季度调研报告...</a></td>
                <td class="stk-tr">2012-03-30</td>
              </tr>
              <tr>
                <td><span class="mr5">[调查报告]</span><a href="#">华夏基金管理有限公司1季度调研报告...</a></td>
                <td class="stk-tr">2012-03-30</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <div class="box-sta pl5 mb5">
        <div class="hd"> <span class="tit stk-fb">最新内部报告</span> <b class="more-btn"><a href="#">更多&gt;&gt;</a></b> </div>
        <div class="bd zoom clearfix pt10" style="height:115px;">
          <table class="pat4-table">
            <tbody>
              <tr>
                <td><span class="mr5">[华夏基金]</span><a href="#">基于调整基金对账单服务方式的公告...</a></td>
                <td class="stk-tr">2012-03-30</td>
              </tr>
              <tr>
                <td><span class="mr5">[华夏基金]</span><a href="#">基于调整基金对账单服务方式的公告...</a></td>
                <td class="stk-tr">2012-03-30</td>
              </tr>
              <tr>
                <td><span class="mr5">[华夏基金]</span><a href="#">基于调整基金对账单服务方式的公告...</a></td>
                <td class="stk-tr">2012-03-30</td>
              </tr>
              <tr>
                <td><span class="mr5">[华夏基金]</span><a href="#">基于调整基金对账单服务方式的公告...</a></td>
                <td class="stk-tr">2012-03-30</td>
              </tr>
              <tr>
                <td><span class="mr5">[华夏基金]</span><a href="#">基于调整基金对账单服务方式的公告...</a></td>
                <td class="stk-tr">2012-03-30</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>


      <div class="box-sta pl5 mb5">
        <div class="hd"> <span class="tit stk-fb">股东持投</span> </div>
        <div class="bd zoom clearfix pt10 alignC" style="height:242px;"> <img src="../css/blue/images/config/stockview5.jpg"> </div>
      </div>
    </div><!--右边-->
  </div>

  <div class="sv-sec-box zoom clearfix mt5">
  	<div class="box-sta mb10">
            <div class="hd cursor" onClick="toggleDiv('J_td_1',this);">
           	  <span class="tit stk-fb mr10">旗下基金</span><span class="mr10">封闭基金2只</span><span class="mr10">开放基金27只</span>
                <b class="stk-ui-sort-desc extra-btn"></b>
            </div>
            <div id="J_td_1" class="bd zoom clearfix pt10">
            <table class="pat2-table " >
            <thead>
                <tr>
                    <th>基金代码</th>
                    <th>基金名称</th>
                    <th>成立日期</th>
                    <th>基金类型</th>
                    <th>基金分类</th>
                    <th>最新份额（万份）</th>
                    <th>基金经理</th>
                    <th>最新净值</th>
                    <th>净值日期</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="stk-tc"><a href="#">519029</a></td>
                    <td class="stk-tc"><a href="#">华泰稳增混合</a></td>
                    <td class="stk-tc size11">2008-09-08</td>
                    <td class="stk-tc">开放式基金</td>
                    <td class="stk-tc">偏股式基金</td>
                    <td class="stk-tr pr10">335078.76</td>
                    <td class="stk-tc"><a href="#">王海维</a></td>
                    <td class="stk-tr">1.319</td>
                    <td class="stk-tc size11">2008-09-08</td>
                </tr>
                <tr class="even">
                  <td class="stk-tc"><a href="#">510050</a></td>
                  <td class="stk-tc"><a href="#">华泰稳增混合</a></td>
                  <td class="stk-tc size11">2008-09-08</td>
                  <td class="stk-tc">开放式基金</td>
                  <td class="stk-tc">偏股式基金</td>
                  <td class="stk-tr pr10">1282556.58</td>
                  <td class="stk-tc"><a href="#">方军</a></td>
                  <td class="stk-tr">1.789</td>
                  <td class="stk-tc size11">2008-09-08</td>
                </tr>
                <tr>
                  <td class="stk-tc"><a href="#">500028</a></td>
                  <td class="stk-tc"><a href="#">华泰稳增混合</a></td>
                  <td class="stk-tc size11">2008-09-08</td>
                  <td class="stk-tc">开放式基金</td>
                  <td class="stk-tc">偏股式基金</td>
                  <td class="stk-tr pr10">335078.76</td>
                  <td class="stk-tc"><a href="#">王海维</a></td>
                  <td class="stk-tr">0.978</td>
                  <td class="stk-tc size11">2008-09-08</td>
                </tr>
                <tr class="even">
                  <td class="stk-tc"><a href="#">288102</a></td>
                  <td class="stk-tc"><a href="#">华泰稳增混合</a></td>
                  <td class="stk-tc size11">2008-09-08</td>
                  <td class="stk-tc">开放式基金</td>
                  <td class="stk-tc">偏股式基金</td>
                  <td class="stk-tr pr10">1282556.58</td>
                  <td class="stk-tc"><a href="#">方军</a></td>
                  <td class="stk-tr">1.021</td>
                  <td class="stk-tc size11">2008-09-08</td>
                </tr>
                <tr>
                  <td class="stk-tc"><a href="#">255001</a></td>
                  <td class="stk-tc"><a href="#">华泰稳增混合</a></td>
                  <td class="stk-tc size11">2008-09-08</td>
                  <td class="stk-tc">开放式基金</td>
                  <td class="stk-tc">偏股式基金</td>
                  <td class="stk-tr pr10">335078.76</td>
                  <td class="stk-tc"><a href="#">王海维</a></td>
                  <td class="stk-tr">2.378</td>
                  <td class="stk-tc size11">2008-09-08</td>
                </tr>
                <tr class="even">
                  <td class="stk-tc"><a href="#">001023</a></td>
                  <td class="stk-tc"><a href="#">华泰稳增混合</a></td>
                  <td class="stk-tc size11">2008-09-08</td>
                  <td class="stk-tc">开放式基金</td>
                  <td class="stk-tc">偏股式基金</td>
                  <td class="stk-tr pr10">1282556.58</td>
                  <td class="stk-tc"><a href="#">方军</a></td>
                  <td class="stk-tr">2.26</td>
                  <td class="stk-tc size11">2008-09-08</td>
                </tr>
                <tr>
                  <td class="stk-tc"><a href="#">025445</a></td>
                  <td class="stk-tc"><a href="#">华泰稳增混合</a></td>
                  <td class="stk-tc size11">2008-09-08</td>
                  <td class="stk-tc">开放式基金</td>
                  <td class="stk-tc">偏股式基金</td>
                  <td class="stk-tr pr10">335078.76</td>
                  <td class="stk-tc"><a href="#">王海维</a></td>
                  <td class="stk-tr">1.015</td>
                  <td class="stk-tc size11">2008-09-08</td>
                </tr>
            </tbody>
            </table>
            </div>
    </div>
  </div>


  <div class="sv-sec-box zoom clearfix mt5">
  	<div class="box-sta mb10">
      <div class="hd cursor" onClick="toggleDiv('J_td_2',this);">
           	  <span class="tit stk-fb mr10">旗下基金经理</span><span class="colorBlue stk-fb">28位</span>
                <b class="stk-ui-sort-desc extra-btn"></b>
            </div>
            <div id="J_td_2" class="bd zoom clearfix pt10">
            <table class="pat2-table " >
            <thead>
                <tr>
                    <th>姓名</th>
                    <th>基金经理年限（年）</th>
                    <th>目前管理基金</th>
                    <th>曾管理基金个数</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="stk-tc"><a href="#">岑小青</a></td>
                    <td class="stk-tc">7.9</td>
                    <td class="stk-tc"><a href="#">华夏大盘</a> (2005-05-02)<b class="splitr ml10 mr10"></b><a href="#">华夏策略精选</a> （2010-07-08）</td>
                    <td class="stk-tc">&nbsp;</td>
                </tr>
                <tr class="even">
                  <td class="stk-tc"><a href="#">岑小青</a></td>
                  <td class="stk-tc">5.8</td>
                  <td class="stk-tc"><a href="#">华夏大盘</a> (2005-05-02)<b class="splitr ml10 mr10"></b><a href="#">华夏策略精选</a> （2010-07-08）</td>
                  <td class="stk-tc">&nbsp;</td>
                </tr>
                <tr>
                  <td class="stk-tc"><a href="#">岑小青</a></td>
                  <td class="stk-tc">8.5</td>
                  <td class="stk-tc"><a href="#">华夏大盘</a> (2005-05-02)<b class="splitr ml10 mr10"></b><a href="#">华夏策略精选</a> （2010-07-08）</td>
                  <td class="stk-tc">&nbsp;</td>
                </tr>
              </tbody>
            </table>
            </div>
    </div>
  </div>
</div>
</body>
</html>