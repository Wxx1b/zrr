<%@ page import="com.sinitek.spirit.webcontrol.common.FrameworkConfig" %>
<%@ taglib prefix="ui" uri="http://www.sinitek.com/spirit/taglib/ui" %>
<%@ taglib prefix="event" uri="http://www.sinitek.com/spirit/taglib/event" %>
<%@ taglib prefix="func" uri="http://www.sinitek.com/spirit/taglib/function" %>
<%@ taglib prefix="layout" uri="http://www.sinitek.com/spirit/taglib/layout" %>
<%@ taglib prefix="param" uri="http://www.sinitek.com/spirit/taglib/param" %>
<%@ taglib prefix="plugin" uri="http://www.sinitek.com/spirit/taglib/plugin" %>
<%@ taglib prefix="chart" uri="http://www.sinitek.com/spirit/taglib/chart" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="orgfn" uri="http://www.sinitek.com/sirm/org/func" %>
<%request.setAttribute("contextPath",request.getContextPath());%>
<%request.setAttribute("path",request.getContextPath());%>
<c:if test="${empty requestScope._innerheadinclude_ and empty param._innerheadinclude_}">
<!DOCTYPE html>
</c:if>

<%--<c:if test="${empty themeName}">--%>
    <%--<%--%>
        <%--request.setAttribute("themeName", FrameworkConfig.getInstance().getConfig().get("default-theme"));--%>
    <%--%>--%>
<%--</c:if>--%>