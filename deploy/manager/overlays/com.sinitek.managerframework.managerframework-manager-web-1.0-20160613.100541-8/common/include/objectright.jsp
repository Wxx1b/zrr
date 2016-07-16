<%--
  User: 朱敏捷
  Date: 14-5-26
  Time: 下午2:19
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ include file="/includes/projectincludes.jsp" %>--%>
<%@ include file="/includes/commonincludes.jsp" %>
<%@ taglib prefix="org" uri="http://www.sinitek.com/sirm/org/tag" %>


<style type="text/css">
    .stk-table-selected{background-color: #d3e3fb}
    .stk-table-green{background-color: #66CC00}
    .stk-table-yellow{background-color: #FFFF99}
    .stk-table-pink{background-color: pink}
    .stk-table-white{background-color: white}
</style>

<script type="text/javascript">
function showAuth(objid,name) {
    $("#rightobjid").stk_val(objid);
    $("#rightdefinekey").val("${param.rightdefinekey}");
    $("#authselect").val("");
    $("#_orgs_searchUser").val("");
    $("#_orgs_candidateControlDiv").html("");
    $("#orgAuthTable").stk_query();
    $("#orgAuthWindow").stk_show({title:"对象设置授权 - " + name});
}

function showFunctionAuth(objid,name){
    $("#rightobjid").stk_val(objid);
    $("#rightdefinekey").val("FUNCTIONINFO");
    $("#authselect").val("");
    $("#_orgs_searchUser").val("");
    $("#_orgs_candidateControlDiv").html("");
    $("#orgAuthTable").stk_query();
    $("#orgAuthWindow").stk_show({title:"对象设置授权 - " + name});
}

function removeOrgAuth(orgid) {
    stk.call({
        className:"com.sinitek.managerframework.menu.action.MenuAuthAction",
        method:"removeOrgAuth",
        param:{menuid:$("#rightobjid").stk_val(), orgid:orgid, rightdefinekey:$("#rightdefinekey").stk_val()},
        callBack:function(result) {
            if (result == "success") {
                $("#orgAuthTable").stk_query();
                var selectedOrgId = $("#_listauth_orgid", window.parent.document).stk_val();
                if (StringUtils.isNotBlank(selectedOrgId) && selectedOrgId == orgid) {
                    window.parent.mylink(null, null, selectedOrgId);
                }
                stk.alert("操作成功","提示");
            } else {
                stk.alert(result);
            }
        }
    });
}

function addOrgAuth() {
    var authselect = $("#authselect").stk_val();
    if (StringUtils.isNotBlank(authselect)) {
        var orgId = "";
        var authselects = authselect.split(",");
        for (var i = 0; i < authselects.length; i++) {
            if (i > 0) {
                orgId += ",";
            }
            orgId += authselects[i].split(":")[0];
        }
        stk.call({
            className:"com.sinitek.managerframework.menu.action.MenuAuthAction",
            method:"addOrgAuth",
            param:{menuid:$("#rightobjid").stk_val(), orgid:orgId, rightdefinekey:$("#rightdefinekey").stk_val()},
            callBack:function(result) {
                if (result == "success") {
                    $("#orgAuthTable").stk_query();
                    $("#authselect").val("");
                    $("#_orgs_searchUser").val("");
                    $("#_orgs_candidateControlDiv").html("");
                    var selectedOrgId = $("#_listauth_orgid", window.parent.document).stk_val();
                    if (StringUtils.isNotBlank(selectedOrgId) && selectedOrgId == orgId) {
                        window.parent.mylink(null, null, selectedOrgId);
                    }
                    stk.alert("添加成功","提示");
                } else {
                    stk.alert(result);
                }
            }
        });
    }else{
        stk.alert("请选择授权对象","提示")
    }
}

function rejectOrgAuth() {
    var authselect = $("#authselect").stk_val();
    if (StringUtils.isNotBlank(authselect)) {
        var orgId = "";
        var authselects = authselect.split(",");
        for (var i = 0; i < authselects.length; i++) {
            if (i > 0) {
                orgId += ",";
            }
            orgId += authselects[i].split(":")[0];
        }
        stk.call({
            className:"com.sinitek.managerframework.menu.action.MenuAuthAction",
            method:"rejectOrgAuth",
            param:{menuid:$("#rightobjid").stk_val(), orgid:orgId, rightdefinekey:$("#rightdefinekey").stk_val()},
            callBack:function(result) {
                if (result == "success") {
                    $("#orgAuthTable").stk_query();
                    $("#authselect").val("");
                    $("#_orgs_searchUser").val("");
                    $("#_orgs_candidateControlDiv").html("");
                    var selectedOrgId = $("#_listauth_orgid", window.parent.document).stk_val();
                    if (StringUtils.isNotBlank(selectedOrgId) && selectedOrgId == orgId) {
                        window.parent.mylink(null, null, selectedOrgId);
                    }
                    stk.alert("拒绝成功","提示");
                } else {
                    stk.alert(result);
                }
            }
        });
    }else{
        stk.alert("请选择授权对象","提示")
    }
}

function defineColors(data) {
    for (var i = 0; i < data.length; i++){
        var ca = $('#orgAuthTable').find("tr[rownum='" + i + "']");
        ca.attr("selectedCss","stk-table-selected");
    }
    for (var i = 0; i < data.length; i++) {
        var cb = $('#orgAuthTable').find("tr[rownum='" + i + "']");
        if (data[i].rejectflag == "0") {
            cb.addClass("stk-table-white");
            cb.attr("oldCss","stk-table-white");
        } else {
            cb.addClass("stk-table-pink");
            cb.attr("oldCss","stk-table-pink");
        }
        cb.click(function(){
            changeTrColor($(this),"orgAuthTable");
        });
    }
}

function changeTrColor(tr, tableId) {
    var rownum = $(tr).attr("rownum");
    var thisRow = $('#' + tableId).find("tr[rownum='" + rownum + "']");
    var otherRow = $('#' + tableId).find("tr[rownum!='" + rownum + "']");
    otherRow.each(function () {
        if ($(this).attr("oldCss") != undefined && $(this).attr("rownum") != undefined) {
            $(this).addClass($(this).attr("oldCss"));
        }
    });
    if (thisRow.attr("selectedCss") != undefined) {
        thisRow.removeClass().addClass(thisRow.attr("selectedCss"));
    }
}
</script>

<%--对象设置授权--%>
<layout:window id="orgAuthWindow" title="对象设置授权" width="410px" height="320px">
    <div style="padding:5px">
        <ui:form id="authQueryForm">
            <input type="hidden" id="rightobjid" name="rightobjid"/>
            <input type="hidden" id="rightdefinekey" name="rightdefinekey" value="${param.rightdefinekey}"/>
            <div style="float: left;width:300px;">
                <%--<ui:autoComplete id="authselect" clazz="com.sinitek.managerframework.org.action.SearchOrgName2Action" showOnFocus="true"--%>
                                            <%--emptyText="请输入名称或拼音" icon="ui-icon-search" width="130px"/>--%>
                <org:SelectOrg prefix="orgs" multi="true" mode="org" hiddenId="authselect" width="250px"></org:SelectOrg>
                <input type="hidden" id="authselect" name="authselect">
            </div>
            <div style="float: left;width:100px;">
                <ui:button text="添加">
                    <event:onclick>
                        addOrgAuth();
                    </event:onclick>
                </ui:button>
                <ui:button text="拒绝">
                    <event:onclick>
                        rejectOrgAuth();
                    </event:onclick>
                </ui:button>
            </div>
            <div style="float: left;width:300px;">
                <span style="background-color:pink;">&nbsp;&nbsp;&nbsp;&nbsp;</span><font color="red">代表“拒绝”权限</font>
            </div>
        </ui:form>
        <ui:table id="orgAuthTable" actionClass="com.sinitek.managerframework.menu.action.MenuAuthAction" allowBlankRow="true"
                  allowInit="false" queryForm="authQueryForm" pageInfoType="simple" pageSize="8"
                  allowConfigPageSize="false">
            <%--<ui:col property="orgname" title="对象名称" width="auto"/>--%>
            <ui:colCust method="jspGetOrgname" title="对象名称" width="auto" align="left"/>
            <ui:colCust method="jspGetOrgType" property="unittype" title="对象类型" width="100px" allowSort="false"
                        align="center"/>
            <ui:colCust method="jspGetCando" title="操作" width="70px" align="center"/>

            <event:aftertablequery dataVar="data">
                defineColors(data);
            </event:aftertablequery>
        </ui:table>
    </div>
</layout:window>