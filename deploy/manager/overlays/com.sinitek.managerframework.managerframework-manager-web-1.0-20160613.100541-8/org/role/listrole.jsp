<%--
  File Desc:
  Product Name: SIRM
  Module Name: org
  Author:      潘虹
  History:     11-7-25 created by 潘虹
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/commonincludes.jsp" %>
<html>
<head>
    <title>角色管理</title>
    <script type="text/javascript">
        function editEmpConfig(treeId, treeNode) {
            stk.call({
                className: "com.sinitek.managerframework.org.action.RoleTableAction",
                method: 'updateRole',
                param: {roleid:treeNode.objid},
                async: false,
                callBack: function (result) {
                    var json = $.parseJSON(result);
                    $("#roleid_window").stk_val(json.roleid);
                    $("#rolename").stk_val(json.rolename);
                    $("#roledec").stk_val(json.roledec);
                    $("#updateWindow").stk_show({title:'修改角色'});
                },
                exceptionHandler: function (message, e) {
                    stk.error(message)
                }
            });
        }
    </script>
</head>
<sirm:body>
    <jsp:include page="/common/include/treemenu.jsp">
        <jsp:param name="page" value="${contextPath}/org/role/distributerole.jsp"/>
        <jsp:param name="clazz" value="com.sinitek.managerframework.org.action.RoleNodeAction"/>
        <jsp:param name="onEditButtonClick" value="editEmpConfig"/>
        <jsp:param name="maxlevel" value="-1"/>
        <jsp:param name="rootid" value="0"/>
    </jsp:include>

    <layout:window id="updateWindow">
        <ui:form id="roleForm_window" clazz="com.sinitek.managerframework.org.action.RoleFormAction" method="saveRole">
            <input type="hidden" id="type_window" name="type" value="1"/>
            <input type="hidden" id="roleid_window" name="roleid"/>

            <div style="width:510px">
                <table class="stk-form-ui-st1">
                    <tr>
                        <td class="hd" width="80">角色名称<em>*</em></td>
                        <td class="bd" width="auto"><ui:textfield width="90%" id="rolename" name="rolename" maxLength="50"/></td>
                    </tr>
                    <tr>
                        <td class="hd" width="80">角色描述</td>
                        <td class="bd" width="auto"><ui:textarea rows="10" width="90%" id="roledec" name="roledec"/></td>
                    </tr>
                    <tr class="btn-bar">
                        <td class="hd"></td>
                        <td class="bd">
                            <ui:button id="" text="提交">
                                <event:onclick>
                                    if ($("#roleForm_window").stk_checkForm()) {
                                    $("#roleForm_window").stk_submit(function(result) {
                                    if (result != "")
                                    stk.alert(result);
                                    else{
                                    $("#roleForm_window").stk_reset();
                                    $("#updateWindow").stk_hide();
                                    $("#roleTable").stk_query();
                                    reLoadTree();
                                    }
                                    });
                                    }
                                </event:onclick>
                            </ui:button>
                            <ui:button text="关闭">
                                <event:onclick>
                                    $("#updateWindow").stk_hide();
                                </event:onclick>
                            </ui:button>
                        </td>
                    </tr>
                </table>
            </div>
            <func:checkers>
                <func:checker target="rolename" allowBlank="false" blankText="请输入角色名称"  maxLength="40" maxLengthText="角色名称不能超过40字"/>
                <func:checker target="roledec" validator="checkLength()"/>
            </func:checkers>
        </ui:form>
    </layout:window>
</sirm:body>
</html>