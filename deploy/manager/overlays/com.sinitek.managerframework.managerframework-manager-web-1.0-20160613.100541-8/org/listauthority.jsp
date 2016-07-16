<%@ page import="com.sinitek.managerframework.org.action.AuthorityAction" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%--
  File Desc:      
  Product Name: SIRM
  Module Name: indicator
  Author:      潘虹
  History:     11-9-29 created by 潘虹
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/orgincludes.jsp" %>
<sirm:page clazz="com.sinitek.managerframework.org.action.AuthorityAction"></sirm:page>
<html>
<head><title>所有权限</title>
</head>
<script type="text/javascript" src="../scripts/org/listauthority.js"></script>
<sirm:body>
    <ui:form id="allMenuForm">
        <c:if test="${not empty groupSettings}">
            <input id="tableName" name="tableName" type="hidden" value="table${groupSettings[0].id}"/>
        </c:if>

        <input id="menuType" name="type" type="hidden" value="1"/>
        <input id="settings" name="settings" type="hidden" value="${settings}"/>
        <table width="400px">
            <tr>
                <td nowrap="nowrap">组织结构</td>
                <td nowrap="nowrap" style="padding-left:10px;padding-right:10px;">
                    <ui:button id="unitbtn" text="选择组织机构">
                        <event:onclick>
                            show('user', 'orgdiv', 'orgtext', 'wwww');
                        </event:onclick>
                    </ui:button>
                </td>
                <td nowrap="nowrap">
                    <div id="orgdiv"></div>
                    <input type="hidden" id="orgtext" name="orgtext"/>
                </td>
                <td nowrap="nowrap" style="width:80%;padding-left:10px;">
                    <ui:button id="searchBtn" text="查询">
                        <event:onclick>
                            sirm.use('sirm.org', function(org) {
                            org.search();
                            });
                        </event:onclick>
                    </ui:button>
                    <ui:button id="sortBtn" text="显示顺序设置">
                        <event:onclick>
                            sirm.use('sirm.org', function(org) {
                            org.showSortWindow(${settings});
                            });
                        </event:onclick>
                    </ui:button>
                </td>

            </tr>
        </table>
    </ui:form>
    <layout:window id="authSortWindow" width="300px">
        <ui:form id="authSortForm" clazz="com.sinitek.managerframework.org.action.AuthorityAction" method="saveAuthSort">
            <div style="padding:10px;" align="center">
                <ui:doubleSelect id="authSort" name="authSort" selectTitle="排序"/>
                <script type="text/javascript">
                    $(document).ready(function () {
                        $("#authSort_r").unbind("dblclick");
                    });
                </script>
                <ui:button text="保存">
                    <event:onclick>
                        sirm.use('sirm.org', function(org) {
                        org.saveAuthSort();
                        });
                    </event:onclick>
                </ui:button>
            </div>
        </ui:form>
    </layout:window>
    <layout:tabs id="demo" width="100%">
        <c:forEach items="${groupSettings}" var="groupSetting" varStatus="i">
        <layout:tab title="${groupSetting.name}" id="tab${groupSetting.id}">
            <c:if test="${i.index == 0}">
                <input id="initName" name="initName" type="hidden" value="table${groupSetting.id}"/>
                <jsp:include page="/${groupSetting.url}">
                    <jsp:param name="initflag" value="true"></jsp:param>
                    <jsp:param name="tabIndex" value="${groupSetting.id}"></jsp:param>
                </jsp:include>
            </c:if>
            <c:if test="${i.index != 0}">
                <jsp:include page="/${groupSetting.url}">
                    <jsp:param name="initflag" value="false"></jsp:param>
                    <jsp:param name="tabIndex" value="${groupSetting.id}"></jsp:param>
                </jsp:include>
            </c:if>
        </layout:tab>
        </c:forEach>
        <event:ontabselect tabVar="tab">
            var tabid = tab.id.substr(3);
            var table = $("#table"+tabid);
            $("#tableName").stk_val("table"+tabid);
            table.stk_query();
        </event:ontabselect>
    </layout:tabs>
    <jsp:include page="/org/searchorg/selectorginclude.jsp"/>
</sirm:body>
</html>