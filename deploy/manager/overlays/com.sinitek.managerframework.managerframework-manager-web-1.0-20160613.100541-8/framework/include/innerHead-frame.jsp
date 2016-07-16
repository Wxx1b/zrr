<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<c:set var="contextPath" value="${pageContext.request.contextPath}"/>--%>
<c:if test="${empty requestScope._innerheadinclude_ and empty param._innerheadinclude_}">
    <c:set var="_innerheadinclude_" value="1" scope="request"/>
    <%--<link href="${contextPath}/framework/css/${themeName}/frame.css" type="text/css" rel="stylesheet">--%>
    <%--<script type="text/javascript" src="${contextPath}/framework/js/stk-frame.js"></script>--%>
</c:if>

