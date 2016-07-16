<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 12-9-19
  Time: 下午4:45
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ taglib prefix="org" uri="http://www.sinitek.com/sirm/org/tag" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/framework/include/head.jsp" %>
<%--<%@include file="/org/treehead.jsp" %>--%>
<%--<%@include file="/framework/include/innerHead.jsp" %>--%>
<%@include file="/framework/include/sirmHead.jsp" %>
<script type="javascript" src="${contextPath}/scripts/org/org.js"></script>
<link href="${contextPath}/org/css/org.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="${contextPath}/framework/js/stk-frame.js"></script>
<sirm:page clazz="com.sinitek.managerframework.org.action.SearchUnitAction"></sirm:page>
<script type="text/javascript">
    var allTree =${result};
</script>
<ui:tree jsList="allTree" id="_listauth_collectionTreeId" width="310px" height="280px"></ui:tree>
