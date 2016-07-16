<%--
  Created by IntelliJ IDEA.
  User: HF.fay
  Date: 14-6-24
  Time: 13:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/commonincludes.jsp" %>
<sirm:page clazz="com.sinitek.managerframework.menu.action.MenuAction" method="getMenuInfo"></sirm:page>

<html>
<head>
    <title></title>
    <script type="text/javascript">

        function selectTreeNode(code, name, functionName, url, ms, pid, icon, type) {
            window.parent.selectNode(code, '');
        }

        $(document).ready(function () {
            if (${objid != 0}) {
                var nodeinfo = window.parent.getNodeInfo('${objid}');
                var maxlevel = window.parent.getMaxLevel();

                if (nodeinfo) {
                    if (maxlevel != -1 && nodeinfo.level >= maxlevel) {
                        $("#childmenudiv").stk_hide();
                        $("#menuinfodiv").css("width", "600px");
                        return;
                    }
                }
            }
            $("#childmenudiv").stk_show();
        });
    </script>
</head>
<sirm:body>
    <%--------  展示页面  -----%>
    <%-------------------------%>

    <div>
        <table>
            <tr>
                <td valign="top">
                    <layout:panel title="菜单信息">
                        <div id="menuinfodiv">
                            <table class="stk-form-ui-st1">
                                <tr>
                                    <td class="hd" width="110px">菜单路径</td>
                                    <td class="bd" width="auto"><label
                                            id="cdname">${not empty cdname ? cdname : "主菜单"}</label></td>
                                </tr>
                                <tr>
                                    <td class="hd" width="110px">名称</td>
                                    <td class="bd" width="auto"><ui:label id="qname">${qname}</ui:label></td>
                                </tr>
                                <tr>
                                    <td class="hd" width="110px">Url</td>
                                    <td class="bd" width="auto"><ui:label id="qurl">${qurl}</ui:label></td>
                                </tr>
                                <tr>
                                    <td class="hd" width="110px">样式</td>
                                    <td class="bd" width="auto"><ui:label id="qstyle">${qstyle}</ui:label></td>
                                </tr>
                                <tr>
                                    <td class="hd" width="110px">描述</td>
                                    <td class="bd" width="auto"><ui:label
                                            id="description">${description}</ui:label></td>
                                </tr>
                            </table>
                        </div>
                    </layout:panel>
                        <%--<layout:panel title="" collapsible="false" id="view2" name="view2">--%>
                    <c:if test="${not empty qurl}">
                        <%@include file="managemenu_right_urlinclude.jsp" %>
                    </c:if>
                    <c:if test="${empty qurl}">
                        <%@include file="managemenu_right_dirinclude.jsp" %>
                    </c:if>
                    <c:choose>
                        <c:when test=""/>
                    </c:choose>

                </td>
            </tr>
        </table>
    </div>


    <jsp:include page="../include/objectright.jsp">
        <jsp:param name="rightdefinekey" value="SPRT_SYSMENU"/>
    </jsp:include>
</sirm:body>
</html>