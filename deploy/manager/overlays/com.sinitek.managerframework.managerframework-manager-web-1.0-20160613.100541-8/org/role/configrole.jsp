<%@ page import="java.util.List" %>
<%@ page import="com.sinitek.base.common.api.CommonAPIFactory" %>
<%@ page import="com.sinitek.managerframework.org.common.bean.Role" %>
<%@ page import="com.sinitek.managerframework.org.common.api.IOrgService" %>
<%@ page import="com.sinitek.managerframework.function.common.api.IFunctionService" %>
<%--
  File Desc:      
  Product Name: SIRM
  Module Name: org
  Author:      潘虹
  History:     11-7-25 created by 潘虹
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/orgincludes.jsp" %>
<%@ taglib prefix="orgfn" uri="http://www.sinitek.com/sirm/org/func" %>
<%
    String roleid = request.getParameter( "roleid" );
    String type = request.getParameter( "type" );
    Role role = ( ( IOrgService ) CommonAPIFactory.getInstance().getCommonAPI( IOrgService.class ) ).getRoleById( roleid );
    List queryList = ( ( IFunctionService ) CommonAPIFactory.getInstance().getCommonAPI( IFunctionService.class ) ).findAllFunction();
    pageContext.setAttribute( "roleid", roleid );
    pageContext.setAttribute( "queryList", queryList );
%>
<html>
<head><title>权限配置页面</title>
    <script type="text/javascript">
        function saveRoleConfig() {
            if ($("input:checked[name='infos']").length > 0) {
                $("#roleForm").stk_submit(function (result) {
                    var strP = /^\d+$/;
                    if (result != "") {
                        if (!strP.test(result))
                            stk.alert(result);
                        else if ($("#type").stk_val() == "0")
                            window.location = sirm.jsurl("/org/role/configemployee.jsp?roleid=" + result + "&type=0");
                        else
                            window.location = sirm.jsurl("/org/role/listrole.jsp");
                    }
                });
            } else {
                stk.alert("请选择权限");
            }
        }

        function closeBtn() {
            window.location = sirm.jsurl("/org/role/listrole.jsp");
        }

        /**
         *全选
         * @param infoname
         */
        function checkInfos(infoname) {
            var twoInfo = $("#" + infoname).prop("checked");
            $("input[title=" + infoname + "]").each(function (i, cb) {
                $(cb).prop("checked", twoInfo);
            });

        }
    </script>
</head>
<sirm:body>
    <ui:form id="roleForm" clazz="com.sinitek.managerframework.org.action.RoleFormAction" method="saveRoleConfig">
        <input type="hidden" id="type" name="type" value="${param.type}"/>
        <input type="hidden" id="roleid" name="roleid" value="${param.roleid}"/>
        当前位置：角色管理 >> 权限配置(<%=role != null ? role.getName() : ""%>)
        <div style="width:99%">
            <div>
                <table class="stk-form-ui-st1">
                    <tr>
                        <td class="bd" width="auto">
                            <c:forEach var="Group" varStatus="i" items="${queryList}">
                                <layout:panel title="${Group.name}" collapsible="true">
                                    <c:forEach var="twoGroup" varStatus="i" items="${Group.children}">
                                        &nbsp;&nbsp;
                                        <ui:checkbox name="twoGroup" id="infos_${twoGroup.id}">
                                            <event:onclick> checkInfos('infos_${twoGroup.id}');</event:onclick>
                                        </ui:checkbox>
                                        <span style="background-color:pink"> ${twoGroup.name}</span><br/>
                                        <c:forEach var="info" varStatus="k" items="${twoGroup.children}">
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <%--<c:choose>
                                                <c:when test="${orgfn:checkRoleFuncRight(roleid,info.id)}">
                                                    <ui:checkbox title="infos_${twoGroup.id}" name="infos"
                                                                 id="info_${info.id}" value="${info.id}"
                                                                 label=" ${info.name}" checked="true"></ui:checkbox>
                                                </c:when>
                                                <c:otherwise>
                                                    <ui:checkbox title="infos_${twoGroup.id}" name="infos"
                                                                 id="info_${info.id}" value="${info.id}"
                                                                 label=" ${info.name}"></ui:checkbox>
                                                </c:otherwise>
                                            </c:choose>--%>
                                        </c:forEach><br/>
                                    </c:forEach>
                                </layout:panel><br/>
                            </c:forEach>
                        </td>
                    </tr>
                    <tr class="btn-bar">
                        <td class="bd">
                            <ui:button id="" text="提交">
                                <event:onclick>
                                    saveRoleConfig();
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
</sirm:body>
</html>