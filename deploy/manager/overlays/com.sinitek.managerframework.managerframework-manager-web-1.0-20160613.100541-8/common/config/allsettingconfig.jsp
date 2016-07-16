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
<html>
<head>
    <title>参数配置</title>
</head>
<sirm:body>
    <table width="100%">
        <tr>
            <td style="vertical-align:top;">
                <jsp:include page="/common/include/groupsetting.jsp">
                    <jsp:param name="catalogcode" value="${param.catalogcode}"/>
                </jsp:include>
            </td>
        </tr>
    </table>
</sirm:body>
</html>