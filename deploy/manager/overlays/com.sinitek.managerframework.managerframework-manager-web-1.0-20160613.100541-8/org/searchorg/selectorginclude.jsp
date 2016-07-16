<%--
  File Desc:      
  Product Name: SIRM
  Module Name: indicator
  Author:      潘虹
  History:     11-5-25 created by 潘虹
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/framework/include/head.jsp" %>
<script type="text/javascript">
    function show(prefix, relationDiv, hiddenname, showWindow, userinfo,oneuser) {
        var str = "/org/searchorg/orgusers.jsp?prefix=" + prefix + "&relationDiv="
                + relationDiv + "&hiddenname=" + hiddenname + "&showWindow=" + showWindow + "&modifyShow=0";
        if (userinfo != null && userinfo != 'undefined')
            str += "&userinfo=" + userinfo;
         if (oneuser != null && oneuser != 'undefined')
            str += "&oneuser=" + oneuser;
        $("#frame")[0].src = sirm.jsurl(str);
        var height = userinfo == undefined ? '460px' : '380px';
        $("#frame").height(height);
        $("#userswindow").stk_show({title:'请选择'});
    }
    function showframe(prefix, relationDiv, hiddenname, showWindow, hiddenvalue, userinfo) {
        var text_codeList = hiddenvalue.split(",");
        var result = "";

        for (var i = 0; i < text_codeList.length; i++) {
            var text = text_codeList[i];
            var baseScode = text.split(":");
            if (result != '') {
                result += ',' + text;
            } else {
                result += text;
            }
            _user_spellSecurityContentOrg(relationDiv, baseScode[0], baseScode[1], prefix, hiddenname);
        }
        $("#" + hiddenname).val(result);
    }
    //点击添加按钮添加到相应的层中
    function _user_spellSecurityContentOrg(relationDivId, pluginKeyValue, showContent, prefix, hiddenname) {
        var _relationDiv = document.getElementById(relationDivId);
        _relationDiv.className = "phone-result-table";
        var id = relationDivId + "" + Math.ceil(Math.random() * 1000000000) * Math.ceil(Math.random() * 10000);
        var str = "<span  id=\"" + id + "\" class=\"t-sl\">" + showContent +
                "<b class=\"stk-button-icon ui-icon-close\" onclick=\"_user_removeContentOrg('" + id + "','" + pluginKeyValue + "','" + hiddenname + "')\" ></b></span>";
        _relationDiv.innerHTML = _relationDiv.innerHTML + str;
    }

    //删除层中所选
    function _user_removeContentOrg(id, key, hiddenId) {
        var orgids = $("#" + hiddenId).val() == null ? "" : $("#" + hiddenId).val();
        var text_codeList = orgids.split(",");
        var result = "";
        for (var i = 0; i < text_codeList.length; i++) {
            var text = text_codeList[i];
            var baseScode = text_codeList[i].split(":");
            if (baseScode[0] == key) {
                continue;
            }
            if (result != "") {
                result = result + "," + text;
            } else {
                result = text;
            }
        }
        if (id != null && id != "") {
            var obj = $("#" + id);
            obj.remove();
        }
        $("#" + hiddenId).val(result);
    }
    function callfunc() {
        $('#userswindow').stk_hide();
    <c:if test="${not empty param.callbackfunc}">
        ${param.callbackfunc}();
    </c:if>
    }
</script>
<layout:window id="userswindow" width="620px" layout="column" position="top">
    <iframe name="usersiframe" id="frame" src="${path}/org/searchorg/blankpage.jsp" scrolling="no" frameborder="0" width="99%"></iframe>
</layout:window>
<input type="button" onclick="callfunc();" id="_org_users_close" style="display:none">