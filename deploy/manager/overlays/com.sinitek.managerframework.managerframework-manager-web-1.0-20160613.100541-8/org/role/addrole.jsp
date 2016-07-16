<%--
  File Desc:      
  Product Name: SIRM
  Module Name: org
  Author:      潘虹
  History:     11-7-25 created by 潘虹
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/orgincludes.jsp" %>
<html>
<head><title>新增角色页面</title>
    <script type="text/javascript">
        function saveRole() {
            if ($("#roleForm").stk_checkForm()) {
                $("#roleForm").stk_submit(function(result) {
                    var strP = /^\d+$/;
                    if (result != "") {
                        if (!strP.test(result))
                            stk.alert(result);
                        else
                                <%--window.location = "${contextPath}/org/role/configrole.jsp?roleid=" + result + "&type=0";--%>
                            window.location = sirm.jsurl("/org/role/configemployee.jsp?roleid=" + result + "&type=0");
                    }
                });
            }
        }

        /**
         *验证角色描述不得为空
         */
        function checkLength() {
            if ($("#roledec").stk_text() != "") {
                if ($("#roledec").stk_text().length > 200) {
                    return "角色描述的长度不得大于200";
                }
            }
            return  true;
        }
    </script>
</head>
<sirm:body>
<ui:form id="roleForm" clazz="com.sinitek.managerframework.org.action.RoleFormAction" method="saveRole">
    <input type="hidden" id="type" name="type" value="0"/>
    当前位置：角色管理 >> 新增角色
    <div style="width:510px">
        <div>
            <table class="stk-form-ui-st1">
                <tr>
                    <td class="hd" width="80">角色名称<em>*</em></td>
                    <td class="bd" width="auto"><ui:textfield width="80%" id="rolename" name="rolename"/></td>
                </tr>
                <tr>
                    <td class="hd" width="80">角色描述</td>
                    <td class="bd" width="auto"><ui:textarea rows="10" width="80%" id="roledec" name="roledec"/></td>
                </tr>
                <tr class="btn-bar">
                    <td class="hd"></td>
                    <td class="bd">
                        <ui:button id="" text="提交">
                            <event:onclick>
                                saveRole();
                            </event:onclick>
                        </ui:button>
                        <ui:button text="返回">
                            <event:onclick>
                                window.location = sirm.jsurl("/org/role/listrole.jsp");
                            </event:onclick>
                        </ui:button>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <func:checkers>
        <func:checker target="rolename" allowBlank="false" blankText="请输入角色名称" maxLength="40" maxLengthText="角色名称不能超过40字"/>
        <func:checker target="roledec" validator="checkLength()"/>
    </func:checkers>
</ui:form>
</sirm:body>
</html>