<%--
作者: 王志华
日期: 11-4-26
时间: 下午11:21
描述: 登录界面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="framework/include/head.jsp" %>
<c:set var="themeName" value="default" scope="request"/>
<%@ include file="framework/include/innerHead.jsp" %>
<script type="text/javascript" src="${contextPath}/sirm/js/rsa.js"></script>
<%@ taglib uri="http://www.sinitek.com/sirm/framework/tag" prefix="framework" %>
<framework:loadlogonpageinfo var="pi"/>
<html>
<head>
<title>${empty setting.SIRM_TITLE ? '携宁工作管理平台' : setting.SIRM_TITLE}</title>
<style>
    .overlay {
        -webkit-box-align: center;
        -webkit-box-pack: center;
        -webkit-transition: 0.25s opacity;
        -moz-transition: 0.25s opacity;
        transition: 0.25s opacity;
        filter: progid:DXImageTransform.Microsoft.gradient(enabled = 'true', startColorstr = '#4C999999', endColorstr = '#07999999');
        background: -webkit-radial-gradient(rgba(127, 127, 127, 0.5), rgba(127, 127, 127, 0.5) 35%, rgba(0, 0, 0, 0.7));
        background: -moz-radial-gradient(rgba(127, 127, 127, 0.5), rgba(127, 127, 127, 0.5) 35%, rgba(0, 0, 0, 0.7));
        bottom: 0;
        display: block;
        display: -webkit-box;
        display: -moz-box;
        display: box;
        left: 0;
        position: fixed;
        *position: absolute;
        *width: 100%;
        *height: 100%;
        right: 0;
        top: 0;
        z-index: 1000;
    }

    .overlay .ie {
        background: #fff;
        filter: alpha(opacity = 0);
        opacity: 0;
        position: absolute;
        position: fixed;
        z-index: -1;
        width: 100%;
        height: 100%;
    }

    .transparent {
        opacity: 0;
    }

    .support_bg_add, .language_box {
        -webkit-box-shadow: 0px 5px 80px #505050;
        -moz-box-shadow: 0px 5px 80px #505050;
        box-shadow: 0px 5px 80px #505050;
        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        border-radius: 5px;
    }

    body {
        height: 100% !important
    }

    html {
        height: 100%
    }
</style>
<script type="text/javascript">
    (function () {
        if (top.location != document.location) {
            top.location = document.location;
        }
        else {
            $(document).ready(function () {
                var loginBtn = $('#loginBtn'),
                        loginForm = $('#logonForm'),
                        inputs = loginForm.find('input', 'button'),
                        username = $("#J_username"),
                        pwd = $("#J_password"),
                        articleMsg = $("#articleMsg"),
                        msg = $("#msg"),
                        loginBtnOnClick = function () {
                            if (!validateForm()) {
                                return false;
                            }

                            loginBtn.unbind('click', loginBtnOnClick);
                            loginBtn.css({
                                background: 'url(${contextPath}/common/css/common/images/icon/wait.gif) no-repeat 0 0',
                                paddingLeft: '2em',
                                width: 'auto'
                            });
                            loginBtn.html('正在登录……');
                            $("#J_password2").val(rsa($("#J_password").val()));
//                            $("#J_password2").val($("#J_password").val());

                            loginForm[0].submit();

                            inputs.attr('disabled', 'disabled');
                        },
                        validateForm = function () {
                            articleMsg.hide();
                            msg.empty();
                            if (!$.trim(username.val())) {
                                articleMsg.show();
                                msg.html("请输入用户名");
                                username.focus();
                                return false;
                            }

                            if (!$.trim(pwd.val())) {
                                articleMsg.show();
                                msg.html("请输入密码");
                                pwd.focus();
                                return false;
                            }
                            return true;
                        };
                $("#J_username").focus();
                $("#J_username,#J_password").keypress(function (e) {
                    if (e.which == 13) {
                        loginBtn.click();
                    }
                });
                //密码框禁止粘贴
                $("#J_password").bind("paste",function(e){
                    return false;
                });
                // 获取自动登录标识
                loginBtn.click(loginBtnOnClick);
                stk.call(
                {'className': 'com.sinitek.managerframework.um.action.LogonAction',
                    'method': 'getUserInfoFromCookie',
                    'param': {'logoutparam': '${param.logoutparam}'},
                    'callBack': function (result) {
                        var data = jQuery.parseJSON(result);
                        $("#J_username").val(data.username);
                        $("#J_password").val(data.userpass);
                        var autologon = sirm.getCookie("jc_autologon");
                        if (autologon != null && autologon == 1) {
                            document.getElementById("autologon").checked = true;
                            loginBtn.css({
                                background: 'url(${contextPath}/common/css/common/images/icon/wait.gif) no-repeat 0 0',
                                paddingLeft: '2em',
                                width: 'auto'
                            });
                            loginBtn.html('正在登录……');
                            setTimeout(function () {
                                loginBtn.click();
                            }, "800");
                        }
                    }
                });
            });
        }

        var supportTplHead = [
            '<div class="overlay transparent">',
            '<div class="support_bg support_bg_add">',
            '<a href="#" class="icon_close"></a>',
            '<div class="statement" style="overflow-x:hidden">'
        ].join('');
        var supportTplFoot = [
            '</div>',
            '</div>',
            '<div class="ie"></div>',
            '</div>'
        ].join('');
        var support = {isShow: false, dom: undefined};
        var showSupport = function () {
            if (!support.isShow) {
                support.dom.appendTo('body');
                setTimeout(function () {
                    support.dom.removeClass('transparent');
                    support.isShow = true;
                }, 100)
            }
        };
        $(function () {
            $('#supportBtn').click(function () {
                if (!support.dom) {
                    stk.call({
                        className: "com.sinitek.managerframework.supportcenter.action.SupportCenterAction",
                        method: 'getSupportCenter',
                        callBack: function (data) {
                            data = $.parseJSON(data);
                            var supportTpl = supportTplHead;
                            for (var i = 0; i < data.length; i++) {
                                var result = data[i],
                                        tplArray = ['<table class="bottomline w100p">',
                                            '<tr>',
                                            '<td class="colorBlack fwb" width="50%">'];
                                tplArray.push(result.range);
                                tplArray.push('</td><td style="color:#0092c1">');
                                tplArray.push(result.name);
                                tplArray.push('</td></tr><tr><td>电话：');
                                tplArray.push(result.tel);
                                tplArray.push('</td><td>Email：');
                                tplArray.push(result.email);
                                tplArray.push('</td></tr><tr><td>MSN：');
                                tplArray.push(result.msn);
                                tplArray.push('</td><td>QQ：');
                                tplArray.push(result.qq);
                                tplArray.push('</td></tr></table>');
                                supportTpl += tplArray.join('');
                            }
                            supportTpl += supportTplFoot;

                            var dom = support.dom = $(supportTpl);
                            dom.find('a.icon_close').click(function () {
                                dom.addClass('transparent');
                                setTimeout(function () {
                                    dom[0].parentNode.removeChild(dom[0]);
                                    support.isShow = false;
                                }, 400);
                                return false;
                            });

                            showSupport();
                        },
                        exceptionHandler: function (message, e) {
                            stk.error(message)
                        }
                    });
                } else {
                    showSupport();
                }
                return false;
            });
        });
    })();
</script>
</head>
<body id="body-bg">
<section class="login-sec">
    <c:choose>
        <c:when test="${result==20}">
            <c:set var="articleMsg" value="用户名或密码错误"/>
        </c:when>
        <c:when test="${result==21}">
            <c:set var="articleMsg" value="用户被锁定"/>
        </c:when>
        <c:when test="${result==22}">
            <c:set var="articleMsg" value="用户已离职"/>
        </c:when>
        <c:when test="${result==23}">
            <c:set var="articleMsg" value="LDAP服务器连接出错"/>
        </c:when>
        <c:when test="${result==24}">
            <c:set var="articleMsg" value="用户在系统中不存在"/>
        </c:when>
        <c:when test="${result==25 && not empty errormessage}">
            <c:set var="articleMsg" value="${errormessage}"/>
        </c:when>
        <c:when test="${result==26}">
            <c:set var="articleMsg" value="参数配置错误"/>
        </c:when>
        <c:otherwise>
            <c:set var="articleMsgstyle" value="display:none"/>
            <c:set var="articleMsg"/>
        </c:otherwise>
    </c:choose>

    <div id="articleMsg" style="${articleMsgstyle}">
        <article class="message">
            <p class="error"><i class="icon-error"></i><span id="msg">${articleMsg}</span></p>
        </article>
    </div>

    <article class="login-article">
        <form action="${path}/${pi.checkuserurl}" id="logonForm" method="post">
            <ul>
                <li class="username">
                    <label for="J_username">&nbsp;</label>
                    <input type="text" name="${pi.usernameinputname}" id="J_username">
                </li>
                <li class="username">
                    <label for="J_password">&nbsp;</label>
                    <input type="password" id="J_password">
                    <input type="hidden" name="${pi.userpassinputname}" id="J_password2">
                    <%--<a href="#">忘记密码？</a>--%>
                </li>
                <%--<%--%>
                    <%--if ("true".equals(SettingUtils.getLocalSetting("language.enable"))) {--%>
                <%--%>--%>
                <%--<li>--%>
                    <%--<label>&nbsp;</label>--%>

                    <%--<select onchange="location.replace('?locale='+this.value+'&apply=true')">--%>
                        <%--<c:forEach items="${supportLocales}" var="currentLocale">--%>
                            <%--<c:set var="currentLocale" value="${currentLocale}" scope="page"/>--%>
                            <%--<%--%>
                                <%--Locale lo = (Locale) pageContext.getAttribute("currentLocale");--%>
                            <%--%>--%>
                            <%--<option--%>
                                    <%--<c:if test="${currentLocale == locale}">selected="selected" </c:if>--%>
                                    <%--value="${currentLocale}">--%>
                                <%--<%=lo.getDisplayCountry(lo)%>--%>
                            <%--</option>--%>
                        <%--</c:forEach>--%>
                    <%--</select>--%>
                <%--</li>--%>
                <%--<%}%>--%>
                <li class="savelogin">
                    <label>&nbsp;<input id="autologon" name="autologon" type="checkbox" value="1">自动登录</label>
                </li>
            </ul>
            <aside class="login-submit-button" id="submit-button">
                <button type="button" id="loginBtn"></button>
                <span style="line-height: 24px;height: 24px;">
                    <a id="supportBtn" href="###">支持中心</a>
                </span>
            </aside>
        </form>
    </article>
</section>
</body>
</html>
<%
//    session.invalidate();//清空session
    Cookie[] cookies = request.getCookies();//获取cookie
    if (cookies != null && cookies.length > 0) {
        for (Cookie c : cookies) {
            c.setMaxAge(0);//让cookie过期
        }
    }
    session.invalidate();
%>