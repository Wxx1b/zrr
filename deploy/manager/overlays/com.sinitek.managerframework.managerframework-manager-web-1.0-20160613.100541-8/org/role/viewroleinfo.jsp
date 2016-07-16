<%--
  File Desc:      
  Product Name: SIRM
  Module Name: org
  Author:      潘虹
  History:     11-7-25 created by 潘虹
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.sinitek.managerframework.setting.common.utils.NumberTool" %>
<%@ page import="com.sinitek.base.common.api.CommonAPIFactory" %>
<%@ page import="com.sinitek.managerframework.org.common.api.IOrgService" %>
<%@ page import="com.sinitek.managerframework.function.common.api.IFunctionService" %>
<%@ page import="com.sinitek.managerframework.org.common.bean.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/orgincludes.jsp" %>
<%
    String roleid = request.getParameter( "roleid" );
    int _type = NumberTool.safeToInteger( request.getParameter( "type" ), 0 );
    pageContext.setAttribute( "type", _type );
    Role role = ( ( IOrgService ) CommonAPIFactory.getInstance().getCommonAPI( IOrgService.class ) ).getRoleById( roleid );
    List<Employee> emplist = ( ( IOrgService ) CommonAPIFactory.getInstance().getCommonAPI( IOrgService.class ) ).findEmployeeByRoleId( roleid );
    List queryList = ( ( IFunctionService ) CommonAPIFactory.getInstance().getCommonAPI( IFunctionService.class ) ).findAllFunction();
    String empStr = "";
    for ( int i = 0; i < emplist.size(); i++ )
    {
        Employee emp = emplist.get( i );
        if ( empStr == "" )
        {
            empStr += emp.getEmpName();
        } else
        {
            empStr += "," + emp.getEmpName();
        }
    }
    pageContext.setAttribute( "empStr", empStr );
    pageContext.setAttribute( "roleid", NumberTool.safeToInteger( roleid, 0 ) );
    pageContext.setAttribute( "queryList", queryList );
%>
<html>
<head><title>角色详细信息页面</title>
    <script type="text/javascript">
        //关闭按钮事件
        function closeBtn() {
            window.location = sirm.jsurl("/org/role/listrole.jsp");
        }
        //页面加载事件，显示人员
        $(document).ready(function () {
            if ($("#type").stk_val() != "" && $("#type").stk_val() == "0") {
                if ('${empStr}' != '') {
                    var _relationDiv = document.getElementById("users");
                    _relationDiv.innerHTML = '${empStr}';
                }
            }
        });
    </script>
</head>
<sirm:body>
    <ui:form id="roleConfigForm">
        <input type="hidden" id="roleid" name="roleid" value="${roleid}"/>
        <input type="hidden" id="type" name="type" value="${type}"/>
        当前位置：角色管理 >> 角色详细信息
        <div style="width:99%;height:auto;">
            <div>
                <table class="stk-form-ui-st1">
                    <tr>
                        <td class="hd" width="80">角色名称</td>
                        <td class="bd" width="auto"><%=role != null ? role.getName() : ""%>
                        </td>
                    </tr>
                    <tr>
                        <td class="hd" width="80">角色描述</td>
                        <td class="bd"
                            width="auto"><%=role != null ? role.getDescription() == null ? "" : role.getDescription() : ""%>
                        </td>
                    </tr>
                        <%--<tr>--%>
                        <%--<td class="hd" width="80">角色权限</td>--%>
                        <%--<td class="bd" width="auto">--%>
                        <%--<c:forEach var="Group" varStatus="i" items="${queryList}">--%>
                        <%--<layout:panel title="${Group.name}" collapsible="true">--%>
                        <%--<c:forEach var="twoGroup" varStatus="i" items="${Group.children}">--%>
                        <%--&nbsp;&nbsp;<span style="background-color:pink"> ${twoGroup.name}</span><br/>--%>
                        <%--<c:forEach var="info" varStatus="k" items="${twoGroup.children}">--%>
                        <%--&nbsp;&nbsp;&nbsp;&nbsp;--%>
                        <%--<c:choose>--%>
                        <%--<c:when test="${orgfn:checkRoleFuncRight(roleid,info.id)}">--%>
                        <%--<input type="checkbox" disabled="true" checked="true"/>${info.name}--%>
                        <%--</c:when>--%>
                        <%--<c:otherwise>--%>
                        <%--<input type="checkbox" disabled="true"/>${info.name}--%>
                        <%--</c:otherwise>--%>
                        <%--</c:choose>--%>
                        <%--</c:forEach>--%>
                        <%--<br/>--%>
                        <%--</c:forEach>--%>
                        <%--</layout:panel>--%>
                        <%--<br/>--%>
                        <%--</c:forEach>--%>
                        <%--</td>--%>
                        <%--</tr>--%>
                    <tr>
                        <td class="hd" width="80">人员列表</td>
                        <td class="bd" width="auto">
                            <span id="users" style="width:99%;height:50px"></span>
                        </td>
                    </tr>
                    <tr class="btn-bar">
                        <td class="hd"></td>
                        <td class="bd">
                            <ui:button text="返回">
                                <event:onclick>
                                    closeBtn();
                                </event:onclick>
                            </ui:button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </ui:form>
    <%@include file="../searchorg/selectorginclude.jsp" %>
</sirm:body>
</html>