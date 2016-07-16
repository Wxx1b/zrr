<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>模板 - 新建储备项目</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
    <script type="text/javascript">
        function toggleDiv(targetId, obj)
        {
            $('#' + targetId).toggle();
            $(obj).find('.stk-ui-sort-desc').toggleClass('stk-ui-sort-asc');
        }

        $(function ()
        {
            $('table.pat8-table tr:odd').addClass('bgcolorGray');
        });
        $(function ()
        {
            $('.chubei-box-checkbox').click(function ()
            {
                var self = $(this).children('label');
                var input = self.children('input');
                var value = !input.attr('checked');
                input.attr('checked', value);
                if (value)
                {
                    self.parent().addClass('chubei-box-checkbox-checked');
                } else
                {
                    self.parent().removeClass('chubei-box-checkbox-checked');
                }
                return false;
            });
        });
        $(function ()
        {
            var nav_tab_li = $('.chubei-box-tab li');
            $('.chubei-box-tab-1:gt(0)').hide();

            nav_tab_li.click(function ()
            {
                $(this).addClass('select')
                        .siblings().removeClass('select');

                var nav_tab_li_index = nav_tab_li.index(this);
                $('.chubei-box-tab-1').eq(nav_tab_li_index).show()
                        .siblings('.chubei-box-tab-1').hide();
            });
        });
    </script>
</head>
<body>
<div class="stock-view-page pt10 pl10 pr10">
<div class="chubei-box">
    <div class="chubei-box-tit">投资计划概要</div>
    <table class="pat7-table pat7-table-td-balck">
        <tr>
            <th class="stk-tr bgcolorGray w120">项目编号</th>
            <td>XN-01-0001</td>
            <th class="stk-tr bgcolorGray w120">投资计划名称<em class="red">*</em></th>
            <td><input type="text" value="xx投资计划"></td>
        </tr>
        <tr>
            <th class="stk-tr bgcolorGray">简称<em class="red">*</em></th>
            <td><input type="text" value="xx投资计划"></td>
            <th class="stk-tr bgcolorGray w120">产品类型<em class="red">*</em></th>
            <td><select>
                <option>基础设施债权计划</option>
                <option>基础设施债权计划</option>
            </select></td>
        </tr>
        <tr>
            <th class="stk-tr bgcolorGray">地区<em class="red">*</em></th>
            <td><select>
                <option>北京</option>
                <option>上海</option>
            </select></td>
            <th class="stk-tr bgcolorGray w120">规模（亿元）</th>
            <td><input type="text" value="2000"></td>
        </tr>
        <tr>
            <th class="stk-tr bgcolorGray">期限（年）</th>
            <td><input type="text" value="8"></td>
            <th class="stk-tr bgcolorGray w120">投资利率（%）</th>
            <td><input type="text" value="28.61"></td>
        </tr>
        <tr>
            <th class="stk-tr bgcolorGray">提前到期选择权</th>
            <td colspan="3"><textarea></textarea></td>
        </tr>
        <tr>
            <th class="stk-tr bgcolorGray">项目经理</th>
            <td colspan="3">张三丰</td>
        </tr>
        <tr>
            <th class="stk-tr bgcolorGray">项目组成员</th>
            <td colspan="3">
                <button class="stk-button stk-ext-button mr10">选择人员</button>
                <span class="chubei-box-blue">王五<a href="#"><em></em></a></span>
                <span class="chubei-box-blue">李四<a href="#"><em></em></a></span></td>
        </tr>
    </table>
</div>
<div class="chubei-box mt10">
    <div class="chubei-box-tit">偿债主体信息</div>
    <div class="chubei-box-item">
        <div class="search">请选择偿债主体 <span class="search-input">
                <input type="text" value="请输入联系人名称或者拼音" placeholder="请输入联系人名称或者拼音">
                <em></em></span>
            <button class="stk-button stk-ext-button mr10">查 询</button>
        </div>
        <dl class="one">
            <dt>
            <p><span class="size14">北京市基础设施投资有限公司</span> <a href="#">[ 编辑 ]</a> <a href="#">[ 删除 ]</a></p>

            <p class="gray"><span>所属行业：GICS资产品</span><span>企业性质：地方国有企业</span><span>营业执照号码：E28112FZ</span><span>组织机构代码证：E21323545FZ</span>
            </p>
            </dt>
            <dd class="kuang"><span class="labels">选择联系人：</span><span><a class="chubei-box-checkbox">
                <label for="chose1-1">
                    <input type="checkbox" id="chose1-1" name="chose1-1">
                    <em></em>全部</label>
            </a> <a class="chubei-box-checkbox">
                <label for="chose1-2">
                    <input type="checkbox" id="chose1-2" name="chose1-2">
                    <em></em>张三</label>
            </a> <a class="chubei-box-checkbox">
                <label for="chose1-3">
                    <input type="checkbox" id="chose1-3" name="chose1-3">
                    <em></em>李四</label>
            </a> <a class="chubei-box-checkbox">
                <label for="chose1-4">
                    <input type="checkbox" id="chose1-4" name="chose1-4">
                    <em></em>王五</label>
            </a></span></dd>
            <dd class="kuang"><span class="labels">选择账户：</span><span><a class="chubei-box-checkbox">
                <label for="chose1-1">
                    <input type="checkbox" id="chose1-1" name="chose1-1">
                    <em></em>全部</label>
            </a> <a class="chubei-box-checkbox">
                <label for="chose1-1">
                    <input type="checkbox" id="chose1-1" name="chose1-1">
                    <em></em>工商银行（1233546687855266）</label>
            </a> <a class="chubei-box-checkbox">
                <label for="chose1-1">
                    <input type="checkbox" id="chose1-1" name="chose1-1">
                    <em></em>招商银行（1233546687855266）</label>
            </a></span></dd>
            <dd>
                <p><span class="labels">资金计划使用用途：</span><span>
                        <select>
                            <option>2014</option>
                            <option>2015</option>
                        </select>
                        至
                        <select>
                            <option>2020</option>
                            <option>2012</option>
                        </select>
                        </span></p>
                <p>
                    <button class="stk-button stk-ext-button mr10">增加</button>
                    <button class="stk-button stk-ext-button mr10">删除</button>
                </p>
                <p>
                <table class="w100p chubei-table">
                    <tr>
                        <th><a class="chubei-box-checkbox">
                            <label>
                                <input type="checkbox">
                                <em></em></label>
                        </a></th>
                        <th>用途名称</th>
                        <th>2014年(万元)</th>
                        <th>2015年(万元)</th>
                        <th>2016年(万元)</th>
                        <th>2017年(万元)</th>
                        <th>208年(万元)</th>
                        <th>2019年(万元)</th>
                        <th>2020年(万元)</th>
                    </tr>
                    <tr>
                        <td class="alignC"><a class="chubei-box-checkbox">
                            <label>
                                <input type="checkbox">
                                <em></em></label>
                        </a></td>
                        <td><input type="text" value="项目建设"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <td class="alignC"><a class="chubei-box-checkbox">
                            <label>
                                <input type="checkbox">
                                <em></em></label>
                        </a></td>
                        <td><input type="text" value="项目建设"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <td class="alignC"><a class="chubei-box-checkbox">
                            <label>
                                <input type="checkbox">
                                <em></em></label>
                        </a></td>
                        <td><input type="text" value="项目建设"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <td class="alignC"><a class="chubei-box-checkbox">
                            <label>
                                <input type="checkbox">
                                <em></em></label>
                        </a></td>
                        <td><input type="text" value="项目建设"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                    </tr>
                </table>
                </p>
        </dl>
    </div>
</div>
<div class="chubei-box mt10">
    <div class="chubei-box-tit">项目信息</div>
    <div class="chubei-box-item">
        <table class="w100p chubei-table">
            <tr>
                <th class="alignC"><a class="chubei-box-checkbox">
                    <label>
                        <input type="checkbox">
                        <em></em></label>
                </a></th>
                <th>名称<em class="red">*</em></th>
                <th>类型<em class="red">*</em></th>
                <th>核准文件<em class="red">*</em></th>
                <th>所属行业<em class="red">*</em></th>
                <th class="alignR">总投资规模(万元)<em class="red">*</em></th>
                <th>资金用途<em class="red">*</em></th>
                <th class="alignR">拟试用资金<em class="red">*</em></th>
                <th class="alignC">项目方名称<em class="red">*</em></th>
                <th class="alignC">操作</th>
            </tr>
            <tr>
                <td class="alignC"><a class="chubei-box-checkbox">
                    <label>
                        <input type="checkbox">
                        <em></em></label>
                </a></td>
                <td>子项目</td>
                <td>在建</td>
                <td><a href="#">xxxxx.doc</a></td>
                <td>GICS能源II</td>
                <td class="alignR">200,000</td>
                <td><a href="#">项目建设</a></td>
                <td class="alignR">200,000</td>
                <td class="alignC"><a href="#">北京原水工程有限公司</a></td>
                <td class="alignC"><a href="#">编辑</a></td>
            </tr>
            <tr>
                <td class="alignC"><a class="chubei-box-checkbox">
                    <label>
                        <input type="checkbox">
                        <em></em></label>
                </a></td>
                <td>子项目</td>
                <td>在建</td>
                <td><a href="#">xxxxx.doc</a></td>
                <td>GICS能源II</td>
                <td class="alignR">200,000</td>
                <td><a href="#">项目建设</a></td>
                <td class="alignR">200,000</td>
                <td class="alignC"><a href="#">北京原水工程有限公司</a></td>
                <td class="alignC"><a href="#">编辑</a></td>
            </tr>
            <tr>
                <td class="alignC"><a class="chubei-box-checkbox">
                    <label>
                        <input type="checkbox">
                        <em></em></label>
                </a></td>
                <td>子项目</td>
                <td>在建</td>
                <td><a href="#">xxxxx.doc</a></td>
                <td>GICS能源II</td>
                <td class="alignR">200,000</td>
                <td><a href="#">项目建设</a></td>
                <td class="alignR">200,000</td>
                <td class="alignC"><a href="#">北京原水工程有限公司</a></td>
                <td class="alignC"><a href="#">编辑</a></td>
            </tr>
            <tr>
                <td class="alignC"><a class="chubei-box-checkbox">
                    <label>
                        <input type="checkbox">
                        <em></em></label>
                </a></td>
                <td>子项目</td>
                <td>在建</td>
                <td><a href="#">xxxxx.doc</a></td>
                <td>GICS能源II</td>
                <td class="alignR">200,000</td>
                <td><a href="#">项目建设</a></td>
                <td class="alignR">200,000</td>
                <td class="alignC"><a href="#">北京原水工程有限公司</a></td>
                <td class="alignC"><a href="#">编辑</a></td>
            </tr>
        </table>
    </div>
</div>
<div class="chubei-box mt10">
    <div class="chubei-box-tit">
        <ul>
            <li><a class="chubei-box-checkbox">
                <label for="chose5-1">
                    <input type="checkbox" id="chose5-1" name="chose5-1">
                    <em></em>无担保人</label>
            </a></li>
            <li><a class="chubei-box-checkbox">
                <label for="chose5-2">
                    <input type="checkbox" id="chose5-2" name="chose5-2">
                    <em></em>担保人</label>
            </a></li>
            <li><a class="chubei-box-checkbox">
                <label for="chose5-3">
                    <input type="checkbox" id="chose5-3" name="chose5-3">
                    <em></em>担保物</label>
            </a></li>
            <li><a class="chubei-box-checkbox">
                <label for="chose5-4">
                    <input type="checkbox" id="chose5-4" name="chose5-4">
                    <em></em>其他</label>
            </a></li>
        </ul>
    </div>
    <div class="chubei-box-item">
        <div class="chubei-box-tab">
            <ul>
                <li class="select"><a href="#" onclick="return false">无担保人</a></li>
                <li><a href="#" onclick="return false">担保人</a></li>
            </ul>
        </div>
        <div class="chubei-box-tab-1">
            <div class="search">请选择担保人 <span class="search-input">
                    <input type="text" value="请输入联系人名称或者拼音" placeholder="请输入联系人名称或者拼音">
                    <em></em></span>
                <button class="stk-button stk-ext-button mr10">查 询</button>
            </div>
            <dl class="two">
                <dt>
                <p><span class="size14">北京市基础设施投资有限公司</span> <a href="#">[ 编辑 ]</a> <a href="#">[ 删除 ]</a></p>

                <p class="gray"><span>地区：北京</span><span>企业性质：地方国有企业</span></p>
                </dt>
                <dd><span class="labels">与偿债主题关联关系：</span><span>
                        <select>
                            <option>母公司或实际控制人</option>
                        </select>
                        </span></dd>
                <dd><span class="labels">担保企业与被担保企业净资产比率：</span><span>
                        <select>
                            <option>2013</option>
                        </select>
                        年
                        <input type="text" value="20" style="width:26px">
                        %</span></dd>
                <dd><span class="labels">备注：</span><span>
                        <input type="text" style="width:500px">
                        </span></dd>
                <dd class="kuang"><span class="labels">选择联系人：</span><span><a class="chubei-box-checkbox">
                    <label for="chose1-1">
                        <input type="checkbox" id="chose1-1" name="chose1-1">
                        <em></em>全部</label>
                </a> <a class="chubei-box-checkbox">
                    <label for="chose1-2">
                        <input type="checkbox" id="chose1-2" name="chose1-2">
                        <em></em>张三</label>
                </a> <a class="chubei-box-checkbox">
                    <label for="chose1-3">
                        <input type="checkbox" id="chose1-3" name="chose1-3">
                        <em></em>李四</label>
                </a> <a class="chubei-box-checkbox">
                    <label for="chose1-4">
                        <input type="checkbox" id="chose1-4" name="chose1-4">
                        <em></em>王五</label>
                </a></span></dd>
                <dd class="kuang"><span class="labels">选择账户：</span><span><a class="chubei-box-checkbox">
                    <label for="chose1-1">
                        <input type="checkbox" id="chose1-1" name="chose1-1">
                        <em></em>全部</label>
                </a> <a class="chubei-box-checkbox">
                    <label for="chose1-1">
                        <input type="checkbox" id="chose1-1" name="chose1-1">
                        <em></em>工商银行（1233546687855266）</label>
                </a> <a class="chubei-box-checkbox">
                    <label for="chose1-1">
                        <input type="checkbox" id="chose1-1" name="chose1-1">
                        <em></em>招商银行（1233546687855266）</label>
                </a></span></dd>
            </dl>
        </div>
        <div class="chubei-box-tab-1">
            <div class="search">请选择担保人 <span class="search-input">
                    <input type="text" value="请输入联系人名称或者拼音" placeholder="请输入联系人名称或者拼音">
                    <em></em></span>
                <button class="stk-button stk-ext-button mr10">查 询</button>
            </div>
            <dl class="two">
                <dt>
                <p><span class="size14">上海市基础设施投资有限公司</span> <a href="#">[ 编辑 ]</a> <a href="#">[ 删除 ]</a></p>

                <p class="gray"><span>地区：上海</span><span>企业性质：地方国有企业</span></p>
                </dt>
                <dd><span class="labels">与偿债主题关联关系：</span><span>
                        <select>
                            <option>母公司或实际控制人</option>
                        </select>
                        </span></dd>
                <dd><span class="labels">担保企业与被担保企业净资产比率：</span><span>
                        <select>
                            <option>2013</option>
                        </select>
                        年
                        <input type="text" value="20" style="width:26px">
                        %</span></dd>
                <dd><span class="labels">备注：</span><span>
                        <input type="text" style="width:500px">
                        </span></dd>
                <dd class="kuang"><span class="labels">选择联系人：</span><span><a class="chubei-box-checkbox">
                    <label for="chose1-1">
                        <input type="checkbox" id="chose1-1" name="chose1-1">
                        <em></em>全部</label>
                </a> <a class="chubei-box-checkbox">
                    <label for="chose1-2">
                        <input type="checkbox" id="chose1-2" name="chose1-2">
                        <em></em>张三</label>
                </a> <a class="chubei-box-checkbox">
                    <label for="chose1-3">
                        <input type="checkbox" id="chose1-3" name="chose1-3">
                        <em></em>李四</label>
                </a> <a class="chubei-box-checkbox">
                    <label for="chose1-4">
                        <input type="checkbox" id="chose1-4" name="chose1-4">
                        <em></em>王五</label>
                </a></span></dd>
                <dd class="kuang"><span class="labels">选择账户：</span><span><a class="chubei-box-checkbox">
                    <label for="chose1-1">
                        <input type="checkbox" id="chose1-1" name="chose1-1">
                        <em></em>全部</label>
                </a> <a class="chubei-box-checkbox">
                    <label for="chose1-1">
                        <input type="checkbox" id="chose1-1" name="chose1-1">
                        <em></em>工商银行（1233546687855266）</label>
                </a> <a class="chubei-box-checkbox">
                    <label for="chose1-1">
                        <input type="checkbox" id="chose1-1" name="chose1-1">
                        <em></em>招商银行（1233546687855266）</label>
                </a></span></dd>
            </dl>
        </div>
    </div>
</div>
<div class="chubei-box mt10">
    <div class="chubei-box-tit">上传附件</div>
    <div class="chubei-box-item">
        <p><a href="#"><b class="icon-add"></b>新增文件</a></p>

        <p><em class="icon-st47 mr5"></em>新建 Microsoft Office Excel 工作表.xlsx(11KB) <a href="#">删除</a> |
            <a href="#">预览</a></p>
    </div>
</div>
<div class="chubei-box stk-tc mt10 clearfix">
    <button class="stk-button stk-ext-button mr20">保存</button>
    <button class="stk-button stk-ext-button mr20">保存并下一步</button>
</div>
</div>
</body>
</html>