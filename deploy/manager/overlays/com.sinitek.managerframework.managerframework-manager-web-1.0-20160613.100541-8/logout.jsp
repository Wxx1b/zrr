<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%@ page import="com.sinitek.managerframework.setting.common.context.SettingUtils" %>
<%--
  描述: 退出系统之后会先进入这个页面。项目根据实际情况在这个页面做清除认证的操作
  User: 王志华
  Date: 11-9-23
  Time: 下午6:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.invalidate();
    String redirecturl = SettingUtils.getStringValue( "FRAMEWORK", "APP.LOGOUT.REDIRECTURL" );
    if ( StringUtils.isBlank( redirecturl ) )
    {
        String logonurl = SettingUtils.getStringValue( "FRAMEWORK", "APP.LOGONURL" );
        if ( redirecturl == null )
        {
            redirecturl = request.getContextPath() + "/action.jsp";
        }
    }
    response.sendRedirect( redirecturl );

//    String param = StringUtil.safeToString(request.getParameter("param"),"");
//    if (logonurl == null){
//        logonurl = "/action.jsp";
//    }
//    if(!param.isEmpty()){
//        logonurl = logonurl+"?logoutparam="+param;
//    }
//    response.sendRedirect(logonurl);
%>
