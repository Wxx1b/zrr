<%--
  File Desc:      
  Product Name: SIRM
  Module Name: indicator
  Author:      潘虹
  History:     11-9-24 created by 潘虹
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/orgincludes.jsp" %>
<html>
<head><title>在线用户</title></head>
<sirm:body>
<ui:form id="queryForm">
    <div class="search-params-bar">
        <table>
            <tr>
                <td class="tit"><label>员工名称</label></td>
                <td class="bd"><ui:textfield id="querycname" name="empName"/></td>
                <td class="tit"><label>公司部门</label></td>
                <td class="bd">
                    <ui:button id="_user_btn2" icon="ui-icon-plusthick" text="选择部门">
                        <event:onclick>
                            showunit('unitDiv', 'units');
                        </event:onclick>
                    </ui:button>
                </td>
                <td><input type="hidden" name="units" id="units"/>

                    <div id="unitDiv"></div>
                </td>
                <td>
                    <ui:button text="查询" icon="ui-icon-circle-zoomout">
                        <event:onclick>
                            $("#onlineUsersTable").stk_query();
                        </event:onclick>
                    </ui:button>
                </td>
            </tr>
        </table>
    </div>
    <input type="hidden" id="order" name="order">
</ui:form>
<plugin:colRowNum id="rowNumPlugin"/>
<ui:table id="onlineUsersTable" nowrap="true" pageSize="15" queryForm="queryForm" actionClass="com.sinitek.managerframework.org.action.OnlineUsersTableAction" allowExport="true"
          exportFileName="在线用户">
    <func:tableExport>
        <ui:col property="displayname" title="员工名称" width="100px" align="left" allowSort="true"/>
        <ui:col title="员工性别" property="sex" width="20px" align="center">
            <%--sex.equals("1") ? "男" : "女"    --%>
            sex.equals("1") ? "男" :sex.equals("2") ? "女" : ""
        </ui:col>
        <ui:col property="email" title="Email" width="15%" align="left"/>
        <ui:col property="tel" title="办公电话" align="left" width="15%"/>
        <%--<ui:col property="positionname" title="岗位名称" align="left" width="25%"/>--%>
        <%--<ui:col property="unitname" title="部门名称" width="25%" align="left" allowTip="true"/>--%>
        <%--<ui:col property="rolename" title="角色名称" width="25%" align="left"/>--%>
    </func:tableExport>
    <ui:col plugin="rowNumPlugin" width="30px"/>
    <ui:col property="displayname" title="员工名称" width="100px" align="left" allowSort="true"/>
    <ui:col title="性别" property="sex" width="30px" align="center">
        sex==1 ? "男" :sex==2 ? "女" : ""
    </ui:col>
    <ui:col property="email" title="Email" width="50%" align="left"/>
    <ui:col property="tel" title="办公电话" align="left" width="50%"/>
    <ui:colDate format="yyyy-MM-dd HH:mm" property="logontime" title="最近登录时间" align="center" width="100px" nowrap="true"/>

    <%--<ui:col property="positionname" title="岗位名称" align="left" width="25%" allowTip="true"/>--%>
    <%--<ui:col property="unitname" title="部门名称" width="25%" align="left" allowTip="true"/>--%>
    <%--<ui:col property="rolename" title="角色名称" width="25%" align="left" allowTip="true"/>--%>
    <%--<ui:col title="操作" width="120px" nowrap="false"/>--%>
    <event:ontableorder propertyVar="property" orderTypeVar="order">
    $("#order").stk_val(property+":"+order);
    $("#onlineUsersTable").stk_query();
    </event:ontableorder>
</ui:table>
<jsp:include page="searchorg/selectunitinclude.jsp"/>
</sirm:body>
</html>