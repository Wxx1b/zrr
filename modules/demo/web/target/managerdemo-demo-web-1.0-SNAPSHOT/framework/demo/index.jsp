<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html style="height: 100%">
<head>
<meta charset="UTF-8">
<title>Demo</title>
<%@ include file="../include/innerHead.jsp" %>
<!-- 主要内容 -->
<script type="text/javascript">
var demoData = [
    {name: "WEB控件", open: true, children: [
        {name: "表单类控件<font color='red'>(1)</font>", children: [
            {name: "文本输入栏", href: "textfield.jsp"},
            {name: "多行文本输入栏", href: "textarea.jsp"},
            {name: "日期输入栏", href: "datefield.jsp"},
            {name: "复/单选框", href: "checkRadio.jsp"},
            {name: "复/单选框组", href: "checkRadioGroup.jsp"},
            {name: "下拉选择框", href: "select.jsp"},
            {name: "多选框", href: "multiselect.jsp"},
            {name: "联动下拉框", href: "interactselect.jsp"},
            {name: "Label", href: "label.jsp"},
            {name: "时间Label", href: "timelabel.jsp"},
            {name: "高级输入框", isOpen: true, children: [
//                {name: "<font color='gray'>复合选择框(弃用)</font>", href: "combobox.jsp"},
                {name: "自动填充栏", href: "autocomplete.jsp"},
                {name: "文本编辑器", href: "doceditor.jsp"},
                {name: "弹出框文本编辑器<font color='red'>update!</font>", href: "updatedoceditor.jsp"}
            ]},
            {name: "高级选择器", open: true, children: [
                {name: "双向选择器", href: "doubleSelect.jsp"},
                {name: "可删除选择器", href: "removableselect.jsp"},
                {name: "分类选择器", href: "classifiedselect.jsp"},
                {name: "字母选择器", href: "letterselect.jsp"},
                {name: "星级选择器", href: "starselect.jsp"},
                {name: "颜色选择器", href: "colorSelect.jsp"},
                {name: "滑动条", href: "slider.jsp"}
            ]},
            {name: "表单", open: true, children: [
                {name: "表单验证", href: "form.jsp"},
                {name: "异步初始化", href: "form_init.jsp"},
                {name: "文件上传", href: "fileUpload.jsp"}
            ]}
        ]},
        {name: "操作类控件", children: [
            {name: "按钮", href: "button.jsp"},
            {name: "菜单按钮", href: "buttonMenu.jsp"},
            {name: "链接", href: "a.jsp"}
            //            {name:"<font color='gray'>菜单(NAN)</font>",href:"#"},
            //            {name:"<font color='gray'>右键菜单(NAN)</font>",href:"#"}
        ]},
        {name: "数据类控件<font color='red'>(1)</font>", children: [
            {name: "进度条<font color='red'>new!</font>", href: "progressBar.jsp"},
            {name: "表格", open: true, children: [
                {name: "普通", href: "table.jsp"},
                {name: "分组", href: "table_group.jsp"},
                {name: "<font color='gray'>固定高度(弃用)</font>", href: "table_height.jsp"},
                {name: "事件", href: "table_event.jsp"},
                {name: "表达式", href: "table_expr.jsp"},
                {name: "List", href: "table_list.jsp"},
                {name: "自定义分页List", href: "table_listCust.jsp"},
                {name: "汇总", href: "table_collect.jsp"},
                {name: "复选框应用", href: "table_checkbox.jsp"},
                {name: "导出", href: "table_export.jsp"},
                {name: "详细", href: "table_detail.jsp"},
                {name: "行号", href: "table_rowNum.jsp"},
                {name: "帮助信息", href: "table_help.jsp"},
                {name: "列合并", href: "table_mergeCol.jsp"}
            ]},
            {name: "固定列表格", open: true, children: [
                {name: "普通", href: "tablefix.jsp"},
                {name: "固定高度", href: "tablefix_height.jsp"}
            ]},
            {name: "树", open: true, children: [
                {name: "静态", href: "tree.jsp"},
                {name: "动态", href: "tree_dynamic.jsp"}
            ]}

        ]},
        {name: "布局类控件<font color='red'>(2)</font>", children: [
            {name: "对话框", href: "dialog.jsp"},
            {name: "信息提示框<font color='red'>new!</font>", href: "message.jsp"},
            {name: "浮动层<font color='red'>new!</font>", href: "float.jsp"},
            {name: "<font color='gray'>间距(弃用)</font>", href: "spacing.jsp"},
            {name: "<font color='gray'>布局盒(弃用)</font>", href: "box.jsp"},
            {name: "FieldSet", href: "fieldset.jsp"},
            {name: "面板", href: "panel.jsp"},
            {name: "标签面板", href: "tab.jsp"},
            {name: "窗口", href: "window.jsp"},
            {name: "工具栏", href: "toolbar.jsp"}
        ]},
        {name: "图表类控件", children: [
            {name: "线状图表", open: true, children: [
                {name: "普通", href: "chart_line.jsp"},
                {name: "圆滑", href: "chart_spline.jsp"},
                {name: "显示值", href: "chart_line_datalabels.jsp"},
                {name: "反转", href: "chart_line_inverted.jsp"},
                {name: "自定义图标", href: "chart_line_icon.jsp"},
                {name: "对齐线", href: "chart_line_duiqi.jsp"}
            ]},
            {name: "面积图表", open: true, children: [
                {name: "普通", href: "chart_area.jsp"},
                {name: "圆滑", href: "chart_areaspline.jsp"},
                {name: "百分比", href: "chart_area_percent.jsp"},
                {name: "堆栈", href: "chart_area_stacked.jsp"}
            ]},
            {name: "横木图表", open: true, children: [
                {name: "普通", href: "chart_bar.jsp"},
                {name: "堆栈", href: "chart_bar_stacked.jsp"}
            ]},
            {name: "柱状图表", open: true, children: [
                {name: "普通", href: "chart_column.jsp"},
                {name: "堆栈", href: "chart_column_stacked.jsp"},
                {name: "标签旋转", href: "chart_column_rotation.jsp"},
                {name: "事件", href: "chart_column_event.jsp"}
            ]},
            {name: "饼状图表", open: true, children: [
                {name: "普通", href: "chart_pie.jsp"},
                {name: "面包圈", href: "chart_pie_donut.jsp"}

            ]},
            {name: "散布图表", open: true, children: [
                {name: "普通", href: "chart_scatter.jsp"}
            ]},
            {name: "组合图表", open: true, children: [
                {name: "范例1", href: "chart_combo.jsp"},
                {name: "范例2", href: "chart_combo2.jsp"}
            ]},
            {name: "股票图表", open: true, children: [
                {name: "普通", href: "chart_stock.jsp"},
                {name: "多个数据", href: "chart_stock_towLines.jsp"},
                {name: "标记", href: "chart_stock_flag.jsp"}
            ]}
        ]},
        {name: "控件API", children: [
            {name: "ajax调用<font color='red'>方便！</font>", href: "ajax_call.jsp"},
            {name: "控件渲染<font color='red'>牛叉！</font>", href: "renderTo.jsp"},
            {name: "表格相关", children: [
                {name: "stk_adjust", href: "stk_adjust.jsp"},
                {name: "stk_call", href: "stk_call.jsp"},
                {name: "stk_checkedData", href: "stk_checkedData.jsp"},
                {name: "stk_checkedHtmlData", href: "stk_checkedHtmlData.jsp"},
                {name: "stk_collectData", href: "stk_collectData.jsp"},
                {name: "stk_hasSelect", href: "stk_hasSelect.jsp"},
                {name: "stk_detail", href: "stk_detail.jsp"},
                {name: "stk_info", href: "stk_info.jsp"},
                {name: "stk_init", href: "stk_init.jsp"},
                {name: "stk_jump", href: "stk_jump.jsp"},
                {name: "stk_query", href: "stk_query.jsp"},
                {name: "stk_selectData", href: "stk_selectData.jsp"},
                {name: "stk_selectHtmlData", href: "stk_selectHtmlData.jsp"}
            ]},
            {name: "外框Tab相关", children: [
                {name: "stk_go", href: "stk_go.jsp"},
                {name: "stk_getTab", href: "stk_getTab.jsp"},
                {name: "stk_getParentTab", href: "stk_getParentTab.jsp"},
                {name: "stk_navigate", href: "stk_navigate.jsp"},
                {name: "stk_removeSelf", href: "stk_removeSelf.jsp"},
                {name: "stk_removeTab", href: "stk_removeTab.jsp"},
                {name: "stk_refreshHomeModule", href: "stk_refreshHomeModule.jsp"}
            ]},
            {name: "Form相关", children: [
                {name: "stk_reset", href: "stk_reset.jsp"},
                {name: "stk_submit", href: "stk_submit.jsp"},
                {name: "stk_check", href: "stk_check.jsp"},
                {name: "stk_checkForm", href: "stk_checkForm.jsp"}
            ]},
            {name: "选择器相关", children: [
                {name: "stk_addOptions", href: "stk_addOptions.jsp"},
                {name: "stk_emptyOptions", href: "stk_emptyOptions.jsp"},
                {name: "stk_firstOption", href: "stk_firstOption.jsp"},
                {name: "stk_removeItem", href: "stk_removeItem.jsp"},
                {name: "stk_removeOptions", href: "stk_removeOptions.jsp"},
                {name: "stk_resetOptions", href: "stk_resetOptions.jsp"}
            ]},
            {name: "stk_checked", href: "stk_checked.jsp"},
            //            {name:"stk_close",href:"stk_close.jsp"},
            {name: "stk_closeMask", href: "stk_closeMask.jsp"},
            {name: "stk_closeQtip", href: "stk_closeQtip.jsp"},
            {name: "stk_disabled", href: "stk_disabled.jsp"},
            {name: "stk_flushCache", href: "stk_flushCache.jsp"},
            {name: "stk_hide", href: "stk_hide.jsp"},
            {name: "stk_hideCol", href: "stk_hideCol.jsp"},
            {name: "stk_init", href: "stk_init.jsp"},
            {name: "stk_map", href: "stk_map.jsp"},
            {name: "stk_qtip", href: "stk_qtip.jsp"},
            {name: "stk_readOnly", href: "stk_readOnly.jsp"},
            {name: "stk_refresh", href: "stk_refresh.jsp"},
            {name: "stk_renderRow", href: "stk_renderRow.jsp"},
            {name: "stk_show", href: "stk_show.jsp"},
            {name: "stk_showCol", href: "stk_showCol.jsp"},
            {name: "stk_showMask", href: "stk_showMask.jsp"},
            {name: "stk_showMenu", href: "stk_showMenu.jsp"},
            {name: "stk_text", href: "stk_text.jsp"},
            {name: "stk_title", href: "stk_title.jsp"},
            {name: "stk_toggleChecked", href: "stk_toggleChecked.jsp"},
            {name: "stk_val", href: "stk_val.jsp"}
        ]},
        {name: "范例应用", children: [
            {name: "增删查改", href: "curd_ajax.jsp"}
        ]},
        {name: "静态模板<font color='red'>(2)</font>", children: [
            {name: "登录", href: "moban_denglu.jsp"},
            {name: "外部报告详细页", href: "moban_baogao.jsp"},
            {name: "表格样式二", href: "moban_table2.jsp"},
            {name: "电话沟通", href: "moban_dianhua.jsp"},
            {name: "电话沟通-新", href: "moban_dianhua2.jsp"},
            {name: "按钮", href: "moban_button.jsp"},
            {name: "高级查询", href: "moban_search.jsp"},
            {name: "查询表单", href: "moban_form_chaxun.jsp"},
            {name: "输入表单-简单", href: "moban_form_jiandan.jsp"},
            {name: "输入表单-复杂", href: "moban_form_fuza.jsp"},
            {name: "查看表单-弹窗", href: "moban_form_tanchuang.jsp"},
            {name: "查看表单-跳转", href: "moban_form_tiaozhuan.jsp"},
            {name: "报告数量统计", href: "moban_tongji.jsp"},
            {name: "多人协作-日期", href: "moban_xiezuo_riqi.jsp"},
            {name: "多人协作-分类", href: "moban_xiezuo_fenlei.jsp"},
            {name: "内部报告-评论", href: "moban_neibu_pinglun.jsp"},
            {name: "内部报告-详细", href: "moban_neibu_xiangxi.jsp"},
            {name: "投资池", href: "moban_touzichi.jsp"},
            {name: "权限管理", href: "moban_quanxian.jsp"},
            {name: "全文检索", href: "moban_jiansuo.jsp"},
            {name: "个股全景图", href: "moban_stock.jsp"},
            {name: "固定列表格", href: "moban_tablefix.jsp"},
            {name: "公告", href: "moban_baogao2.jsp"},
            {name: "个人中心", href: "moban_home.jsp"},
            {name: "手动批量调整", href: "moban_shoudongS1.jsp"},
            {name: "支持中心", href: "moban_zhichi.jsp"},
            {name: "语言中心", href: "moban_yuyan.jsp"},
            {name: "日程模式", href: "moban_richeng.jsp"},
            {name: "工作流明细", href: "moban_wf_mingxi.jsp"},
            {name: "管理人全景图", href: "moban_guanliren.jsp"},
            {name: "基金经理全景图", href: "moban_jijinjingli.jsp"},
            {name: "基金全景图", href: "moban_jijin.jsp"},
            {name: "报告审批", href: "moban_baogao_shenpi.jsp"},
            {name: "报告编辑", href: "moban_baogao_bianji.jsp"},
            {name: "竖标签", href: "moban_shuTab.jsp"},
            {name: "周日程", href: "moban_zhouricheng.jsp"},
            {name: "项目执行", href: "moban_xiangmu.jsp"},
            {name: "高级搜索输入", href: "moban_inputMenu.jsp"},
            {name: "券商会议", href: "moban_huiyi.jsp"},
            {name: "外部报告查询列表", href: "moban_baogao_liebiao.jsp"},
            {name: "新建储备项目<font color='red'>new!</font>", href: "moban_chubei_create.jsp"},
            {name: "查询储备项目<font color='red'>new!</font>", href: "moban_chubei_query.jsp"}
        ]}
    ]},
    {name: "第三方控件<font color='red'>new!</font>", open:true,children: [
        {name: "JqueryUI", href: "http://jqueryui.com/demos/"},
        {name: "浮动树多选", href: "float_tree.jsp"},
        {name: "右键菜单", href: "contextMenu.jsp"},
        {name: "提示泡-poshy-tip", href: "http://vadikom.com/demos/poshytip/"},
        {name: "蒙板-blockUI", href: "http://www.malsup.com/jquery/block/"},
        {name: "树形控件-zTree<font color='red'>推荐!</font>", href: "http://www.ztree.me"},
        {name: "拖拽-jquery.event.drag", href: "http://threedubmedia.com/code/event/drag/"},
        {name: "浮动层-powerFloat", href: "http://www.zhangxinxu.com/study/201012/jquery-power-float-demo.html"}
    ]},
    {name: "Welcome", href: "welcome.jsp"}

];

var setting = {
    view: {
        nameIsHTML: true
    },
    callback: {
        onClick: function (event, treeId, treeNode)
        {
            $("#content").attr("src", treeNode.href);
        }
    }
};

$(document).ready(function ()
{
    $.fn.zTree.init($("#treeDemo"), setting, demoData);
});
</script>
<style type="text/css">
    html, body {
        margin : 0px;
        height : 100%;
    }
</style>
</head>

<body style="height: 100%">

<div style="float:left;width:250px;line-height:100%;height: 100%;overflow-y: auto;overflow-x: hidden">
    <ul id="treeDemo" class="ztree"></ul>
</div>
<div id="contentDiv" style="margin-left: 250px;line-height:100%;height: 100%;overflow: hidden">
    <iframe id="content" src='welcome.jsp' name="mainFrame" style="width: 100%;height: 100%">
    </iframe>
</div>
</body>
</html>