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
    //    function showunit(relationDiv, hiddenname) {
    //        $("#org_unit_frame")[0].src = "/org/searchorg/orgunit.jsp?relationDiv=" + relationDiv + "&hiddenname=" + hiddenname;
    //        $("#org_unit").stk_show({title:'请选择'});
    //    }
    function showunit(relationDiv, hiddenname, radiounit) {
        if (radiounit != undefined && radiounit != "" && radiounit == "true") {
            $("#org_unit_frame")[0].src = sirm.jsurl("/org/searchorg/orgunit.jsp?relationDiv=" + relationDiv + "&hiddenname=" + hiddenname + "&radiounit=" + radiounit);
            $("#org_unit").stk_show({title:'请选择'});
        } else {
            $("#org_unit_frame")[0].src = sirm.jsurl("/org/searchorg/orgunit.jsp?relationDiv=" + relationDiv + "&hiddenname=" + hiddenname);
            $("#org_unit").stk_show({title:'请选择'});
        }
    }
    function showunitframe(relationDiv, hiddenname, hiddenvalue) {
        $("#org_unit_frame")[0].src = sirm.jsurl("/org/searchorg/orgunit.jsp?relationDiv=" + relationDiv + "&hiddenname=" + hiddenname + "&hiddenvalue=" + hiddenvalue);
    }

    function showunitvalue(relationDiv, hiddenname, hiddenvalue) {
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
            _user_spellSecurityContentUnit(relationDiv, baseScode[0], baseScode[1], hiddenname);
        }
        $("#" + hiddenname).val(result);
    }

    //点击添加按钮添加到相应的层中
    function _user_spellSecurityContentUnit(relationDivId, pluginKeyValue, showContent, hiddenname) {
        var _relationDiv = document.getElementById(relationDivId);
        _relationDiv.className = "phone-result-table";
        var id = relationDivId + "" + Math.ceil(Math.random() * 1000000000) * Math.ceil(Math.random() * 10000);
        var str = "<span  id=\"" + id + "\" class=\"t-sl\">" + showContent +
                "<b class=\"stk-button-icon ui-icon-close\" onclick=\"_user_removeContentUnit('" + id + "','" + pluginKeyValue + "','" + hiddenname + "')\" ></b></span>";
        _relationDiv.innerHTML = _relationDiv.innerHTML + str;
    }

    //删除层中所选
    function _user_removeContentUnit(id, key, hiddenId) {
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

    function callfunction() {
        $('#org_unit').stk_hide();
    <c:if test="${not empty param.callbackfunc}">
        ${param.callbackfunc}();
    </c:if>
    }
</script>
<layout:window id="org_unit" width="320px" height="350px" layout="column">
    <iframe name="unit" id="org_unit_frame" scrolling="no" frameborder="0" width="320px" height="340px"></iframe>
</layout:window>
<input type="button" onclick="callfunction();" id="_org_unit_close" style="display:none">
