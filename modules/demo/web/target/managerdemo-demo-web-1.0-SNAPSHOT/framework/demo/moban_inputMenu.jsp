<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>模板 - 按钮菜单</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
    <script type="text/javascript">
        function selectType(type,typeName,icon)
        {
            $('#type').val(type);
            $('#typeName').html(typeName);
            $('#typeIcon1' ).removeClass().addClass('icon-logo' ).addClass(icon);
        }

        function selectType2( type,icon )
        {
            $( '#type2' ).val( type );
            $('#typeIcon2' ).removeClass().addClass('icon-logo' ).addClass(icon);
        }
    </script>
</head>
<body style="padding: 10px">
<form action="a.jsp">
普通：<div class="stk-input-append">
    <div class="stk-btn-group">
        <button type="button" style="width: 100px" class="dropdown-toggle left" onclick="$(this).stk_showMenu('menuId');"><b id="typeIcon1" class="icon-logo logo-gov"></b><input id="type" type="hidden"/><span id="typeName">证监会行业</span><b class="stk-button-icon stk-button-icon-bi1 ui-icon-triangle-b"></b></button>
    </div><input name="search" class="stk-input">
</div>
    </form>
<div id="menuId" style="display:none">
    <a href="javascript:selectType(1,'证监会行业','logo-gov')"><b class="icon-logo logo-gov"></b>证监会行业</a>
    <a href="javascript:selectType(2,'其他行业','logo-investar');"><b class="icon-logo logo-investar"></b>其他行业</a>
</div>

<br>
仅图标：<div class="stk-input-append">
    <div class="stk-btn-group">
        <button type="button" class="dropdown-toggle left" onclick="$(this).stk_showMenu('menuId2');"><b id="typeIcon2" class="icon-logo logo-gov"></b><input id="type2" type="hidden"/></button>
    </div><input name="search" class="stk-input">
</div>
<div id="menuId2" style="display:none">
    <a href="javascript:selectType2(1,'logo-gov')"><b class="icon-logo logo-gov"></b>证监会行业</a>
    <a href="javascript:selectType2(2,'logo-investar');"><b class="icon-logo logo-investar"></b>其他行业</a>
</div>
</body>
</html>