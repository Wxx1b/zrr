<%--
  File Desc:      
  Product Name: SIRM
  Module Name: indicator
  Author:      潘虹
  History:     11-9-21 created by 潘虹
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/orgincludes.jsp" %>
<html>
<head><title>添加部门下员工</title>
    <script type="text/javascript">
        function submitForm(index) {
            if (index == "1" || index == "2") {
                if ($("#employeeForm").stk_checkForm()) {
                    if ($("#usershidden").stk_val() != '') {
                        $("#employeeForm").stk_submit(function(result) {
                            if (result != "") {
                                stk.alert(result);
                            } else {
                                if (index == "1") {
                                    $("#employeeForm").stk_reset();
                                    $("#users").stk_html("");
                                    $("#usershidden").stk_val("");
                                } else {
                                    window.location.href = sirm.jsurl('/org/orgstructure.jsp?orgid=' +${param.orgid});
                                }
                            }
                        });
                    } else {
                        stk.alert("请选择人员");
                    }
                }
            } else if (index == "3") {
                window.location.href = sirm.jsurl('/org/orgstructure.jsp?orgid=' +${param.orgid});
            }

        }
    </script>
</head>
<sirm:body>
    <layout:window id="addemployeeWindow" width="540px" cellUnderLine="true" cellMarginBottom="1px" feature="labelBg"
                   title="新增员工">
<ui:form id="employeeForm" clazz="com.sinitek.managerframework.org.action.EmployeeFormAction" method="saveEmployeeInfo">
    <div class="stk-form-ui-st1">
        <table>
            <tr>
                <td class="hd" width="80"><label>下级岗位</label><em>*</em></td>
                <td class="bd" width="auto"><org:position unitid="${param.orgid}" positionlists="positionlist"/>
                    <ui:select list="#attr.positionlist" id="pid" name="pid" headerValue="--请选择--" headerKey=""/></td>
            </tr>
            <tr>
                <td class="hd" width="80"><label>员工列表</label><em>*</em></td>
                <td class="bd" width="400">
                    <ui:button text="选择人员">
                        <event:onclick>
                            show('user','users','usershidden','wwww','true');
                        </event:onclick>
                    </ui:button>
                    <div style="width:400px;height:78px; overflow-y:scroll;">

                    <div id="users" style="width:99%;height:1px"></div>
                    <input id="usershidden" name="usershidden" type="hidden"/></div></td>
            </tr>
            <tr class="btn-bar">
                <td class="hd"></td>
                <td class="bd">
                    <ui:button text="保存并新增">
                        <event:onclick>
                            submitForm("1");
                        </event:onclick>
                    </ui:button>
                    <ui:button text="保存并返回">
                        <event:onclick>
                            submitForm("2");
                        </event:onclick>
                    </ui:button>
                    <ui:button text="返回">
                        <event:onclick>
                            submitForm("3");
                        </event:onclick>
                    </ui:button>
                </td>
            </tr>
        </table>
    </div>
    <func:checkers>
        <func:checker target="pid" allowBlank="false" blankText="请选择岗位名称"/>
    </func:checkers>
</ui:form>
</layout:window>
<%--<%@include file="searchorg/selectorginclude.jsp" %>--%>
</sirm:body>
</html>