<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 13-9-17
  Time: 上午11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script src="${contextPath}/scripts/org/passwordcheck.js"></script>
<script type="text/javascript" src="${contextPath}/sirm/js/rsa.js"></script>
<%--密码安全策略窗口--%>
<layout:window id="passSecurityWindow" width="350px">
    <event:onwindowclose>
        var passwordwindowtype = $("#passwordwindowtype").stk_val();
        if(passwordwindowtype == 1){
        window.location.href = sirm.jsurl("/logout.action");
        }else{
        $("#passSecurityWindow").stk_hide();
        }
    </event:onwindowclose>
    <ui:form id="passSecurityForm" clazz="com.sinitek.managerframework.org.action.UserFormAction" method="updatePassword">
        <input type="hidden" id="passwordwindowtype" name="passwordwindowtype">
        <input type="hidden" id="updateuserid" name="userid">
        <input type="hidden" id="passtype" name="passtype" value="1"/>

        <div style="width:360px">
            <div>
                <table width="100%">
                    <tr>
                        <td style="width:300px;color: #FF0000;margin: 15px;" id="alertinfo">
                            你的密码已过期,必须成功修改密码后才能正常登录系统
                        </td>
                    </tr>
                </table>
                <table class="stk-form-ui-st1">
                    <tr>
                        <td class="hd" width="80">当前密码<em>*</em></td>
                        <td class="bd" width="auto">
                            <ui:textfield type="password" id="updatePassword" name="password"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="hd" width="80">新密码<em>*</em></td>
                        <td class="bd" width="auto">
                            <ui:textfield type="password" id="updateNewPassword" name="newPassword"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="hd" width="80">确认新密码<em>*</em></td>
                        <td class="bd" width="auto">
                            <ui:textfield type="password" id="updatePasswordTwo" name="passwordTwo"/>
                        </td>
                    </tr>
                    <tr class="btn-bar">
                        <td class="hd"></td>
                        <td class="bd">
                            <ui:button text="保存">
                                <event:onclick>
                                    if($("#passSecurityForm").stk_checkForm())
                                    {
                                        <%--$("#passSecurityWindow").stk_showMask();--%>
                                        stk.call({
                                        className: 'com.sinitek.managerframework.org.action.UserPasswordCheckAction',
                                        method: 'passwordLengthCheck',
                                        param:{'password':rsa($("#updatePassword").stk_val()),
                                                'newPassword':rsa($("#updateNewPassword").stk_val()),
                                                'passwordTwo':rsa($("#updatePasswordTwo").stk_val())},
                                        callBack: function (result) {
                                            if(result != "OK"){
                                                $("#passSecurityWindow").stk_closeMask();
                                                stk.alert(result);
                                            }
                                            else{
                                                <%--提交密码修改信息--%>
                                                $("#passSecurityWindow").stk_showMask();
                                                $("#updatePassword").stk_val(rsa($("#updatePassword").val()));
                                                $("#updateNewPassword").stk_val(rsa($("#updateNewPassword").val()));
                                                $("#updatePasswordTwo").stk_val(rsa($("#updatePasswordTwo").val()));
                                                $("#passSecurityForm").stk_submit(function(result){
                                                    if(result!=""){
                                                        $("#passSecurityWindow").stk_show();
                                                        $("#passSecurityWindow").stk_closeMask();
                                                        stk.alert(result);
                                                    }else{
                                                        stk.info("修改成功,请重新登录！",{"确定": function(){
                                                            window.location = sirm.jsurl("/logout.jsp");
                                                            $("#passSecurityWindow").stk_hide();
                                                        }});
                                                    }
                                                });
                                            }
                                        }
                                    });
                                    }
                                </event:onclick>
                            </ui:button>
                            <ui:button text="关闭" id="passSecurityWindowclose1">
                                <event:onclick>
                                    window.location.href = sirm.jsurl("/logout.action");
                                </event:onclick>
                            </ui:button>
                            <ui:button text="关闭" id="passSecurityWindowclose2">
                                <event:onclick>
                                    $("#passSecurityWindow").stk_hide();
                                </event:onclick>
                            </ui:button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <func:checkers>
            <func:checker target="updatePassword" allowBlank="false" blankText="请输入当前密码"/>
            <func:checker target="updateNewPassword" allowBlank="false" blankText="请输入新密码"/>
            <func:checker target="updatePasswordTwo" allowBlank="false" blankText="请输入确认新密码"/>
        </func:checkers>
    </ui:form>
</layout:window>
<layout:window id="passUpdateWindow" width="300px">
    <table width="100%">
        <tr>
            <td style="height: 60px;text-align: center;">
                <span id="warncontent"></span>,建议您<a href='javascript:updatePassWord();'
                                                     style="text-decoration: underline;"><span style="color: #FF0000">修改密码</span></a>
            </td>
        </tr>
        <tr>
            <td style="text-align: center;margin-bottom: 10px">
                <ui:button text="确定">
                    <event:onclick>
                        $("#passUpdateWindow").stk_hide();
                    </event:onclick>
                </ui:button>
                <br/>
                <br/>
            </td>
        </tr>
    </table>
</layout:window>
<%--密码安全策略窗口--%>