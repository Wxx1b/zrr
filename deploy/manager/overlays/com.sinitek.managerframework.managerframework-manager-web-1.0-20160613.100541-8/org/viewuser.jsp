<%--
  Created by IntelliJ IDEA.
  User: 潘虹
  Date: 12-1-17
  Time: 下午5:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/orgincludes.jsp" %>
<html>
<head><title>用户详细信息</title>
    <script type="text/javascript">
        (function () {
            sirm.define('sirm.org', {
                contextPath:'${contextPath}',
                orgid:'${param.orgid}'
            });
        })();
    </script>
    <script src="${contextPath}/scripts/org/viewuser.js"></script>
</head>
<sirm:body>
<ui:form id="userInfoForm" clazz="com.sinitek.managerframework.org.action.UserFormAction" method="updateUserInfo">
    <input type="hidden" id="orgid"/>
    <div style="width:700px;float:left;">
        <div>
            <table class="stk-form-ui-st1">
                <tr>
                    <td class="hd" width="80">登录名</td>
                    <td class="bd" width="auto" colspan="3">
                        <label id="labusername"></label>
                    </td>
                </tr>
                <tr>
                    <td class="hd" width="80">员工名称</td>
                    <td class="bd" width="auto">
                        <label id="labcname"></label>
                    </td>
                    <td class="hd" width="80">员工姓名拼音</td>
                    <td class="bd" width="auto">
                        <label id="labnamepy"></label>
                    </td>
                </tr>
                <tr>
                    <td class="hd" width="80">性别</td>
                    <td class="bd" width="auto">
                        <label id="labsex"></label>
                    </td>
                    <td class="hd" width="80">Email</td>
                    <td class="bd" width="auto">
                        <label id="labemail"></label>
                    </td>
                </tr>
                <tr>
                    <td class="hd" width="80">办公电话</td>
                    <td class="bd" width="auto">
                        <label id="labtel"></label>
                    </td>
                    <td class="hd" width="80">手机</td>
                    <td class="bd" width="auto">
                        <label id="labmobilephone"></label>
                    </td>
                </tr>
                <tr>
                    <td class="hd" width="80">职位</td>
                    <td class="bd" width="auto">
                        <label id="labjob"></label>
                    </td>
                    <td class="hd" width="80">在职状态</td>
                    <td class="bd" width="auto">
                        <label id="labinservice"></label>
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
                    <td class="bd" width="auto"><label id="labtel2"></label></td>
                    <td class="hd" width="80">家庭电话1</td>
                    <td class="bd" width="auto"><label id="labfamilytelephone"></label></td>
                </tr>
                <tr>
                    <td class="hd" width="80">手机电话2</td>
                    <td class="bd" width="auto"><label id="labmobilephone2"></label></td>
                    <td class="hd" width="80">家庭电话2</td>
                    <td class="bd" width="auto"><label id="labfamilytelephone2"></label></td>
                </tr>
                <tr>
                    <td class="hd" width="80">其他电话1</td>
                    <td class="bd" width="auto"><label id="labotherphone"></label></td>
                    <td class="hd" width="80">其他电话2</td>
                    <td class="bd" width="auto"><label id="labotherphone2"></label></td>
                </tr>
                <tr>
                    <td class="hd" width="80">BP机</td>
                    <td class="bd" width="auto"><label id="labbp"></label></td>
                    <td class="hd" width="80">办公室</td>
                    <td class="bd" width="auto"><label id="laboffice"></label></td>
                </tr>
                <tr>
                    <td class="hd" width="80">公司传真1</td>
                    <td class="bd" width="auto"><label id="labfax"></label></td>
                    <td class="hd" width="80">公司传真2</td>
                    <td class="bd" width="auto"><label id="labfax2"></label></td>
                </tr>
                <tr>
                    <td class="hd" width="80">家庭传真1</td>
                    <td class="bd" width="auto"><label id="labfamilyfax"></label></td>
                    <td class="hd" width="80">家庭传真2</td>
                    <td class="bd" width="auto"><label id="labfamilyfax2"></label></td>
                </tr>
                <tr>
                    <td class="hd" width="80">公司地址</td>
                    <td class="bd" width="auto"><label id="labcompanyaddress"></label></td>
                    <td class="hd" width="80">家庭地址</td>
                    <td class="bd" width="auto"><label id="labfamilyaddress"></label></td>
                </tr>
                <tr>
                    <td class="hd" width="80">公司邮编</td>
                    <td class="bd" width="auto"><label id="labcompanyzip"></label></td>
                    <td class="hd" width="80">家庭邮编</td>
                    <td class="bd" width="auto"><label id="labfamilyzip"></label></td>
                </tr>
                <tr>
                    <td class="hd" width="80">其他地址</td>
                    <td class="bd" width="auto"><label id="labotheraddress"></label></td>
                    <td class="hd" width="80">其他邮编</td>
                    <td class="bd" width="auto"><label id="labotherzip"></label></td>
                </tr>
                <tr>
                    <td class="hd" width="80">其他Email 1</td>
                    <td class="bd" width="auto"><label id="labemail1"></label></td>
                    <td class="hd" width="80">其他Email 2</td>
                    <td class="bd" width="auto"><label id="labemail2"></label></td>
                </tr>
                <tr>
                    <td class="hd" width="80">主页</td>
                    <td class="bd" width="auto"><label id="labhomepage"></label></td>
                    <td class="hd" width="80">QQ</td>
                    <td class="bd" width="auto"><label id="labqq"></label></td>
                </tr>
                <tr>
                    <td class="hd" width="80">MSN</td>
                    <td class="bd" width="auto"><label id="labmsn"></label></td>
                    <td class="hd" width="80">工作地</td>
                    <td class="bd" width="auto">
                        <label id="labwhere"></label></td>
                </tr>
                <%--<tr>--%>
                    <%--<td class="hd" width="80">andriod终端号</td>--%>
                    <%--<td class="bd" width="auto"><label id="terminalid"></label></td>--%>
                    <%--<td class="hd" width="80">iphone终端号</td>--%>
                    <%--<td class="bd" width="auto"><label id="terminalid1"></label></td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                    <%--<td class="hd" width="80">ipad终端号</td>--%>
                    <%--<td class="bd" width="auto"><label id="terminalid2"></label></td>--%>
                <%--</tr>--%>
                <tr>
                    <td class="hd" width="80">通讯录</td>
                    <td class="bd" width="auto"><label id="labaddressbook"></label></td>
                    <td class="hd" width="80">小组</td>
                    <td class="bd" width="auto"><div id="infoTeamDiv" class="phone-result-table"></div></td>
                </tr>
                <tr>
                    <td class="hd" width="80">角色</td>
                    <td class="bd" width="auto">
                        <div id="infoRoleDiv" class="phone-result-table"></div>
                    </td>
                    <td class="hd" width="80">岗位</td>
                    <td class="bd" width="auto">
                        <div id="infoPostDiv" class="phone-result-table"></div>
                    </td>
                </tr>
                <tr>
                    <td class="hd" width="80">个人简介</td>
                    <td class="bd" width="auto" colspan="3">
                        <label id="labintroduction"></label>
                    </td>
                </tr>
                <%--<tr>
                    <td colspan="4">
                        <plugin:colRowNum id="rowNumPlugin"/>
                        <ui:table id="qualifyTable" queryForm="userInfoForm"
                                  actionClass="com.sinitek.sirm.org.web.QualifyTableAction">
                            <ui:col plugin="rowNumPlugin" width="30px"/>
                            <ui:colCust method="getQualifyType" property="qualifytype" align="left" title="资质类型"
                                        width="150px"/>
                            <ui:colCust method="getQualifyLev" property="lev" title="资质等级" width="60px"/>
                            <ui:col property="qualifyno" align="left" title="证照编号" width="100px" allowTip="true"/>
                            <ui:col property="issuingunit" align="left" title="发证单位" width="100%" allowTip="true"/>
                            <ui:col property="issuingdate" title="发证日期" width="80px"/>
                            <ui:col property="endtime" title="有效期" width="80px"/>
                            <ui:col property="failuredate" title="失效日期" width="80px"/>
                        </ui:table>
                    </td>
                </tr>--%>
                <tr class="btn-bar">
                    <td class="bd" align="center" colspan="4">
                        <ui:button text="关闭">
                            <event:onclick>
                                sirm.use('sirm.org', function(org) {
                                org.closeTab();
                                });
                            </event:onclick>
                        </ui:button>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div style="width:200px;float:left;text-align:center;">
        <div>
            <img src="${contextPath}/org/photo/userphotoinfo.action?orgid=${param.orgid}&param=0" height="180px" width="180px" id="userphoto" name="userphoto">
        </div>
        <div style="margin-top: 30px">
            <img src="${contextPath}/org/photo/userphotoinfo.action?orgid=${param.orgid}&param=1" height="55px" width="120px" id="usersignphoto" name="usersignphoto">
        </div>
    </div>
</ui:form>
</sirm:body>
</html>