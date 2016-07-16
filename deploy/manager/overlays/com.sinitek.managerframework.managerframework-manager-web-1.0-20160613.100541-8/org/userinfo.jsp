<%@ page import="com.sinitek.managerframework.um.utils.UserCheckUtils" %>
<%@ page import="com.sinitek.managerframework.um.check.UserCheckContext" %>
<%@ page import="com.sinitek.base.common.api.CommonAPIFactory" %>
<%@ page import="com.sinitek.managerframework.setting.common.entity.*" %>
<%@ page import="com.sinitek.managerframework.setting.common.api.ISettingService" %>
<%--
  File Desc:      
  Product Name: SIRM
  Module Name: indicator
  Author:      潘虹
  History:     11-4-26 created by 潘虹
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/orgincludes.jsp" %>
<html>
<head><title>用户管理</title></head>
<sirm:body>
    <%
        //    ISetting crmSetting = CommonServiceFactory.getSettingService().getSetting("COMMON", "SIRM_CRMTYPE");
        ISetting roleSetting = ( ( ISettingService ) CommonAPIFactory.getInstance().getCommonAPI( ISettingService.class ) ).getSetting( "COMMON", "ROLESHOW" );

//    boolean fumdcrm = false;
        boolean roleshow = false;
//    if (crmSetting != null && "fundcrm".equals(crmSetting.getValue())) {
//        fumdcrm = true;
//    }
        if ( roleSetting == null || "true".equals( roleSetting.getValue() ) )
        {
            roleshow = true;
        }
//    request.setAttribute("fumdcrm", fumdcrm);
        request.setAttribute( "roleshow", roleshow );
        UserCheckContext uc = new UserCheckContext();
        uc.setRequest( request );
        uc.setResponse( response );
        boolean result = UserCheckUtils.canChangePassword( uc );
        request.setAttribute( "canChangePassword", result );
    %>
    <script type="text/javascript" src="../scripts/org/userinfo.js">
    </script>
    <script type="text/javascript">
        (function () {
            sirm.define('sirm.org', {
                contextPath: '${contextPath}'
            });
        })();
    </script>
    <ui:form id="queryForm">
        <div class="search-params-bar">
            <table>
                <tr>
                    <td class="tit"><label>员工名称</label></td>
                    <td class="bd"><ui:textfield id="querycname" name="empName"/></td>
                    <td class="tit"><label>在职状态</label></td>
                    <td class="bd"><ui:select id="queryinservice" name="inservice"
                                              list="#{'':'--请选择--','1':'在职','0':'离职'}"/></td>
                    <td class="tit">
                        <ui:button text="选择部门" icon="ui-icon-circle-zoomout">
                            <event:onclick>
                                showunit('unitdiv', 'strutureId');
                            </event:onclick>
                        </ui:button>
                        <label>所选部门</label></td>
                    <td class="bd">
                        <div id="unitdiv"></div>
                        <input id="strutureId" name="strutureId" type="hidden"/>
                            <%--<org:structure structurelists="structurelist"></org:structure>--%>
                            <%--<ui:select list="#attr.structurelist" id="strutureId" name="strutureId" headerValue="--请选择--" headerKey=""></ui:select>--%>
                    </td>
                    <td>
                        <ui:button text="查询" icon="ui-icon-circle-zoomout">
                            <event:onclick>
                                $("#userTable").stk_query();
                            </event:onclick>
                        </ui:button>
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="order" name="order">
    </ui:form>
    <ui:form id="tabForm">
        <plugin:colCheckbox id="checkBoxPlugin" name="check"/>
        <plugin:colRowNum id="rowNumPlugin"/>
        <plugin:colLink id="updateBtn" text="修改" dataVar="data">
            sirm.use('sirm.org', function(org) {
            org.showUpdateWindow(data);
            });
        </plugin:colLink>
        <plugin:colLink id="updatepassBtn" text="重置密码" dataVar="data">
            sirm.use('sirm.org', function(org) {
            org.showPassWindow(data);
            });
        </plugin:colLink>
        <plugin:colLink id="unlockUserBtn" text="解锁" dataVar="data">
            sirm.use('sirm.org', function(org) {
            org.unlockUser(data);
            });
        </plugin:colLink>
        <plugin:colLink id="linkPlugin" dataVar="val">
            sirm.use('sirm.org', function(org) {
            org.showInfoWindow(val);
            });
        </plugin:colLink>

        <c:set var="tableWidth" value="920"/>
        <c:if test="${not roleshow}">
            <c:set var="tableWidth" value="${tableWidth-130}"/>
        </c:if>
        <ui:tablefix id="userTable" nowrap="true" fixWidth="300px" tableWidth="${tableWidth}px" queryForm="queryForm"
                     actionClass="com.sinitek.managerframework.org.action.UserTableAction" allowExport="true" pageSize="15"
                     exportFileName="用户管理">
            <layout:tableToolBar position="top">
                <%--<ui:toolbarButton text="导入" icon="ui-icon-document">--%>
                <%--<event:onclick>--%>
                <%--</event:onclick>--%>
                <%--</ui:toolbarButton>--%>
                <ui:toolbarButton text="新增" icon="ui-icon-document">
                    <event:onclick>
                        sirm.use('sirm.org', function(org) {
                        org.showAddWindow();
                        });
                    </event:onclick>
                </ui:toolbarButton>
                <c:if test="${roleshow}">
                    <ui:toolbarButton text="角色设置" icon="ui-icon-wrench">
                        <event:onclick>
                            sirm.use('sirm.org', function(org) {
                            org.roleConfig();
                            });
                        </event:onclick>
                    </ui:toolbarButton>
                </c:if>
                <ui:toolbarButton text="岗位设置" icon="ui-icon-wrench">
                    <event:onclick>
                        sirm.use('sirm.org', function(org) {
                        org.postConfig();
                        });
                    </event:onclick>
                </ui:toolbarButton>
                <ui:toolbarButton text="小组设置" icon="ui-icon-wrench">
                    <event:onclick>
                        sirm.use('sirm.org', function(org) {
                        org.teamConfig();
                        });
                    </event:onclick>
                </ui:toolbarButton>
                <ui:toolbarButton text="批量锁定" icon="ui-icon-wrench">
                    <event:onclick>
                        sirm.use('sirm.org', function(org) {
                        org.batchLockUser();
                        });
                    </event:onclick>
                </ui:toolbarButton>
                <ui:toolbarButton text="批量离职" icon="ui-icon-wrench">
                    <event:onclick>
                        sirm.use('sirm.org', function(org) {
                        org.batchUpdateInservice();
                        });
                    </event:onclick>
                </ui:toolbarButton>
                <c:if test="${canChangePassword}">
                    <ui:toolbarButton text="批量重置密码" icon="ui-icon-wrench">
                        <event:onclick>
                            sirm.use('sirm.org', function(org) {
                            org.batchUpdatePassword();
                            });
                        </event:onclick>
                    </ui:toolbarButton>
                </c:if>
                <%--<c:if test="${fumdcrm}">--%>
                <%--<ui:toolbarButton text="同步用户信息" icon="ui-icon-wrench">--%>
                <%--<event:onclick>--%>
                <%--sirm.use('sirm.org', function(org) {--%>
                <%--org.SynchronousUsers();--%>
                <%--});--%>
                <%--</event:onclick>--%>
                <%--</ui:toolbarButton>--%>
                <%--<ui:toolbarButton text="同步失败用户信息" icon="ui-icon-wrench">--%>
                <%--<event:onclick>--%>
                <%--sirm.use('sirm.org', function(org) {--%>
                <%--org.FailureUsers();--%>
                <%--});--%>
                <%--</event:onclick>--%>
                <%--</ui:toolbarButton>--%>
                <%--</c:if>--%>
            </layout:tableToolBar>
            <ui:col plugin="checkBoxPlugin" fixed="true" width="20px" align="center"/>
            <ui:col plugin="rowNumPlugin" fixed="true" width="30px"/>
            <ui:colCust method="getUserLockedStatus" fixed="true" property="userlocke" width="20"/>
            <ui:col property="username" fixed="true" title="登录名" width="100px" align="left" allowSort="true"
                    allowTip="true" nowrap="true"/>
            <ui:col property="displayname" fixed="true" title="员工姓名" plugin="linkPlugin" width="150px" align="left"
                    allowSort="true" allowTip="true" nowrap="true"/>
            <ui:col title="性别" property="sex" width="50px"
                    align="center">sex == 1 ? "男" :sex == 2 ? "女" : "" </ui:col>
            <ui:col property="email" title="Email" width="180px" align="left" allowTip="true"/>
            <%--<ui:col property="tel" title="办公电话" align="left" width="15%" allowTip="true"/>--%>
            <ui:col property="inservice" title="状态" width="50px" align="center"
                    allowTip="true">"1".equals(inservice+"") ? "在职" : "离职"</ui:col>
            <ui:col property="positionname" title="岗位部门名称" align="left" width="200px" allowTip="true"/>
            <%--<ui:col property="unitname" title="部门" align="left" width="17%"/>--%>
            <c:if test="${roleshow}">
                <ui:col property="rolename" title="角色名称" width="130px" align="left" allowTip="true"/>
            </c:if>
            <ui:col property="teamname" title="小组名称" width="130px" align="left" allowTip="true"/>
            <%--<ui:col property="userlocke" title="锁定状态" width="80px">--%>
            <%--userlocke=="true" ? "锁定" : "未锁定"--%>
            <%--</ui:col>--%>
            <ui:col plugin="updateBtn,updatepassBtn,unlockUserBtn" title="操作" width="150px" nowrap="true"/>
            <event:ontableorder propertyVar="property" orderTypeVar="order">
                $("#order").stk_val(property+":"+order);
                $("#userTable").stk_query();
            </event:ontableorder>
        </ui:tablefix>
    </ui:form>
    <!--同步失败用户-->
    <layout:window id="failureUsersWindow">
        <div style=" padding:10px">
            失败用户名单：
            <div id="failures"></div>
            <ui:button text="同步">
                <event:onclick>
                    sirm.use('sirm.org', function(org) {
                    org.saveFailureUsers();
                    });
                </event:onclick>
            </ui:button>
        </div>
    </layout:window>
    <!--修改密码窗口-->
    <ui:form id="userForm" clazz="com.sinitek.managerframework.org.action.UserFormAction" method="updatePassword">
        <!--保存同步全部用户还是同步失败用户-->
        <input type="hidden" id="synchronoustype" name="synchronoustype"/>
        <input type="hidden" id="updateuserid" name="userid"/>
        <input type="hidden" id="passtype" name="passtype" value="0"/>
    </ui:form>
    <!--配置角色-->
    <layout:window id="roleConfigWindow" width="500px">
        <ui:form id="roleForm" clazz="com.sinitek.managerframework.org.action.RoleFormAction" method="saveEmpConfig">
            <table class="stk-form-ui-st1">
                <tr>
                    <td class="hd" width="80">人员列表</td>
                    <td class="bd" width="auto">
                        <div id="rolediv"></div>
                        <input type="hidden" id="rolehidden" name="rolehidden"/>
                    </td>
                </tr>
                <tr>
                    <td class="hd" width="80">设置角色</td>
                    <td class="bd" width="auto">
                        <org:roleTag rolelist="rolelist"/>
                        <ui:select list="#attr.rolelist" id="EmpRoleid" name="EmpRoleid" headerValue="--请选择--"
                                   headerKey=""/>
                    </td>
                </tr>
                <tr class="btn-bar">
                    <td class="bd" align="center" colspan="2">
                        <ui:button id="" text="提交">
                            <event:onclick>
                                if($("#roleForm").stk_checkForm())
                                {
                                $("#roleForm").stk_submit(function(result){
                                if(result!=""){
                                stk.alert(result);
                                }else{
                                $("#roleConfigWindow").stk_hide();
                                $("#userTable").stk_query();}
                                });
                                }
                            </event:onclick>
                        </ui:button>
                        <ui:button text="关闭">
                            <event:onclick>
                                $("#roleConfigWindow").stk_hide();
                            </event:onclick>
                        </ui:button>
                    </td>
                </tr>
            </table>
            <func:checkers>
                <func:checker target="EmpRoleid" allowBlank="false" blankText="请输入设置角色"/>
            </func:checkers>
        </ui:form>
    </layout:window>

    <!--配置岗位-->
    <layout:window id="postConfigWindow" width="500px">
        <ui:form id="postListForm" clazz="com.sinitek.managerframework.org.action.UserFormAction" method="postEmpConfig">
            <table class="stk-form-ui-st1">
                <tr>
                    <td class="hd" width="80">人员列表</td>
                    <td class="bd" width="auto">
                        <div id="postdiv"></div>
                        <input type="hidden" id="posthidden" name="posthidden"/>
                    </td>
                </tr>
                <tr>
                    <td class="hd" width="80">设置岗位</td>
                    <td class="bd" width="auto">
                        <org:orgTag orglist="orglist"/>
                        <select id="postEmpId"
                                onchange="if(this.options[this.selectedIndex].disabled==true) this.selectedIndex=0"
                                style="width: 120px;">${orglist}</select>
                    </td>
                </tr>
                <tr class="btn-bar">
                    <td class="bd" align="center" colspan="2">
                        <ui:button id="" text="提交">
                            <event:onclick>
                                if($("#postListForm").stk_checkForm())
                                {
                                $("#postListForm").stk_submit(function(result){
                                if(result!=""){
                                stk.alert(result);
                                }else{
                                $("#postConfigWindow").stk_hide();
                                $("#userTable").stk_query();}
                                });
                                }
                            </event:onclick>
                        </ui:button>
                        <ui:button text="关闭">
                            <event:onclick>
                                $("#postConfigWindow").stk_hide();
                            </event:onclick>
                        </ui:button>
                    </td>
                </tr>
            </table>
            <func:checkers>
                <func:checker target="postEmpId" validator="sirm.org.checkpostId()" blankText="请输入设置岗位"/>
            </func:checkers>
        </ui:form>
    </layout:window>

    <!--配置小组-->
    <layout:window id="teamConfigWindow" width="500px">
        <ui:form id="teamForm" clazz="com.sinitek.managerframework.org.action.TeamFormAction" method="saveTeamEmpInfo">
            <table class="stk-form-ui-st1">
                <tr>
                    <td class="hd" width="80">人员列表</td>
                    <td class="bd" width="auto">
                        <div id="teamdiv"></div>
                        <input type="hidden" id="usershidden" name="usershidden"/>
                    </td>
                </tr>
                <tr>
                    <td class="hd" width="80">设置小组</td>
                    <td class="bd" width="auto">
                        <org:Team teamlists="teamlist"/>
                        <ui:select list="#attr.teamlist" id="teamid" name="teamid" headerValue="--请选择--" headerKey="0"/>
                    </td>
                </tr>
                <tr class="btn-bar">
                    <td class="bd" align="center" colspan="2">
                        <ui:button id="" text="提交">
                            <event:onclick>
                                if($("#teamForm").stk_checkForm())
                                {
                                $("#teamForm").stk_submit(function(result){
                                if(result!=""){
                                stk.alert(result);
                                }else{
                                $("#teamConfigWindow").stk_hide();
                                $("#userTable").stk_query();}
                                });
                                }
                            </event:onclick>
                        </ui:button>
                        <ui:button text="关闭">
                            <event:onclick>
                                $("#teamConfigWindow").stk_hide();
                            </event:onclick>
                        </ui:button>
                    </td>
                </tr>
            </table>
            <func:checkers>
                <func:checker target="teamid" allowBlank="false" blankText="请输入设置小组"/>
            </func:checkers>
        </ui:form>
    </layout:window>

    <%@include file="searchorg/selectorginclude.jsp" %>
    <%@include file="searchorg/selectunitinclude.jsp" %>
</sirm:body>
</html>