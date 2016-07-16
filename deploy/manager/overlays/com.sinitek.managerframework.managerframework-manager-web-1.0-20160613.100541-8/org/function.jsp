<%@ page import="com.sinitek.managerframework.org.action.AuthorityAction" %>
<%@ page import="java.util.Map" %>
<%--
  File Desc:      
  Product Name: SIRM
  Module Name: indicator
  Author:      潘虹
  History:     11-9-29 created by 潘虹
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/orgincludes.jsp" %>
    <ui:tablefix id="table${param.tabIndex}" actionClass="com.sinitek.managerframework.function.action.FunctionInfoAction" fixWidth="410px"
                 nowrap="true" queryForm="allMenuForm" allowExport="true" pageSize="200" exportFileName="权限报表-功能权限" allowInit="${param.initflag}">
        <ui:col mergeCol="true" property="first" title="一级分类" fixed="true" group="功能类型" width="100px" align="left" allowSort="true" allowTip="true"/>
        <ui:col mergeCol="true" property="second" title="二级分类" fixed="true" group="功能类型" width="120px" align="left" allowSort="true" allowTip="true"/>
        <ui:col property="third" title="功能名称" fixed="true" group="功能类型" width="150px" align="left" allowSort="true" allowTip="true"/>
        <ui:col property="user" title="使用对象" width="100%" align="left" allowSort="true" allowTip="true"/>
    </ui:tablefix>