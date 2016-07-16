<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.sinitek.com/sirm/common/tag" prefix="sirm" %>
<%@ taglib uri="http://www.sinitek.com/sirm/common/func" prefix="sirmfn" %>
<c:if test="${empty requestScope._innerheadinclude_ and empty param._innerheadinclude_}">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="X-UA-Compatible" content="IE=IE8" >
    <script type="text/javascript">
    var __contextPath = "<c:out value="${contextPath}"/>";
    var __themeName="<c:out value="${themeName}"/>";
    </script>
    <script type="text/javascript" src="${contextPath}/framework/js/jquery.js"></script>
    <script type="text/javascript" src="${contextPath}/framework/js/jquery-ui.js"></script>
    <script type="text/javascript" src="${contextPath}/framework/js/jquery-plugin.js"></script>
    <%--<script type="text/javascript" src="${contextPath}/framework/js/jquery.ztree.all-3.5.min.js"></script>--%>
    <script type="text/javascript" src="${contextPath}/framework/js/stk-core.js"></script>
    <script type="text/javascript" src="${contextPath}/framework/js/stk-tools.js"></script>
    <script type="text/javascript" src="${contextPath}/framework/js/stk-api.js"></script>
    <script type="text/javascript" src="${contextPath}/framework/highcharts/highcharts.js"></script>
    <%--<script type="text/javascript" src="${contextPath}/framework/highcharts/exporting.js"></script>--%>
    <%--<script type="text/javascript" src="${contextPath}/framework/highstock/highstock.js"></script>--%>
    <%--<script type="text/javascript" src="${contextPath}/framework/highstock/exporting.js"></script>--%>
    <script type="text/javascript" src="${contextPath}/framework/jscal/js/jscal2.js"></script>
    <script type="text/javascript" src="${contextPath}/framework/jscal/js/unicode-letter.js"></script>
    <script type="text/javascript" src="${contextPath}/framework/jscal/js/lang/cn.js"></script>
    <script type="text/javascript" src="${contextPath}/framework/kindeditor/kindeditor.js" charset="utf-8" ></script>
    <script type='text/javascript' src='${contextPath}/dwr/engine.js'></script>
    <script type="text/javascript">
        dwr.engine.setErrorHandler(function(message, ex) {
        });
    </script>
    <script type="text/javascript">
        dwr.engine.setHeaders({"_ssid_":"${_ssid_}"});
    </script>
    <script type='text/javascript' src='${contextPath}/dwr/interface/SpiritInteractAction.js'></script>
    <script type='text/javascript' src='${contextPath}/dwr/interface/SpiritTableAction.js'></script>
    <script type='text/javascript' src='${contextPath}/dwr/interface/SpiritFormAction.js'></script>
    <script type='text/javascript' src='${contextPath}/dwr/interface/SpiritTreeAction.js'></script>
    <script type='text/javascript' src='${contextPath}/dwr/interface/SpiritAutoCompleteAction.js'></script>
    <script type='text/javascript' src='${contextPath}/dwr/interface/SpiritSelectorAction.js'></script>
    <script type='text/javascript' src='${contextPath}/dwr/interface/SpiritChartAction.js'></script>
    <script type='text/javascript' src='${contextPath}/dwr/interface/SpiritCommonAction.js'></script>
    <script type='text/javascript' src='${contextPath}/dwr/interface/UserConfigAware.js'></script>
    <!-[if lte IE 8]>
    <script type="text/javascript" src="${contextPath}/framework/js/html5.js"></script>
    <!-[endif]->

    <!-[if IE]>
    <script type="text/javascript" src="${contextPath}/sirm/js/plugins/swfobject/swfobject.js"></script>
    <![endif]->

    <script type='text/javascript' src="${contextPath}/sirm/js/plugins/plupload/js/plupload.full.js"></script>
    <script type='text/javascript' src='${contextPath}/sirm/js/sirm.js'></script>
    <script type="text/javascript">
        sirm._ssid_ = "${_ssid_}";
        var hasCallMethod = window.open.call != null;

        if (hasCallMethod){
            window.open = function (open) {
                return function (url, name, features) {
                    var _url = sirm.appendssid(url);
                    return open.call(window, _url, name, features);
                };
            }(window.open);
        }

        document.reload = function (reload) {
            return function () {
                document.location.assign(sirm.appendssid(document.location.href));
            };
        }(document.reload);

        if (hasCallMethod){
            var doc = $(document);
            doc.stk_go = function(go){
                return function(url,title,setting){
                    var _url = sirm.appendssid(url);
                    return go.call(doc, _url, title, setting);
                };
            }(doc.stk_go);

            STK.go = function(go){
                return function(url,title,setting){
                    var _url = sirm.appendssid(url);
                    return go.call(STK, _url, title, setting);
                };
            }(STK.go);
        }

        $(document).ready(function(){
            $("iframe").each(function(i, o){
                var src = sirm.appendssid($(o).attr("src"));
                $(o).attr("src", src);
            });

            $("a").each(function (i, o) {
                var href = $(o).attr("href");
                if (undefined != href && href.toLowerCase().indexOf("javascript") == -1) {
                    href = sirm.appendssid(href);
                    $(o).attr("href", href);
                }
            });

            $("form").each(function(i, o){
                var action = sirm.appendssid($(o).attr("action"));
                $(o).attr("action", action);
            });
        });

        if ($.fn.prop == null){
            jQuery.fn.extend({
                prop : function(name, value){
                    var obj = this[0];
                    if (arguments.length == 1){
                        return $(obj).attr(name);
                    }
                    else{
                        $(obj).attr(name,value);
                    }
                }
            });
        }
    </script>
    <c:if test="${empty themeName}">
        <link type="text/css" href="${contextPath}/framework/css/blue/jquery-ui.css" rel="stylesheet" />
        <link type="text/css" href="${contextPath}/framework/css/blue/jquery-plugin.css" rel="stylesheet" />
        <link type="text/css" href="${contextPath}/framework/css/blue/stk.css" rel="stylesheet" />

    </c:if>
    <c:if test="${not empty themeName}">
        <link type="text/css" href="${contextPath}/framework/css/${themeName}/jquery-ui.css" rel="stylesheet" />
        <link type="text/css" href="${contextPath}/framework/css/${themeName}/jquery-plugin.css" rel="stylesheet" />
        <link type="text/css" href="${contextPath}/framework/css/${themeName}/stk.css" rel="stylesheet" />

    </c:if>
    <link type="text/css" href="${contextPath}/framework/css/default/sirm.css" rel="stylesheet" />
    <link type="text/css" href="${contextPath}/framework/jscal/css/jscal2.css" rel="stylesheet" />
    <link type="text/css" href="${contextPath}/framework/jscal/css/border-radius.css" rel="stylesheet" />
    <link type="text/css" href="${contextPath}/framework/kindeditor/skins/default.css" rel="stylesheet" />

    <jsp:include page="/framework/include/innerHead-frame.jsp" />
    <jsp:include page="/framework/include/sirmHead.jsp" />

    <c:set var="_innerheadinclude_" value="1" scope="request"/>
</c:if>
