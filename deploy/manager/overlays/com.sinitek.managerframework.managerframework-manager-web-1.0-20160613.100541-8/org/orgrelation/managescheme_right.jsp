<%--
  Created by IntelliJ IDEA.
  User: HF.fay
  Date: 14-6-24
  Time: 13:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/commonincludes.jsp" %>
<sirm:page clazz="com.sinitek.managerframework.org.action.OrgRelationTableAction" method="loadOrgInfo"></sirm:page>
<html>
<head>
    <title></title>
    <script type="text/javascript">
        function getselect() {
            var top = document.createElement("optgroup");
            stk.call({
                className: "com.sinitek.managerframework.menu.action.MenuAction",
                method: 'getMenuSelect',
                param: {},
                callBack: function (result) {
                    var menuselect = $("#menuselect");
                    var html = [];
                    html.push("<option value=\"\">请选择</option>");

                    for (var i in result) {
                        var blank = [];
                        for(var j = 0; j < result[i].level * 4; j++){
                            blank.push("&nbsp;");
                        }
                        html.push("<option value=\""+ result[i].objid +"\">" + blank.join("") + result[i].name + "</option>");
                    }

                    menuselect.html(html.join("\n"));
                },
                exceptionHandler: function (message, e) {
                    stk.error(message)
                }
            });
        }

        function showUpdateWindow(data) {
            $("#menuname").stk_val("");
            $("#description2").stk_val("");
            $("#url").stk_val("");


            $("#menuname").stk_val(data.name);
            $("#url").stk_val(data.url);
            $("#objid").stk_val(data.objid);
            $("#description2").stk_val(data.description);
            $("#style").stk_val(data.style);
            $("#addmenuWindow").stk_show();

        }

        function showMoveWindow(data) {
            $("#movemenuWindow").stk_show();
            $("#spanmenuname").text(data.name);
            $("#objid2").val(data.objid);
            $("#menuposition").val("");

            getselect();
        }

        function removeMenu() {
            if ($("#checkBoxPlugin").hasSelect()) {
                stk.confirm("确认删除吗？", function () {
                    $("#checkBoxPlugin").stk_call({type:'0'}, function (result) {
//                    $("#industryTree").stk_refresh($("#qparentid").stk_val());
                        $("#menuTable").stk_query();
                        window.parent.reLoadTree();
                    });
                });
            }
            else {
                stk.alert("请选中要删除的数据");
            }
        }

        function selectTreeNode(code, name, functionName, url, ms, pid, icon, type){
            window.parent.selectNode(code, '');
        }

        function showPostSortWindow() {
            var postdata = $("#menuTable").stk_info().data;
            var size = postdata.length;
            var postids = [size], posts = {};
            for (var i = 0; i < size; i++) {
                var postid = postdata[i].objid;
                var postname = postdata[i].name;
                posts[postid] = postname;
                postids[i] = postid;
            }
            $("#postSortWindow").stk_show({title: '排序'});
            $("#postSort").stk_init(posts, postids);
            $(".stk-p-2").hide();
            $(".stk-p-1").hide();
        }

        function savePostSort() {
            var param = sirm.org.param;
            $("#postSortForm").stk_submit(function (result) {
                if (result != "") {
                    stk.alert(result);
                } else {
                    $("#postSortWindow").stk_hide();
                    $("#postTable").stk_query();
                    freshOrgTree();
                }
                $("#postTable").stk_query();
            });
        }
        function addOrgRelation() {
            var parentid  = $("#objid").stk_val();
            $("#selectOrg").stk_val("");
            $("#users").stk_html("");
            $("#orgRelationForm").stk_submit("getOrgRelation", function (result) {

                var item = jQuery.parseJSON(result);

                addParentIds(item);
                $("#orgRelationWindow").stk_show({title:'请选择'});
                $("#selectOrgTr").stk_show();
                $("#selectTree").stk_val("");
                $("#parentId").stk_val([parentid]);
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
                    name.push("&nbsp;&nbsp;&nbsp;");
                }
                name.push(data.orgname);
                selparentid.append("<option value='"+ data.objid +"'>" + name.join("") + "</option>");
            }
        }
        /**
         *  保存关系
         */
        function saveRelation(tf) {
                $("#orgRelationForm").stk_submit(function (result) {
                    if (result != "") {
                        stk.alert(result);
                    } else {
                        //刷新
                        reflush(tf);
                        closeRelationWindow();
                    }
                });
        }
        /**
         *  关闭窗口
         */
        function closeRelationWindow() {
            $("#orgRelationWindow").stk_hide();
        }
        function reflush(flag){
            if(flag){
                window.location = sirm.jsurl("/org/orgrelation/managescheme_right.jsp");
            }
            window.parent.reLoadTree();

        }
        /**
         *  删除组织结构上下级关系
         */
        function delOrgRelation() {
            if ($("#checkBoxPlugin").hasSelect()) {
                stk.confirm("确认删除吗？", function() {
                    $("#checkBoxPlugin").stk_call({schemeid:'${param.schemeid}'}, function(result) {
                        if(result == '删除成功'){
                            stk.info(result);
                            reflush(true);
                        }else{
                            stk.alert("删除失败");
                        }
                    });
                });
            }
            else {
                stk.alert("请选中要删除的数据");
            }

        }
        /**
         *  更新
         */
        function updateOrgRelation(data) {
                $("#orgRelationForm").stk_submit("getOrgRelation", function (result) {
                    var item = jQuery.parseJSON(result);
                    addParentIds(item);
                    $("#parentId").stk_val(data.parentid);
                    $("#parentId").stk_removeOptions([data.objid]);
                    $("#relationId").stk_val(data.objid);
                    $("#selectOrgTr").hide();
                    $("#orgRelationWindow").stk_show({title: '请选择'});
                });
            }

        <%--$(document).ready(function(){--%>
            <%--if(${objid != 0}) {--%>
                <%--var nodeinfo = window.parent.getNodeInfo('${objid}');--%>
                <%--var maxlevel = window.parent.getMaxLevel();--%>

                <%--if (nodeinfo) {--%>
                    <%--if (maxlevel != -1 && nodeinfo.level >= maxlevel) {--%>
                        <%--$("#childmenudiv").stk_hide();--%>
                        <%--$("#menuinfodiv").css("width", "600px");--%>
                        <%--return;--%>
                    <%--}--%>
                <%--}--%>
            <%--}--%>
            <%--$("#childmenudiv").stk_show();--%>
        <%--});--%>
    </script>
</head>
<sirm:body >
<%--------  展示页面  -----%>
<%-------------------------%>

<div>
    <table width="800px">
        <tr>
            <td valign="top">
                <%--<layout:panel title="" collapsible="false" id="view2" name="view2">--%>
                <ui:form id="orgschemeform">
                    <input type="hidden" id="objid" name="objid" value="${objid}">
                    <input type="hidden" id="orgid" name="orgid" value="${orgid}">
                    <input type="hidden" id="schemeid" name="schemeid" value="${param.schemeid}">
                    <layout:panel title="当前节点">
                        <div id="orginfodiv">
                            <table class="stk-form-ui-st1">
                                <tr>
                                    <td class="hd" width="110px">名称</td>
                                    <td class="bd" width="auto"><ui:label id="qname">${orgname}</ui:label></td>
                                </tr>
                                <tr>
                                    <td class="hd" width="110px">类型</td>
                                    <td class="bd" width="auto"><ui:label id="qstyle">${orgtype}</ui:label></td>
                                </tr>
                                <tr>
                                    <td class="hd" width="110px">描述</td>
                                    <td class="bd" width="auto"><ui:label id="description">${description}</ui:label></td>
                                </tr>
                            </table>
                        </div>
                    </layout:panel>

                    <div id="childorgdiv" style="margin-top: 20px">
                        <layout:panel title="下级节点">
                            <plugin:colLink id="updateBut" text="修改" dataVar="data">
                                updateOrgRelation(data);
                            </plugin:colLink>
                            <plugin:colCheckbox id="checkBoxPlugin" name="check"/>
                            <plugin:colRowNum id="rowNumPlugin">

                            </plugin:colRowNum>
                            <ui:table id="orgschemetable" actionClass="com.sinitek.managerframework.org.action.OrgRelationTableAction" nowrap="true"
                                      queryForm="orgschemeform" tableWidth="100%" pageSize="10">
                                <layout:tableToolBar position="top">
                                    <ui:toolbarButton icon="ui-icon-document" text="新增">
                                        <event:onclick>
                                            addOrgRelation();
                                        </event:onclick>
                                    </ui:toolbarButton>
                                    <ui:toolbarButton icon="ui-icon-trash" text="删除">
                                        <event:onclick>
                                            delOrgRelation();
                                        </event:onclick>
                                    </ui:toolbarButton>
                                </layout:tableToolBar>
                                <ui:col plugin="checkBoxPlugin" nowrap="false" width="30px"/>
                                <%--<ui:col plugin="rowNumPlugin" width="30px"/>--%>
                                <ui:col property="orgname" title="名称" align="left" width="200px" allowTip="true"/>
                                <ui:colCust method="getJspOrgTypeName" property="unittype" title="类型" align="left" width="100%" allowTip="true"/>
                                <%--<ui:col property="description" title="描述" align="left" width="40%" allowTip="true"/>--%>
                                <ui:col property="description" title="描述" align="left" allowTip="true"  width="200px"/>
                                <%--<ui:colCust method="setorda" title="排序" width="80px"/>--%>
                                <ui:col plugin="updateBut" title="操作" width="120px"/>
                                <event:ontableorder propertyVar="property" orderTypeVar="order">
                                    $("#order").stk_val(property+":"+order);
                                    $("#menuTable").stk_query();
                                </event:ontableorder>
                            </ui:table>
                        </layout:panel>
                    </div>
                </ui:form>
            </td>
        </tr>
    </table>
</div>


<layout:window id="orgRelationWindow">
    <ui:form id="orgRelationForm" clazz="com.sinitek.managerframework.org.action.OrgRelationSchemeAction"
             method="saveRelation">
        <input type="hidden" id="schemeRelationId" name="schemeId" value="${param.schemeid}"/>
        <input type="hidden" id="relationId" name="relationId"/>
        <table class="stk-form-ui-st1">
            <tr>
                <td class="hd" width="80">上级节点<em>*</em></td>
                <td class="bd" width="auto">
                    <ui:select list="#{'0':'--根--'}" id="parentId" name="parentId" width="150px"></ui:select>
                </td>
            </tr>
            <tr id="selectOrgTr">
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
                    <ui:button text="保存">
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
    </ui:form>
</layout:window>

</sirm:body>
<%@include file="/org/searchorg/selectorginclude.jsp" %>
</html>