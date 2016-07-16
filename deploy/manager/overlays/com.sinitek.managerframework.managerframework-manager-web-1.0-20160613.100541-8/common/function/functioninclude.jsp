<%@ page import="java.util.List" %>
<%@ page import="com.sinitek.base.common.api.CommonAPIFactory" %>
<%@ page import="com.sinitek.managerframework.function.common.api.IFunctionService" %>
<%--
  File Desc:
  Product Name: SIRM
  Module Name: indicator
  Author:      潘虹
  History:     11-11-14 created by 潘虹
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/org/includes/orgincludes.jsp" %>
<%@ taglib prefix="orgfn" uri="http://www.sinitek.com/sirm/org/func" %>
<link href="${contextPath}/org/css/org.css" type="text/css" rel="stylesheet">
<style type="text/css">
    a:link.menuitem {
        text-decoration: none;
        color: black;
        border-bottom: 1px #0099CC dashed;
    }

    a:visited.menuitem {
        text-decoration: none;
        color: black;
        border-bottom: 1px #0099CC dashed;
    }

    a:hover.menuitem {
        text-decoration: none;
        color: black;
        border-bottom: 1px #0099CC solid;
    }

    a:active.menuitem {
        text-decoration: none;
        color: black;
        border-bottom: 1px #0099CC solid;
    }
</style>
<org:OrgTreeTag orglist="orgtreelist"/>
<%
    List queryList = ( ( IFunctionService ) CommonAPIFactory.getInstance().getCommonAPI( IFunctionService.class ) ).findAllFunction();
    pageContext.setAttribute( "queryList", queryList );
%>
<html>
<head><title>组织结构授权功能页面</title>

    <script type="text/javascript">
        function gettypeentity() {
            return "FUNCTIONINFO:ACCESS";
        }
        function checkMenu(obj, all) {
            checkchildren(obj, all);
        }

        function checkchildren(obj, all) {
            var _id = $(obj).attr("id");
            var _name = $(obj).attr("name");
            var _isbool = $(obj).prop("checked");
            //遍历所有子checkbox，前提是该节点打开。
            if (all) {
                $("#menutable input[name='" + _id + "']").each(function () {
                    $(this).prop("checked", _isbool);
                });
            }
        }
    </script>
</head>
<sirm:body>
    <div id="menutable">
        <c:forEach var="Group" varStatus="i" items="${queryList}">
            <layout:panel title="${Group.name}" collapsible="true">
                <c:forEach var="twoGroup" varStatus="i" items="${Group.children}">
                    <input class="_listauth" type="checkbox" id="infos_${twoGroup.id}"
                           value="-"
                           onclick="checkMenu(this,true)"/>
                    <span style="background-color:pink"> ${twoGroup.name}</span><br/>
                    <c:forEach var="info" varStatus="k" items="${twoGroup.children}">
                        &nbsp;&nbsp;
                        <c:set var="sort" value="${info.sort}"/>
                        <input class="_listauth" type="checkbox" id="info_${info.id}"
                               name="infos_${twoGroup.id}" value="${info.id}:FUNCTIONINFO:ACCESS"/>
                        <span><a class="menuitem" href="javascript:void(0);"
                                 onclick="showAuth('${info.id}','${info.name}')">${info.name}</a></span>
                    </c:forEach><br/>
                </c:forEach>
            </layout:panel><br/>
        </c:forEach>
    </div>

    <jsp:include page="../include/objectright.jsp">
        <jsp:param name="rightdefinekey" value="FUNCTIONINFO"/>
    </jsp:include>
</sirm:body>
</html>