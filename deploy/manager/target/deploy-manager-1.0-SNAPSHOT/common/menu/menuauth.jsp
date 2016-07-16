<%--
  File Desc:      
  Product Name: SIRM
  Module Name: org
  Author:      潘虹
  History:     11-5-11 created by 潘虹
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../includes/commonincludes.jsp" %>
<%@ taglib prefix="org" uri="http://www.sinitek.com/sirm/org/tag" %>

<html>
<head>
    <title>菜单授权</title>
</head>
<body style="margin:10px 10px 0px 10px;">
<table id="tcontain" width="100%">
    <tr>
        <td style="vertical-align:top;">
            <jsp:include page="/common/include/setauth.jsp">
                <jsp:param name="page" value="${contextPath}/common/menu/menuauth1.jsp?_ssid_=${_ssid_}"/>
            </jsp:include>
        </td>
    </tr>
</table>
</body>
</html>