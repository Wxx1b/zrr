<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>模板 - 电话沟通-新</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<div class="phone-box pt10 pl10 pr10">
	<div class="phone-crumbs pt10 pl10 pr10">当前位置：客户服务 &gt;&gt; 电话沟通</div>
    <div class="phone-title-box">
    	<table>
        	<tr>
              <th>联系人</th>
        	  <td class="colorGray">张某（汇添富）</td>
        	  <th>电话号码</th>
        	  <td class="colorGray">13509998852，13509998852</td>
        	</tr>
        	<tr>
        	  <th>日期</th>
        	  <td><input type="text" class="stk-input" style="width:70px" />至<input type="text" class="stk-input" style="width:70px" /></td>
        	  <td>&nbsp;</td>
        	  <td>&nbsp;</td>
          </tr>
        	<tr>
        	  <th>沟通方式</th>
        	  <td><label><input type="radio" />拨打电话，MSN等</label>&nbsp;<label><input type="radio" />接听电话，MSN等</label></td>
        	  <th>服务自我评价</th>
        	  <td><label><input type="radio" />优秀</label>&nbsp;<label><input type="radio" />较好</label>&nbsp;<label><input type="radio" />一般</label>&nbsp;<label><input type="radio" />较差</label></td>
          </tr>
       	</table>
    </div>
  <div class="phone-content-box">
		<table class="phone-table w100p mt10">
        	<tr>
            	<th class="w100">推荐情况</th>
                <td valign="top"><p class="colorRed fwb mb5">推荐的股票</p>
                <div style="width:500px; height:70px; overflow-y:auto; overflow-x:hidden; border:1px solid #ccc; position:relative">
                    <div class="stk-person-select">
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    </div>
                </div>
                <div class="phone-popbox">
                	<ul>
                    	<li class="mli">
                        	<label><input type="radio" />买入</label>
                            <label><input type="radio" />卖出</label>
                            <input type="text" class="stk-input w180" />
                            比例 <input type="text" class="stk-input w40" />%
                        </li>
                        <li>
                        	<label><input type="radio" />买入</label>
                            <label><input type="radio" />卖出</label>
                            <input type="text" class="stk-input w180" />
                            比例 <input type="text" class="stk-input w40" />%
                        </li>
                        <li>
                        	<label><input type="radio" />买入</label>
                            <label><input type="radio" />卖出</label>
                            <input type="text" class="stk-input w180" />
                            比例 <input type="text" class="stk-input w40" />%
                        </li>
                        <li>
                        	<label><input type="radio" />买入</label>
                            <label><input type="radio" />卖出</label>
                            <input type="text" class="stk-input w180" />
                            比例 <input type="text" class="stk-input w40" />%
                        </li>
                        <li>
                        	<label><input type="radio" />买入</label>
                            <label><input type="radio" />卖出</label>
                            <input type="text" class="stk-input w180" />
                            比例 <input type="text" class="stk-input w40" />%
                        </li>
                    </ul>
                    <div class="clearfix">
                    <div class="fl">
                    	<button class="stk-button stk-button-st-3"><span>确定</span></button>
                        <button class="stk-button stk-button-st-3"><span>取消</span></button>
                    </div>
                    <div class="fr">
                    	<a href="javascript:void(0);">展开剩余5条&gt;&gt;</a>
                    </div>
                    </div>
                </div>
                </td>
                 <td valign="top">
                 <p class="colorRed fwb mb5">推荐的行业</p>
                 <div style="width:500px; height:70px; overflow-y:auto; overflow-x:hidden; border:1px solid #ccc; position:relative">
                    <div class="stk-person-select">
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    </div>
                </div>
                <div class="phone-popbox">
                	<ul>
                    	<li class="mli">
                        	<label><input type="radio" />增持</label>
                            <label><input type="radio" />减持</label>
                            <input type="text" class="stk-input w180" />
                        </li>
                        <li class="mli">
                        	<label><input type="radio" />增持</label>
                            <label><input type="radio" />减持</label>
                            <input type="text" class="stk-input w180" />
                        </li>
                        <li class="mli">
                        	<label><input type="radio" />增持</label>
                            <label><input type="radio" />减持</label>
                            <input type="text" class="stk-input w180" />
                        </li>
                        <li class="mli">
                        	<label><input type="radio" />增持</label>
                            <label><input type="radio" />减持</label>
                            <input type="text" class="stk-input w180" />
                        </li>
                    </ul>
                    <div class="clearfix">
                    <div class="fl">
                    	<button class="stk-button stk-button-st-3"><span>确定</span></button>
                        <button class="stk-button stk-button-st-3"><span>取消</span></button>
                    </div>
                    <div class="fr">
                    	<a href="javascript:void(0);">展开剩余5条&gt;&gt;</a>
                    </div>
                    </div>
                </div>
                 </td>
            </tr>
        </table>
		<table class="phone-table w100p mt10">
       	  <tr>
           	  <th class="w100 stk-table-bbline">客户持仓情况</th>
              <td valign="top" class="stk-table-bbline">
              	<p class="mb5"><b>持仓的股票</b><input type="text" class="stk-input" style="width:30px" />%(为空时记录不变)</p>
                <div style="width:500px; height:70px; overflow-y:auto; overflow-x:hidden; border:1px solid #ccc; position:relative">
                    <div class="stk-person-select">
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    </div>
                </div>
                <div class="phone-popbox">
                	<ul>
                    	<li class="mli">
                            <input type="text" class="stk-input w180" />
                            股数 <input type="text" class="stk-input w30" /> 万股
                            均价 <input type="text" class="stk-input w30" /> 元
                        </li>
                        <li class="mli">
                            <input type="text" class="stk-input w180" />
                            股数 <input type="text" class="stk-input w30" /> 万股
                            均价 <input type="text" class="stk-input w30" /> 元
                        </li>
                        <li class="mli">
                            <input type="text" class="stk-input w180" />
                            股数 <input type="text" class="stk-input w30" /> 万股
                            均价 <input type="text" class="stk-input w30" /> 元
                        </li>
                        <li class="mli">
                            <input type="text" class="stk-input w180" />
                            股数 <input type="text" class="stk-input w30" /> 万股
                            均价 <input type="text" class="stk-input w30" /> 元
                        </li>
                        <li class="mli">
                            <input type="text" class="stk-input w180" />
                            股数 <input type="text" class="stk-input w30" /> 万股
                            均价 <input type="text" class="stk-input w30" /> 元
                        </li>
                    </ul>
                    <div class="clearfix">
                    <div class="fl">
                    	<button class="stk-button stk-button-st-3"><span>确定</span></button>
                        <button class="stk-button stk-button-st-3"><span>取消</span></button>
                    </div>
                    <div class="fr">
                    	<a href="javascript:void(0);">展开剩余5条&gt;&gt;</a>
                    </div>
                    </div>
                </div>
              </td>
              <td class="stk-table-bbline">&nbsp;</td>
          </tr>
       	  <tr>
           	  <th rowspan="2" class="w100 stk-table-bbline">客户关心信息</th>
              <td valign="top">
              	<p class="fwb mb5">关心的股票</p>
              	<div style="width:500px; height:70px; overflow-y:auto; overflow-x:hidden; border:1px solid #ccc; position:relative">
                    <div class="stk-person-select">
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    </div>
                </div>
                <div class="phone-popbox">
                	<ul>
                    	<li class="mli">
                            <input type="text" class="stk-input w180" />
                            <select class="w50">
                            	<option>请选择</option>
                            </select>
                        </li>
                        <li class="mli">
                            <input type="text" class="stk-input w180" />
                            <select class="w50">
                            	<option>请选择</option>
                            </select>
                        </li>
                        <li class="mli">
                            <input type="text" class="stk-input w180" />
                            <select class="w50">
                            	<option>请选择</option>
                            </select>
                        </li>
                        <li class="mli">
                            <input type="text" class="stk-input w180" />
                            <select class="w50">
                            	<option>请选择</option>
                            </select>
                        </li>
                    </ul>
                    <div class="clearfix">
                    <div class="fl">
                    	<button class="stk-button stk-button-st-3"><span>确定</span></button>
                        <button class="stk-button stk-button-st-3"><span>取消</span></button>
                    </div>
                    <div class="fr">
                    	<a href="javascript:void(0);">展开剩余5条&gt;&gt;</a>
                    </div>
                    </div>
                </div>
              </td>
              <td>
              	<p class="fwb mb5">关心的行业</p>
                <div style="width:500px; height:70px; overflow-y:auto; overflow-x:hidden; border:1px solid #ccc; position:relative">
                    <div class="stk-person-select">
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    </div>
                </div>
                <div class="phone-popbox">
                	<ul>
                    	<li class="mli">
                            <input type="text" class="stk-input w180" />
                            <select class="w50">
                            	<option>请选择</option>
                            </select>
                        </li>
                        <li class="mli">
                            <input type="text" class="stk-input w180" />
                            <select class="w50">
                            	<option>请选择</option>
                            </select>
                        </li>
                        <li class="mli">
                            <input type="text" class="stk-input w180" />
                            <select class="w50">
                            	<option>请选择</option>
                            </select>
                        </li>
                        <li class="mli">
                            <input type="text" class="stk-input w180" />
                            <select class="w50">
                            	<option>请选择</option>
                            </select>
                        </li>
                    </ul>
                    <div class="clearfix">
                    <div class="fl">
                    	<button class="stk-button stk-button-st-3"><span>确定</span></button>
                        <button class="stk-button stk-button-st-3"><span>取消</span></button>
                    </div>
                    <div class="fr">
                    	<a href="javascript:void(0);">展开剩余5条&gt;&gt;</a>
                    </div>
                    </div>
                </div>
              </td>
          </tr>
       	  <tr>
           	  <td class="stk-table-bbline" valign="top">
              	<p class="fwb mb5">关心的风格</p>
                <div style="width:500px; height:70px; overflow-y:auto; overflow-x:hidden; border:1px solid #ccc; position:relative">
                    <div class="stk-person-select">
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    </div>
                </div>
                <div class="phone-popbox">
                	<ul>
                    	<li class="mli">
                            <select class="w50">
                            	<option>请选择</option>
                            </select>
                            <select class="w50">
                            	<option>请选择</option>
                            </select>
                        </li>
                        <li class="mli">
                            <select class="w50">
                            	<option>请选择</option>
                            </select>
                            <select class="w50">
                            	<option>请选择</option>
                            </select>
                        </li>
                        <li class="mli">
                            <select class="w50">
                            	<option>请选择</option>
                            </select>
                            <select class="w50">
                            	<option>请选择</option>
                            </select>
                        </li>
                        <li class="mli">
                            <select class="w50">
                            	<option>请选择</option>
                            </select>
                            <select class="w50">
                            	<option>请选择</option>
                            </select>
                        </li>
                    </ul>
                    <div class="clearfix">
                    <div class="fl">
                    	<button class="stk-button stk-button-st-3"><span>确定</span></button>
                        <button class="stk-button stk-button-st-3"><span>取消</span></button>
                    </div>
                    <div class="fr">
                    	<a href="javascript:void(0);">展开剩余5条&gt;&gt;</a>
                    </div>
                    </div>
                </div>
              </td>
              <td class="stk-table-bbline" valign="top">
              	<p class="fwb mb5">关心其他</p>
                <div style="width:500px; height:70px; overflow-y:auto; overflow-x:hidden; border:1px solid #ccc; position:relative">
                    <div class="stk-person-select">
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    </div>
                </div>
                <div class="phone-popbox">
                	<ul>
                    	<li class="mli">
                            <select class="w50">
                            	<option>请选择</option>
                            </select>
                            <select class="w50">
                            	<option>请选择</option>
                            </select>
                            <select class="w50">
                            	<option>请选择</option>
                            </select>
                        </li>
                        <li class="mli">
                            <select class="w50">
                            	<option>请选择</option>
                            </select>
                            <select class="w50">
                            	<option>请选择</option>
                            </select>
                            <select class="w50">
                            	<option>请选择</option>
                            </select>
                        </li>
                        <li class="mli">
                            <select class="w50">
                            	<option>请选择</option>
                            </select>
                            <select class="w50">
                            	<option>请选择</option>
                            </select>
                            <select class="w50">
                            	<option>请选择</option>
                            </select>
                        </li>
                        <li class="mli">
                            <select class="w50">
                            	<option>请选择</option>
                            </select>
                            <select class="w50">
                            	<option>请选择</option>
                            </select>
                            <select class="w50">
                            	<option>请选择</option>
                            </select>
                        </li>
                    </ul>
                    <div class="clearfix">
                    <div class="fl">
                    	<button class="stk-button stk-button-st-3"><span>确定</span></button>
                        <button class="stk-button stk-button-st-3"><span>取消</span></button>
                    </div>
                    <div class="fr">
                    	<a href="javascript:void(0);">展开剩余5条&gt;&gt;</a>
                    </div>
                    </div>
                </div>
              </td>
          </tr>
       	  <tr>
           	  <th class="w100 stk-table-bbline">法人股</th>
              <td class="stk-table-bbline">
              	<p class="fwb mb5">股票代码</p>
                <div style="width:500px; height:70px; overflow-y:auto; overflow-x:hidden; border:1px solid #ccc; position:relative">
                    <div class="stk-person-select">
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    <span class="stk-child-o"><span>（买入）万科-20%</span><b class="stk-button-icon stk-child-close"></b></span>
                    </div>
                </div>
                <div class="phone-popbox" style="width:480px">
                	<ul>
                    	<li class="mli">
                            <input type="text" class="stk-input w180" />
                            股数 <input type="text" class="stk-input w30" /> 万股
                            解禁日期 <input type="text" class="stk-input 120px" />
                        </li>
                        <li class="mli">
                            <input type="text" class="stk-input w180" />
                            股数 <input type="text" class="stk-input w30" /> 万股
                            解禁日期 <input type="text" class="stk-input 120px" />
                        </li>
                        <li class="mli">
                            <input type="text" class="stk-input w180" />
                            股数 <input type="text" class="stk-input w30" /> 万股
                            解禁日期 <input type="text" class="stk-input 120px" />
                        </li>
                        <li class="mli">
                            <input type="text" class="stk-input w180" />
                            股数 <input type="text" class="stk-input w30" /> 万股
                            解禁日期 <input type="text" class="stk-input 120px" />
                        </li>
                    </ul>
                    <div class="clearfix">
                    <div class="fl">
                    	<button class="stk-button stk-button-st-3"><span>确定</span></button>
                        <button class="stk-button stk-button-st-3"><span>取消</span></button>
                    </div>
                    <div class="fr">
                    	<a href="javascript:void(0);">展开剩余5条&gt;&gt;</a>
                    </div>
                    </div>
                </div>
              </td>
              <td class="stk-table-bbline">&nbsp;</td>
          </tr>
      </table>
      	<table class="w100p mt10">
        	<tr>
            	<th class="w100">日常信息</th>
                <td><textarea class="stk-textarea w100p h80"></textarea></td>
            </tr>
        	<tr>
            	<th class="w100">客户联系方式与业务人员变动信息</th>
                <td><textarea class="stk-textarea w100p h80"></textarea></td>
            </tr>
        	<tr>
            	<th class="w100">客户外部意见/我方内部建议</th>
                <td><textarea class="stk-textarea w100p h80"></textarea></td>
            </tr>
        </table>
    </div>
</div>
<div class="pool-btn-box"><button class="stk-button stk-button-st-3 mr10">下一步</button><button class="stk-button stk-button-st-3 mr10">提交</button></div>
</div>
</body>
</html>