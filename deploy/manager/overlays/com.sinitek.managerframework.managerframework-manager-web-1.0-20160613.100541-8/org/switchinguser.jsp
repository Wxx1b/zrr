<%--
  Created by IntelliJ IDEA.
  User: sinitek
  Date: 12-9-5
  Time: 上午10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/org/includes/orgincludes.jsp" %>
<html>
<head>
    <title>切换用户</title>
    <script type="text/javascript">
        function submitSwitchingUser() {
            if ($("#switchingUserForm").stk_checkForm()) {
                $("#switchingUserForm")[0].submit();
            }
        }
    </script>
</head>
<sirm:body>
    <ui:form id="switchingUserForm" action="${contextPath}/service/org/switchinguser.action" actionMethod="post">
        <c:if test="${result==1}">
            <p style="color: red" id="msg"><em>密码错误</em></p>
        </c:if>
        <div style="width:700px">
            <table width="100%" border="0" cellpadding="1" cellspacing="0" class="stk-form-ui-st1">
                <tr>
                    <td class="hd" width="80">登录名<em>*</em></td>
                    <td class="bd" width="auto">
                        <input type="hidden" id="user" name="user"/>
                        <org:SelectOrg prefix="user" mode="ORG" hiddenId="user"/>
                    </td>
                </tr>
                <tr>
                    <td class="hd" width="80">密码<em>*</em></td>
                    <td class="bd" width="auto">
                        <ui:textfield id="pwd" name="pwd" type="password"/>
                    </td>
                </tr>
                <tr>
                    <td class="bd" width="auto" colspan="2">
                        <ui:button text="切换">
                            <event:onclick>
                                submitSwitchingUser();
                            </event:onclick>
                        </ui:button>
                    </td>
                </tr>
            </table>
            <func:checkers>
                <func:checker target="user" allowBlank="false" blankText="请选择需要切换的用户"/>
                <func:checker target="pwd" allowBlank="false" blankText="请输入密码"/>
            </func:checkers>
        </div>
    </ui:form>
</sirm:body>
</html>