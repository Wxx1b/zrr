<%--
  File Desc:      
  Product Name: SIRM
  Module Name: indicator
  Author:      潘虹
  History:     11-6-21 created by 潘虹
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/orgincludes.jsp" %>
<%--<sirm:page clazz="com.sinitek.sirm.web.routine.TemplateMessageAction" method="loadMessTemplateInfo"></sirm:page>--%>
<html>
<head><title>个人信息</title>
</head>
<script type="text/javascript">
    function showMessTemplate(tempid){
        $(document).stk_go("${path}" + "/routine/viewmessagetemplate.jsp"+ "?upid="+tempid, "邮件模板详细", {keyWithoutParams : true,refresh : true});
    }
//    $(function(){
//        $("#templatetab").unbind().bind('click', function() {
//            stk.call({
//                className:"com.sinitek.sirm.web.routine.TemplateMessageAction",
//                method:'findMessageTemplate',
//                callBack:function(result) {
//                    if(result!=null){
//                        stk.alert(result);
//                    }
//                },
//                exceptionHandler:function(message, e) {
//                    stk.error(message)
//                }
//            });
//        });
//    });

</script>
<sirm:body>
<script type="text/javascript" src="${contextPath}/scripts/org/updateemployee.js">
</script>
<layout:tabs id="usertabs" width="100%">
    <layout:tab id="userinfotab" title="个人基本信息">
<ui:form id="employeeForm" clazz="com.sinitek.managerframework.org.action.EmployeeFormAction" method="updateEmployeeInfo">
    <input type="hidden" id="type" name="type"/>

    <div style="width:1000px">
        <div style="float:left;width:700px;">
            <table width="100%" border="0" cellpadding="1" cellspacing="0" class="stk-form-ui-st1">
                <tr>
                    <td class="hd" width="80">登录名</td>
                    <td class="bd" width="auto" colspan="3"><label id="username"></label></td>
                </tr>
                <tr>
                    <td class="hd" width="80">员工名称</td>
                    <td class="bd" width="auto"><label id="empName"></label></td>
                    <td class="hd" width="80">员工姓名拼音</td>
                    <td class="bd" width="auto"><ui:textfield id="namepy" name="namepy"/></td>
                </tr>
                <tr>
                    <td class="hd" width="80">性别</td>
                    <td class="bd" width="auto"><ui:radioboxgroup columnWidth="30%" columnHeight="20px" name="sex"
                                                                  id="sex"
                                                                  list="#{'1':'男','2':'女'}"
                                                                  defaultValue="1"/>
                    </td>
                    <td class="hd" width="80">电子邮箱</td>
                    <td class="bd" width="auto"><label id="email"></label></td>
                </tr>
                <tr>
                    <td class="hd" width="80">办公电话</td>
                    <td class="bd" width="auto"><ui:textfield id="tel" name="tel"/></td>
                    <td class="hd" width="80">手机</td>
                    <td class="bd" width="auto"><ui:textfield id="mobilephone" name="mobilephone"/></td>
                </tr>
                <tr>
                    <td class="hd" width="80">职位</td>
                    <td class="bd" width="auto"><ui:textfield id="job" name="job"/></td>
                    <td class="hd" width="80">在职状态</td>
                    <td class="bd" width="auto">
                        <label id="inservice"></label>
                    </td>
                </tr>
                <tr>
                    <td class="hd" width="80">入职日期</td>
                    <td class="bd" width="auto"><label id="rzrq"></label></td>
                    <td class="hd" width="80">离职日期</td>
                    <td class="bd" width="auto"><label id="lzrq"></label></td>
                </tr>
                <tr>
                    <td class="hd" width="80">办公电话2</td>
                    <td class="bd" width="auto"><ui:textfield id="tel2" name="tel2"/></td>
                    <td class="hd" width="80">家庭电话1</td>
                    <td class="bd" width="auto"><ui:textfield id="familytelephone" name="familytelephone"/></td>
                </tr>
                <tr>
                    <td class="hd" width="80">手机电话2</td>
                    <td class="bd" width="auto"><ui:textfield id="mobilephone2" name="mobilephone2"/></td>
                    <td class="hd" width="80">家庭电话2</td>
                    <td class="bd" width="auto"><ui:textfield id="familytelephone2" name="familytelephone2"/></td>
                </tr>
                <tr>
                    <td class="hd" width="80">其他电话1</td>
                    <td class="bd" width="auto"><ui:textfield id="otherphone" name="otherphone"/></td>
                    <td class="hd" width="80">其他电话2</td>
                    <td class="bd" width="auto"><ui:textfield id="otherphone2" name="otherphone2"/></td>
                </tr>
                <tr>
                    <td class="hd" width="80">BP机</td>
                    <td class="bd" width="auto"><ui:textfield id="bp" name="bp"/></td>
                    <td class="hd" width="80">办公室</td>
                    <td class="bd" width="auto"><ui:textfield id="office" name="office"/></td>
                </tr>
                <tr>
                    <td class="hd" width="80">公司传真1</td>
                    <td class="bd" width="auto"><ui:textfield id="fax" name="fax"/></td>
                    <td class="hd" width="80">公司传真2</td>
                    <td class="bd" width="auto"><ui:textfield id="fax2" name="fax2"/></td>
                </tr>
                <tr>
                    <td class="hd" width="80">家庭传真1</td>
                    <td class="bd" width="auto"><ui:textfield id="familyfax" name="familyfax"/></td>
                    <td class="hd" width="80">家庭传真2</td>
                    <td class="bd" width="auto"><ui:textfield id="familyfax2" name="familyfax2"/></td>
                </tr>
                <tr>
                    <td class="hd" width="80">公司地址</td>
                    <td class="bd" width="auto"><ui:textfield id="companyaddress" name="companyaddress"/></td>
                    <td class="hd" width="80">家庭地址</td>
                    <td class="bd" width="auto"><ui:textfield id="familyaddress" name="familyaddress"/></td>
                </tr>
                <tr>
                    <td class="hd" width="80">公司邮编</td>
                    <td class="bd" width="auto"><ui:textfield id="companyzip" name="companyzip"/></td>
                    <td class="hd" width="80">家庭邮编</td>
                    <td class="bd" width="auto"><ui:textfield id="familyzip" name="familyzip"/></td>
                </tr>
                <tr>
                    <td class="hd" width="80">其他地址</td>
                    <td class="bd" width="auto"><ui:textfield id="otheraddress" name="otheraddress"/></td>
                    <td class="hd" width="80">其他邮编</td>
                    <td class="bd" width="auto"><ui:textfield id="otherzip" name="otherzip"/></td>
                </tr>
                <tr>
                    <td class="hd" width="80">其他Email 1</td>
                    <td class="bd" width="auto"><ui:textfield id="email1" name="email1"/></td>
                    <td class="hd" width="80">其他Email 2</td>
                    <td class="bd" width="auto"><ui:textfield id="email2" name="email2"/></td>
                </tr>
                <tr>
                    <td class="hd" width="80">主页</td>
                    <td class="bd" width="auto"><ui:textfield id="homepage" name="homepage"/></td>
                    <td class="hd" width="80">QQ</td>
                    <td class="bd" width="auto"><ui:textfield id="qq" name="qq"/></td>
                </tr>
                <tr>
                    <td class="hd" width="80">MSN</td>
                    <td class="bd" width="auto"><ui:textfield id="msn" name="msn"/></td>
                    <td class="hd" width="80">工作地</td>
                    <td class="bd" width="auto"><ui:select id="where" name="where"
                                                           list="#{'0':'--请选择--','1':'上海','2':'北京','3':'深圳'}"
                                                           defaultValue="0" width="130px"/></td>
                </tr>
                <tr>
                    <td class="hd" width="80">通讯录</td>
                    <td class="bd" width="auto" colspan="3"><ui:textfield id="addressbook" name="addressbook"/></td>
                </tr>
                <tr>
                    <td class="hd" width="80">个人简介</td>
                    <td class="bd" width="auto" colspan="3"><ui:textarea width="500px" rows="5" id="introduction"
                                                                         name="introduction"/></td>
                </tr>
                <%--<tr>
                    <td colspan="4">
                        <input type="hidden" id="orgid" name="orgid" value="${currentUser.orgId}"/>
                        <plugin:colRowNum id="rowNumPlugin"/>
                        <ui:table id="qualifyTable" queryForm="employeeForm"
                                  actionClass="com.sinitek.sirm.org.web.QualifyTableAction">
                            <ui:col plugin="rowNumPlugin" width="30px"/>
                            <ui:colCust method="getQualifyType" property="qualifytype" align="left" title="资质类型"
                                        width="150px"/>
                            <ui:colCust method="getQualifyLev" property="lev" title="资质等级" width="80px"/>
                            <ui:col property="qualifyno" align="left" title="证照编号" width="100px" allowTip="true"/>
                            <ui:col property="issuingunit" align="left" title="发证单位" width="100%" allowTip="true"/>
                            <ui:col property="issuingdate" title="发证日期" width="80px"/>
                            <ui:col property="endtime" title="有效期" width="80px"/>
                            <ui:col property="failuredate" title="失效日期" width="80px"/>
                        </ui:table>
                    </td>
                </tr>--%>
             </table>
            <table width="450px">
                <tr class="btn-bar">
                    <td class="hd"></td>
                    <td class="bd" align="center">
                        <ui:button text="保存">
                            <event:onclick>
                                $("#type").stk_val("1");
                                $("#employeeForm").stk_submit(function(result){
                                if(result!=""){
                                stk.alert(result);
                                }
                                });
                            </event:onclick>
                        </ui:button>
                    </td>
                </tr>
            </table>
        </div>
        <div style="float:left;width:200px;height:220px;margin-left:15px;">
            <table align="center" border="0">
                <tr>
                    <td width="180px" height="180px" id="photo">
                        <jsp:include page="includes/photoupload.jsp"></jsp:include>
                    </td>
                </tr>
            </table>
        </div>
        <div style="float:left;width:200px;height:220px;margin-left:15px;margin-top: 30px">
            <table align="center" border="0">
                <tr>
                    <td width="120px" height="55px" id="signphoto">
                        <jsp:include page="includes/signphotoupload.jsp"></jsp:include>
                    </td>
                </tr>
            </table>
        </div>
    </div>

</ui:form>
    </layout:tab>
    <%--<layout:tab id="templatetab" title="消息订阅设置">
        <ui:form id="templateform" clazz="com.sinitek.managerframework.org.action.EmployeeFormAction" method="addUserTemplate">
        <div style="width:500px">
            <div>
                <table class="stk-form-ui-st1">
                    <tr>
                        <td class="hd" width="80" valign="top"><label>消息模板</label></td>
                        <td class="bd" width="auto">
                            <table>
                                <c:forEach items="${templates}" var="template">
                                    <tr>
                                    <c:set var="tempValue" value="${values}"/>
                                    <c:set var="tempKey" value=",${template.key},"/>
                                        <c:if test="${ not fn:contains(tempValue, tempKey)}">
                                            <td width="250px;" height="30px"><a href="#"
                                                                                onclick="showMessTemplate('${template.key}')"><label>${template.value}</label></a></td>
                                            <td width="60px;" height="30px"> <input type="checkbox"  name="templates" value="${template.key}" checked="checked" ></td>
                                        </c:if>
                                        <c:if test="${fn:contains(tempValue, tempKey)}">
                                            <td width="250px;" height="30px"><a href="#"
                                                                                onclick="showMessTemplate('${template.key}')"><label>${template.value}</label></a></td>
                                            <td width="60px;" height="30px"> <input type="checkbox"  name="templates" value="${template.key}"></td>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                            </table>

                        </td>
                    </tr>
                </table>
            </div>
        </div>
            <table width="480px">
                <tr class="btn-bar">
                    <td class="hd"></td>
                    <td class="bd" align="center">
                        <ui:button text="保存">
                            <event:onclick>
                                $("#templateform").stk_submit(function(result){
                                if(result!=""){
                                stk.alert(result);
                                }
                                });
                            </event:onclick>
                        </ui:button>

                    </td>
                </tr>
            </table>
        </ui:form>
    </layout:tab>--%>
    </layout:tabs>


<!--修改密码窗口-->
<layout:window id="passWindow" width="500px">
<ui:form id="userForm" clazz="com.sinitek.managerframework.org.action.UserFormAction" method="updatePassword">
<input type="hidden" id="updateuserid" name="userid">
<input type="hidden" id="passtype" name="passtype" value="1"/>

<div style="width:510px">
    <div>
        <table class="stk-form-ui-st1">
            <tr>
                <td class="hd" width="80">原始密码<em>*</em></td>
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
                            if($("#userForm").stk_checkForm())
                            {
                            $("#userForm").stk_submit(function(result){
                            if(result!=""){
                            stk.alert(result);
                            }else{
                            $("#passWindow").stk_hide();
                            }
                            });
                            }
                        </event:onclick>
                    </ui:button>
                    <ui:button text="关闭">
                        <event:onclick>
                            $("#passWindow").stk_hide();
                        </event:onclick>
                    </ui:button>
                </td>
            </tr>
        </table>
    </div>
    <func:checkers>
        <func:checker target="updatePassword" allowBlank="false" blankText="请输入原始密码"/>
        <func:checker target="updateNewPassword" allowBlank="false" blankText="请输入新密码"/>
        <func:checker target="updatePasswordTwo" validator="sirm.org.updatepw()" allowBlank="false"
                      blankText="请输入确认新密码"/>
    </func:checkers>
    </ui:form>
    </layout:window>
    </sirm:body>
    <script>
        setInterval("updateUploadBtn()", 500);
        function updateUploadBtn() {
            $($("#uploader-photouploader").children()[1]).find("a").html("<b class=\"icon-add\"/>上传头像");
            $($("#uploader-photouploader").children()[2]).stk_hide();
            $($("#uploader-photouploader2").children()[1]).find("a").html("<b class=\"icon-add\"/>上传签名图象");
            $($("#uploader-photouploader2").children()[2]).stk_hide();
        }
    </script>
</html>