<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>--%>
<%--
  File Desc:      
  Product Name: SIRM
  Module Name: indicator
  Author:      潘虹
  History:     11-4-27 created by 潘虹
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/orgincludes.jsp" %>
<html>
<head><title>岗位信息</title></head>
<sirm:body>
    <script type="text/javascript" src="${contextPath}/scripts/org/postinfo.js">
    </script>
    <script type="text/javascript">
        (function () {
            sirm.define('sirm.org.param', {
                postid: '${param.postid}'
            });
        })();

        function freshOrgTree() {
            window.parent.reLoadTree();
            window.parent.selectNode('${param.rootid}', '', false);
        }
        function frushOrgTreetemp(id) {
            window.parent.reLoadTree();
        }
        function selectTreeNode(id) {
            window.parent.selectNode(id, '');
        }
    </script>
    当前位置：
    <span id="currentSpan"></span>
    <ui:form id="queryForm2">
        <div class="search-params-bar">
            <table>
                <tr>
                    <td class="tit"><label></label></td>
                    <td class="bd"><ui:textfield id="queryuserName" name="username" width="120px" emptyText="登录名 / 员工姓名"/></td>
                    <td><ui:button text="查询" icon="ui-icon-circle-zoomout">
                        <event:onclick>
                            $("#employeeTable").stk_query();
                        </event:onclick>
                    </ui:button>
                    </td>
                </tr>
            </table>
        </div>
        <plugin:colCheckbox id="checkBoxPlugin" name="check"/>
        <plugin:colLink id="usernamelinkPlugin" dataVar="data">
            sirm.use('sirm.org', function(org) {
            org.showInfoWindow(data);
            });
        </plugin:colLink>
        <plugin:colLink id="moveBtn" text="移动" dataVar="data">
            sirm.use('sirm.org', function(org) {
            org.showEmpMoveWindow(data);
            });
        </plugin:colLink>
        <input type="hidden" id="postpid" name="postpid" value="${param.postid}"/>
        <input type="hidden" id="order" name="order">
        <plugin:colRowNum id="rowNumPlugin"/>
        <ui:table id="employeeTable" nowrap="true" queryForm="queryForm2"
                  actionClass="com.sinitek.managerframework.org.action.EmployeeTableAction" allowInit="false" allowExport="true"
                  exportFileName="组织结构-岗位下人员列表">
            <layout:tableToolBar position="top">
                <ui:toolbarButton text="新增" icon="ui-icon-document">
                    <event:onclick>
                        sirm.use('sirm.org', function(org) {
                        org.showAddWindow();
                        });
                    </event:onclick>
                </ui:toolbarButton>
                <ui:toolbarButton text="删除" icon="ui-icon-trash">
                    <event:onclick>
                        sirm.use('sirm.org', function(org) {
                        org.remove();
                        });
                    </event:onclick>
                </ui:toolbarButton>
                <ui:toolbarButton text="排序" icon="ui-icon-arrow-2-n-s">
                    <event:onclick>
                        sirm.use('sirm.org', function(org) {
                        org.showEmpSortWindow();
                        });
                    </event:onclick>
                </ui:toolbarButton>
            </layout:tableToolBar>
            <func:tableExport>
                <ui:col property="displayname" plugin="usernamelinkPlugin" align="left" title="员工姓名" width="80px"/>
                <ui:col property="username" title="登录名" align="left" width="80px"/>
                <%--<ui:col property="orgid" title="工号" width="70px" align="left" allowTip="true"/>--%>
                <ui:col property="email" title="Email" align="left" width="80px"/>
                <ui:col property="tel" title="办公电话" align="left" width="80px"/>
            </func:tableExport>
            <ui:col plugin="checkBoxPlugin" width="20px"/>
            <ui:col plugin="rowNumPlugin" width="30px"/>
            <ui:col property="displayname" plugin="usernamelinkPlugin" align="left" allowTip="true" title="员工姓名"
                    width="60px"/>
            <ui:col property="username" title="登录名" align="left" width="60px" allowTip="true"/>
            <ui:col property="email" title="Email" align="left" width="45%"/>
            <ui:col property="tel" title="办公电话" align="left" width="45%"/>
            <ui:col plugin="moveBtn" title="操作" width="80px"/>
            <event:ontableorder propertyVar="property" orderTypeVar="order">
                $("#order").stk_val(property+":"+order);
                $("#employeeTable").stk_query();
            </event:ontableorder>
        </ui:table>
    </ui:form>

    <ui:form id="employeeForm" clazz="com.sinitek.managerframework.org.action.EmployeeFormAction" method="saveEmployeeInfo">
        <input type="hidden" id="pid" name="pid" value="${param.postid}"/>

        <div id="users" style="width:99%;height:50px;display:none;"></div>
        <input id="usershidden" name="usershidden" type="hidden"/>
    </ui:form>
    <layout:window id="moveemployeeWindow" width="540px" cellUnderLine="true" cellMarginBottom="1px" feature="labelBg"
                   title="移动菜单">
        <ui:form id='moveemployeeform' clazz="com.sinitek.managerframework.org.action.UserFormAction" method="moveEmployee">
            <input type="hidden" id="parentid" name="parentid" value="${param.postid}">
            <input type="hidden" id="orgid" name="orgid" value="0">
            <div style="width:510px">
                <div>
                    <table class="stk-form-ui-st1">
                        <tr>
                            <td class="hd" width="80"><label>上级岗位名称</label></td>
                            <td class="bd" width="auto">
                                <label id="parentpositionname"></label>

                            </td>
                        </tr>
                        <tr>
                            <td class="hd" width="80"><label>员工名称</label></td>
                            <td class="bd" width="auto">
                                <label id="empname"></label>
                            </td>
                        </tr>
                        <tr id="selecttr">
                            <td class="hd" width="80"><label>移动至</label></td>
                            <td class="bd" width="auto">
                                <select id="empselect" name="empselect"></select>
                            </td>
                        </tr>

                        <tr class="btn-bar">
                            <td class="hd"></td>
                            <td class="bd">
                                <ui:button text="确定">
                                    <event:onclick>
                                        if($("#moveemployeeform").stk_checkForm()) {
                                        $("#moveemployeeform").stk_submit(function(result){
                                        if ("ok" == result){
                                        $("#moveemployeeWindow").stk_hide();
                                        $("#employeeTable").stk_query();
                                        window.parent.reLoadTree();
                                        stk.info("操作成功");
                                        }
                                        else{
                                        stk.alert(result);
                                        }
                                        });
                                        }
                                    </event:onclick>
                                </ui:button>

                                <ui:button text="取消">
                                    <event:onclick>
                                        $("#moveemployeeWindow").stk_hide();
                                    </event:onclick>
                                </ui:button>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <func:checkers>
                <func:checker target="empselect" allowBlank="false" blankText="请选择目标节点"/>
            </func:checkers>
        </ui:form>
    </layout:window>

    <!--显示详细信息窗口-->
    <layout:window width="500px" id="showInfoWindow">
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
            <div style="padding:10px 0 0 150px">
                <ui:button text="关闭">
                    <event:onclick>
                        $("#showInfoWindow").stk_hide();
                    </event:onclick>
                </ui:button>
            </div>
        </div>
    </layout:window>
    <!--岗位排序-->
    <layout:window id="empSortWindow" width="300px">
        <ui:form id="empSortForm" clazz="com.sinitek.managerframework.org.action.EmployeeFormAction" method="saveEmpSort">
            <div style="padding:10px;" align="center">
                <input type="hidden" id="postid" name="postid" value="${param.postid}"/>
                <ui:doubleSelect id="empSort" name="empSort" selectTitle="排序"/>
                <script type="text/javascript">
                    $(document).ready(function () {
                        $("#postSort_r").unbind("dblclick");
                    });
                </script>
                <ui:button text="保存">
                    <event:onclick>
                        sirm.use('sirm.org', function(org) {
                        org.saveEmpSort();
                        });
                    </event:onclick>
                </ui:button>
            </div>
        </ui:form>
    </layout:window>
</sirm:body>
</html>
<jsp:include page="searchorg/selectorginclude.jsp">
    <jsp:param name="callbackfunc" value="sirm.org.callbackfunction"/>
</jsp:include>