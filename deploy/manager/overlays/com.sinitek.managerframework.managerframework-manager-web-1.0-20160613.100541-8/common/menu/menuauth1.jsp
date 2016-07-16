<%@ page import="com.sinitek.spirit.web.sysmenu.ISysMenu" %>
<%@ page import="com.sinitek.spirit.web.sysmenu.SysMenuContext" %>
<%@ page import="java.util.List" %>
<%--
  File Desc:      
  Product Name: SIRM
  Module Name: org
  Author:      潘虹
  History:     11-5-11 created by 潘虹
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../includes/commonincludes.jsp" %>
<%
    List<ISysMenu> topMenus = SysMenuContext.getInstance().getTopMenus("DEFAULT");

    pageContext.setAttribute("topMenus", topMenus);
%>
<style type="text/css">
    a:link.menuitem {text-decoration:none; color:black; border-bottom: 1px #0099CC dashed;}
    a:visited.menuitem {text-decoration:none; color:black; border-bottom: 1px #0099CC dashed;}
    a:hover.menuitem {text-decoration:none; color:black; border-bottom: 1px #0099CC solid;}
    a:active.menuitem {text-decoration:none; color:black; border-bottom: 1px #0099CC solid;}
</style>

<html>
<head><title>菜单授权</title>
<script type="text/javascript">
//        function callbackfnc(rootid){
//            alert("callbackfnc="+rootid);
//        }
function gettypeentity() {
    return  "SPRT_SYSMENU,FUNCTIONINFO:ACCESS";
}
/**
 * 按菜单配置 选中菜单节点
 * @param obj 选中项
 */
function checkMenu(obj, all) {
    checkchildren(obj, all);
    checkMenuParent(obj, all);
}
function checkMenuParent(obj, all) {
    var _id = $(obj).prop("id");
    var _name = $(obj).prop("name");
    var _isbool = $(obj).prop("checked");
    //递归选中父节点
    if (all) {
        if (_isbool) {
            //获取当前节点
            $paren = $("#" + _name);
            $paren.prop("checked", _isbool);
            if ($paren.prop("name") != "tab_0")
                checkMenuParent($paren, true);
        }
    }
}

function checkchildren(obj, all) {
    var _id = $(obj).prop("id");
    var _name = $(obj).prop("name");
    var _isbool = $(obj).prop("checked");
    //遍历所有子checkbox，前提是该节点打开。
    if (all) {
        $("#menutable input[name='" + _id + "']").each(function () {
            $(this).prop("checked", _isbool);
            checkchildren($(this), true);
        });
    }
}

function menuauthtoorg(objid) {
    $(document).stk_go("${contextPath}/common/menu/menutoorg.jsp", "对象设置授权");
}
</script>
</head>
<sirm:body>
    <div id="ctab1">
        <%--<ui:form id="orgForm" clazz="com.sinitek.managerframework.org.action.MenuTreeAction" method="orgAuth">--%>
            <div id="menutable">
                <c:forEach items="${topMenus}" varStatus="i" var="topMenu">
                    <layout:panel title="${topMenu.name}" collapsible="true">
                        <input class="_listauth" type="checkbox" id="tab_${topMenu.id}" name="tab_0"
                               value="${topMenu.id}:SPRT_SYSMENU:ACCESS" onclick="checkMenu(this,true)"/>
                        <%--onclick="checkMenu(this,false)"--%>
                        <span>${topMenu.name}</span><br/>
                        <c:forEach items="${topMenu.children}" varStatus="j" var="secondMenu">
                            &nbsp;&nbsp;
                            <input class="_listauth" type="checkbox" id="second_${secondMenu.id}"
                                   name="tab_${topMenu.id}" value="${secondMenu.id}:SPRT_SYSMENU:ACCESS"
                                   onclick="checkMenu(this,true)"/>
                            <span style="background-color:pink">${secondMenu.name}</span><br/>
                            <c:forEach items="${secondMenu.children}" varStatus="k" var="thirdMenu">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input class="_listauth" type="checkbox" id="third_${thirdMenu.id}"
                                       name="second_${secondMenu.id}" value="${thirdMenu.id}:SPRT_SYSMENU:ACCESS"
                                       onclick="checkMenu(this,true)"/>
                                <span><a class="menuitem" href="javascript:void(0);"
                                         onclick="showAuth('${thirdMenu.id}','${thirdMenu.name}')">${thirdMenu.name}</a></span>
                                <br/>
                                    <orgfn:loadFunction menuId="${thirdMenu.id}" var="allFunctions"/>
                                    <c:forEach items="${allFunctions}" var="function">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input class="_listauth" type="checkbox" id="fourth_${function.objid}"
                                           name="third_${thirdMenu.id}" value="${function.objid}:FUNCTIONINFO:ACCESS"
                                           onclick="checkMenu(this,true)"/>
                                        <span><a class="menuitem" href="javascript:void(0);"
                                             onclick="showFunctionAuth('${function.objid}','${function.name}')">${function.name}</a></span>
                                    </c:forEach>
                                    <c:if test="${not empty allFunctions}"><br/></c:if>
                            </c:forEach>
                            <br/>
                        </c:forEach>
                    </layout:panel><br/>
                </c:forEach>
            </div>
        <%--</ui:form>--%>
    </div>

    <jsp:include page="../include/objectright.jsp">
        <jsp:param name="rightdefinekey" value="SPRT_SYSMENU"/>
    </jsp:include>
</sirm:body>
</html>