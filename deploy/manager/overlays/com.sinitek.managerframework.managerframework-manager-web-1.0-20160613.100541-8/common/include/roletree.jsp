<%--
  Created by IntelliJ IDEA.
  Author: 冯奕骅
  Date: 2015/3/30
  Time: 15:03
--%>
<%@include file="/framework/include/head.jsp" %>
<%--<%@include file="/org/treehead.jsp" %>--%>
<%--<%@include file="/framework/include/innerHead.jsp" %>--%>
<%@include file="/framework/include/sirmHead.jsp" %>
<script type="javascript" src="${contextPath}/scripts/org/org.js"></script>
<link href="${contextPath}/org/css/org.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="${contextPath}/framework/js/stk-frame.js"></script>
<sirm:page clazz="com.sinitek.managerframework.menu.action.MenuTreeAction"></sirm:page>
<script type="text/javascript">
    var roleTree =${result};
</script>
<ui:tree jsList="roleTree" id="_listauth_role_collectionTreeId"/>