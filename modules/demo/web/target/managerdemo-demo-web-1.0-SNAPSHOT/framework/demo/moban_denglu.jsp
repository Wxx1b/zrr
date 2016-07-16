<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>模板 - 报告</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body id="body-bg">
<section class="login-sec">
    <article class="message">
    	<p class="error">请输入密码</p>
    </article>
	<article class="login-article">
    	<ul>
        	<li class="username"><label for="J_username">&nbsp;</label><input id="J_username" type="text" /></li>
            <li class="password"><label for="J_password">&nbsp;</label><input id="J_password" type="password" /> </li>
            <li class="savelogin"><label>&nbsp;<input name="" type="checkbox" value="">一个月之内免登陆</label></li>
        </ul>
        <aside class="login-submit-button"><button>&nbsp;</button>&nbsp;&nbsp;<a href="#">忘记密码？</a></aside>
    </article>
</section>
</body>
</html>