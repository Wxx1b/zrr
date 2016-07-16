<%@ page import="com.sinitek.managerframework.um.check.UserCheckContext" %>
<%@ page import="com.sinitek.managerframework.um.utils.UserCheckUtils" %>
<%--<h1>first.jsp</h1>--%>
<%--<%@ page import="java.util.Locale" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="framework/include/head.jsp" %>
<%@ taglib prefix="comtag" uri="http://www.sinitek.com/sirm/common/func" %>
<%@ taglib prefix="framework" uri="http://www.sinitek.com/sirm/framework/tag" %>

<framework:loadmenutag menuName="allMenus"></framework:loadmenutag>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>${empty setting.SIRM_TITLE ? '携宁工作管理平台' : setting.SIRM_TITLE}</title>
    <%@ include file="framework/include/innerHead.jsp" %>
    <%
        UserCheckContext uc = new UserCheckContext();
        uc.setRequest( request );
        uc.setResponse( response );
        boolean result = UserCheckUtils.canChangePassword( uc );
        request.setAttribute( "canChangePassword", result );
    %>
    <script type="text/javascript" src="${contextPath}/framework/js/stk-frame.js"></script>
    <c:if test="${empty themeName}">
        <link href="${contextPath}/framework/css/blue/frame.css" type="text/css" rel="stylesheet">
    </c:if>
    <c:if test="${not empty themeName}">
        <link href="${contextPath}/framework/css/${themeName}/frame.css" type="text/css" rel="stylesheet">
    </c:if>

    <script type="text/javascript">
        var showwarning = '';
        var informationCount = 0;
        var messageCount = 0;
    </script>

    <style>
        html, body {
            width: 100%;
            height: 100%;
            overflow: auto;
        }

        #imContent, #imContent * {
            cursor: default;
        }

        .im-ip {
            color: #939393;
        }

        .im-message {
            width: 408px;
            height: 206px;
            position: relative;
            top: 1px;
            padding: 8px;
            overflow: auto;
        }

        .im-window-content {
            width: 100%;
            height: 100%;
            overflow: hidden;
        }

        .im-input, .im-input textarea {
            width: 100%;
        }

        .im-input textarea {
            height: 124px;
        }

        .im-input {
            position: relative;
            overflow: hidden;
        }

        .im-self {
            color: #008000;
        }

        .im-pep {
            color: #0000FF;
        }

        .im-offline-user {
            color: #939393;
        }

        .ke-icon-imHistory {
            background-image: url(${contextPath}/sirm/resources/images/im-histroy.png); /*background-position: 0px -672px;*/
            width: 16px;
            height: 16px;
        }

        .overlay {
            -webkit-box-align: center;
            -webkit-box-pack: center;
            -webkit-transition: 0.25s opacity;
            -moz-transition: 0.25s opacity;
            transition: 0.25s opacity;
            filter: progid:DXImageTransform.Microsoft.gradient(enabled='true', startColorstr='#4C999999', endColorstr='#07999999');
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
            filter: alpha(opacity=0);
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
    </style>
    <script>

        $(function () {
            var informationCount = 0;
            var messageCount = 0;
            var mannualcloseflag = 0;


            var menuObj = [];

            <c:set var="topMenuIds" value=""/>
            <comtag:getSysMenuByParentId allSysMenuList="${allMenus}" parentId="0" varName="topMenuList"/>
            <c:forEach items="${topMenuList}" varStatus="i"  var="topMenu">
            <c:set var="topMenuIds" value="${topMenuIds};${topMenu.objid}m"/>
            var m1 = {id: ${topMenu.objid}, name: "${topMenu.name}"};
            m1.children = [];
            <comtag:getSysMenuByParentId allSysMenuList="${allMenus}" parentId="${topMenu.objid}" varName="secondMenuList"/>
            <c:forEach items="${secondMenuList}" varStatus="j"  var="secondMenu">
            var m2 = {id: ${secondMenu.objid}, name: "${secondMenu.name}"};
            m2.children = [];
            m1.children.push(m2);
            <comtag:getSysMenuByParentId allSysMenuList="${allMenus}" parentId="${secondMenu.objid}" varName="thirdMenuList"/>
            <c:forEach items="${thirdMenuList}" varStatus="k"  var="thirdMenu">
            <%--var tf = (${fn:indexOf(thirdMenu.url, "://")} > 0)  ? "${thirdMenu.url}" : "${contextPath}/${thirdMenu.url}";--%>

            <c:set var="menuurl" value="${contextPath}/${thirdMenu.url}"/>
            var tf = "${fn:indexOf(thirdMenu.url, "://")  > 0 || fn:indexOf(thirdMenu.url, "/")  == 0 ? thirdMenu.url : menuurl}";


            <%--var m3 = {id: ${thirdMenu.objid}, name:"${sirm:i18nDefault(thirdMenu.name,thirdMenu.name)}",url:{}};--%>
            var m3 = {id: ${thirdMenu.objid}, name: "${thirdMenu.name}", url: {}};
            if (tf.indexOf("?") == -1) {
                tf += "?_ssid_=${_ssid_}";
            } else {
                tf += "&_ssid_=${_ssid_}";
            }
            <comtag:getSysMenuByParentId allSysMenuList="${allMenus}" parentId="${thirdMenu.objid}" varName="fourMenuList"/>
            <c:forEach items="${fourMenuList}" varStatus="k"  var="fourMenu">
            <%--var tf2 = (${fn:indexOf(fourMenu.url, "://")} > 0)  ? "${fourMenu.url}" : "${contextPath}/${fourMenu.url}";--%>
            <c:set var="menuurl" value="${contextPath}/${fourMenu.url}"/>
            <%--var tf2 = "${fn:indexOf(fourMenu.url, "://") > 0  ? fourMenu.url : menuurl}";--%>
            var tf = "${fn:indexOf(fourMenu.url, "://")+1  > 0 || fn:indexOf(fourMenu.url, "/")  == 0 ? fourMenu.url : menuurl}";

            <%--m3.url[tf2] = {summaryTitle:"${sirm:i18nDefault(fourMenu.name,fourMenu.name)}"};--%>
            m3.url[tf2] = {summaryTitle: "${fourMenu.name}"};
            if (tf2.indexOf("?") == -1) {
                tf2 += "?_ssid_=${_ssid_}";
            } else {
                tf2 += "&_ssid_=${_ssid_}";
            }
            </c:forEach>
            if (${fn:length(fourMenuList)==0})
                m3.url = tf;
            m2.children.push(m3);
            </c:forEach>
            </c:forEach>
            if (m1.children.length > 0) {
                menuObj.push(m1);
            }
            </c:forEach>
            STK.init({
                menuObj: menuObj,
//        defaultMenuId:menuObj[0] && menuObj[0].id

                defaultMenuId: menuObj[0] && menuObj[0].id,
                searchDataClass: 'com.sinitek.managerframework.menu.action.MenuSearchAction'
            });
            STK.showAllMenu();

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
                $('.support').click(function () {
                    if (!support.dom) {
                        stk.call({
                            className: "com.sinitek.managerframework.supportcenter.action.SupportCenterAction",
                            method: 'getSupportCenter',
                            callBack: function (data) {
                                data = $.parseJSON(data);
                                var supportTpl = supportTplHead;
                                for (var i = 0; i < data.length; i++) {

                                    var result = data[i],
                                            tplArray = [
                                                '<table class="bottomline w100p">',
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

            STK.go("${contextPath}/home.jsp?t=" + new Date().getTime(), "个人中心", {
                enableClose: true,
                switchTabRefresh: false
            });

            stk.call({
                className: "com.sinitek.managerframework.um.action.OnlineUserAction",
                method: 'fetchData',
                callBack: function (data) {
                    $("#totalperson").stk_html(data);
                },
                exceptionHandler: function (message, e) {
                    stk.error(message)
                }
            });
        });

        function showRemindWindow() {
            $("#remindWindow").stk_show();
        }

        function showRemindContWindow(data) {
            $("#subtime").stk_text((data.subtime).format("yyyy-MM-dd hh:mm"));
            $("#title").stk_text(data.title);
            $("#content").stk_text(data.content);
            $("#remindWindow").stk_hide();
            $("#remindContWindow").stk_show();
        }

        function closeCountWindows() {
            $("#remindContWindow").stk_hide();
            $("#remindWindow").stk_show();
        }

        function pasw_update() {
//    $("#userForm").stk_reset();
//    $("#passWindow").stk_show({title:'修改密码'});
            $("#passSecurityForm").stk_reset();
            $("#passSecurityWindow").stk_show({title: '修改密码', 'closeOnEscape': false});
            $("#passSecurityWindowclose1").stk_hide();
            $("#alertinfo").html('');
        }
        function updatepw() {
            if ($("#_updateNewPassword").stk_val() != $("#_updatePasswordTwo").stk_val()) {
                return "两次密码输入不一致";
            } else {
                return true;
            }
        }
    </script>
</head>
<body>
<header id="J_common_header" class="common-header">
    <nav class="common-header-nav">
        <ul id="J_mainnav">
            <comtag:getSysMenuByParentId allSysMenuList="${allMenus}" parentId="0" varName="topMenuList"/>
            <c:forEach items="${topMenuList}" varStatus="status" var="topMenu">
                <c:set var="str" value="${topMenu.objid}m"/>
                <c:if test="${fn:contains(topMenuIds, str)}">
                    <li <c:if test="${status.first}">class='selected'</c:if>>
                        <a class="${topMenu.icon}" href="javascript:void(0);"
                           onclick="STK.menuDo(${topMenu.objid});<c:if
                                   test='${not empty topMenu.url}'>STK.go('${contextPath}/${topMenu.url}','${topMenu.name}');
                                   </c:if>"><b></b>${topMenu.name}
                        </a></li>
                </c:if>
            </c:forEach>
        </ul>
        <script type="text/javascript">
            $('#J_mainnav li').click(function () {
                $('#J_mainnav li').removeClass('selected');
                $(this).addClass('selected');
            });
        </script>
    </nav>
    <aside class="common-header-aside">
        <div class="top-bar">
            <figure class="figure">
                <img src="${contextPath}/framework/css/common/images/logo.png">
            </figure>
            <time class="time" id="time"></time>
            <div class="skinlist">
                <ul>
                    <li class="blue<c:if test="${themeName=='blue'}">Select</c:if>">
                        <img src="${contextPath}/framework/css/common/images/blank.gif"
                             onclick="sirm.changeTheme('blue');">
                    </li>
                    <li class="default<c:if test="${themeName=='default'}">Select</c:if>">
                        <img src="${contextPath}/framework/css/common/images/blank.gif"
                             onclick="sirm.changeTheme('default');">
                    </li>
                    <li class="orange<c:if test="${themeName=='orange'}">Select</c:if>">
                        <img src="${contextPath}/framework/css/common/images/blank.gif"
                             onclick="sirm.changeTheme('orange');">
                    </li>
                </ul>
            </div>
        </div>
        <div class="info-bar">
            <a href="#"
               onclick="STK.go('${contextPath}/org/updateemployee.jsp?flag=update', '个人信息')"
               class="username">${empty currentUser ? "" : currentUser.displayName}</a>
            <b class="split">|</b>
            <c:if test="${canChangePassword}">
                <a href="#" onclick="pasw_update();">修改密码</a>
                <b class="split">|</b>
            </c:if>
            <a href="#" title="在线用户"
               onclick="STK.go('${contextPath}/org/onlineusers.jsp','在线用户',{refresh:true})"
               class="totalperson" id="totalperson"><img
                    src="${contextPath}/framework/css/common/images/icon/wait.gif"/></a>
            <%--<a href="#" title="我的事宜"
               onclick="STK.go('${contextPath}/workflow/applicate/managertask.jsp?_ssid_=${_ssid_}','我的事宜',{refresh:true})"
               class="information" id="information">0</a>--%>
            <b class="split">|</b>
            <a href="#" class="support">支持中心</a><b class="split">|</b>
            <a href="${contextPath}/logout.action" class="logout">退出</a>
        </div>
    </aside>
    <script>
        SpiritCommonAction.getNowDate({
            callback: function (result) {
                $('#time').calendarClock({
                    dateTimeFormat: "yyyy-MM-dd HH:mm:ss",
                    date: result
                });
            }
        });
    </script>
</header>
<section id="J_common_section" class="common-section">
    <aside id="J_common_aside" class="com-sec-aside">
        <h2 class="com-sec-title">
            <span id="J_main_title"><c:if test="${!empty topMenuIds}"><c:out value="${topMenus[0].name}"/></c:if></span>
            <span class="search-input position"><input class="stk-input " type="text" style="width: 12px"><b
                    class="com-sec-aside-more-opt"></b></span>
        </h2>
        <nav id="J_common_sec_aside_nav" class="com-sec-aside-nav">
        </nav>
    </aside>
    <b id="J_left_nav_ext_btn" class="left-nav-ext-btn"></b>
    <article id="J_common_article" class="com-art">
        <nav class="com-art-nav">
            <ul id="J_commonNavTabBar">
            </ul>
            <b class="close-all" title="关闭全部"><span class="common-bg nav-l-bg" onclick="STK.closeNav('ALL',event)"><i
                    class="common-bg-icon nav-close"></i></span><b
                    class="common-bg nav-r-bg"></b></b>
        </nav>
        <section id="J_common_panel_section" class="common-show-panel-section" style="position:relative">
        </section>
    </article>
</section>
<%@ include file="passwordsecure.jsp" %>
</body>
</html>