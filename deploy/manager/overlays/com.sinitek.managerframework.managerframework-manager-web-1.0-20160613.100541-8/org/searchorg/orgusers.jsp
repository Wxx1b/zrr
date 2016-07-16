<%@ page import="com.sinitek.managerframework.org.common.enums.OrgType" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/framework/include/head.jsp" %>

<html>
<head>
<title>Simple jsp page</title>
<%@ include file="/framework/include/innerHead.jsp" %>
<link href="${contextPath}/org/css/org.css" type="text/css" rel="stylesheet">
<script type="text/javascript">
//判断是否存在
function _user_repeatIndusty(scode, text_code) {
    var text_codeList = text_code.split(",");
    if (text_codeList.length > 0) {
        for (var i = 0; i < text_codeList.length; i++) {
            if (text_codeList[i] == '') {
                continue;
            }
            var baseScode = text_codeList[i].split(":");
            if (baseScode[0] + '' == scode + '') {
                return false;
            }
        }
    }
    return true;
}
//点击添加按钮添加到相应的层中
function _user_spellSecurityContent(relationDivId, pluginKeyValue, showContent, prefix, hiddenname) {
    var _relationDiv = parent.document.getElementById(relationDivId);
    _relationDiv.className = "phone-result-table";
    if ('${param.oneuser}' != '') {
        _relationDiv.innerHTML = "";
    }
    var id = relationDivId + "" + Math.ceil(Math.random() * 1000000000) * Math.ceil(Math.random() * 10000);
    var str = "<span  id=\"" + id + "\" class=\"t-sl\">" + showContent +
            "<b class=\"stk-button-icon ui-icon-close\" onclick=\"usersiframe.window._user_removeContent('" + id + "','" + pluginKeyValue + "','" + hiddenname + "')\" ></b></span>";
    _relationDiv.innerHTML = _relationDiv.innerHTML + str;
}

//点击添加，添加到相应的panel里
function _users_${param.prefix}_spellSecurityCheck(fromstr, tostr, hiddenstr, orgId) {
    var formtext = $("#" + fromstr);
    var topanel = $("#" + tostr);
    $("#" + tostr).attr("class", "phone-result-table");
    var hiddentext = $("#" + hiddenstr);
    if (formtext.stk_val() != '') {
        var baseScode = formtext.stk_val().split(":");
        var flag0 = $("input[type='checkbox'][name='check'][value='" + baseScode[0] + "']").prop("checked");
        var flag1 = $("#checkbox" + baseScode[0]).prop("checked");
        var flag2 = $("input[type='radio'][name='radioBox'][value='" + baseScode[0] + "']").prop("checked");
        if (_user_repeatIndusty(baseScode[0], hiddentext.stk_val()) && (flag0 || flag1 || flag2)) {
            var result = hiddentext.stk_val();
            if (result != '') {
                result += ',' + formtext.stk_val();
            } else {
                result += formtext.stk_val();
            }
            hiddentext.stk_val(result);
//                var id = tostr + "" + Math.ceil(Math.random() * 1000000000) * Math.ceil(Math.random() * 10000);
            var id = tostr + "" + baseScode[0];
            var str = "<span  id=\"" + id + "\" class=\"t-sl\">" + baseScode[1] +
                    "<b class=\"stk-button-icon ui-icon-close\"  onclick=\"_user_${param.prefix}_removeContent('" + id + "','" + baseScode[0] + "','" + hiddenstr + "','" + orgId + "')\" ></b><input type='hidden' id=hidden" + baseScode[0] + " name=hidden" + baseScode[0] + " value=" + id + "></span>"
            topanel.append(str);
        } else {
            _user_${param.prefix}_removeContent($("#hidden" + baseScode[0]).stk_val(), baseScode[0], hiddenstr, orgId);
        }
    } else {
        parent.stk.alert("未选择添加项");
    }
}

function _allusers_${param.prefix}_spellSecurityCheck(fromstr, tostr, hiddenstr, orgId) {
    var formtext = $("#" + fromstr);
    var topanel = $("#" + tostr);
    $("#" + tostr).attr("class", "phone-result-table");
    var hiddentext = $("#" + hiddenstr);
    if (formtext.stk_val() != '') {
        var baseScode = formtext.stk_val().split(":");
        var flag0 = $("input[type='checkbox'][name='check'][value='" + baseScode[0] + "']").prop("checked");
        var flag1 = $("#checkbox" + baseScode[0]).prop("checked");
        var flag2 = $("input[type='radio'][name='radioBox'][value='" + baseScode[0] + "']").prop("checked");
        if (_user_repeatIndusty(baseScode[0], hiddentext.stk_val()) && (flag0 || flag1 || flag2)) {
            var result = hiddentext.stk_val();
            if (result != '') {
                result += ',' + formtext.stk_val();
            } else {
                result += formtext.stk_val();
            }
            hiddentext.stk_val(result);
//            var id = tostr + "" + Math.ceil(Math.random() * 1000000000) * Math.ceil(Math.random() * 10000);
            var id = tostr + "" + baseScode[0];
            var str = "<span  id=\"" + id + "\" class=\"t-sl\">" + baseScode[1] +
                    "<b class=\"stk-button-icon ui-icon-close\"  onclick=\"_user_${param.prefix}_removeContent('" + id + "','" + baseScode[0] + "','" + hiddenstr + "','" + orgId + "')\" ></b><input type='hidden' id=hidden" + baseScode[0] + " name=hidden" + baseScode[0] + " value=" + id + "></span>"
            topanel.append(str);
        }
    } else {
        parent.stk.alert("未选择添加项");
    }
}
//添加到页面的div中
function _user_addContent(dicContent, hiddenname, divname, prefix) {
    var text_codeList = dicContent.split(",");
    var hiddenObj = parent.document.getElementById(hiddenname);
    if ('${param.oneuser}' != '') {
        hiddenObj.value = "";
    }
    var result = hiddenObj.value;

    for (var i = 0; i < text_codeList.length; i++) {
        var text = text_codeList[i];
        var baseScode = text.split(":");
        if (_user_repeatIndusty(baseScode[0], hiddenObj.value)) {
            if (result != '') {
                result += ',' + text;
            } else {
                result += text;
            }
            _user_spellSecurityContent(divname, baseScode[0], baseScode[1], prefix, hiddenname);
        }
    }
    hiddenObj.value = result;
}
//删除panel中所选
function _user_${param.prefix}_removeContent(id, key, hiddenId, orgId) {
    $("#checkbox" + orgId).stk_checked(false);
    var hidden = $("#" + hiddenId);
    var orgids = hidden.stk_val() == null ? "" : hidden.stk_val();
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
    $("#" + id).remove();
    hidden.stk_val(result);

    <%--取消选定--%>
    $("input[type='checkbox'][name='check'][value='" + key + "']").stk_checked(false);
    $("input[type='radio'][name='radioBox'][value='" + key + "']").stk_checked(false);
}
//删除层中所选
function _user_removeContent(id, key, hiddenId) {
    var hidden = parent.document.getElementById(hiddenId);
    var orgids = hidden.value == null ? "" : hidden.value;
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
        var obj = parent.document.getElementById(id);
        obj.parentNode.removeChild(obj);
    }
    hidden.value = result;
}
function functionName(obj) {
    var _nodeid = $(obj).attr("nodeId");
    var _nodetype = $(obj).attr("nodetype");
    var _nodename = $(obj).attr("nodename");
    var result = _nodeid + ":" + _nodename + ":" + _nodetype;

    $("#_user_${param.prefix}_post").stk_val("");
    $("#_user_${param.prefix}_org").stk_val("");
    $("#_user_${param.prefix}_team").stk_val("");
    $("#_user_${param.prefix}_role").stk_val("");
    if (_nodetype == '<%=OrgType.POSITION.getEnumItemValue()%>') {
        $("#_user_${param.prefix}_post").stk_val(result);
    } else if (_nodetype == '<%=OrgType.DEPT.getEnumItemValue()%>') {
        $("#_user_${param.prefix}_org").stk_val(result);
    } else if (_nodetype == '<%=OrgType.TEAM.getEnumItemValue()%>') {
        $("#_user_${param.prefix}_team").stk_val(result);
    } else if (_nodetype == '<%=OrgType.ROLE.getEnumItemValue()%>') {
        $("#_user_${param.prefix}_role").stk_val(result);
    }
    $("#_user_org_orgid").stk_val(_nodeid);
//        $("#queryuserName").stk_val("");
    $("#_org_userstable").stk_query();
}

function selectusers(show, callback) {
    if ($("#checkBoxPlugin").hasSelect() || $("#radioboxPlugin").hasSelect()) {
        <c:choose>
        <c:when test="${empty param.oneuser }">
        $("#checkBoxPlugin").stk_call({type: '0'}, function (result) {
            var text_codeList = result.split(",");
            if (text_codeList.length > 0) {
                for (var i = 0; i < text_codeList.length; i++) {
                    if (text_codeList[i] == "") {
                        continue;
                    }
                    $("#_user_${param.prefix}_user").stk_val(text_codeList[i]);
                    _users_${param.prefix}_spellSecurityCheck("_user_${param.prefix}_user", "_user_checkusers_div", '_user_check_hidden');
                }
            }
            if (callback != null) callback();
        });
        </c:when>
        <c:otherwise>
        $("#radioboxPlugin").stk_call({type: '0'}, function (result) {
            $("#_user_${param.prefix}_user").stk_val(result);
            _users_${param.prefix}_spellSecurityCheck("_user_${param.prefix}_user", "_user_checkusers_div", '_user_check_hidden');
            if (callback != null) callback();
        });
        </c:otherwise>
        </c:choose>
    } else {
        if (show) {
//                parent.stk.alert("请选中要增加的用户");
        } else {
            if (callback != null) callback();
        }
    }
}


function selectemps(orgid, callback) {
    <c:choose>
    <c:when test="${empty param.oneuser }">
    $("#_user_${param.prefix}_user").stk_val(orgid);
    _users_${param.prefix}_spellSecurityCheck("_user_${param.prefix}_user", "_user_checkusers_div", '_user_check_hidden');
    if (callback != null) callback();
    </c:when>
    <c:otherwise>
    $("#_user_${param.prefix}_user").stk_val(orgid);
    $("#_user_checkusers_div").stk_html("");
    $("#_user_check_hidden").stk_val("");
    _users_${param.prefix}_spellSecurityCheck("_user_${param.prefix}_user", "_user_checkusers_div", '_user_check_hidden');
    if (callback != null) callback();
    </c:otherwise>
    </c:choose>
}

function selectempsall(orgid, callback) {
    $("#_user_${param.prefix}_user").stk_val(orgid);
    _allusers_${param.prefix}_spellSecurityCheck("_user_${param.prefix}_user", "_user_checkusers_div", '_user_check_hidden');
    if (callback != null) callback();
}

/**
 *为自动完成框的查询准备参数
 */
function get${param.prefix}Param() {
    return {prefix: '${param.prefix}', userinfo: '${param.userinfo}', queryCon: $("#queryCon").stk_val()};
}

/**
 *  checkbox选中后把值存到相应的隐藏域中
 * @param values
 * @param type
 */
function _${param.prefix}_checkbox(values, type) {
    $("#_user_${param.prefix}_" + type).stk_val(values);
}

function loadtree() {
    $.ajax({
        type: 'post',
        data: {queryCon: $("#queryCon").stk_val(),
            prefix: '${param.prefix}',
            userinfo: '${param.userinfo}'},
        url: '${contextPath}/org/tree.jsp',
        dataType: "html",
        success: function (str) {
            var html = sirm.removeScriptElementsFromHtml(str);
            _listauth_collectionTreeId_hasLoad = undefined;
            $("#dtree").html(html);
            _listauth_collectionTreeId_buildTree();
            _listauth_collectionTreeId_hasLoad = true;
            $("div[class='loading-st1']").eq(0).parent().css("display", "none");

        },
        error: function (result) {
            stk.error("获取树失败");
        }
    });
}

$(document).ready(function () {
    loadtree();
    $("#queryCon").bind("input propertychange", function () {
        setTimeout(function () {
            loadtree();
        }, 200);
    });
});



</script>
</head>
<sirm:body>
    <ui:form id="_org_usersForm">
        <input type="hidden" id="_user_org_orgid" name="_user_org_orgid">
        <input type="hidden" id="_user_${param.prefix}_org" name="_user_${param.prefix}_org"/>
        <input type="hidden" id="_user_${param.prefix}_post" name="_user_${param.prefix}_post"/>
        <input type="hidden" id="_user_${param.prefix}_user" name="_user_${param.prefix}_user"/>
        <input type="hidden" id="_user_${param.prefix}_team" name="_user_${param.prefix}_team"/>
        <input type="hidden" id="_user_${param.prefix}_role" name="_user_${param.prefix}_role"/>
        <table width="600px">
            <tr valign="top">
                <td width="180px">
                        <%--<ui:tree id="_org_tree" clazz="com.sinitek.managerframework.org.action.SearchOrgAction" width="180px" height="300px"></ui:tree>--%>
                    <div style="height:${(empty param.userinfo)?"400px":"320px"};width:180px;overflow-y:auto;overflow-x:hidden">
                        <input type="text" id="queryCon" name="queryCon">

                        <div id="dtree" style="height:100px;width: 100%;">

                        </div>
                    </div>
                </td>
                <td>
                    <div style="height:${(empty param.userinfo)?"400px":"300px"};overflow-y:auto">
                        <div class="search-params-bar">
                            <table>
                                <tr>
                                    <td class="bd"><ui:textfield id="queryuserName" themeName="double-cancel"
                                                                 name="userName" width="150px" emptyText="登录名 / 员工姓名">
                                        <event:onkeypress keyCodeVar="code">
                                            if(code=="13")
                                            $("#querybtn").onclick();
                                        </event:onkeypress>
                                    </ui:textfield></td>
                                    <td class="bd">
                                        <ui:checkbox name="inservice" label="显示离职">
                                            <event:onclick>
                                                $("#_org_userstable").stk_query();
                                            </event:onclick>
                                        </ui:checkbox>
                                    </td>
                                    <td><ui:button text="查询" id="querybtn">
                                        <event:onclick>
                                            $("#_org_userstable").stk_query();
                                        </event:onclick>
                                    </ui:button>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <layout:VSpacing height="5px"/>
                        <div style="height:250px;overflow-y:auto;">
                            <plugin:colRowNum id="rowNumPlugin"/>
                            <plugin:colCheckbox id="checkBoxPlugin" name="check" allowCache="true" checkedVar="checked" dataVar="data">
                                <%--selectusers(true);--%>
                                selectemps(data.orgid+":"+data.displayname+":8");
                            </plugin:colCheckbox>
                            <plugin:colRadiobox id="radioboxPlugin" name="radioBox" dataVar="data">
                                selectemps(data.orgid+":"+data.displayname+":8");
                            </plugin:colRadiobox>
                            <input type="hidden" id="order" name="order">
                            <ui:table pageInfoType="simple" rowHeight="19px" width="400px" nowrap="true"
                                      id="_org_userstable" queryForm="_org_usersForm"
                                      actionClass="com.sinitek.managerframework.org.action.SearchUserAction"
                                      allowBlankRow="true">
                                <c:choose>
                                    <c:when test="${empty param.oneuser }">
                                        <ui:col plugin="checkBoxPlugin" width="25px"/>
                                    </c:when>
                                    <c:otherwise>
                                        <ui:col plugin="radioboxPlugin" width="25px"/>
                                    </c:otherwise>
                                </c:choose>
                                <ui:col plugin="rowNumPlugin" width="30px"/>
                                <%--<ui:col property="username" title="登录名" width="45%" align="left"/>--%>
                                <ui:col property="displayname" title="员工姓名" width="70px" align="left" allowTip="false">
                                    "<input type='hidden' name='name"+orgid+"' id='name"+orgid+"' value='"+displayname+"'/><span title=\""+displayname+"\">"+displayname+"</span>"
                                </ui:col>
                                <ui:col property="positionname" title="岗位/部门" width="130px" align="left"
                                        allowTip="true"/>
                                <event:ontableorder propertyVar="property" orderTypeVar="order">
                                    $("#order").stk_val(property+":"+order);
                                    $("#_org_userstable").stk_query();
                                </event:ontableorder>
                            </ui:table>
                        </div>

                        <layout:VSpacing height="5px"/>
                        <div>
                            <input type="hidden" id="_user_check_hidden"/>
                            <c:if test="${empty param.userinfo}">
                                <table>
                                    <tr>
                                        <td nowrap="">已选部门</td>
                                        <td>
                                            <div id="_user_checkorgs_div"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td nowrap="">已选岗位</td>
                                        <td>
                                            <div id="_user_checkposts_div"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td nowrap="">已选小组</td>
                                        <td>
                                            <div id="_user_checkteams_div"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td nowrap="">已选人员</td>
                                        <td>
                                            <div id="_user_checkusers_div"></div>
                                        </td>
                                    </tr>
                                </table>
                            </c:if>
                        </div>
                    </div>
                    <div>
                        <ui:button text="确定">
                            <event:onclick>
                                <%--selectusers(false,function(){--%>
                                var _var= $("#_user_check_hidden");
                                if(_var.stk_val()!=''){
                                _user_addContent(_var.stk_val(),'${param.hiddenname}','${param.relationDiv}','${param.prefix}');
                                window.parent.document.getElementById("_org_users_close").click();
                                } else {
                                parent.stk.alert("请选择要增加的选项");
                                }
                                <%--});--%>

                            </event:onclick>
                        </ui:button>
                        <ui:button text="关闭">
                            <event:onclick>
                                window.parent.document.getElementById("_org_users_close").click();
                            </event:onclick>
                        </ui:button>
                    </div>
                </td>
            </tr>
        </table>
    </ui:form>
</sirm:body>
<script type="text/javascript">
    $(document).ready(function() {
        $("#_org_userstable tr:eq(0) th:nth-child(1)").bind("click", function() {
            <%--$.each(result,function(i,data){--%>
            var check = $("#check_all").stk_checked();
            $("#_org_userstable input[type='checkbox'][name='check']").each(function(i, val) {
                if (check) {
                    selectempsall(val.value + ":" + $("#name" + val.value).stk_val() + ":8");
                } else {
                    <%--$("#close" + val.value).click();--%>
                    _user_${param.prefix}_removeContent('_user_checkusers_div' + val.value, val.value, '_user_check_hidden', 'undefined');
                }
            });
            <%--selectemps(data.orgid+":"+data.displayname+":8");--%>
            <%--});--%>
        });
    });
</script>
</html>
