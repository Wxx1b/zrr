<%--<%@ page import="com.sinitek.spirit.um.client.*" %>--%>
<%@ page import="com.sinitek.util.ThreadLocalRegister" %>
<%--<%@ page import="com.sinitek.managerframework.um.common.client.*" %>--%>
<%@ page import="com.sinitek.managerframework.um.common.context.*" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 13-9-12
  Time: 下午2:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UserSession s = UMFactory.getUMClient().getSession();
    //UserSession s = UMClientImpl.getInstance().openSession("1dmi2", "1");
    out.println(s == null);

    Cookie[] cookies = request.getCookies();
    if (cookies != null && cookies.length > 0){
        for(Cookie c : cookies){
            out.println(c.getName() + "=" + c.getValue() + "<br/>");
        }
    }

    String sessionId = (String) ThreadLocalRegister.getAttribute("sessionId");
    out.println("sessionId:" + sessionId + "<br/>");
    if (sessionId == null) {
        Cookie sessionCookie = getSessionCookie(request);
        out.println("sessionCookie is null?" + (sessionCookie == null) + "<br/>");
        if (sessionCookie != null) {
            out.println("sessionId:" + sessionCookie.getValue() + "<br/>");
            sessionId = sessionCookie.getValue();
            ThreadLocalRegister.setAttribute("sessionId", sessionId);
        }
    }
%>

<%!
    private Cookie getSessionCookie(HttpServletRequest request)
  {
    Cookie[] cookies = request.getCookies();
    if (cookies == null) return null;
    for (Cookie cookie : cookies) {
      if ("USESSIONID".equals(cookie.getName()))
        return cookie;
    }
    return null;
  }
%>