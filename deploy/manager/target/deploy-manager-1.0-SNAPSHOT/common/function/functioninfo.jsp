
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/org/includes/orgincludes.jsp" %>

<html>
<head>
    <title></title>
</head>
<body>

<jsp:include page="/common/include/treemenu.jsp">
    <jsp:param name="page" value="${contextPath}/common/function/functioninfo_right.jsp?_ssid_=${_ssid_}"/>
    <jsp:param name="clazz" value="com.sinitek.managerframework.function.action.FunctionInfoAction"/>
    <jsp:param name="maxlevel" value="-1"/>
</jsp:include>

</body>
</html>


<%--&lt;%&ndash;--%>
  <%--File Desc:      --%>
  <%--Product Name: SIRM--%>
  <%--Module Name: org--%>
  <%--Author:      潘虹--%>
  <%--History:     11-7-25 created by 潘虹--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ include file="/org/includes/orgincludes.jsp" %>--%>
<%--<html>--%>
<%--<head><title>功能页面</title>--%>
<%--<script type="text/javascript">--%>
<%--//是否可做菜单--%>
<%--function ismenuFun() {--%>
    <%--var functiontype = $("#functiontype").stk_val();--%>
    <%--if (functiontype == "0") {--%>
        <%--return "请输入功能类型";--%>
    <%--} else {--%>
        <%--if (functiontype == "1") {--%>
            <%--if ($("#url").stk_val() == "") {--%>
                <%--return "请输入功能Url";--%>
            <%--}--%>
        <%--} else if (functiontype == "2") {--%>
            <%--if ($("#action").stk_val() == "") {--%>
                <%--return "请输入功能Action";--%>
            <%--}--%>
            <%--if ($("#method").stk_val() == "") {--%>
                <%--return "请输入功能Method";--%>
            <%--}--%>
        <%--}--%>
    <%--}--%>
    <%--return true;--%>
<%--}--%>

<%--//添加功能--%>
<%--function addFun() {--%>
    <%--if ($(getSelected()).attr("id") == undefined || $(getSelected()).attr("id") == "tree0") {--%>
        <%--stk.alert("请选择功能分类");--%>
        <%--return;--%>
    <%--} else {--%>
        <%--$("#addFunForm").stk_reset();--%>
        <%--getParentFun(false);--%>
        <%--$("#funtype").stk_val("0");--%>
        <%--$("#menuflag").stk_val("0");--%>
        <%--$("#addFunWindow").stk_show({title:'新增'});--%>
        <%--$("#funcode").stk_focus();--%>
    <%--}--%>
<%--}--%>

<%--//修改功能--%>
<%--function showUpdateWindow(data) {--%>
<%--//    stk.debug(data);--%>
    <%--$("#addFunForm").stk_reset();--%>
    <%--getParentFun(false);--%>
    <%--$("#addFunBtn").stk_hide();--%>
    <%--$("#funtype").stk_val("1");--%>
    <%--$("#funid").stk_val(data.objid);--%>
    <%--$("#funcode").stk_val(data.code);--%>
    <%--$("#funname").stk_val(data.name);--%>
    <%--$("#functiontype").stk_val(data.type);--%>
    <%--$("#funsort").stk_val(data.sort);--%>
    <%--$("#url").stk_val(data.url);--%>
    <%--$("#action").stk_val(data.action);--%>
    <%--$("#method").stk_val(data.method);--%>
    <%--$("#fundec").stk_val(data.brief);--%>
    <%--$("#addFunWindow").stk_show({title:'修改'});--%>
    <%--$("#funcode").stk_focus();--%>
<%--}--%>

<%--//删除功能--%>
<%--function removeFun() {--%>
    <%--if ($("#checkBoxPlugin").hasSelect()) {--%>
        <%--stk.confirm("确认删除吗？", function() {--%>
            <%--$("#checkBoxPlugin").stk_call({type:'0'}, function(result) {--%>
                <%--$("#funTable").stk_query();--%>
            <%--});--%>
        <%--});--%>
    <%--}--%>
    <%--else {--%>
        <%--stk.alert("请选中要删除的数据");--%>
    <%--}--%>
<%--}--%>

<%--$(function() {--%>
    <%--//加载功能分类--%>
    <%--reloadTree();--%>
<%--});--%>
<%--//获取当前选中的元素--%>
<%--function getSelected() {--%>
    <%--return $(".prem-menu").find("li[selected='selected']")[0];--%>
<%--}--%>

<%--//删除当前选中栏目--%>
<%--function deleteColumn() {--%>
    <%--var selected = $(getSelected());--%>
    <%--var id = $(selected).attr("id");--%>
    <%--if (id == "tree0") {--%>
        <%--stk.alert("功能分类根节点不得删除");--%>
    <%--} else {--%>
        <%--if (id == undefined) {--%>
            <%--stk.alert("请选择要删除的栏目");--%>
            <%--return;--%>
        <%--} else {--%>
            <%--var parentid = $(selected).attr("parentid");--%>
            <%--$("#groupid").val(id);--%>
            <%--stk.confirm("确认删除吗？", function() {--%>
                <%--$("#queryForm").stk_submit("removeSelect", function(result) {--%>
                    <%--if (result != "")--%>
                        <%--stk.alert(result);--%>
                    <%--else {--%>
                        <%--reloadTree();--%>
                        <%--addFunClass(parentid);--%>
                    <%--}--%>
                <%--});--%>
            <%--});--%>
        <%--}--%>
    <%--}--%>
<%--}--%>

<%--//增加功能分类--%>
<%--function addColumn() {--%>
    <%--var selectedId = $(getSelected()).attr("id");--%>
    <%--if (selectedId == undefined) {--%>
        <%--stk.confirm("增加根节点吗？", function() {--%>
            <%--$("#addTypeForm").stk_reset();--%>
            <%--getParentFun(true);--%>
            <%--$("#type").stk_val("0");--%>
            <%--$("#addTypeWindow").stk_show({title:"新增"});--%>
            <%--$("#typename").stk_focus();--%>
        <%--});--%>
    <%--} else {--%>
        <%--$("#addTypeForm").stk_reset();--%>
        <%--getParentFun(true);--%>
        <%--$("#type").stk_val("0");--%>
        <%--$("#addTypeWindow").stk_show({title:"新增"});--%>
        <%--$("#typename").stk_focus();--%>
    <%--}--%>
<%--}--%>

<%--//重新加载栏目树--%>
<%--function reloadTree() {--%>
    <%--var tree = $(".menu-list");--%>
    <%--$(tree).html("");--%>
    <%--$("#queryForm").stk_submit("treeSelect", function(result) {--%>
        <%--var sb = [];--%>
        <%--var data = jQuery.parseJSON(result);--%>
        <%--sb.push("<li id='tree0' onclick='addFunClass(\"tree0\")' style='cursor:pointer;white-space:nowarp;margin-left:0px;'>");--%>
        <%--sb.push("<span style=\"margin-left:0px\"><b class=\"icon-st25 mr5\"></b>");--%>
        <%--sb.push("功能分类");--%>
        <%--sb.push("</span><span class=\"opt-bar\"></span></li>");--%>
        <%--for (var i = 0; i < data.length; i++) {--%>
            <%--var _ic = data[i];--%>
            <%--sb.push("<li id='" + _ic.id + "' level='" + _ic.level + "'cname='" + _ic.name + "' show='1' sort='" + _ic.sort + "' description='" + _ic.description + "' parentid='" + _ic.parentId + "' onclick=\"showhide('" + _ic.id + "')\" style='cursor:pointer;white-space:nowarp;margin-left:" + ((_ic.level + 1) * 14) + "px;_margin-left:" + ((_ic.level + 1) * 7) + "px;'>");--%>
            <%--sb.push("<span style=\"margin-left:0px\"><b class=\"icon-st25 mr5\"></b>");--%>
            <%--sb.push(_ic.name);--%>
            <%--sb.push("</span>");--%>
            <%--sb.push("<span class=\"opt-bar\"><b onclick=\"addiconclick('" + _ic.id + "','up')\" class=\"icon-st16\"></b><b  onclick=\"addiconclick('" + _ic.id + "','down')\" class=\"icon-st17\"></b><b  onclick=\"addiconclick('" + _ic.id + "','edit')\" class=\"icon-st15\"></b></span>");--%>
            <%--sb.push("</li>");--%>
        <%--}--%>
        <%--$(tree).append(sb.join("\n"));--%>
        <%--var _wh = $.offHeight() - 30;--%>
        <%--var _m = $('.prem-menu');--%>
        <%--var _h = _m.height();--%>
        <%--_h = (_h + 45) > _wh ? _wh : _h;--%>
        <%--if ((_h + 45) > _wh) {--%>
            <%--_m.css({"height" : (_wh - 45) + "px","overflow-y" : "auto","overflow-x" : "hidden","position":"relative"})--%>
        <%--}--%>
        <%--if ($("#groupid") != undefined && $("#groupid").stk_val() != "")--%>
            <%--addFunClass($("#groupid").stk_val());--%>
        <%--if ($.browser.msie && $.browser.version == '6.0') {--%>
            <%--$('.menu-list li').hover(function() {--%>
                <%--$(this).addClass('hover');--%>
            <%--}, function() {--%>
                <%--$(this).removeClass('hover');--%>
            <%--})--%>
        <%--}--%>
    <%--});--%>
<%--}--%>

<%--function showhide(liId) {--%>
    <%--var show = $("#" + liId).stk_attr("show");--%>
    <%--$("#" + liId).stk_attr("show", show=="1" ? "0" : "1");--%>
    <%--$("li[parentid=" + liId + "]").each(function(i, li) {--%>
        <%--if (show=="1")--%>
            <%--$(li).stk_hide();--%>
        <%--else--%>
            <%--$(li).stk_show();--%>
    <%--});--%>
    <%--addFunClass(liId);--%>
<%--}--%>

<%--//添加选中样式--%>
<%--function addFunClass(btnvar) {--%>
    <%--//给树加选中效果--%>
    <%--var btn = $("#" + btnvar);--%>
    <%--$('.menu-list .selected').removeClass('selected');--%>
    <%--$(btn).addClass('selected');--%>
    <%--$(".prem-menu").find("li[selected='selected']").css("background-color", "").removeAttr("selected");--%>
    <%--$(btn).attr("selected", "selected").css("background-color", stk.table_td_select_color);--%>
    <%--sendtypepage(btnvar);--%>
<%--}--%>

<%--//点击图标--%>
<%--function addiconclick(btnvar, str) {--%>
    <%--event.cancelBubble = true;--%>
    <%--var lin = $("#" + btnvar);--%>
    <%--var id = lin.attr("id");--%>
    <%--var parentid = lin.attr("parentid");--%>
    <%--if (str == "up") {--%>
        <%--var groupindex = $(".menu-list li[parentid='" + parentid + "']").index(lin);--%>
        <%--var li = $(".menu-list li[parentid='" + parentid + "']:eq(" + (groupindex - 1) + ")");--%>
        <%--$("#groupid").stk_val(id);--%>
        <%--$("#groupsort").stk_val($(lin).attr("sort"));--%>
        <%--if (groupindex > 0) {--%>
            <%--$("#updateid").stk_val($(li).attr("id"));--%>
            <%--$("#updatesort").stk_val($(li).attr("sort"));--%>
            <%--$("#queryForm").stk_submit("updateSelect", function(result) {--%>
                <%--if (result != "")--%>
                    <%--stk.alert(result);--%>
                <%--else {--%>
                    <%--reloadTree();--%>
                <%--}--%>
            <%--});--%>
        <%--}--%>
    <%--} else if (str == "down") {--%>
        <%--var groupindex = $(".menu-list li[parentid='" + parentid + "']").index(lin);--%>
        <%--var endindex = $(".menu-list li[parentid='" + parentid + "']").index($(".menu-list li[parentid='" + parentid + "']:last"));--%>
        <%--$("#groupid").stk_val(id);--%>
        <%--$("#groupsort").stk_val($(lin).attr("sort"));--%>
        <%--if (groupindex < endindex) {--%>
            <%--var updateevent = $(".menu-list li[parentid='" + parentid + "']:eq(" + (groupindex + 1) + ")");--%>
            <%--$("#updateid").stk_val($(updateevent).attr("id"));--%>
            <%--$("#updatesort").stk_val($(updateevent).attr("sort"));--%>
            <%--$("#queryForm").stk_submit("updateSelect", function(result) {--%>
                <%--if (result != "")--%>
                    <%--stk.alert(result);--%>
                <%--else {--%>
                    <%--reloadTree();--%>
                <%--}--%>
            <%--});--%>
        <%--}--%>
    <%--} else if (str == "edit") {--%>
        <%--$("#addTypeForm").stk_reset();--%>
        <%--getParentFun(true);--%>
        <%--$("#addBtn").stk_hide();--%>
        <%--$("#type").stk_val("1");--%>
        <%--$("#typeid").stk_val(id);--%>
        <%--$("#parentid").stk_val(parentid);--%>
        <%--$("#typename").stk_val(lin.attr("cname"));--%>
        <%--$("#typesort").stk_val(lin.attr("sort"));--%>
        <%--$("#typedec").stk_val(lin.attr("description"));--%>
        <%--$("#addTypeWindow").stk_show({title:'修改'});--%>
        <%--$("#typename").stk_focus();--%>
    <%--}--%>
<%--}--%>

<%--//刷新当前位置--%>
<%--function sendtypepage(id) {--%>
    <%--if (id != 'tree0') {--%>
        <%--$("#groupid").stk_val(id);--%>
        <%--$("#queryForm").stk_submit("getCurrentMenu", function(strmeun) {--%>
            <%--var sb = [];--%>
            <%--var datas = $.parseJSON(strmeun);--%>
            <%--for (var i = datas.length - 1; i >= 0; i--) {--%>
                <%--var data = $(datas).get(i);--%>
                <%--if (i == datas.length - 1) {--%>
                    <%--sb.push("<a href=\"javascript:gotourl('" + data.id + "')\">" + data.code + "</a>");--%>
                <%--} else {--%>
                    <%--sb.push("&nbsp;&gt;&gt;&nbsp;<a href=\"javascript:gotourl('" + data.id + "')\">" + data.code + "</a>");--%>
                <%--}--%>
            <%--}--%>
            <%--$("#currentMeun").html(sb.join("\n"));--%>
        <%--});--%>
    <%--}--%>
    <%--$("#funTable").stk_query();--%>
<%--}--%>

<%--function gotourl(id) {--%>
    <%--addFunClass(id);--%>
<%--}--%>
<%--/**--%>
 <%--*验证功能分类描述不得为空--%>
 <%--*/--%>
<%--function checkLength() {--%>
    <%--if ($("#typedec").stk_text() != "") {--%>
        <%--if ($("#typedec").stk_text().length > 50) {--%>
            <%--return "功能分类描述的长度不得大于50";--%>
        <%--}--%>
    <%--}--%>
    <%--return  true;--%>
<%--}--%>
<%--/**--%>
 <%--*验证功能描述不得为空--%>
 <%--*/--%>
<%--function checkFunLength() {--%>
    <%--if ($("#fundec").stk_text() != "") {--%>
        <%--if ($("#fundec").stk_text().length > 50) {--%>
            <%--return "功能描述的长度不得大于50";--%>
        <%--}--%>
    <%--}--%>
    <%--return  true;--%>
<%--}--%>

<%--/**--%>
 <%--*  获取功能分类列表--%>
 <%--* @param funtype--%>
 <%--*/--%>
<%--function getParentFun(funtype) {--%>
    <%--$("#parentfun").stk_val(funtype);--%>
    <%--var selectedId = $(getSelected()).attr("id");--%>
    <%--$("#addTypeForm").stk_submit('getParentFun', function(result) {--%>
        <%--if (funtype) {--%>
            <%--$("#parentid").stk_html(result);--%>
            <%--if (selectedId == "tree0")--%>
                <%--$("#parentid").stk_val(0);--%>
            <%--else--%>
                <%--$("#parentid").stk_val(selectedId);--%>
        <%--} else {--%>
            <%--$("#functionGroupId").stk_html(result);--%>
            <%--$("#functionGroupId").stk_val(selectedId);--%>
        <%--}--%>
    <%--});--%>
<%--}--%>

<%--//$(function(){--%>
<%--//	var _wh = $.offHeight();--%>
<%--//	var _m = $('.prem-menu');--%>
<%--//	var _h = _m.height();--%>
<%--//	_h = (_h+45)>_wh ? _wh : _h;--%>
<%--//	if((_h+45)>_wh){--%>
<%--//		_m.css({"height" : (_wh-45)+"px","overflow-y" : "auto","overflow-x" : "hidden"})--%>
<%--//	}--%>
<%--//})--%>

<%--</script>--%>
<%--</head>--%>
<%--<sirm:body>--%>
<%--<ui:form id="queryForm" clazz="com.sinitek.managerframework.function.action.FunctionInfoAction">--%>
    <%--<input type="hidden" id="groupid" name="groupid"/> <!--当前节点的ID-->--%>
    <%--<input type="hidden" id="updateid" name="updateid"/><!--目标节点的ID-->--%>
    <%--<input type="hidden" id="groupsort" name="groupsort"/> <!--当前节点的排序-->--%>
    <%--<input type="hidden" id="updatesort" name="updatesort"/><!--目标节点的排序-->--%>
    <%--<div class="prem-bar">--%>
        <%--<table class="w100p">--%>
            <%--<tr>--%>
                <%--<td width="250">--%>
                    <%--<ui:button text="新增" icon="ui-icon-plusthick">--%>
                        <%--<event:onclick>--%>
                            <%--addColumn();--%>
                        <%--</event:onclick>--%>
                    <%--</ui:button>--%>
                    <%--<ui:button text="删除" icon="ui-icon-minusthick">--%>
                        <%--<event:onclick>--%>
                            <%--deleteColumn();--%>
                        <%--</event:onclick>--%>
                    <%--</ui:button>--%>
                <%--</td>--%>
                <%--<td width="auto">--%>
                    <%--当前位置：<span id="currentMeun"></span>--%>
                <%--</td>--%>
            <%--</tr>--%>
        <%--</table>--%>
    <%--</div>--%>
    <%--<div class="prem-box">--%>
        <%--<table class="w100p">--%>
            <%--<tr>--%>
                <%--<td width="300px" height="457px">--%>
                    <%--<div class="prem-menu" style="width:300px">--%>
                        <%--<ul class="menu-list"></ul>--%>
                    <%--</div>--%>
                <%--</td>--%>
                <%--<td width="5" class="split-bar frbar-st1"></td>--%>
                <%--<td width="auto" valign="top">--%>
                    <%--<div class="prem-sec-box"> <!-- style="width:100%"-->--%>
                        <%--<plugin:colCheckbox id="checkBoxPlugin" name="check"/>--%>
                        <%--<plugin:colRowNum id="rowNumPlugin"/>--%>
                        <%--<plugin:colLink id="updateBtn" text="修改信息" dataVar="data">--%>
                            <%--showUpdateWindow(data);--%>
                        <%--</plugin:colLink>--%>
                        <%--<ui:table id="funTable" actionClass="com.sinitek.managerframework.function.action.FunctionInfoAction" queryForm="queryForm" width="100%">--%>
                            <%--<layout:tableToolBar position="top">--%>
                                <%--<ui:toolbarButton text="新增" icon="ui-icon-document">--%>
                                    <%--<event:onclick>--%>
                                        <%--addFun();--%>
                                    <%--</event:onclick>--%>
                                <%--</ui:toolbarButton>--%>
                                <%--<ui:toolbarButton text="删除" icon="ui-icon-trash">--%>
                                    <%--<event:onclick>--%>
                                        <%--removeFun();--%>
                                    <%--</event:onclick>--%>
                                <%--</ui:toolbarButton>--%>
                            <%--</layout:tableToolBar>--%>
                            <%--<ui:col plugin="checkBoxPlugin" width="20px"/>--%>
                            <%--<ui:col plugin="rowNumPlugin" width="30px"/>--%>
                            <%--<ui:col property="Code" title="代码" align="left" width="70px" allowTip="true"/>--%>
                            <%--<ui:col property="Name" title="名称" align="left" width="80px" allowTip="true"/>--%>
                            <%--<ui:colCust allowSort="false" method="getFunctionType" property="functiontype" title="类型" align="center" width="30px"/>--%>
                            <%--<ui:col property="Url" title="Url" align="left" nowrap="true" width="33%" allowTip="true"/>--%>
                            <%--<ui:col property="Action" title="Action" align="left" nowrap="true" width="33%" allowTip="true"/>--%>
                            <%--<ui:col property="Method" title="Method" align="left" nowrap="true" width="33%" allowTip="true"/>--%>
                            <%--<ui:col property="sort" title="排序" align="right" width="30px"/>--%>
                            <%--<ui:col plugin="updateBtn" title="操作" nowrap="false" width="60px"/>--%>
                        <%--</ui:table>--%>
                    <%--</div>--%>
                <%--</td>--%>
            <%--</tr>--%>
        <%--</table>--%>
    <%--</div>--%>
<%--</ui:form>--%>
<%--<!--新增分类-->--%>
<%--<layout:window id="addTypeWindow">--%>
    <%--<ui:form id="addTypeForm" clazz="com.sinitek.managerframework.function.action.FunctionInfoAction" method="saveType">--%>
        <%--<input type="hidden" id="type" name="type"/>--%>
        <%--<input type="hidden" id="typeid" name="typeid"/>--%>
        <%--&lt;%&ndash;<input type="hidden" id="parentid" name="parentid"/>&ndash;%&gt;--%>
        <%--<input type="hidden" id="parentfun" name="parentfun"/>--%>

        <%--<div style="width:510px">--%>
            <%--<div>--%>
                <%--<table class="stk-form-ui-st1">--%>
                    <%--<tr>--%>
                        <%--<td class="hd" width="80">上级分类<em>*</em></td>--%>
                        <%--<td class="bd" width="auto">--%>
                            <%--<ui:select id="parentid">--%>
                            <%--</ui:select>--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td class="hd" width="80">分类名称<em>*</em></td>--%>
                        <%--<td class="bd" width="auto"><ui:textfield width="90%" id="typename" name="typename"/></td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td class="hd" width="80">顺序<em>*</em></td>--%>
                        <%--<td class="bd" width="auto"><ui:textfield width="90%" id="typesort" name="typesort"/></td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td class="hd" width="80">分类描述</td>--%>
                        <%--<td class="bd" width="auto"><ui:textarea rows="10" width="90%" id="typedec" name="typedec"></ui:textarea></td>--%>
                    <%--</tr>--%>
                    <%--<tr class="btn-bar">--%>
                        <%--<td class="hd"></td>--%>
                        <%--<td class="bd">--%>
                            <%--<ui:button id="addBtn" text="保存并新增">--%>
                                <%--<event:onclick>--%>
                                    <%--if ($("#addTypeForm").stk_checkForm()) {--%>
                                    <%--$("#addTypeForm").stk_submit(function(result) {--%>
                                    <%--if (result != "")--%>
                                    <%--stk.alert(result);--%>
                                    <%--else{--%>
                                    <%--reloadTree();--%>
                                    <%--}--%>
                                    <%--});--%>
                                    <%--}--%>
                                <%--</event:onclick>--%>
                            <%--</ui:button>--%>
                            <%--<ui:button id="" text="保存并关闭">--%>
                                <%--<event:onclick>--%>
                                    <%--if ($("#addTypeForm").stk_checkForm()) {--%>
                                    <%--$("#addTypeForm").stk_submit(function(result) {--%>
                                    <%--if (result != "")--%>
                                    <%--stk.alert(result);--%>
                                    <%--else{--%>
                                    <%--$("#addTypeWindow").stk_hide();--%>
                                    <%--reloadTree();--%>
                                    <%--}--%>
                                    <%--});--%>
                                    <%--}--%>
                                <%--</event:onclick>--%>
                            <%--</ui:button>--%>
                            <%--<ui:button text="关闭">--%>
                                <%--<event:onclick>--%>
                                    <%--$("#addTypeWindow").stk_hide();--%>
                                <%--</event:onclick>--%>
                            <%--</ui:button>--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                <%--</table>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<func:checkers>--%>
            <%--<func:checker target="parentid" allowBlank="false" blankText="请输入上级分类"/>--%>
            <%--<func:checker target="typename" allowBlank="false" blankText="请输入分类名称"/>--%>
            <%--<func:checker target="typesort" allowBlank="false" regex="^[0-9]*$" regexText="请输入数字格式的分类顺序" blankText="请输入分类顺序"/>--%>
            <%--<func:checker target="typedec" validator="checkLength()"/>--%>
        <%--</func:checkers>--%>
    <%--</ui:form>--%>
<%--</layout:window>--%>
<%--<!--新增功能-->--%>
<%--<layout:window id="addFunWindow">--%>
    <%--<ui:form id="addFunForm" clazz="com.sinitek.managerframework.function.action.FunctionInfoAction" method="saveFunction">--%>
        <%--<input type="hidden" id="funtype" name="funtype"/>--%>
        <%--<input type="hidden" id="funid" name="funid"/>--%>
        <%--&lt;%&ndash;<input type="hidden" id="functionGroupId" name="functionGroupId"/>&ndash;%&gt;--%>

        <%--<div style="width:510px">--%>
            <%--<div>--%>
                <%--<table class="stk-form-ui-st1">--%>
                    <%--<tr>--%>
                        <%--<td class="hd" width="80">功能分类<em>*</em></td>--%>
                        <%--<td class="bd" width="auto"><ui:select id="functionGroupId"></ui:select></td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td class="hd" width="80">功能代码<em>*</em></td>--%>
                        <%--<td class="bd" width="auto"><ui:textfield id="funcode" name="funcode" width="80%"/></td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td class="hd" width="80">功能名称<em>*</em></td>--%>
                        <%--<td class="bd" width="auto"><ui:textfield id="funname" name="funname" width="80%"/></td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td class="hd" width="80">功能类型<em>*</em></td>--%>
                        <%--<td class="bd" width="auto">--%>
                            <%--<param:enumList clazz="com.sinitek.sirm.common.function.enumerate.FunctionType" var="enumList"/>--%>
                            <%--<ui:select id="functiontype" name="functiontype" list="#attr.enumList" headerKey="0"--%>
                                       <%--headerValue="--请选择--" listKey="enumItemValue"--%>
                                       <%--listValue="enumItemInfo"></ui:select></td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td class="hd" width="80">顺序<em>*</em></td>--%>
                        <%--<td class="bd" width="auto"><ui:textfield id="funsort" name="funsort" width="80%"/></td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td class="hd" width="80">Url</td>--%>
                        <%--<td class="bd" width="auto"><ui:textfield id="url" name="url" width="80%"/></td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td class="hd" width="80">Action</td>--%>
                        <%--<td class="bd" width="auto"><ui:textfield id="action" name="action"/>--%>
                            <%--&nbsp;&nbsp; Method &nbsp;<ui:textfield id="method" name="method"/>--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td class="hd" width="80">说明</td>--%>
                        <%--<td class="bd" width="auto"><ui:textarea rows="10" id="fundec" name="fundec" width="80%"></ui:textarea></td>--%>
                    <%--</tr>--%>
                    <%--<tr class="btn-bar">--%>
                        <%--<td class="hd"></td>--%>
                        <%--<td class="bd">--%>
                            <%--<ui:button id="addFunBtn" text="保存并新增">--%>
                                <%--<event:onclick>--%>
                                    <%--if ($("#addFunForm").stk_checkForm()) {--%>
                                    <%--$("#addFunForm").stk_submit(function(result) {--%>
                                    <%--if (result != "")--%>
                                    <%--stk.alert(result);--%>
                                    <%--else{--%>
                                    <%--reloadTree();--%>
                                    <%--}--%>
                                    <%--});--%>
                                    <%--}--%>
                                <%--</event:onclick>--%>
                            <%--</ui:button>--%>
                            <%--<ui:button id="" text="保存并关闭">--%>
                                <%--<event:onclick>--%>
                                    <%--if ($("#addFunForm").stk_checkForm()) {--%>
                                    <%--$("#addFunForm").stk_submit(function(result) {--%>
                                    <%--if (result != "")--%>
                                    <%--stk.alert(result);--%>
                                    <%--else{--%>
                                    <%--$("#addFunWindow").stk_hide();--%>
                                    <%--reloadTree();--%>
                                    <%--}--%>
                                    <%--});--%>
                                    <%--}--%>
                                <%--</event:onclick>--%>
                            <%--</ui:button>--%>
                            <%--<ui:button text="关闭">--%>
                                <%--<event:onclick>--%>
                                    <%--$("#addFunWindow").stk_hide();--%>
                                <%--</event:onclick>--%>
                            <%--</ui:button>--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                <%--</table>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<func:checkers>--%>
            <%--<func:checker target="functionGroupId" allowBlank="false" blankText="请输入功能分类"/>--%>
            <%--<func:checker target="funcode" allowBlank="false" blankText="请输入功能代码"/>--%>
            <%--<func:checker target="funname" allowBlank="false" blankText="请输入功能名称"/>--%>
            <%--<func:checker target="functiontype" validator="ismenuFun()"/>--%>
            <%--<func:checker target="fundec" validator="checkFunLength()"/>--%>
            <%--<func:checker target="funsort" allowBlank="false" blankText="请输入顺序" regex="^[0-9]*$" regexText="请输入数字格式的分类顺序"/>--%>
        <%--</func:checkers>--%>
    <%--</ui:form>--%>
<%--</layout:window>--%>
<%--</sirm:body>--%>
<%--</html>--%>