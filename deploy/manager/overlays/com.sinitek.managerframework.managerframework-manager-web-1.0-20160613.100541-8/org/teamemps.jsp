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
<head><title>小组信息</title></head>
<sirm:body>
    <script type="text/javascript" src="${contextPath}/scripts/org/teamemps.js">
</script>
<script type="text/javascript">
    (function () {
        sirm.define('sirm.org.param', {
            teamid:'${param.teamid}'
        });
    })();
</script>
当前小组：&nbsp;<span id="currentSpan"></span>
<ui:form id="queryForm2">
    <div class="search-params-bar">
        <table>
            <tr>
                <td class="tit"><label></label></td>
                <td class="bd"><ui:textfield id="querycname" name="cname" width="120px" emptyText="登录名 / 员工姓名"/></td>
                <td><ui:button text="查询" icon="ui-icon-circle-zoomout">
                    <event:onclick>
                        $("#teamTable").stk_query();
                    </event:onclick>
                </ui:button>
                </td>
            </tr>
        </table>
    </div>
    <plugin:colCheckbox id="checkBoxPlugin" name="check"/>
    <plugin:colLink id="usernamelinkPlugin" dataVar="val">
        sirm.use('sirm.org', function(org) {
        org.showInfoWindow(val);
        });
    </plugin:colLink>
    <%--<plugin:colLink id="updateBtn" text="设为小组长" dataVar="data">--%>
        <%--sirm.use('sirm.org', function(org) {--%>
        <%--org.showUpdateWindow(data);--%>
        <%--});--%>
    <%--</plugin:colLink>--%>
    <input type="hidden" id="teamid" name="teamid" value="${param.teamid}"/>
    <input type="hidden" id="order" name="order">
    <plugin:colRowNum id="rowNumPlugin"/>
    <ui:table id="teamTable" nowrap="true" queryForm="queryForm2" actionClass="com.sinitek.managerframework.org.action.TeamTableAction"
              pageSize="15" allowInit="false" allowExport="true"
              exportFileName="组织结构-小组下人员列表">
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
            <ui:toolbarButton text="设置小组长" icon="ui-icon-wrench">
                <event:onclick>
                    sirm.use('sirm.org', function(org) {
                    org.addconfigTeamer();
                    });
                </event:onclick>
            </ui:toolbarButton>
            <ui:toolbarButton text="取消小组长" icon="ui-icon-wrench">
                <event:onclick>
                    sirm.use('sirm.org', function(org) {
                    org.deleteconfigTeamer();
                    });
                </event:onclick>
            </ui:toolbarButton>
        </layout:tableToolBar>
        <func:tableExport>
            <ui:col property="displayname" title="员工姓名" width="45%"/>
            <ui:col property="username" title="登录名" width="45%"/>
            <ui:col property="email" title="Email" align="left" width="45%"/>
            <ui:col property="tel" title="办公电话" align="left" width="45%"/>
        </func:tableExport>
        <ui:col plugin="checkBoxPlugin" width="20px"/>
        <ui:col plugin="rowNumPlugin" width="30px"/>
        <ui:col property="displayname" plugin="usernamelinkPlugin" title="员工姓名" width="100px" allowTip="true"
                align="left"/>
        <ui:col property="username" title="登录名" width="100px" allowTip="true" align="left"/>
        <%--<ui:col property="orgid" title="工号" width="70px" align="left" allowTip="true"/>--%>
        <ui:col property="email" title="Email" align="left" width="160px" allowTip="true"/>
        <ui:col property="tel" title="办公电话" align="left" width="45%"/>
        <ui:col property="teamer" title="身份" align="left" width="100px">

        </ui:col>
        <%--<ui:col plugin="updateBtn" title="操作" width="100px"/>--%>
        <event:ontableorder propertyVar="property" orderTypeVar="order">
            $("#order").stk_val(property+":"+order);
            $("#teamTable").stk_query();
        </event:ontableorder>
    </ui:table>
</ui:form>
<layout:window id="addUpdateWindow" width="500px">
    <ui:form id="teamForm" clazz="com.sinitek.managerframework.org.action.TeamFormAction" method="saveTeamEmpInfo">
        <input type="hidden" id="updateteamid" name="teamid" value="${param.teamid}"/>

        <div id="users" style="width:99%;height:50px"></div>
        <input id="usershidden" name="usershidden" type="hidden"/>
    </ui:form>
</layout:window>
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
        <div style="padding:10px 0 0 150px">
            <ui:button text="关闭">
                <event:onclick>
                    $("#showInfoWindow").stk_hide();
                </event:onclick>
            </ui:button>
        </div>
    </div>
</layout:window>
</sirm:body>
</html>
<jsp:include page="searchorg/selectorginclude.jsp">
    <jsp:param name="callbackfunc" value="sirm.org.callbackfunction"/>
</jsp:include>