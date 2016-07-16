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
<%@ page import="com.sinitek.managerframework.org.common.bean.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/orgincludes.jsp" %>
<%
    String roleid = request.getParameter( "roleid" );
    String type = request.getParameter( "type" );
    pageContext.setAttribute( "type", NumberTool.safeToInteger( type, 0 ) );
    Role role = ( ( IOrgService ) CommonAPIFactory.getInstance().getCommonAPI( IOrgService.class ) ).getRoleById( roleid );
    List<Employee> emplist = null;
    if ( !"".equals( roleid ) )
    {
        String empStr = "";
        emplist = ( ( IOrgService ) CommonAPIFactory.getInstance().getCommonAPI( IOrgService.class ) ).findEmployeeByRoleId( roleid );
        for ( int i = 0; i < emplist.size(); i++ )
        {
            Employee emp = emplist.get( i );
            if ( empStr == "" )
            {
                empStr += emp.getId() + ":" + emp.getEmpName() + ":8";
            } else
            {
                empStr += "," + emp.getId() + ":" + emp.getEmpName() + ":8";
            }
        }
        pageContext.setAttribute( "empStr", empStr );
        pageContext.setAttribute( "roleid", NumberTool.safeToInteger( roleid, 0 ) );
    }
%>
<html>
<head><title>人员配置页面</title>
    <script type="text/javascript">
        function saveEmpConfig() {
            $("#roleForm").stk_submit(function (result) {
                var strP = /^\d+$/;
                if (result != "") {
                    if (!strP.test(result))
                        stk.alert(result);
                } else if ($("#type").stk_val() == "0")
                    window.location = sirm.jsurl("/org/role/viewroleinfo.jsp?roleid=${roleid}&type=0");
                else
                    window.location = sirm.jsurl("/org/role/listrole.jsp");
            });
        }
        function closeBtn() {
            window.location = sirm.jsurl("/org/role/listrole.jsp");
        }
        $(document).ready(function () {
            if ($("#type").stk_val() != "" && $("#type").stk_val() == "1") {
                if ('${empStr}' != '')
                    showframe('user', 'users', 'rolehidden', 'wwww', '${empStr}', 'true');
                $("#rolehidden").stk_val('${empStr}');
            }
        });
    </script>
</head>
<sirm:body>
    <ui:form id="roleForm" clazz="com.sinitek.managerframework.org.action.RoleFormAction" method="saveEmpConfig">
        <input type="hidden" id="type" name="type" value="${type}"/>
        <input type="hidden" id="EmpRoleid" name="EmpRoleid" value="${roleid}"/>
        <input type="hidden" id="config" name="config" value="true"/>
        当前位置：角色管理 >> 人员配置
        <div style="width:510px">
            <div>
                <table class="stk-form-ui-st1">
                    <tr>
                        <td class="hd" width="80">角色名称</td>
                        <td class="bd" width="auto"><%=role != null ? role.getName() : ""%>
                        </td>
                    </tr>
                    <tr>
                        <td class="hd" width="80">人员配置</td>
                        <td class="bd" width="auto"><ui:button text="选择人员">
                            <event:onclick>
                                show('user','users','rolehidden','wwww','true');
                            </event:onclick>
                        </ui:button>
                        </td>
                    </tr>
                    <tr>
                        <td class="hd" width="80"></td>
                        <td class="bd" width="auto">
                            <div id="users" style="width:99%;"></div>
                            <input id="rolehidden" name="rolehidden" type="hidden"/></td>
                    </tr>
                    <tr class="btn-bar">
                        <td class="hd"></td>
                        <td class="bd">
                            <ui:button id="" text="提交">
                                <event:onclick>
                                    saveEmpConfig();
                                </event:onclick>
                            </ui:button>
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