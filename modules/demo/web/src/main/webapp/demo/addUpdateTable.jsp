<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/12/14
  Time: 21:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/framework/include/head.jsp" %>
<html>
<head>
    <title></title>
    <%@ include file="/framework/include/innerHead.jsp" %>
    <script type="text/javascript">
        function showAddWindow() {
            var form = $("#addUpdateForm");
            form.stk_reset();
            form.find("input[name='type']").stk_val("0");
            $("#addUpdateWindow").stk_show();
        }
        function showUpdateWindow(data) {
            var form = $("#addUpdateForm");
            form.stk_reset();
            form.find("input[name='type']").stk_val("1");
            form.find("input[name='objid']").stk_val(data.objid);
            $("#name_update").stk_val(data.name);
            $("#age_update").stk_val(data.age);
            $("#gender_update").stk_val(data.gender);
            $("#income_update").stk_val(data.income);
            $("#addUpdateWindow").stk_show();
        }
        function submitForm() {
            if ($("#addUpdateForm").stk_checkForm()) {
                $("#addUpdateForm").stk_submit(function () {
                    $("#addUpdateWindow").stk_hide();
                    $("#queryTable").stk_query();
                });
            }
        }
    </script>
</head>
<body>

<plugin:colButton id="updateBut" text="修改" dataVar="data">
    showUpdateWindow(data);
</plugin:colButton>
<ui:table id="queryTable" actionClass="com.sinitek.managerdemo.demo.action.DemoAddUpdateTableAction">
    <ui:col property="name" title="姓名"></ui:col>
    <ui:col property="age" title="年龄"></ui:col>
    <ui:colNumber property="income" isMoney="true" pointPlace="2" title="收入"></ui:colNumber>
    <ui:colEnum clazz="com.sinitek.managerdemo.demo.common.enums.GenderEnums" property="gender" title="性别"></ui:colEnum>
    <ui:col plugin="updateBut" title="修改" width="60px"/>
    <layout:tableToolBar position="top">
        <ui:toolbarButton icon="ui-icon-plusthick" text="添加">
            <event:onclick>
                showAddWindow();
            </event:onclick>
        </ui:toolbarButton>
    </layout:tableToolBar>
</ui:table>

<layout:window width="600px" layout="column" id="addUpdateWindow" title="添加/修改">
    <ui:form clazz="com.sinitek.managerdemo.demo.action.DemoAddUpdateTableAction" method="addUpdate"
             id="addUpdateForm">
        <input type="hidden" id="type" name="type">
        <input type="hidden" id="objid" name="objid">
        <table class="stk-form-ui-st1">
            <tr>
                <td class="hd" width="80"><font color="red">*</font>姓名</td>
                <td class="bd" width="auto"><ui:textfield id="name_update" name="name_update"/></td>
            </tr>
            <tr>
                <td class="hd" width="80">年龄</td>
                <td class="bd" width="auto"><ui:textfield id="age_update" name="age_update"/></td>
            </tr>
            <tr>
                <td class="hd" width="80"><font color="red">*</font>性别</td>
                <td class="bd" width="auto">
                    <param:enumList clazz="com.sinitek.managerdemo.demo.common.enums.GenderEnums" var="GenderEnumList"/>
                    <ui:select list="#attr.GenderEnumList" id="gender_update" name="gender_update" headerKey=""
                               headerValue="--请选择--" listKey="enumItemName" listValue="enumItemInfo"></ui:select>
                </td>
            </tr>
            <tr>
                <td class="hd" width="80">收入</td>
                <td class="bd" width="auto"><ui:textfield id="income_update" name="income_update"/></td>
            </tr>
            <tr class="btn-bar">
                <td class="hd"></td>
                <td class="bd">
                    <ui:button text="提交">
                        <event:onclick>
                            submitForm();
                        </event:onclick>
                    </ui:button>
                    <ui:button type="reset" text="重置"/>
                    <ui:button text="取消">
                        <event:onclick>
                            $("#addUpdateWindow").stk_hide();
                        </event:onclick>
                    </ui:button>
                </td>
            </tr>
        </table>
        <func:checkers>
            <func:checker target="name_update" allowBlank="false" blankText="请输入字符串"/>
            <func:checker target="age_update" allowBlank="false" blankText="请选择枚举"/>
        </func:checkers>
        <event:onkeypress keyCodeVar="code">
            if(code == 13) submitForm();
        </event:onkeypress>
    </ui:form>
</layout:window>
</body>
</html>
