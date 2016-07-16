<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/includes/commonincludes.jsp" %>

<html >
<head>
    <title></title>
</head>
<body>

    <jsp:include page="/common/include/treemenu.jsp">
        <jsp:param name="page" value="${contextPath}/common/menu/managemenu_right.jsp"/>
        <jsp:param name="clazz" value="com.sinitek.managerframework.menu.action.SearchNodeAction"/>
        <jsp:param name="maxlevel" value="2"/>
        <jsp:param name="rootid" value="0"/>
    </jsp:include>

</body>
</html>



<%--<%@ page import="com.sinitek.sirm.common.CommonServiceFactory" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%--&lt;%&ndash;--%>
  <%--Created by IntelliJ IDEA.--%>
  <%--User: Administrator--%>
  <%--Date: 11-6-13--%>
  <%--Time: 上午11:06--%>
  <%--To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@include file="/includes/commonincludes.jsp" %>--%>
<%--<%--%>
    <%--List queryList = CommonServiceFactory.getFunctionService().findAllFunction();--%>
    <%--pageContext.setAttribute("queryList", queryList);--%>
<%--%>--%>
<%--<html>--%>
<%--<head><title>菜单管理</title></head>--%>
<%--<sirm:body>--%>
<%--<script type="text/javascript">--%>
    <%--function aaa() {--%>
        <%--//如果需要传参--%>
        <%--return {type:$("#type").stk_val()};--%>
    <%--}--%>




    <%--function removeMenu() {--%>
        <%--if ($("#checkBoxPlugin").hasSelect()) {--%>
            <%--stk.confirm("确认删除吗？", function () {--%>
                <%--$("#checkBoxPlugin").stk_call({type:'0'}, function (result) {--%>
                    <%--$("#industryTree").stk_refresh($("#qparentid").stk_val());--%>
                    <%--$("#menuTable").stk_query();--%>
                <%--});--%>
            <%--});--%>
        <%--}--%>
        <%--else {--%>
            <%--stk.alert("请选中要删除的数据");--%>
        <%--}--%>
    <%--}--%>


    <%--function showUpdateWindow(data) {--%>
        <%--getselect();--%>

        <%--$("#menuname").stk_val("");--%>
        <%--$("#functionId").stk_val("");--%>
        <%--$("#ord").stk_val("");--%>
        <%--$("#description2").stk_val("");--%>
        <%--$("#url").stk_val("");--%>


        <%--$("#menuname").stk_val(data.name);--%>
        <%--$("#functionId").stk_val(data.functionId);--%>
        <%--$("#url").stk_val(data.url);--%>
        <%--$("#ord").stk_val(data.ord);--%>
        <%--$("#objid").stk_val(data.objid);--%>
        <%--$("#description2").stk_val(data.description);--%>
        <%--$("#style").stk_val(data.style);--%>
        <%--$("#addmenuWindow").stk_show();--%>

    <%--}--%>


    <%--function setord(ord, uptype, parentid, objid, rownum) {--%>

    <%--&lt;%&ndash;获取table rownum&ndash;%&gt;--%>
        <%--var orderval = "";--%>
        <%--$("input[name='menueval_order']").each(--%>
              <%--function() {--%>
                  <%--if (orderval != "") {--%>
                      <%--orderval += ",";--%>
                  <%--}--%>
                  <%--orderval += $(this).val();--%>
              <%--}--%>
        <%--);--%>

    <%--&lt;%&ndash;当前rownum&ndash;%&gt;--%>
        <%--$("#current_rownum").stk_val(rownum);--%>
    <%--&lt;%&ndash;菜单排序字符&ndash;%&gt;--%>
        <%--$("#menu_orders").stk_val(orderval);--%>

        <%--$("#oparentid").stk_val(parentid);--%>
        <%--$("#oobjid").stk_val(objid);--%>
        <%--$("#oord").stk_val(ord);--%>
        <%--$("#uptype").stk_val(uptype);--%>
        <%--$("#setOrdForm").stk_submit('setOrd', function (result) {--%>
            <%--$("#menuTable").stk_query();--%>
        <%--});--%>

    <%--}--%>

    <%--function getselect() {--%>
        <%--var top = document.createElement("optgroup");--%>
        <%--var x = 0;--%>
        <%--var sed;--%>
        <%--$("#setOrdForm").stk_submit('getMenuSelect', function (result) {--%>
            <%--var menuselect = document.getElementById("menuselect");--%>
            <%--removeAllChildren(menuselect);--%>
            <%--var topone = document.createElement("option");--%>
            <%--topone.setAttribute("value", 0);--%>
            <%--topone.appendChild(document.createTextNode("-可选择-"));--%>
            <%--menuselect.appendChild(topone);--%>
            <%--for (var i in result) {--%>
                <%--if (result[i].type == 1) {--%>
                    <%--top.setAttribute("label", result[i].name);--%>
                    <%--menuselect.appendChild(top);--%>
                    <%--top = document.createElement("optgroup");--%>
                <%--}--%>
                <%--else if (result[i].type == 2) {--%>
                    <%--var sed = document.createElement("option");--%>
                    <%--sed.setAttribute("value", result[i].objid);--%>
                    <%--sed.appendChild(document.createTextNode(result[i].name));--%>
                    <%--top.appendChild(sed);--%>
                <%--}--%>
            <%--}--%>
        <%--});--%>
    <%--}--%>
    <%--function removeAllChildren(node) {--%>
        <%--while (node.hasChildNodes())--%>
            <%--node.removeChild(node.firstChild);--%>
    <%--}--%>

<%--function exportSysMenu() {--%>
<%--window.open("${contextPath}/org/menu/exportMenu.action");--%>
<%--}--%>

<%--function impoerwindow() {--%>
<%--$("#importmenuform").stk_reset();--%>
<%--$("#importmenuwindow").stk_show();--%>
<%--}--%>
<%--function modechoice() {--%>
<%--var menufile = $("#menufile").stk_val();--%>
<%--var importmode = $('input:radio[name="importmode"]:checked').stk_val();--%>
<%--if (menufile.length <= 0) {--%>
<%--stk.info("请选择要导入的文件");--%>
<%--return false;--%>
<%--} else if (importmode == undefined || importmode.length <= 0) {--%>
<%--stk.info("请选择导入模式【新增】或【覆盖】");--%>
<%--return false;--%>
<%--} else {--%>
<%--return true;--%>
<%--}--%>
<%--}--%>
<%--function showconfirm() {--%>
<%--stk.info("如要覆盖菜单，系统内部除参数【ORGSIRM019】的人员，其余所有人员菜单访问权限将被清除【请谨慎操作】!", {"确定": function () {--%>
<%--stk.closeDialog();--%>
<%--}});--%>
<%--}--%>
<%--</script>--%>
<%--<table>--%>
    <%--<tr>--%>
<%--<td width="350" align="right">--%>
<%--<ui:button text="导入">--%>
<%--<event:onclick>--%>
<%--impoerwindow();--%>
<%--</event:onclick>--%>
<%--</ui:button>--%>
<%--<ui:button text="导出">--%>
<%--<event:onclick>--%>
<%--exportSysMenu();--%>
<%--</event:onclick>--%>
<%--</ui:button>--%>
<%--</td>--%>
<%--<td width="10">--%>
<%--&nbsp;--%>
<%--</td>--%>
<%--<td width="900">--%>

<%--</td>--%>
<%--</tr>--%>
<%--<tr>--%>
        <%--<td height="400" valign="top" width="350">--%>
            <%--<ui:tree id="industryTree" clazz="com.sinitek.managerframework.menu.action.MenuTreeAction" jsParam="aaa()"/>--%>
        <%--</td>--%>
        <%--<td height="400" valign="top" width="900">--%>
                <%--&lt;%&ndash;<layout:panel title="" collapsible="false" id="view2" name="view2">&ndash;%&gt;--%>
            <%--<ui:form id="menuForm">--%>
                <%--<input type="hidden" id="qparentid" name="qparentid">--%>
                <%--<input type="hidden" id="type" name="type" value="1">--%>
                <%--<input type="hidden" id="order" name="order">--%>

                <%--<div>--%>
                    <%--<div>--%>
                        <%--<table class="stk-form-ui-st1">--%>
                            <%--<tr>--%>
                                <%--<td class="hd" width="110">菜单路径</td>--%>
                                <%--<td class="bd" width="auto"><label id="cdname"></label></td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<td class="hd" width="110">名称</td>--%>
                                <%--<td class="bd" width="auto"><ui:label id="qname"></ui:label></td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<td class="hd" width="110">Url</td>--%>
                                <%--<td class="bd" width="auto"><ui:label id="qurl"></ui:label></td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<td class="hd" width="110">样式</td>--%>
                                <%--<td class="bd" width="auto"><ui:label id="qstyle"></ui:label></td>--%>
                            <%--</tr>--%>
                            <%--<tr style="display:none">--%>
                                <%--<td class="hd" width="110">功能名称</td>--%>
                                <%--<td class="bd" width="auto"><ui:label id="qfunctionName"></ui:label></td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<td class="hd" width="110">描述</td>--%>
                                <%--<td class="bd" width="auto"><ui:label id="description"></ui:label></td>--%>
                            <%--</tr>--%>
                        <%--</table>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<plugin:colLink id="updateBut" text="修改" dataVar="data">--%>
                    <%--$("#add").stk_hide();--%>
                    <%--$("#selecttr").stk_show();--%>
                    <%--showUpdateWindow(data);--%>
                <%--</plugin:colLink>--%>
                <%--<plugin:colCheckbox id="checkBoxPlugin" name="check"/>--%>
                <%--<plugin:colRowNum id="rowNumPlugin">--%>

                <%--</plugin:colRowNum>--%>
                <%--<ui:table id="menuTable" actionClass="com.sinitek.managerframework.menu.action.MenuAction" nowrap="true"--%>
                          <%--queryForm="menuForm">--%>
                    <%--<layout:tableToolBar position="top">--%>
                        <%--<ui:toolbarButton icon="ui-icon-document" text="新增">--%>
                            <%--<event:onclick>--%>
                                <%--$("#url").stk_val("");--%>
                                <%--$("#menuname").stk_val("");--%>
                                <%--$("#functionId").stk_val("");--%>
                                <%--$("#ord").stk_val("");--%>
                                <%--$("#description2").stk_val("");--%>
                                <%--$("#objid").stk_val("0");--%>
                                <%--$("#add").stk_show();--%>
                                <%--$("#selecttr").stk_hide();--%>
                                <%--$("#functionId").stk_val("0");--%>
                                <%--$("#addmenuWindow").stk_show();--%>
                            <%--</event:onclick>--%>
                        <%--</ui:toolbarButton>--%>
                        <%--<ui:toolbarButton icon="ui-icon-trash" text="删除">--%>
                            <%--<event:onclick>--%>
                                <%--removeMenu();--%>
                            <%--</event:onclick>--%>
                        <%--</ui:toolbarButton>--%>
                    <%--</layout:tableToolBar>--%>
                    <%--<ui:col plugin="checkBoxPlugin" nowrap="false" width="20px"/>--%>
                    <%--<ui:col plugin="rowNumPlugin" width="30px"/>--%>
                    <%--<ui:col property="name" title="名称" align="left" width="100px" allowTip="false">--%>
                        <%--"<input type='hidden' name='menueval_order' value='"+objid+"_"+rownum+"'/><span title='"+name+"'>"+name+"</span>"--%>
                    <%--</ui:col>--%>
                    <%--<ui:col property="functionName" title="功能名称" align="left" allowTip="true" show="false" width="25%"/>--%>
                    <%--&lt;%&ndash;show="false"&ndash;%&gt;--%>
                    <%--<ui:col property="url" title="Url" align="left" width="25%"/>--%>
                    <%--<ui:col property="description" title="描述" align="left" width="50%"/>--%>
                    <%--<ui:col property="style" title="样式" width="40px"/>--%>
                    <%--<ui:colCust method="setorda" title="排序" width="80px"/>--%>
                    <%--<ui:col plugin="updateBut" title="操作" width="60px"/>--%>
                    <%--<event:ontableorder propertyVar="property" orderTypeVar="order">--%>
                        <%--$("#order").stk_val(property+":"+order);--%>
                        <%--$("#menuTable").stk_query();--%>
                    <%--</event:ontableorder>--%>
                <%--</ui:table>--%>
            <%--</ui:form>--%>
                <%--&lt;%&ndash;</layout:panel>&ndash;%&gt;--%>
        <%--</td>--%>
    <%--</tr>--%>
<%--</table>--%>

<%--<layout:window id="addmenuWindow" width="540px" cellUnderLine="true" cellMarginBottom="1px" feature="labelBg"--%>
               <%--title="编辑菜单">--%>
    <%--<ui:form id='addmenuform' clazz="com.sinitek.managerframework.menu.action.MenuAction" method="addChildMenu">--%>
        <%--<div style="width:510px">--%>
            <%--<div>--%>
                <%--<table class="stk-form-ui-st1">--%>
                    <%--<tr>--%>
                        <%--<td class="hd" width="80"><label>上级菜单</label></td>--%>
                        <%--<td class="bd" width="auto">--%>
                            <%--<label name="parentName" id="parentName">主菜单</label>--%>
                            <%--<input type="hidden" id="parentId" name="parentId" value="0">--%>
                            <%--<input type="hidden" id="objid" name="objid" value="0">--%>
                        <%--</td>--%>
                    <%--</tr>--%>

                    <%--<tr id="selecttr">--%>
                        <%--<td class="hd" width="80"><label>移动菜单</label></td>--%>
                        <%--<td class="bd" width="auto">--%>
                            <%--<select id="menuselect">--%>
                                    <%--&lt;%&ndash;<option value="0">-可选择-</option>&ndash;%&gt;--%>
                            <%--</select>--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td class="hd" width="80"><label>名称<em>*</em></label></td>--%>
                        <%--<td class="bd" width="auto">--%>
                            <%--<ui:textfield id="menuname" name="menuname" width="300px"/>--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td class="hd" width="80"><label>Url</label></td>--%>
                        <%--<td class="bd" width="auto">--%>
                            <%--<ui:textfield id="url" name="url" width="300px"/>--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    <%--<tr style="display:none">--%>
                        <%--<td class="hd" width="80"><label>功能</label></td>--%>
                        <%--<td class="bd" width="auto">--%>
                            <%--<select id="functionId">--%>
                                <%--<option label="--请选择--" value="0"/>--%>
                                <%--<c:forEach var="Group" varStatus="i" items="${queryList}">--%>
                                    <%--<optgroup label="${Group.name}"/>--%>
                                    <%--<c:forEach var="twoGroup" varStatus="i" items="${Group.children}">--%>
                                        <%--<optgroup label="&nbsp;&nbsp;${twoGroup.name}"/>--%>
                                        <%--<c:forEach var="info" varStatus="k" items="${twoGroup.children}">--%>
                                            <%--<c:if test="${info.type==1}">--%>
                                                <%--<option label="${info.name}" value="${info.id}"/>--%>
                                            <%--</c:if>--%>
                                        <%--</c:forEach>--%>
                                    <%--</c:forEach>--%>
                                <%--</c:forEach>--%>
                            <%--</select>--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                        <%--&lt;%&ndash;<tr>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<td class="hd" width="80"><label>顺序<em>*</em></label></td>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<td class="bd" width="auto">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<ui:textfield id="ord" name="ord" width="300px"/>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</td>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</tr>&ndash;%&gt;--%>
                    <%--<tr>--%>
                        <%--<td class="hd" width="80"><label>样式</label></td>--%>
                        <%--<td class="bd" width="auto">--%>
                            <%--<ui:textfield id="style" name="style" width="300px"/>--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td class="hd" width="80"><label>描述</label></td>--%>
                        <%--<td class="bd" width="auto">--%>
                            <%--<ui:textarea id="description2" name="description2" rows="5" width="300px"/>--%>
                        <%--</td>--%>
                    <%--</tr>--%>

                    <%--<tr class="btn-bar">--%>
                        <%--<td class="hd"></td>--%>
                        <%--<td class="bd">--%>
                            <%--<ui:button text="保存并新建" id="add">--%>
                                <%--<event:onclick>--%>
                                    <%--if($("#addmenuform").stk_checkForm())--%>
                                    <%--{--%>
                                    <%--$("#addmenuform").stk_submit(function(result){--%>
                                    <%--&lt;%&ndash;$("#addmenuform").stk_reset();&ndash;%&gt;--%>
                                    <%--$("#menuname").stk_val("");--%>
                                    <%--$("#functionId").stk_val("");--%>
                                    <%--$("#ord").stk_val("");--%>
                                    <%--$("#description2").stk_val("");--%>
                                    <%--$("#url").stk_val("");--%>
                                    <%--$("#style").stk_val("");--%>
                                    <%--$("#addmenuWindow").stk_hide();--%>
                                    <%--$("#menuTable").stk_query();--%>
                                    <%--$("#industryTree").stk_refresh($("#qparentid").stk_val())--%>

                                    <%--$("#objid").stk_val("0");--%>
                                    <%--$("#addmenuWindow").stk_show();--%>
                                    <%--});--%>
                                    <%--}--%>
                                <%--</event:onclick>--%>
                            <%--</ui:button>--%>
                            <%--<ui:button text="保存并关闭">--%>
                                <%--<event:onclick>--%>
                                    <%--var menuselect = $("#menuselect").stk_val();--%>
                                    <%--if($("#addmenuform").stk_checkForm())--%>
                                    <%--{--%>
                                    <%--$("#addmenuform").stk_submit(function(result){--%>
                                    <%--&lt;%&ndash;$("#addmenuform").stk_reset();&ndash;%&gt;--%>
                                    <%--$("#menuname").stk_val("");--%>
                                    <%--$("#functionId").stk_val("");--%>
                                    <%--$("#ord").stk_val("");--%>
                                    <%--$("#style").stk_val("");--%>
                                    <%--$("#description2").stk_val("");--%>
                                    <%--$("#addmenuWindow").stk_hide();--%>
                                    <%--$("#menuTable").stk_query();--%>
                                    <%--$("#industryTree").stk_refresh($("#qparentid").stk_val());--%>
                                    <%--$("#industryTree").stk_refresh(menuselect);--%>
                                    <%--});--%>
                                    <%--}--%>
                                <%--</event:onclick>--%>
                            <%--</ui:button>--%>

                            <%--<ui:button text="关闭">--%>
                                <%--<event:onclick>--%>
                                    <%--&lt;%&ndash;$("#addmenuform").stk_reset();&ndash;%&gt;--%>
                                    <%--$("#menuname").stk_val("");--%>
                                    <%--$("#functionId").stk_val("");--%>
                                    <%--$("#ord").stk_val("");--%>
                                    <%--$("#style").stk_val("");--%>
                                    <%--$("#description2").stk_val("");--%>
                                    <%--$("#addmenuWindow").stk_hide();--%>
                                <%--</event:onclick>--%>
                            <%--</ui:button>--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                <%--</table>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<func:checkers>--%>
            <%--<func:checker target="menuname" allowBlank="false" blankText="请输入名称"/>--%>
            <%--&lt;%&ndash;<func:checker target="ord" regex="^[0-9]*$" regexText="顺序必须为数字" allowBlank="false" blankText="请输入顺序"/>&ndash;%&gt;--%>
        <%--</func:checkers>--%>
    <%--</ui:form>--%>
<%--</layout:window>--%>




<%--<ui:form id="setOrdForm" clazz="com.sinitek.managerframework.menu.action.MenuAction">--%>
    <%--<input type="hidden" id="oparentid" name="oparentid" value="">--%>
    <%--<input type="hidden" id="oobjid" name="oobjid" value="">--%>
    <%--<input type="hidden" id="oord" name="oord" value="">--%>
    <%--<input type="hidden" id="uptype" name="uptype" value="">--%>
    <%--&lt;%&ndash;当前rownum&ndash;%&gt;--%>
    <%--<input type="hidden" id="current_rownum" name="current_rownum" value="">--%>
    <%--&lt;%&ndash;菜单排序字符&ndash;%&gt;--%>
    <%--<input type="hidden" id="menu_orders" name="menu_orders" value="">--%>
<%--</ui:form>--%>

<%--&lt;%&ndash;菜单导入&ndash;%&gt;--%>
<%--<layout:window id="importmenuwindow" width="450px" cellUnderLine="true" cellMarginBottom="1px" title="菜单导入">--%>
<%--<ui:form id='importmenuform' clazz="com.sinitek.sirm.org.web.MenuImportAction" method="importExcel"--%>
<%--allowFileUpload="true">--%>
<%--<table width="100%" class="stk-form-ui-st1">--%>
<%--<tr>--%>
<%--<td class="bd" nowrap="nowrap" colspan="2" style="color:#ff0000">--%>
<%--<label style="color:#ff0000;">注：菜单ID为空、菜单名称为空，将不作为菜单数据进行导入！</label>--%>
<%--</td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<td class="hd" width="80" nowrap="nowrap">--%>
<%--导入文件--%>
<%--</td>--%>
<%--<td class="bd" width="auto" nowrap="nowrap">--%>
<%--<ui:textfield type="file" name="menufile" id="menufile"/>--%>
<%--</td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<td align="center" nowrap="nowrap" class="bd" width="auto" colspan="2">--%>
<%--新增 <input type="radio" name="importmode" value="new" checked="checked"/>--%>
<%--覆盖<input type="radio" name="importmode" value="cover" onclick="showconfirm()"/>--%>
<%--</td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<td align="center" nowrap="nowrap" class="bd" width="auto" colspan="2">--%>
<%--<ui:button text="确定">--%>
<%--<event:onclick>--%>
<%--if(modechoice()){--%>
<%--$("#importmenuform").stk_submit(function(result){--%>
<%--stk.info(result);--%>
<%--if('导入成功' == result){--%>
<%--$("#importmenuwindow").stk_hide();--%>
<%--}--%>
<%--});--%>
<%--}--%>
<%--</event:onclick>--%>
<%--</ui:button>--%>
<%--<ui:button text="关闭">--%>
<%--<event:onclick>--%>
<%--$("#importmenuwindow").stk_hide();--%>
<%--</event:onclick>--%>
<%--</ui:button>--%>
<%--</td>--%>
<%--</tr>--%>
<%--</table>--%>
<%--</ui:form>--%>
<%--</layout:window>--%>
<%--</sirm:body>--%>
<%--</html>--%>