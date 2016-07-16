<%--
  File Desc:      
  Product Name: SIRM
  Module Name: indicator
  Author:      潘虹
  History:     11-9-9 created by 潘虹
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/orgincludes.jsp" %>
<html>
<head><title>未分配人员</title>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#userTable").stk_query();
        });
        function postConfig() {
            if ($("#checkBoxPlugin").hasSelect()) {
                $("#checkBoxPlugin").stk_call({type:'0'}, function(result) {
                    $("#postdiv").stk_text("");
                    showframe('user', 'postdiv', 'posthidden', 'wwww', result);
                    $("#postConfigWindow").stk_show({title:'岗位配置'});
                    $("#postEmpId").stk_val(0);
                });
            }
            else {
                stk.alert("请选中要配置岗位的用户");
            }
        }
        function showInfoWindow(val) {
            $("#labcname").stk_text(val.displayname);
            $("#labusername").stk_text(val.username);
            $("#labsex").stk_text(val.sex == "1" ? "男" : val.sex == "2" ? "女" : "");
            $("#labemail").stk_text(val.email);
            $("#labtel").stk_text(val.tel);
            $("#labjob").stk_text(val.job);
            $("#labmobilephone").stk_text(val.mobilephone);
            $("#labinservice").stk_text(val.inservice == "1" ? "在职" : "离职");
            $("#showInfoWindow").stk_show({title:'员工信息'});
        }
    </script>
</head>
<sirm:body>
    <ui:form id="queryForm">
        <div class="search-params-bar">
            <table>
                <tr>
                    <td class="tit"><label></label></td>
                    <td class="bd"><ui:textfield id="querycname" name="empName" width="120px" emptyText="登录名 / 员工姓名"/></td>
                    <td><ui:button text="查询" icon="ui-icon-circle-zoomout">
                        <event:onclick>
                            $("#userTable").stk_query();
                        </event:onclick>
                    </ui:button>
                    </td>
                </tr>
            </table>
        </div>
        <plugin:colCheckbox id="checkBoxPlugin" name="check"/>
        <plugin:colLink id="usernamelinkPlugin" dataVar="val">
            showInfoWindow(val);
        </plugin:colLink>
        <input type="hidden" id="orgid" name="orgid" value="${param.orgid}"/>
        <input type="hidden" id="inservice" name="inservice" value="1"/>
        <input type="hidden" id="order" name="order">
        <input type="hidden" id="unUser" value="true"/>
        <plugin:colRowNum id="rowNumPlugin"/>
        <ui:tablefix tableWidth="100%" id="userTable" nowrap="true" queryForm="queryForm"
                     actionClass="com.sinitek.managerframework.org.action.UserTableAction" pageSize="15" allowInit="false"
                     allowExport="true" exportFileName="组织结构- 未分配岗位人员">
            <layout:tableToolBar position="top">
                <ui:toolbarButton text="岗位设置" icon="ui-icon-wrench">
                    <event:onclick>
                        postConfig();
                    </event:onclick>
                </ui:toolbarButton>
            </layout:tableToolBar>
            <func:tableExport>
                <ui:col property="displayname" title="员工姓名" width="70px"/>
                <ui:col property="username" title="登录名" width="130px"/>
                <%--<ui:col property="orgid" title="工号" width="70px" align="left" allowTip="true"/>--%>
                <ui:col property="email" title="Email" align="left" width="160px"/>
                <ui:col property="tel" title="办公电话" align="left" width="45%"/>
            </func:tableExport>
            <ui:col plugin="checkBoxPlugin" width="20px"/>
            <ui:col plugin="rowNumPlugin" width="30px"/>
            <ui:col property="displayname" plugin="usernamelinkPlugin" title="员工姓名" width="70px" align="left"
                    allowTip="true"/>
            <ui:col property="username" title="登录名" width="130px" align="left" allowTip="true"/>
            <%--<ui:col property="orgid" title="工号" width="70px" align="left" allowTip="true"/>--%>
            <ui:col property="email" title="Email" align="left" width="160px" allowTip="true"/>
            <ui:col property="tel" title="办公电话" align="left" width="45%"/>
            <event:ontableorder propertyVar="property" orderTypeVar="order">
                $("#order").stk_val(property+":"+order);
                $("#userTable").stk_query();
            </event:ontableorder>
        </ui:tablefix>
    </ui:form>
    <!--配置岗位-->
    <layout:window id="postConfigWindow" width="500px">
        <ui:form id="userForm" clazz="com.sinitek.managerframework.org.action.UserFormAction" method="postEmpConfig">
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
                                onchange="if(this.options[this.selectedIndex].disabled==true) this.selectedIndex=0" style="width: 265px">${orglist}</select>
                    </td>
                </tr>
                <tr class="btn-bar">
                    <td class="bd" align="center" colspan="2">
                        <ui:button id="" text="确定">
                            <event:onclick>
                                if($("#userForm").stk_checkForm())
                                {
                                $("#userForm").stk_submit(function(result){
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
                <func:checker target="postEmpId" allowBlank="false" blankText="请输入设置岗位"/>
            </func:checkers>
        </ui:form>
    </layout:window>

    <!--人员详细信息-->
    <layout:window id="showInfoWindow" width="500px">
        <div style="width:100%">
            <div>
                <table class="stk-form-ui-st1">
                    <tr>
                        <td class="hd" width="80">登录名</td>
                        <td class="bd" width="auto"><label id="labusername" name="labusername"></label></td>
                    </tr>
                    <tr>
                        <td class="hd" width="80">员工姓名</td>
                        <td class="bd" width="auto"><label id="labcname" name="labcname"></label></td>
                    </tr>
                    <tr>
                        <td class="hd" width="80">性别</td>
                        <td class="bd" width="auto"><label id="labsex" name="labsex"></label></td>
                    </tr>
                    <tr>
                        <td class="hd" width="80">Email</td>
                        <td class="bd" width="auto"><label id="labemail" name="labemail"></label></td>
                    </tr>
                    <tr>
                        <td class="hd" width="80">办公电话</td>
                        <td class="bd" width="auto"><label id="labtel" name="labtel"></label></td>
                    </tr>
                    <tr>
                        <td class="hd" width="80">手机</td>
                        <td class="bd" width="auto"><label id="labmobilephone" name="labmobilephone"></label></td>
                    </tr>
                    <tr>
                        <td class="hd" width="80">职位</td>
                        <td class="bd" width="auto"><label id="labjob" name="labjob"></label></td>
                    </tr>
                    <tr>
                        <td class="hd" width="80">在职状态</td>
                        <td class="bd" width="auto"><label id="labinservice" name="labinservice"></label></td>
                    </tr>
                </table>
            </div>
            <div>
                <table width="100%">
                    <tr>
                        <td align="center" height="30px">
                            <ui:button text="关闭">
                                <event:onclick>
                                    $("#showInfoWindow").stk_hide();
                                </event:onclick>
                            </ui:button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </layout:window>
    <%@include file="searchorg/selectorginclude.jsp" %>
</sirm:body>
</html>