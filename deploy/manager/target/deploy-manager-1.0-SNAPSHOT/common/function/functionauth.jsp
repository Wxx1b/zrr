<%--
  Created by IntelliJ IDEA.
  User: sinitek
  Date: 12-12-12
  Time: 下午5:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../includes/commonincludes.jsp" %>
<html>
<head>
    <title>功能授权</title>
</head>

<sirm:body>
    <table id="tcontain" width="100%">
        <tr>
            <td style="vertical-align:top;">
                <jsp:include page="/common/include/setauth.jsp">
                    <jsp:param name="page" value="${contextPath}/common/function/functioninclude.jsp?_ssid_=${_ssid_}"/>
                </jsp:include>
            </td>
        </tr>
    </table>
</sirm:body>
</html>