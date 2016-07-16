<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>模板 - 按钮</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
    <script type="text/javascript">
    (function($){
        $.extend($.fn,{
            tipExtra : function(setting){
                var opt = $.extend({
                    html : 'ddd',
                    width : 'auto'
                });
                var tip = $('<div/>').css({
                        "position" : "absolute",
                        "width" : opt.width,
                        "z-index" : 10000,
                        "display" : "none",
                        "border" : "1px solid #bfbfbf"
                    }).append(opt.html);
                var _wh = $.offHeight();
                var bg = $('<div style="position:absolute;top:0;left:0;width:100%;height:'+_wh+'px;z-index:9999;background-color:transparent"></div>').click(function(){
                        tip.remove();
                        $(this).remove();
                    });
                $(this).click(function(){
                    tip.appendTo('body').show();
                    bg.appendTo('body').show();
                })



            }
        });
    })(jQuery)
    $(function(){
        $('#J_extra_1').tipExtra();
        STK.init()
    });
    </script>
</head>
<body>
<div class="index-main-panel">
    <h3 class="index-welcome-info">早上好，陈国庆<span class="summary">（管理员）</span></h3>
    <div class="general">
       		<a href="#">待处理事宜<span class="colorRed">(10)</span></a>
            <a href="#" id="statu">未读消息<span class="colorRed">(0)</span></a>
       		<a href="#">上市公司公告<span class="colorRed">(10)</span></a>
            <a href="#">今日日程<span class="colorRed">(10)</span></a>
        <a href="#" class="setting">设置</a>
    </div>
<div class="index-drag-fra">
    <div class="index-drag-column" style="margin-right:-1px;width:70%">
        <ul class="index-drag-column-ul">
        <li class="index-drag-box">
            <b class="boxbannertop"><b class="b-1"></b><b class="b-2"></b><b class="b-3"></b></b>
            <div class="box-body">
                <div class="box-title">
                    <b class="index-icon icon-1"></b>
                    <h3 class="box-header-title title-1 fl mr10">热点报告</h3>
                    <div class="fl">|<a href="#">more &raquo;</a></div>
                </div>
                <div class="box-content">
                	<ul class="stk-ui-tabs-bar2">
                    	<li class="stk-ui-tabs-item"><a href="#" class="stk-select">内部报告</a></li>
                        <li class="stk-ui-tabs-item"><a href="#">外部报告</a></li>
                    </ul>
                    <ul class="rep-list-ul">
                        <li><b class="icon-st47"></b><span class="sirm-stock-innerrating20">[强买]</span><a href="javascript:void(0);">光迅科技(002281)动态报告</a><span class="colorRed">(255次)</span><span class="name">作者：伟亮</span></li>
                        <li><b class="icon-st47"></b><span class="sirm-stock-innerrating30">[买入]</span><a href="javascript:void(0);">光迅科技(002281)动态报告</a><span class="colorRed">(255次)</span><span class="name">作者：伟亮</span></li>
                        <li><b class="icon-st47"></b><span class="sirm-stock-innerrating40">[中性]</span><a href="javascript:void(0);">光迅科技(002281)动态报告</a><span class="colorRed">(255次)</span><span class="name">作者：伟亮</span></li>
                        <li><b class="icon-st47"></b><span class="sirm-stock-innerrating50">[卖出]</span><a href="javascript:void(0);">光迅科技(002281)动态报告</a><span class="colorRed">(255次)</span><span class="name">作者：伟亮</span></li>
                        <li><b class="icon-st47"></b><span class="sirm-stock-innerrating60">[强卖]</span><a href="javascript:void(0);">光迅科技(002281)动态报告</a><span class="colorRed">(255次)</span><span class="name">作者：伟亮</span></li>

                    </ul>
                </div>
                <div class="box-opt-bar"><b class="common-bg-icon setting"></b><b class="common-bg-icon refresh"></b><b class="common-bg-icon close"></b></div>
            </div>
            <b class="boxbannerbottom"><b class="b-1"></b><b class="b-2"></b><b class="b-3"></b></b>
        </li>
        <li class="index-drag-box">
            <b class="boxbannertop"><b class="b-1"></b><b class="b-2"></b><b class="b-3"></b></b>
            <div class="box-body">
                <div class="box-title">
                    <b class="index-icon icon-2"></b>
                    <h3 class="box-header-title title-3  fl mr10">荐股价差</h3>
                    <div class="fl">|<a href="#">more &raquo;</a></div>
                </div>
                <div class="box-content">

                </div>
                <div class="box-opt-bar"><b class="common-bg-icon setting"></b><b class="common-bg-icon refresh"></b><b class="common-bg-icon close"></b></div>
            </div>
            <b class="boxbannerbottom"><b class="b-1"></b><b class="b-2"></b><b class="b-3"></b></b>
        </li>
        <li class="index-drag-box">
            <b class="boxbannertop"><b class="b-1"></b><b class="b-2"></b><b class="b-3"></b></b>
            <div class="box-body">
                <div class="box-title">
                    <b class="index-icon icon-6"></b>
                    <h3 class="box-header-title title-5 fl mr10">关注报告</h3>
                    <div class="fl">|<a href="#">more &raquo;</a></div>
                </div>
                <div class="box-content">
                	<ul class="stk-ui-tabs-bar2">
                    	<li class="stk-ui-tabs-item"><a href="#" class="stk-select">内部报告</a></li>
                        <li class="stk-ui-tabs-item"><a href="#">外部报告</a></li>
                    </ul>
                    <ul class="rep-list-ul">
                        <li><b class="icon-st47"></b><span class="sirm-stock-innerrating20">[强买]</span><a href="javascript:void(0);">光迅科技(002281)动态报告</a><span class="name">银河证券</span></li>
                        <li><b class="icon-st47"></b><span class="sirm-stock-innerrating30">[买入]</span><a href="javascript:void(0);">光迅科技(002281)动态报告</a><span class="name">银河证券</span></li>
                        <li><b class="icon-st47"></b><span class="sirm-stock-innerrating40">[中性]</span><a href="javascript:void(0);">光迅科技(002281)动态报告</a><span class="name">银河证券</span></li>
                        <li><b class="icon-st47"></b><span class="sirm-stock-innerrating50">[卖出]</span><a href="javascript:void(0);">光迅科技(002281)动态报告</a><span class="name">银河证券</span></li>
                        <li><b class="icon-st47"></b><span class="sirm-stock-innerrating60">[强卖]</span><a href="javascript:void(0);">光迅科技(002281)动态报告</a><span class="name">银河证券</span></li>

                    </ul>
                </div>
                <div class="box-opt-bar"><b class="common-bg-icon setting"></b><b class="common-bg-icon refresh"></b><b class="common-bg-icon close"></b></div>
            </div>
            <b class="boxbannerbottom"><b class="b-1"></b><b class="b-2"></b><b class="b-3"></b></b>
        </li>
        <li class="index-drag-box">
            <b class="boxbannertop"><b class="b-1"></b><b class="b-2"></b><b class="b-3"></b></b>
            <div class="box-body">
                <div class="box-title">
                    <b class="index-icon icon-3"></b>
                    <h3 class="box-header-title title-5 fl mr10">最新外部报告</h3>
                    <div class="fl">|<a href="#">more &raquo;</a></div>
                </div>
                <div class="box-content">
                    <ul class="rep-list-ul">
                        <li><b class="icon-st47"></b><span class="sirm-stock-innerrating20">[强买]</span><a href="javascript:void(0);">光迅科技(002281)动态报告</a><span class="name">银河证券</span></li>
                        <li><b class="icon-st47"></b><span class="sirm-stock-innerrating30">[买入]</span><a href="javascript:void(0);">光迅科技(002281)动态报告</a><span class="name">银河证券</span></li>
                        <li><b class="icon-st47"></b><span class="sirm-stock-innerrating40">[中性]</span><a href="javascript:void(0);">光迅科技(002281)动态报告</a><span class="name">银河证券</span></li>
                        <li><b class="icon-st47"></b><span class="sirm-stock-innerrating50">[卖出]</span><a href="javascript:void(0);">光迅科技(002281)动态报告</a><span class="name">银河证券</span></li>
                        <li><b class="icon-st47"></b><span class="sirm-stock-innerrating60">[强卖]</span><a href="javascript:void(0);">光迅科技(002281)动态报告</a><span class="name">银河证券</span></li>

                    </ul>
                </div>
                <div class="box-opt-bar"><b class="common-bg-icon setting"></b><b class="common-bg-icon refresh"></b><b class="common-bg-icon close"></b></div>
            </div>
            <b class="boxbannerbottom"><b class="b-1"></b><b class="b-2"></b><b class="b-3"></b></b>
        </li>
        <li class="index-drag-box">
            <b class="boxbannertop"><b class="b-1"></b><b class="b-2"></b><b class="b-3"></b></b>
            <div class="box-body">
                <div class="box-title">
                    <b class="index-icon icon-3"></b>
                    <h3 class="box-header-title title-5 fl mr10">最新内部报告</h3>
                    <div class="fl">|<a href="#">more &raquo;</a></div>
                </div>
                <div class="box-content">
                    <ul class="rep-list-ul">
                        <li><b class="icon-st47"></b><span class="sirm-stock-innerrating20">[强买]</span><a href="javascript:void(0);">光迅科技(002281)动态报告</a><span class="name">作者：王城</span></li>
                        <li><b class="icon-st47"></b><span class="sirm-stock-innerrating30">[买入]</span><a href="javascript:void(0);">光迅科技(002281)动态报告</a><span class="name">作者：王城</span></li>
                        <li><b class="icon-st47"></b><span class="sirm-stock-innerrating40">[中性]</span><a href="javascript:void(0);">光迅科技(002281)动态报告</a><span class="name">作者：王城</span></li>
                        <li><b class="icon-st47"></b><span class="sirm-stock-innerrating50">[卖出]</span><a href="javascript:void(0);">光迅科技(002281)动态报告</a><span class="name">作者：王城</span></li>
                        <li><b class="icon-st47"></b><span class="sirm-stock-innerrating60">[强卖]</span><a href="javascript:void(0);">光迅科技(002281)动态报告</a><span class="name">作者：王城</span></li>

                    </ul>
                </div>
                <div class="box-opt-bar"><b class="common-bg-icon setting"></b><b class="common-bg-icon refresh"></b><b class="common-bg-icon close"></b></div>
            </div>
            <b class="boxbannerbottom"><b class="b-1"></b><b class="b-2"></b><b class="b-3"></b></b>
        </li>
        <li class="index-drag-box">
            <b class="boxbannertop"><b class="b-1"></b><b class="b-2"></b><b class="b-3"></b></b>
            <div class="box-body">
                <div class="box-title">
                    <b class="index-icon icon-10"></b>
                    <h3 class="box-header-title title-5 fl mr10">股票研究跟踪</h3>
                    <div class="fl">|<a href="#">more &raquo;</a></div>
                </div>
                <div class="box-content">
                	<table width="100%" class="stk-table-st5">
                    	<thead class="stk-fb">
                          <tr>
                            <th>&nbsp;</th>
                            <th>&nbsp;</th>
                            <th colspan="2">EPS</th>
                            <th colspan="2">PE</th>
                            <th>&nbsp;</th>
                            <th>&nbsp;</th>
                          </tr>
                          <tr>
                            <th class="bd">股票名称</th>
                            <th class="bd">所属行业</th>
                            <th class="bd">内部</th>
                            <th class="bd">一致预期</th>
                            <th class="bd">内部</th>
                            <th class="bd">一致预期</th>
                            <th class="bd">昨收盘</th>
                            <th class="bd">涨幅</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr class="stk-table-tr-odd">
                            <td class="alignC"><a href="#">同方股份(600100)</a></td>
                            <td class="alignC"><a href="#">信息设备</a></td>
                            <td class="bl">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="bl">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="alignR bl">8.88</td>
                            <td class="alignR"><span class="colorGreen">-0.22%</span></td>
                          </tr>
                          <tr class="stk-table-tr-even">
                            <td class="alignC"><a href="#">同方股份(600100)</a></td>
                            <td class="alignC"><a href="#">信息设备</a></td>
                            <td class="bl">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="bl">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="alignR bl">8.88</td>
                            <td class="alignR"><span class="colorRed">0.22%</span></td>
                          </tr>
                          <tr class="stk-table-tr-odd">
                            <td class="alignC"><a href="#">同方股份(600100)</a></td>
                            <td class="alignC"><a href="#">信息设备</a></td>
                            <td class="bl">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="bl">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="alignR bl">8.88</td>
                            <td class="alignR"><span class="colorGreen">-0.22%</span></td>
                          </tr>
                          <tr class="stk-table-tr-even">
                            <td class="alignC"><a href="#">同方股份(600100)</a></td>
                            <td class="alignC"><a href="#">信息设备</a></td>
                            <td class="bl">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="bl">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="alignR bl">8.88</td>
                            <td class="alignR"><span class="colorGreen">-0.22%</span></td>
                          </tr>
                        </tbody>
                    </table>
        </div>
                <div class="box-opt-bar"><b class="common-bg-icon setting"></b><b class="common-bg-icon refresh"></b><b class="common-bg-icon close"></b></div>
            </div>
            <b class="boxbannerbottom"><b class="b-1"></b><b class="b-2"></b><b class="b-3"></b></b>
        </li>
        <li class="index-drag-box">
            <b class="boxbannertop"><b class="b-1"></b><b class="b-2"></b><b class="b-3"></b></b>
            <div class="box-body">
                <div class="box-title">
                    <b class="index-icon icon-11"></b>
                    <h3 class="box-header-title title-5 fl mr10">股票评级变化</h3>
                    <div class="fl">|<a href="#">more &raquo;</a></div>
                </div>
                <div class="box-content">
					<table width="100%" class="stk-table-st5">
                    	<thead class="stk-fb">
                          <tr>
                            <th class="bd">股票名称</th>
                            <th class="bd">最新评级</th>
                            <th class="bd">上次评级</th>
                            <th class="bd">趋势</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr class="stk-table-tr-odd">
                            <td class="alignC"><a href="#">同方股份(600100)</a></td>
                            <td class="alignC"><span class="sirm-stock-innerrating20">[强买]</span><a href="#">(王志华 于 2011-09-06)</a></td>
                            <td class="alignC"><span class="sirm-stock-innerrating60">[强卖]</span>(王志华 于 2011-09-06)</td>
                            <td><b class="sirm-rating-change-same"></b>持平</td>
                          </tr>
                          <tr class="stk-table-tr-even">
                            <td class="alignC"><a href="#">同方股份(600100)</a></td>
                            <td class="alignC"><span class="sirm-stock-innerrating60">[强卖]</span><a href="#">(王志华 于 2011-09-06)</a></td>
                            <td class="alignC"><span class="sirm-stock-innerrating60">[强卖]</span>(王志华 于 2011-09-06)</td>
                            <td><b class="sirm-rating-change-first"></b>首次</td>
                          </tr>
                          <tr class="stk-table-tr-odd">
                            <td class="alignC"><a href="#">同方股份(600100)</a></td>
                            <td class="alignC"><span class="sirm-stock-innerrating20">[强买]</span><a href="#">(王志华 于 2011-09-06)</a></td>
                            <td class="alignC"><span class="sirm-stock-innerrating60">[强卖]</span>(王志华 于 2011-09-06)</td>
                            <td><b class="sirm-rating-change-up"></b>调高</td>
                          </tr>
                          <tr class="stk-table-tr-even">
                            <td class="alignC"><a href="#">同方股份(600100)</a></td>
                            <td class="alignC"><span class="sirm-stock-innerrating60">[强卖]</span><a href="#">(王志华 于 2011-09-06)</a></td>
                            <td class="alignC"><span class="sirm-stock-innerrating60">[强卖]</span>(王志华 于 2011-09-06)</td>
                            <td><b class="sirm-rating-change-down"></b>调低</td>
                          </tr>
                        </tbody>
                    </table>
              </div>
                <div class="box-opt-bar"><b class="common-bg-icon setting"></b><b class="common-bg-icon refresh"></b><b class="common-bg-icon close"></b></div>
            </div>
            <b class="boxbannerbottom"><b class="b-1"></b><b class="b-2"></b><b class="b-3"></b></b>
        </li>
        <li class="index-drag-box">
            <b class="boxbannertop"><b class="b-1"></b><b class="b-2"></b><b class="b-3"></b></b>
            <div class="box-body">
                <div class="box-title">
                    <b class="index-icon icon-5"></b>
                    <h3 class="box-header-title title-5 fl mr10">我的事宜</h3>
                    <div class="fl">|<a href="#">more &raquo;</a></div>
              </div>
                <div class="box-content">
                	<ul class="rep-list-ul">
                    	<li class="bd"><a href="#" class="task">2011-09-05 完成报告审核任务的全面工作</a><a href="#" class="stk-button stk-button-st-5 active">处理</a></li>
                    	<li class="bd"><a href="#" class="task">2011-09-05 完成报告审核任务的全面工作</a><a href="#" class="stk-button stk-button-st-5 active">处理</a></li>
                    	<li class="bd"><a href="#" class="task">2011-09-05 完成报告审核任务的全面工作</a><a href="#" class="stk-button stk-button-st-5 active">处理</a></li>
                    </ul>
                </div>
                <div class="box-opt-bar"><b class="common-bg-icon setting"></b><b class="common-bg-icon refresh"></b><b class="common-bg-icon close"></b></div>
            </div>
            <b class="boxbannerbottom"><b class="b-1"></b><b class="b-2"></b><b class="b-3"></b></b>
        </li>
        </ul>
    </div>
    <div class="index-drag-column" style="width:30%">
        <ul class="index-drag-column-ul">
        <li class="index-drag-box">
            <b class="boxbannertop"><b class="b-1"></b><b class="b-2"></b><b class="b-3"></b></b>
            <div class="box-body">
                <div class="box-title">
                    <b class="index-icon icon-4"></b>
                    <h3 class="box-header-title title-2 fl mr10">我的日程</h3>
                    <div class="fl">|<a href="#">more &raquo;</a></div>
                </div>
                <div class="box-content">
                	<div class="box-calendar">
                    	<p class="calendar"><img src="../css/default/images/calendar.png" width="194" height="161"></p>
                    </div>
              <dl class="cal-list-dl">
                        <dt>今天日程：</dt><dd class="stk-tr"><a href="#" class="stk-button week">周</a><a href="#" class="stk-button month">月</a></dd>
                        <dt>AM 10:00</dt><dd><b class="icon-st27"></b><a href="">完成报告</a><span>&nbsp;-&nbsp;公司内部报告</span></dd>
                        <dt>PM 13:00</dt><dd><b class="icon-st26"></b><a href="">完成报告</a><span style="display:none">&nbsp;-&nbsp;公司内部报告</span></dd>
                        <dt>PM 14:00</dt><dd><b class="icon-st26"></b><a href="">完成报告</a><span style="display:none">&nbsp;-&nbsp;公司内部报告</span></dd>
                        <dt>PM 15:00</dt><dd><b class="icon-st26"></b><a href="">完成报告</a><span style="display:none">&nbsp;-&nbsp;公司内部报告</span></dd>
                    </dl>
                </div>
                <div class="box-opt-bar"><b class="common-bg-icon setting"></b><b class="common-bg-icon refresh"></b><b class="common-bg-icon close"></b></div>
            </div>
            <b class="boxbannerbottom"><b class="b-1"></b><b class="b-2"></b><b class="b-3"></b></b>
        </li>
        <li class="index-drag-box">
            <b class="boxbannertop"><b class="b-1"></b><b class="b-2"></b><b class="b-3"></b></b>
            <div class="box-body">
                <div class="box-title">
                    <b class="index-icon icon-5"></b>
                    <h3 class="box-header-title title-4 fl mr10">我的事宜</h3>
                    <div class="fl">|<a href="#">more &raquo;</a></div>
                </div>
                <div class="box-content">
                  	<ul class="rep-list-ul">
                    	<li class="bd"><a href="#" class="task">2011-09-05 完成报告审核任务的全面工作</a><a href="#" class="stk-button stk-button-st-5 active">处理</a></li>
                    	<li class="bd"><a href="#" class="task">2011-09-05 完成报告审核任务的全面工作</a><a href="#" class="stk-button stk-button-st-5 active">处理</a></li>
                    	<li class="bd"><a href="#" class="task">2011-09-05 完成报告审核任务的全面工作</a><a href="#" class="stk-button stk-button-st-5 active">处理</a></li>
                    </ul>
                </div>
                <div class="box-opt-bar"><b class="common-bg-icon setting"></b><b class="common-bg-icon refresh"></b><b class="common-bg-icon close"></b></div>
            </div>
            <b class="boxbannerbottom"><b class="b-1"></b><b class="b-2"></b><b class="b-3"></b></b>
        </li>
        <li class="index-drag-box">
            <b class="boxbannertop"><b class="b-1"></b><b class="b-2"></b><b class="b-3"></b></b>
            <div class="box-body">
                <div class="box-title">
                    <b class="index-icon icon-7"></b>
                    <h3 class="box-header-title title-6 fl mr10">部门公告</h3>
                    <div class="fl">|<a href="#">more &raquo;</a></div>
                </div>
                <div class="box-content">
                	<div class="box-department">
                    	<h4><a href="#">2011-09-01 全公司公告</a></h4>
                        <p>国农科技 [风险提示,停牌] 深圳中国农大科技股份有限公司股票复牌国农科技[风险提示,停牌] 深圳中国农大科技...</p>
                    </div>
                    <ul class="dep-list-ul">
                        <li><a href="javascript:void(0);">2011-09-01 全公司公告</a></li>
                        <li><a href="javascript:void(0);">2011-09-01 全公司公告</a></li>
                        <li><a href="javascript:void(0);">2011-09-01 全公司公告</a></li>
                        <li><a href="javascript:void(0);">2011-09-01 全公司公告</a></li>
                        <li><a href="javascript:void(0);">2011-09-01 全公司公告</a></li>
                    </ul>
                </div>
                <div class="box-opt-bar"><b class="common-bg-icon setting"></b><b class="common-bg-icon refresh"></b><b class="common-bg-icon close"></b></div>
            </div>
            <b class="boxbannerbottom"><b class="b-1"></b><b class="b-2"></b><b class="b-3"></b></b>
        </li>
        <li class="index-drag-box">
            <b class="boxbannertop"><b class="b-1"></b><b class="b-2"></b><b class="b-3"></b></b>
            <div class="box-body">
                <div class="box-title">
                    <b class="index-icon icon-8"></b>
                    <h3 class="box-header-title title-6 fl mr10">公司公告</h3>
                    <div class="fl">|<a href="#">more &raquo;</a></div>
                </div>
                <div class="box-content">
                  	<ul class="rep-list-ul">
                    	<li class="bd">2011-09-05 <span class="colorGreen">国农科技</span><span class="colorRed">[风险提示，停牌]</span><p><a href="#">深圳中国农大科技股份有限公司股票复牌公告</a></p></li>
                    	<li class="bd">2011-09-05 <span class="colorGreen">国农科技</span><span class="colorRed">[风险提示，停牌]</span><p><a href="#">深圳中国农大科技股份有限公司股票复牌公告</a></p></li>
                    	<li class="bd">2011-09-05 <span class="colorGreen">国农科技</span><span class="colorRed">[风险提示，停牌]</span><p><a href="#">深圳中国农大科技股份有限公司股票复牌公告</a></p></li>
                    </ul>
                </div>
                <div class="box-opt-bar"><b class="common-bg-icon setting"></b><b class="common-bg-icon refresh"></b><b class="common-bg-icon close"></b></div>
            </div>
            <b class="boxbannerbottom"><b class="b-1"></b><b class="b-2"></b><b class="b-3"></b></b>
        </li>
        <li class="index-drag-box">
            <b class="boxbannertop"><b class="b-1"></b><b class="b-2"></b><b class="b-3"></b></b>
            <div class="box-body">
                <div class="box-title">
                    <b class="index-icon icon-9"></b>
                    <h3 class="box-header-title title-6 fl mr10">我的消息</h3>
                    <div class="fl">|<a href="#">more &raquo;</a></div>
                </div>
                <div class="box-content">
                  	<ul class="rep-list-ul">
                    	<li class="bd"><a href="#">2011-09-05 完成报告审核任务的全面工作</a><span class="date stk-tr">今天 17:46 [管理员] </span></li>
                    	<li class="bd"><a href="#">2011-09-05 完成报告审核任务的全面工作</a><span class="date stk-tr">今天 17:46 [管理员] </span></li>
                    	<li class="bd"><a href="#">2011-09-05 完成报告审核任务的全面工作</a><span class="date stk-tr">今天 17:46 [管理员] </span></li>
                    </ul>
                </div>
                <div class="box-opt-bar"><b class="common-bg-icon setting"></b><b class="common-bg-icon refresh"></b><b class="common-bg-icon close"></b></div>
            </div>
            <b class="boxbannerbottom"><b class="b-1"></b><b class="b-2"></b><b class="b-3"></b></b>
        </li>
        </ul>
    </div>
</div>
</div>
</body>
</html>