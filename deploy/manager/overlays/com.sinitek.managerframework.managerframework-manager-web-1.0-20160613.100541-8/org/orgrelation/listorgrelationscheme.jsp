<%--
  Created by IntelliJ IDEA.
  User: sinitek
  Date: 12-5-15
  Time: 下午4:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/orgincludes.jsp" %>
<html>
<head>
<title>组织结构上下级汇报关系方案</title>
<script type="text/javascript">
$(document).ready(function () {
    $("#brief").stk_checkInputContent(100);
});

function remove() {
    if ($("#checkBoxPlugin").hasSelect()) {
        stk.confirm("确认删除吗？", function () {
            $("#checkBoxPlugin").stk_call(function (result) {
                if (result != "")
                    stk.alert(result);
                $("#orgRelationSchemeTable").stk_query();
            });
        });
    }
    else {
        stk.alert("请选中要删除的数据");
    }
}

/**
 *  新增方案
 */
function addRelationScheme() {
    $("#schemeId").stk_val("");
    $("#code").stk_val("");
    $("#name").stk_val("");
    $("#brief").stk_val("");
    $("#orgRelationSchemeForm").stk_validateForm();
    $("#orgRelationSchemeWindow").stk_show({title:'新增组织结构上下级关系方案'});
}
/**
 *  修改方案
 */
function updateRelationScheme(data) {
    $("#schemeId").stk_val(data.objid);
    $("#code").stk_val(data.code);
    $("#name").stk_val(data.name);
    $("#brief").stk_val(data.brief);
    $("#orgRelationSchemeForm").stk_validateForm();
    $("#orgRelationSchemeWindow").stk_show({title:'修改组织结构上下级关系方案'});
}

/**
 *  配置方案
 */
function configRelationScheme(data) {
//    $("#configRelationWindow").stk_show({title:'配置组织结构上下级关系'});
//    $("#schemeRelationId").stk_val(data.objid);
//    $("#relationId").stk_val(0);
//    $("#parentId").stk_val(0);
//    $("#relationTree").stk_refresh();
    var url= "${path}/org/orgrelation/configrelationscheme2.jsp?schemeid="+data.objid+"&_ssid_=${_ssid_}";
    sirm.openTab(url, "组织结构上下级配置", {keyWithoutParams: true}, function () {
    });
}

function getParam() {
    return {schemeId:$("#schemeRelationId").stk_val()}
}


/**
 *  关闭窗口
 */
function closeWindow() {
    $("#orgRelationSchemeWindow").stk_hide();
}

/**
 *  保存方案
 */
function saveRelationScheme(tf) {
    if ($("#orgRelationSchemeForm").stk_checkForm()) {
        $("#orgRelationSchemeForm").stk_submit(function (result) {
            if (result != "") {
                stk.alert(result);
            } else {
                if (tf)
                    closeWindow();
                $("#schemeId").stk_val("");
                $("#code").stk_val("");
                $("#brief").stk_val("");
                $("#name").stk_val("");
                $("#orgRelationSchemeTable").stk_query();
            }
        });
    }
}
/**
 *  保存关系
 */
function saveRelation(tf) {
    if ($("#orgRelationForm").stk_checkForm()) {
        $("#orgRelationForm").stk_submit(function (result) {
            if (result != "") {
                stk.alert(result);
            } else {
                if (tf)
                    closeRelationWindow();
                else {
                    $("#orgRelationForm").stk_submit("getOrgRelation", function (result) {
                        var item = jQuery.parseJSON(result);
                        addParentIds(item);
                        $("#parentId").stk_val("0");
                    });
                }
                $("#relationTree").stk_refresh();
                $("#selectTree").stk_val("");
                $("#selectOrg").stk_val("");
                $("#users").stk_html("");
            }
        });
    }
}

/**
 *  关闭窗口
 */
function closeRelationWindow() {
    $("#orgRelationWindow").stk_hide();
}

/**
 *  新增组织结构上下级关系
 */
function addOrgRelation() {
    $("#relationId").stk_val(0);
    $("#selectOrg").stk_val("");
    $("#users").stk_html("");
    $("#orgRelationForm").stk_submit("getOrgRelation", function (result) {

        var item = jQuery.parseJSON(result);

        addParentIds(item);
        $("#parentId").stk_val("0");
        $("#orgRelationWindow").stk_show({title:'请选择'});
        $(".selectOrgTr").stk_show();
        $("#selectTree").stk_val("");
    });
}

function addParentIds(item) {
    var selparentid = $("#parentId");
    selparentid.stk_emptyOptions();
    selparentid.append("<option value='0'>--根--</option>");
    for (var i = 0; i < item.length; i++) {
        var data = item[i];
        var name = [];
        for (var j = 0; j < data.lev; j++) {
            name.push("&nbsp;&nbsp;&nbsp;&nbsp;");
        }
        name.push(data.orgname);
        selparentid.append("<option value='"+ data.objid +"'>" + name.join("") + "</option>");
    }
}

/**
 *  删除组织结构上下级关系
 */
function delOrgRelation() {
    if ($("#selectTree").stk_val() != "") {
        stk.confirm("确认删除吗？", function () {
            $("#orgRelationForm").stk_submit("delOrgRelation", function (result) {
                if (result != "")
                    stk.alert(result);
                $("#relationTree").stk_refresh();
                $("#selectTree").stk_val("");
            });
        });
    } else {
        stk.alert("请选择要删除的组织结构");
    }
}

/**
 *  更新
 */
function updateOrgRelation() {
    if ($("#selectTree").stk_val() != "") {
        $("#orgRelationForm").stk_submit("getOrgRelation", function (result) {
            var item = jQuery.parseJSON(result);
            addParentIds(item);
            $("#orgRelationForm").stk_submit("getRelation", function (result) {
                if (result != "") {
                    var data = jQuery.parseJSON(result);
                    $("#parentId").stk_val(data.parentid);
                    $("#parentId").stk_removeOptions([data.objid]);
                    $("#relationId").stk_val(data.objid);
                    //stk.debug("relationId.updateOrgRelation");

                    $("#selectOrg").stk_val(data.orgid);
                    $(".selectOrgTr").stk_hide();
                    $("#orgRelationWindow").stk_show({title:'请选择'});
                }
            });
        });
    } else {
        stk.alert("请选择要修改的组织结构");
    }
}
/**
 *  选中树事件
 * @param objid  当前选中的值
 */
function checkTree(objid) {
    $("#selectTree").stk_val(objid);
}
</script>
</head>
<body>
<plugin:colCheckbox id="checkBoxPlugin" name="check"/>
<plugin:colRowNum id="rowNumPlugin"/>
<plugin:colLink id="updateBtn" text="修改" dataVar="data">
    updateRelationScheme(data);
</plugin:colLink>
<plugin:colLink id="configBtn" text="配置" dataVar="scheme">
    configRelationScheme(scheme);
</plugin:colLink>
<ui:table id="orgRelationSchemeTable" actionClass="com.sinitek.managerframework.org.action.OrgRelationSchemeAction"
          allowExport="true" exportFileName="组织结构上下级汇报关系方案管理">
    <layout:tableToolBar position="top">
        <ui:toolbarButton text="新增" icon="ui-icon-document">
            <event:onclick>
                addRelationScheme();
            </event:onclick>
        </ui:toolbarButton>
        <ui:toolbarButton text="删除" icon="ui-icon-trash">
            <event:onclick>
                remove();
            </event:onclick>
        </ui:toolbarButton>
    </layout:tableToolBar>
    <ui:col plugin="checkBoxPlugin" fixed="true" width="30px" align="center"/>
    <ui:col plugin="rowNumPlugin" fixed="true" width="30px"/>
    <ui:col property="code" title="方案代码" width="180px" allowTip="true" allowExport="true" align="left"/>
    <ui:col property="name" title="方案名称" width="40%" allowTip="true" allowExport="true" align="left"/>
    <ui:col property="brief" title="方案备注" width="60%" allowTip="true" allowExport="true" align="left"/>
    <ui:col plugin="updateBtn,configBtn" title="操作" width="100px"/>
</ui:table>

<!--新增方案-->
<layout:window id="orgRelationSchemeWindow">
    <ui:form id="orgRelationSchemeForm" clazz="com.sinitek.managerframework.org.action.OrgRelationSchemeAction"
             method="saveRelationScheme">
        <input type="hidden" id="schemeId" name="schemeId"/>
        <table class="stk-form-ui-st1">
            <tr>
                <td class="hd" width="80">方案代码<em>*</em></td>
                <td class="bd" width="auto">
                    <ui:textfield id="code" name="code" width="300px"/>
                </td>
            </tr>
            <tr>
                <td class="hd" width="80">方案名称<em>*</em></td>
                <td class="bd" width="auto">
                    <ui:textfield id="name" name="name" width="300px"/>
                </td>
            </tr>
            <tr>
                <td class="hd" width="80">方案备注</td>
                <td class="bd" width="auto">
                    <ui:textarea rows="5" id="brief" name="brief" width="300px"/>
                </td>
            </tr>
            <tr class="btn-bar">
                <td class="bd" align="center" colspan="2">
                    <ui:button text="保存并新增">
                        <event:onclick>
                            saveRelationScheme(false);
                        </event:onclick>
                    </ui:button>
                    <ui:button text="保存并关闭">
                        <event:onclick>
                            saveRelationScheme(true);
                        </event:onclick>
                    </ui:button>
                    <ui:button text="关闭">
                        <event:onclick>
                            closeWindow();
                        </event:onclick>
                    </ui:button>
                </td>
            </tr>
        </table>
        <func:checkers>
            <func:checker target="code" allowBlank="false" blankText="方案代码不得为空" maxLength="30"
                          maxLengthText="方案代码不得超过30字"/>
            <func:checker target="name" allowBlank="false" blankText="方案名称不得为空" maxLength="30"
                          maxLengthText="方案名称不得超过30字"/>
            <func:checker target="brief" maxLength="100" maxLengthText="方案备注不得超过100字"/>
        </func:checkers>
    </ui:form>
</layout:window>

<!--新增组织结构汇报关系-->
<layout:window id="orgRelationWindow">
    <ui:form id="orgRelationForm" clazz="com.sinitek.managerframework.org.action.OrgRelationSchemeAction"
             method="saveRelation">
        <input type="hidden" id="schemeRelationId" name="schemeId"/>
        <input type="hidden" id="relationId" name="relationId"/>
        <input type="hidden" id="selectTree" name="selectTree"/>
        <table class="stk-form-ui-st1">
            <tr>
                <td class="hd" width="80">上级节点<em>*</em></td>
                <td class="bd" width="auto">
                    <ui:select list="#{'0':'--根--'}" id="parentId" name="parentId"></ui:select>
                </td>
            </tr>
            <tr class="selectOrgTr">
                <td class="hd" width="80">所选组织结构<em>*</em></td>
                <td class="bd" width="auto">
                    <input type="hidden" id="selectOrg" name="selectOrg"/>
                    <ui:button text="选择组织结构">
                        <event:onclick>
                            show('user','users','selectOrg','wwww');
                        </event:onclick>
                    </ui:button>
                    <div id="users" style="width:99%;height:50px"></div>
                </td>
            </tr>
            <tr class="btn-bar">
                <td class="bd" align="center" colspan="2">
                    <ui:button text="保存并新增">
                        <event:onclick>
                            saveRelation(false);
                        </event:onclick>
                    </ui:button>
                    <ui:button text="保存并关闭">
                        <event:onclick>
                            saveRelation(true);
                        </event:onclick>
                    </ui:button>
                    <ui:button text="关闭">
                        <event:onclick>
                            closeRelationWindow();
                        </event:onclick>
                    </ui:button>
                </td>
            </tr>
        </table>
        <func:checkers>
            <func:checker target="selectOrg" allowBlank="false" blankText="请选择组织结构"/>
        </func:checkers>
    </ui:form>
</layout:window>

<layout:window id="configRelationWindow" height="300px">
    <table>
        <tr>
            <td>
                <ui:button id="addBtn" text="新增">
                    <event:onclick>
                        addOrgRelation();
                    </event:onclick>
                </ui:button>
                <ui:button id="delBtn" text="删除">
                    <event:onclick>
                        delOrgRelation();
                    </event:onclick>
                </ui:button>
                <ui:button text="修改">
                    <event:onclick>
                        updateOrgRelation();
                    </event:onclick>
                </ui:button>
            </td>
        </tr>
        <tr>
            <td>
                <ui:tree id="relationTree" clazz="com.sinitek.managerframework.org.action.OrgRelationSchemeAction" jsParam="getParam"/>
            </td>
        </tr>
    </table>
</layout:window>
<%@include file="/org/searchorg/selectorginclude.jsp" %>
</body>
</html>