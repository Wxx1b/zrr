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
<head><title>通讯录查询</title></head>
<sirm:body>
    <script type="text/javascript" src="${contextPath}/scripts/org/userinfo.js">
    </script>
    <script type="text/javascript">
        (function () {
            sirm.define('sirm.org', {
                contextPath:'${contextPath}'
            });
        })();
    </script>
    <ui:form id="queryForm">
        <div class="search-params-bar">
            <table width="700px">
                <tr>
                    <td>
                        <ul>
                            <li><label>员工姓名</label><ui:textfield id="querycname" name="empName"/>
                            </li>
                            <li><label>在职状态</label><ui:select id="queryinservice" name="inservice"
                                                              list="#{'':'--请选择--','1':'在职','0':'离职'}"/>
                            </li>
                            <li><ui:button text="选择部门" icon="ui-icon-circle-zoomout">
                                <event:onclick>
                                    showunit('unitdiv', 'strutureId');
                                </event:onclick>
                            </ui:button></li>
                            <li><label>所选部门</label> <span id="unitdiv" style="width: 300px;*overflow:auto"></span>
                                <input id="strutureId" name="strutureId" type="hidden"/></li>
                        </ul>
                    </td>
                    <td>
                        <ui:button text="查询" icon="ui-icon-circle-zoomout">
                            <event:onclick>
                                $("#userTable").stk_query();
                            </event:onclick>
                        </ui:button>
                    </td>
                </tr>
                <%--<tr>--%>
                    <%--<td colspan="2"><label>所选部门</label> <span id="unitdiv" style="width: 300px;*overflow:auto"></span>--%>
                        <%--<input id="strutureId" name="strutureId" type="hidden"/></td>--%>
                <%--</tr>--%>
            </table>
        </div>
        <input type="hidden" id="order" name="order">
    </ui:form>
    <ui:form id="tabForm">
        <plugin:colRowNum id="rowNumPlugin"/>
        <plugin:colLink id="linkPlugin" dataVar="val">
            sirm.use('sirm.org', function(org) {
            org.showInfoWindow(val);
            });
        </plugin:colLink>
        <ui:tablefix id="userTable" nowrap="true" queryForm="queryForm"
                     actionClass="com.sinitek.managerframework.org.action.UserTableAction" allowExport="true"
                     exportFileName="内部通讯录" tableWidth="100%" pageSize="15">
            <ui:col plugin="rowNumPlugin" width="30px"/>
            <ui:col property="displayname" title="姓名" plugin="linkPlugin" align="left"
                    allowSort="true" allowTip="true" />
            <ui:col title="性别" property="sex" width="30px" align="center">sex.equals("1") ? "男" :sex.equals("2") ? "女" :
                "" </ui:col>
            <ui:col property="email" title="Email" width="150px" align="left" allowTip="true"/>
            <ui:col property="tel" title="办公电话" align="left" width="120px" allowTip="true"/>
            <ui:col property="tel2" title="办公电话2" align="left" width="120px" allowTip="true"/>
            <ui:col property="mobilephone" title="手机" align="left" width="120px" allowTip="true"/>
            <ui:col property="inservice" title="状态" width="30px" align="center"
                    allowTip="true">inservice.equals("1") ? "在职"
                : "离职"</ui:col>
            <event:ontableorder propertyVar="property" orderTypeVar="order">
                $("#order").stk_val(property+":"+order);
                $("#userTable").stk_query();
            </event:ontableorder>
        </ui:tablefix>
    </ui:form>
    <%@include file="searchorg/selectunitinclude.jsp" %>
</sirm:body>
</html>