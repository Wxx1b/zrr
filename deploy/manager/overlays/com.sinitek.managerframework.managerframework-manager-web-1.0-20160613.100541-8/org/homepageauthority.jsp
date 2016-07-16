<%@ page import="com.sinitek.managerframework.org.action.AuthorityAction" %>
<%--
  File Desc:      
  Product Name: SIRM
  Module Name: indicator
  Author:      李琦明
  History:     14-5-26 created by 李琦明
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/orgincludes.jsp" %>

    <ui:tablefix id="table${param.tabIndex}" actionClass="com.sinitek.managerframework.org.action.HomeAuthorityAction" fixWidth="300px"
                 nowrap="true" queryForm="allMenuForm" allowExport="true" pageSize="200" exportFileName="权限报表-首页权限" allowInit="${param.initflag}">
        <ui:col mergeCol="true" property="first" title="功能名称" fixed="true"  width="300px" align="left" allowSort="true" allowTip="true"/>
        <ui:col property="user" title="使用对象" width="100%" align="left" allowSort="true" allowTip="true"/>
    </ui:tablefix>
