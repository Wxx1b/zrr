<%--
  File Desc:
  Product Name: SIRM
  Module Name: indicator
  Author:      潘虹
  History:     11-4-26 created by 潘虹
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/orgincludes.jsp" %>
<html>
<head><title>用户管理</title></head>
<sirm:body>
<script type="text/javascript" src="../scripts/org/userinfo.js">
</script>
<script type="text/javascript">
</script>
<ui:form id="queryForm">
    <div align="center">
    <ui:button text="人员导入">
        <event:onclick>
            showEmpImportWindow();
        </event:onclick>
    </ui:button>
    </div>
</ui:form>

<%@include file="searchorg/selectorginclude.jsp" %>
<%@include file="searchorg/selectunitinclude.jsp" %>
<%--<%@include file="test.jsp" %>--%>
</sirm:body>
</html>