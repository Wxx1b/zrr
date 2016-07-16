<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>模板 - 基金全景图</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
    <script type="text/javascript">
    function toggleDiv(targetId,obj){
    	$('#'+targetId).toggle();
    	$(obj).find('.stk-ui-sort-desc').toggleClass('stk-ui-sort-asc');
    }
    </script>

    <script type="text/javascript">
    $(function(){
    	var nav_tab_li = $('.nav_tab li');
    	$('.tab_box div.tab-jijin:gt(0)').hide();

    	nav_tab_li.click(function(){
    		$(this).addClass('selected')
    			   .siblings().removeClass('selected');

    	var nav_tab_li_index = nav_tab_li.index(this);
    	$('.tab_box .tab-jijin').eq(nav_tab_li_index).show()
    					 .siblings().hide();
    	}).hover(function(){
    		$(this).addClass('hover');
    	},function(){
    		$(this).removeClass('hover');
    	});
    });
    </script>
</head>
<body>
<div class="stock-view-page p10">
  <div class="search-params-bar mb5">
    <table>
      <tr>
        <td class="tit"><label>基金代码</label></td>
        <td class="bd"><input type="text" placeholder="输入文字..." class="stk-input w100"/></td>
      </tr>
    </table>
  </div>
  <div class="main-title stk-ui-bar"> <span class="tit ml10 stk-fyh">华夏大盘（代码000011）</span> <span class="note-white stk-fb mr5">开放基金－混合型</span> <span class="note-white">成立日期 2004-08-11</span>
    <ul class="nav-list-right pr10 note-white">
      <li class="pr10">基金经理：<a href="#">王亚伟</a></li>
      <li class="pr10">管理人：<a href="#">王亚伟</a></li>
    </ul>
  </div>

  <div class="nav_tab nav-jijin">
    <ul>
      <li  class="selected"><a href="#"><span>基金综合信息</span></a></li>
      <li><a href="#"><span>资产组合</span></a></li>
      <li><a href="#"><span>基金概括</span></a></li>
      <li><a href="#"><span>财务报表</span></a></li>
    </ul>
  </div>

  <div class="tab_box">
  <!--tab1-->
  <div class="tab-jijin">
    <div class="sv-sec-box zoom clearfix mt5">
      <div class="left-part">
        <div class="main-huaxia-box clearfix">
          <div class="hd">
            <div class="stk-fl"> <span class="tit pl5">净值:10.7550</span> <span class="colorGreen">-0.1210(+1.13%)</span> <span class="stk-fyh">累计净值:10.8940</span> </div>
            <div class="stk-fr mr2"> <span class="size10">(2012-05-09)</span> </div>
          </div>
          <table class="pat7-table">
            <tbody>
              <tr>
                <th class="pl10">&nbsp;</th>
                <th class="stk-tc">基金收益</th>
                <th class="stk-tc">同类基金</th>
                <th class="stk-tc">超额收益</th>
                <th class="stk-tc">沪深300</th>
                <th class="stk-tc">超额收益</th>
              </tr>
              <tr>
                <td>最近一周</td>
                <td class="stk-tr colorRed">2.54%</td>
                <td class="stk-tr colorRed">2.54%</td>
                <td class="stk-tr colorRed">2.54%</td>
                <td class="stk-tr colorRed">2.54%</td>
                <td class="stk-tr colorRed">2.54%</td>
              </tr>
              <tr>
                <td>最近一月</td>
                <td class="stk-tr colorGreen">-0.91%</td>
                <td class="stk-tr colorGreen">-0.91%</td>
                <td class="stk-tr colorRed">2.54%</td>
                <td class="stk-tr colorGreen">-0.91%</td>
                <td class="stk-tr colorGreen">-0.91%</td>
              </tr>
              <tr>
                <td>最近一季</td>
                <td class="stk-tr colorRed">2.54%</td>
                <td class="stk-tr colorRed">2.54%</td>
                <td class="stk-tr colorRed">2.54%</td>
                <td class="stk-tr colorRed">2.54%</td>
                <td class="stk-tr colorRed">2.54%</td>
              </tr>
              <tr>
                <td>最近半年</td>
                <td class="stk-tr colorGreen">-0.91%</td>
                <td class="stk-tr colorGreen">-0.91%</td>
                <td class="stk-tr colorRed">2.54%</td>
                <td class="stk-tr colorGreen">-0.91%</td>
                <td class="stk-tr colorGreen">-0.91%</td>
              </tr>
              <tr>
                <td>最近一年</td>
                <td class="stk-tr colorRed">2.54%</td>
                <td class="stk-tr colorRed">2.54%</td>
                <td class="stk-tr colorRed">2.54%</td>
                <td class="stk-tr colorRed">2.54%</td>
                <td class="stk-tr colorRed">2.54%</td>
              </tr>
              <tr>
                <td>今年以来</td>
                <td class="stk-tr colorGreen">-0.91%</td>
                <td class="stk-tr colorGreen">-0.91%</td>
                <td class="stk-tr colorRed">2.54%</td>
                <td class="stk-tr colorGreen">-0.91%</td>
                <td class="stk-tr colorGreen">-0.91%</td>
              </tr>
              <tr>
                <td>成立以来</td>
                <td class="stk-tr colorRed">2.54%</td>
                <td class="stk-tr colorRed">2.54%</td>
                <td class="stk-tr colorRed">2.54%</td>
                <td class="stk-tr colorRed">2.54%</td>
                <td class="stk-tr colorRed">2.54%</td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="box-sta mt10">
          <div class="hd"> <span class="tit stk-fb">业绩走势</span> </div>
          <div class="bd zoom clearfix pt10 alignC" style="height:262px;"> <img src="../css/blue/images/config/stockview7.png"> </div>
        </div>
      </div>

      <div class="right-part">
      	<div class="jijin-pin pl5 clearfix">
        <span class="tit mr10 stk-fl">最新评级:</span>
        <div class="score-opt-box stk-fl">
              <ul>
              <li class="score mr10">4.5</li>
              <li class="score-opt">
                <div class="starts">
                	<b class="b-s b-sc"></b>
                    <b class="b-s"></b>
                    <b class="b-s"></b>
                    <b class="b-s"></b>
                    <b class="b-s"></b>
				</div>
              </li>
              </ul>
		</div>
        <span class="stk-fr colorGray mr5">张某某 于 2012-04-15</span>
        </div>
        <div class="clearfix"></div>
        <div class="box-sta pl5 mb5">
          <div class="hd"> <span class="tit stk-fb">最新报告</span> <b class="more-btn"><a href="#">更多&gt;&gt;</a></b> </div>
          <div class="bd zoom clearfix pt10" style="height:115px;">
            <table class="pat4-table">
              <tbody>
                <tr>
                  <td><span class="mr5">[基金调查报告]</span><a href="#">华夏大盘基金1季度分析报告...</a></td>
                  <td class="stk-tr">2012-03-30</td>
                </tr>
                <tr>
                  <td><span class="mr5">[基金调查报告]</span><a href="#">华夏大盘基金1季度分析报告...</a></td>
                  <td class="stk-tr">2012-03-30</td>
                </tr>
                <tr>
                  <td><span class="mr5">[基金调查报告]</span><a href="#">华夏大盘基金1季度分析报告...</a></td>
                  <td class="stk-tr">2012-03-30</td>
                </tr>
                <tr>
                  <td><span class="mr5">[基金调查报告]</span><a href="#">华夏大盘基金1季度分析报告...</a></td>
                  <td class="stk-tr">2012-03-30</td>
                </tr>
                <tr>
                  <td><span class="mr5">[基金调查报告]</span><a href="#">华夏大盘基金1季度分析报告...</a></td>
                  <td class="stk-tr">2012-03-30</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        <div class="box-sta pl5 mb5">
          <div class="hd"> <span class="tit stk-fb">最新公告</span> <b class="more-btn"><a href="#">更多&gt;&gt;</a></b> </div>
          <div class="bd zoom clearfix pt10" style="height:115px;">
            <table class="pat4-table">
              <tbody>
                <tr>
                  <td><a href="#">华夏大盘基金1季度分析报告...</a></td>
                  <td class="stk-tr">2012-03-30</td>
                </tr>
                <tr>
                  <td><a href="#">华夏大盘基金1季度分析报告...</a></td>
                  <td class="stk-tr">2012-03-30</td>
                </tr>
                <tr>
                  <td><a href="#">华夏大盘基金1季度分析报告...</a></td>
                  <td class="stk-tr">2012-03-30</td>
                </tr>
                <tr>
                  <td><a href="#">华夏大盘基金1季度分析报告...</a></td>
                  <td class="stk-tr">2012-03-30</td>
                </tr>
                <tr>
                  <td><a href="#">华夏大盘基金1季度分析报告...</a></td>
                  <td class="stk-tr">2012-03-30</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

       <div class="box-sta pl5 mb5">
          <div class="hd"> <span class="tit stk-fb">历史分红</span><b class="more-btn"><a href="#">更多&gt;&gt;</a></b> </div>
          <div class="bd zoom clearfix pt10" style="height:115px;">
            <table class="pat2-table">
              <tbody>
                <tr>
                  <th class="stk-tl">权益登录日</th>
                  <th>红利发放日</th>
                  <th class="stk-tc">分派方案</th>
                </tr>
                <tr>
                  <td>2012-04-09 </td>
                  <td class="stk-tc">2012-04-09 </td>
                  <td class="stk-tc">10派1</td>
                </tr>
                <tr>
                  <td>2012-04-09 </td>
                  <td class="stk-tc">2012-04-09 </td>
                  <td class="stk-tc">10派1</td>
                </tr>
                <tr>
                  <td>2012-04-09 </td>
                  <td class="stk-tc">2012-04-09 </td>
                  <td class="stk-tc">10派1</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <!--右边-->
    </div>
    <div class="clearfix"></div>
  </div><!--tab1-->

  <!--tab2-->
  <div class="tab-jijin">
    <div class="sv-sec-box zoom clearfix mt5">
      <div class="left-part">
        <div class="main-huaxia-box clearfix">
          <div class="hd">
            <div class="stk-fl"> <span class="tit pl5">占总资产比</span></div>
          </div>
          <table class="pat7-table">
            <tbody>
              <tr>
                <th class="pl10">&nbsp;</th>
                <th class="stk-tc">2011-12-31</th>
                <th class="stk-tc">2011-09-30</th>
                <th class="stk-tc">2011-06-30</th>
                <th class="stk-tc">2011-03-31</th>
              </tr>
              <tr>
                <td>股票</td>
                <td class="stk-tr">81.87%</td>
                <td class="stk-tr">81.87%</td>
                <td class="stk-tr">81.87%</td>
                <td class="stk-tr">81.87%</td>
              </tr>
              <tr>
                <td class="stk-tr">前三只股票</td>
                <td class="stk-tr">&nbsp;</td>
                <td class="stk-tr">&nbsp;</td>
                <td class="stk-tr">&nbsp;</td>
                <td class="stk-tr">&nbsp;</td>
              </tr>
              <tr>
                <td class="stk-tr">前五只股票</td>
                <td class="stk-tr">&nbsp;</td>
                <td class="stk-tr">&nbsp;</td>
                <td class="stk-tr">&nbsp;</td>
                <td class="stk-tr">&nbsp;</td>
              </tr>
              <tr>
                <td>债券</td>
                <td class="stk-tr">81.87%</td>
                <td class="stk-tr">81.87%</td>
                <td class="stk-tr">81.87%</td>
                <td class="stk-tr">81.87%</td>
              </tr>
              <tr>
                <td class="stk-tr">前三只股票</td>
                <td class="stk-tr">&nbsp;</td>
                <td class="stk-tr">&nbsp;</td>
                <td class="stk-tr">&nbsp;</td>
                <td class="stk-tr">&nbsp;</td>
              </tr>
              <tr>
                <td class="stk-tr">前五只股票</td>
                <td class="stk-tr">&nbsp;</td>
                <td class="stk-tr">&nbsp;</td>
                <td class="stk-tr">&nbsp;</td>
                <td class="stk-tr">&nbsp;</td>
              </tr>
              <tr>
                <td>银行存款</td>
                <td class="stk-tr">81.87%</td>
                <td class="stk-tr">81.87%</td>
                <td class="stk-tr">81.87%</td>
                <td class="stk-tr">81.87%</td>
              </tr>
              <tr>
                <td>其他</td>
                <td class="stk-tr">81.87%</td>
                <td class="stk-tr">81.87%</td>
                <td class="stk-tr">81.87%</td>
                <td class="stk-tr">81.87%</td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="box-sta mt10">
          <div class="hd"> <span class="tit stk-fb mr10">股票持仓</span><span>截止2011-12-31</span></div>
          <div class="bd-width100 zoom clearfix">
          <table class="pat7-table">
            <tbody>
              <tr>
                <th class="stk-tc">股票名称</th>
                <th class="stk-tc">股票代码</th>
                <th class="stk-tc">持仓数量<br>
                  （万股）</th>
                <th class="stk-tc">市值<br>
                  （万元）</th>
                <th class="stk-tc">占股票<br>
                  资产比</th>
                <th class="stk-tc">占总<br>
                  资产比</th>
              </tr>
              <tr>
                <td>广汇股份</td>
                <td class="stk-tc">600256</td>
                <td class="stk-tr">2878.00</td>
                <td class="stk-tr">59，229</td>
                <td class="stk-tr">9.42%</td>
                <td class="stk-tr">9.42%</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td class="stk-tc">&nbsp;</td>
                <td class="stk-tr">&nbsp;</td>
                <td class="stk-tr">&nbsp;</td>
                <td class="stk-tr">&nbsp;</td>
                <td class="stk-tr">&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td class="stk-tc">&nbsp;</td>
                <td class="stk-tr">&nbsp;</td>
                <td class="stk-tr">&nbsp;</td>
                <td class="stk-tr">&nbsp;</td>
                <td class="stk-tr">&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td class="stk-tc">&nbsp;</td>
                <td class="stk-tr colorRed">&nbsp;</td>
                <td class="stk-tr colorRed">&nbsp;</td>
                <td class="stk-tr colorRed">&nbsp;</td>
                <td class="stk-tr colorRed">&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td class="stk-tc">&nbsp;</td>
                <td class="stk-tr colorRed">&nbsp;</td>
                <td class="stk-tr colorRed">&nbsp;</td>
                <td class="stk-tr colorRed">&nbsp;</td>
                <td class="stk-tr colorRed">&nbsp;</td>
              </tr>
              <tr>
                <th class="stk-fb">总计</th>
                <th class="stk-tc stk-fb">&nbsp;</th>
                <th class="stk-tr stk-fb">&nbsp;</th>
                <th class="stk-tr stk-fb">259，229</th>
                <th class="stk-tr stk-fb">49.42%</th>
                <th class="stk-tr stk-fb">49.42%</th>
              </tr>
            </tbody>
          </table>
          </div>
        </div>

        <div class="box-sta mt10">
          <div class="hd"> <span class="tit stk-fb mr10">债券持仓</span><span>截止2011-12-31</span></div>
          <div class="bd-width100 zoom clearfix">
          <table class="pat7-table">
            <tbody>
              <tr>
                <th class="stk-tc">债券名称</th>
                <th class="stk-tc">债券代码</th>
                <th class="stk-tc">持仓数量<br>
                  （万股）</th>
                <th class="stk-tc">市值<br>
                  （万元）</th>
                <th class="stk-tc">占债券<br>
                  资产比</th>
                <th class="stk-tc">占总<br>
                  资产比</th>
              </tr>
              <tr>
                <td>11国债11</td>
                <td class="stk-tc">19111</td>
                <td class="stk-tr">2878.00</td>
                <td class="stk-tr">59，229</td>
                <td class="stk-tr">9.42%</td>
                <td class="stk-tr">9.42%</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td class="stk-tc">&nbsp;</td>
                <td class="stk-tr">&nbsp;</td>
                <td class="stk-tr">&nbsp;</td>
                <td class="stk-tr">&nbsp;</td>
                <td class="stk-tr">&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td class="stk-tc">&nbsp;</td>
                <td class="stk-tr">&nbsp;</td>
                <td class="stk-tr">&nbsp;</td>
                <td class="stk-tr">&nbsp;</td>
                <td class="stk-tr">&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td class="stk-tc">&nbsp;</td>
                <td class="stk-tr colorRed">&nbsp;</td>
                <td class="stk-tr colorRed">&nbsp;</td>
                <td class="stk-tr colorRed">&nbsp;</td>
                <td class="stk-tr colorRed">&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td class="stk-tc">&nbsp;</td>
                <td class="stk-tr colorRed">&nbsp;</td>
                <td class="stk-tr colorRed">&nbsp;</td>
                <td class="stk-tr colorRed">&nbsp;</td>
                <td class="stk-tr colorRed">&nbsp;</td>
              </tr>
              <tr>
                <th class="stk-fb">总计</th>
                <th class="stk-tc stk-fb">&nbsp;</th>
                <th class="stk-tr stk-fb">&nbsp;</th>
                <th class="stk-tr stk-fb">259，229</th>
                <th class="stk-tr stk-fb">49.42%</th>
                <th class="stk-tr stk-fb">49.42%</th>
              </tr>
            </tbody>
          </table>
          </div>
        </div>
      </div>

      <div class="right-part">
      	<div class="box-sta pl5 stk-tc" style="height:237px;"><img src="../css/blue/images/config/stockview7.jpg"></div>
        <div class="box-sta mt10 pl5">
          <div class="hd"> <span class="tit stk-fb mr10">行业分布</span><span>截止2011-12-31</span></div>
          <div class="bd-width100 zoom clearfix">
          <table class="pat7-table">
            <tbody>
              <tr>
                <th class="stk-tc">行业名称</th>
                <th class="stk-tc">持仓市值（万元）</th>
                <th class="stk-tc">占股票资产比</th>
                <th class="stk-tc">占总资产比</th>
                <th class="stk-tc">占总资产环比</th>
                </tr>
              <tr>
                <td>房地产业</td>
                <td class="stk-tr">108562.71</td>
                <td class="stk-tr">9.42%</td>
                <td class="stk-tr">9.42%</td>
                <td class="stk-tr colorRed">+1.43%</td>
                </tr>
              <tr>
                <td>建筑业</td>
                <td class="stk-tr">108562.71</td>
                <td class="stk-tr">9.42%</td>
                <td class="stk-tr">9.42%</td>
                <td class="stk-tr colorGreen">-1.43%</td>
                </tr>
              <tr>
                <td>&nbsp;</td>
                <td class="stk-tc">&nbsp;</td>
                <td class="stk-tr">&nbsp;</td>
                <td class="stk-tr">&nbsp;</td>
                <td class="stk-tr">&nbsp;</td>
                </tr>
              <tr>
                <td>&nbsp;</td>
                <td class="stk-tc">&nbsp;</td>
                <td class="stk-tr colorRed">&nbsp;</td>
                <td class="stk-tr colorRed">&nbsp;</td>
                <td class="stk-tr colorRed">&nbsp;</td>
                </tr>
              <tr>
                <td>&nbsp;</td>
                <td class="stk-tc">&nbsp;</td>
                <td class="stk-tr colorRed">&nbsp;</td>
                <td class="stk-tr colorRed">&nbsp;</td>
                <td class="stk-tr colorRed">&nbsp;</td>
                </tr>
            </tbody>
          </table>
          </div>
        </div>
      </div>
      <!--右边-->
    </div>
    <div class="clearfix"></div>
  </div><!--endtab2-->

  <!--tab3-->
    <div class="tab-jijin">
    <div class="sv-sec-box zoom clearfix mt5">
        <div class="main-huatai">
            <div class="tit-size14 stk-fb">基本信息</div>
        </div>
      	<div class="main-huaxia-box clearfix">
          <table class="pat7-table tab-solid-3px">
            <tbody>
              <tr>
                <th class="bgcolorGray stk-tr" width="15%">基金名称</th>
                <td>南方积极配置证券投资基金</td>
                <th class="bgcolorGray stk-tr" width="15%">发行日期</th>
                <td>2004-08-24</td>
              </tr>
              <tr>
                <th class="bgcolorGray stk-tr">基金简称代码</th>
                <td>南方积配（160105）</td>
                <th class="bgcolorGray stk-tr">上市日期</th>
                <td>2004-12-20</td>
              </tr>
              <tr>
                <th class="bgcolorGray stk-tr">基金类型</th>
                <td>LOF</td>
                <th class="bgcolorGray stk-tr">投资风格</th>
                <td>具有良好的流行性的A股等</td>
              </tr>
              <tr>
                <th class="bgcolorGray stk-tr">基金规模（最新）</th>
                <td>13.45（亿份）</td>
                <th class="bgcolorGray stk-tr">费率明细</th>
                <td><a href="#">查看</a></td>
              </tr>
              <tr>
                <th class="bgcolorGray stk-tr">联系人</th>
                <td>鲍文革</td>
                <th class="bgcolorGray stk-tr">&nbsp;</th>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <th class="bgcolorGray stk-tr">联系电话</th>
                <td>0755-82812000</td>
                <th class="bgcolorGray stk-tr">基金经理</th>
                <td><a href="#">姜文涛</a></td>
              </tr>
              <tr>
                <th class="bgcolorGray stk-tr">传真</th>
                <td>0755-82812000</td>
                <th class="bgcolorGray stk-tr">基金托管人</th>
                <td>中国工商银行股份有限公司</td>
              </tr>
              <tr>
                <th class="bgcolorGray stk-tr">邮编</th>
                <td>518026</td>
                <td>class="bgcolorGray stk-tr">基金管理人</td>
                <td>南方基金管理有限公司</td>
              </tr>
              <tr>
                <th class="bgcolorGray stk-tr">Email</th>
                <td><a href="mailto:service@southernfund.com">service@southernfund.com</a></td>
                <th class="bgcolorGray stk-tr">网址</th>
                <td><a href="#">http://www.southernfund.com</a></td>
              </tr>
              <tr>
                <th class="bgcolorGray stk-tr">办公地址</th>
                <td colspan="3">&nbsp;</td>
              </tr>
              <tr>
                <th class="bgcolorGray stk-tr">分配原则</th>
                <td colspan="3">&nbsp;</td>
              </tr>
              <tr>
                <th class="bgcolorGray stk-tr">投资目标</th>
                <td colspan="3">&nbsp;</td>
              </tr>
              <tr>
                <th class="bgcolorGray stk-tr">投资范围</th>
                <td colspan="3">&nbsp;</td>
              </tr>
              <tr>
                <th class="bgcolorGray stk-tr">业绩比较基准</th>
                <td colspan="3">&nbsp;</td>
              </tr>
              <tr>
                <th class="bgcolorGray stk-tr">基金简介</th>
                <td colspan="3">&nbsp;</td>
              </tr>
            </tbody>
          </table>
        </div>

        <div class="box-sta mt10">
          <div class="hd"> <span class="tit stk-fb">持有人统计</span></div>
          <div class="bd-width100 zoom clearfix">
          <table class="pat7-table stk-fl pat7-table-auto">
            <tbody>
              <tr>
                <th class="stk-fl">报告期</th>
                <td class="stk-tr">2011-12-31</td>
                <td class="stk-tr">2011-06-30</td>
                <td class="stk-tr">2010-12-31</td>
                <td class="stk-tr">2010-06-30</td>
              </tr>
              <tr>
                <th class="stk-fl">基金总份额</th>
                <td class="stk-tr">622,655,095.97</td>
                <td class="stk-tr">622,655,095.97</td>
                <td class="stk-tr">622,655,095.97</td>
                <td class="stk-tr">622,655,095.97</td>
              </tr>
              <tr>
                <th class="stk-fl">持有人户数</th>
                <td class="stk-tr">11,597</td>
                <td class="stk-tr">11,597</td>
                <td class="stk-tr">11,597</td>
                <td class="stk-tr">11,597</td>
              </tr>
              <tr>
                <th class="stk-fl">户均持有份额</th>
                <td class="stk-tr">53,691.05</td>
                <td class="stk-tr">53,691.05</td>
                <td class="stk-tr">53,691.05</td>
                <td class="stk-tr">53,691.05</td>
              </tr>
              <tr>
                <th class="stk-fl">机构持有份额</th>
                <td class="stk-tr">360,874,587.74</td>
                <td class="stk-tr">360,874,587.74</td>
                <td class="stk-tr">360,874,587.74</td>
                <td class="stk-tr">360,874,587.74</td>
              </tr>
              <tr>
                <th class="stk-fl">机构持有比例(%)</th>
                <td class="stk-tr">57.96</td>
                <td class="stk-tr">57.96</td>
                <td class="stk-tr">57.96</td>
                <td class="stk-tr">57.96</td>
              </tr>
              <tr>
                <th class="stk-fl">个人持有份额</th>
                <td class="stk-tr">261,780,155.13</td>
                <td class="stk-tr">261,780,155.13</td>
                <td class="stk-tr">261,780,155.13</td>
                <td class="stk-tr">261,780,155.13</td>
              </tr>
              <tr>
                <th class="stk-fl">个人持有比例（%）</th>
                <td class="stk-tr">42.04</td>
                <td class="stk-tr">42.04</td>
                <td class="stk-tr">42.04</td>
                <td class="stk-tr">42.04</td>
              </tr>
            </tbody>
          </table>
          <div class="ml10"><img src="../css/blue/images/config/stockview8.jpg"></div>
          </div>
        </div>


        <div class="box-sta mt10">
          <div class="hd"> <span class="tit stk-fb">前十大持有人列表</span></div>
          <div class="bd-width100 zoom clearfix">
          <table class="pat7-table">
            <tbody>
              <tr class="stk-tc">
                <th class="stk-tc">持有人名称</th>
                <th class="stk-tc">持有人份额</th>
                <th class="stk-tc" width="60%">占比</th>
              </tr>
              <tr>
                <td class="stk-tc">李光里</td>
                <td class="stk-tr">108562.71</td>
                <td class="stk-tc">9.42%</td>
              </tr>
              <tr>
                <td class="stk-tc">陈耀光</td>
                <td class="stk-tr">108562.71</td>
                <td class="stk-tc">9.42%</td>
                </tr>
            </tbody>
          </table>
          </div>
        </div>

	</div>
	</div>
  <!--endtab3-->

  <!--tab4-->
  <div class="tab-jijin">
    <div class="sv-sec-box zoom clearfix mt5">
      	<div class="clearfix w80p">
        <div class="main-huatai ">
          <div class="tit pl5">财务指标</div>
        </div>
          <table class="pat7-table  pat7-table-no">
            <tbody>
              <tr>
                <th class="bgcolorGray">项目</th>
                <th class="bgcolorGray stk-tr">2011-12-31</th>
                <th class="bgcolorGray stk-tr">2011-09-30</th>
                <th class="bgcolorGray stk-tr">2011-06-30</th>
                <th class="bgcolorGray stk-tr">2011-03-31</th>
              </tr>
              <tr>
                <td>本期已实现收益（元）</td>
                <td class="stk-tr">212,320.00万元</td>
                <td class="stk-tr">212,320.00万元</td>
                <td class="stk-tr">212,320.00万元</td>
                <td class="stk-tr">212,320.00万元</td>
              </tr>
              <tr>
                <td>本期利润（元）</td>
                <td class="stk-tr">212,320.00万元</td>
                <td class="stk-tr">212,320.00万元</td>
                <td class="stk-tr">212,320.00万元</td>
                <td class="stk-tr">212,320.00万元</td>
              </tr>
              <tr>
                <td>本期加权平均净值利润率（%）</td>
                <td class="stk-tr">5.56%</td>
                <td class="stk-tr">5.56%</td>
                <td class="stk-tr">5.56%</td>
                <td class="stk-tr">5.56%</td>
              </tr>
            </tbody>
          </table>
        </div>

        <div class="box-sta mt10">
          <div class="clearfix w80p">
        <div class="main-huatai ">
          <div class="tit pl5">资产负债<span class=" ml10 colorBlue">按基础数据中的实际科目显示</span></div>
        </div>
          <table class="pat7-table  pat7-table-no">
            <tbody>
              <tr>
                <th class="bgcolorGray">项目</th>
                <th class="bgcolorGray stk-tr">数值（元）</th>
              </tr>
              <tr>
                <th colspan="2" class="bgcolorGray">资产</th>
              </tr>
              <tr>
                <td>银行存款</td>
                <td class="stk-tr">212,320.00</td>
              </tr>
              <tr>
                <td>结算准备金</td>
                <td class="stk-tr">212,320.00</td>
              </tr>
            </tbody>
          </table>
        </div>
        </div>

	</div>
	</div>
  <!--endtab4-->
  </div>
</div>
</body>
</html>