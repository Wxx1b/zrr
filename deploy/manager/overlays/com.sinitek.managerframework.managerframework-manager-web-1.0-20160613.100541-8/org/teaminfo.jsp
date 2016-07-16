<%--
  File Desc:      
  Product Name: SIRM
  Module Name: indicator
  Author:      潘虹
  History:     11-4-27 created by 潘虹
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/orgincludes.jsp" %>
<html>
<head><title>小组信息</title></head>
<sirm:body>
<script type="text/javascript" src="${contextPath}/scripts/org/teaminfo.js"></script>
<script type="text/javascript">
    (function () {
        sirm.define('sirm.org.param', {
            teamid: '${param.teamid}',
            id:'${param.id}'
        });
    })();

    function submitTeamForm(close) {
//        $("#teamInfoForm").stk_submit("checkIndustry", function (result) {
//            if (result != "") {
//                stk.alert(result);
//            } else {
                if ($("#teamInfoForm").stk_checkForm()) {
                    $("#teamInfoForm").stk_submit(function (result) {
                        if (result != "")
                            stk.alert(result);
                        else {
                            $("#teamInfoForm").stk_reset();
                            $("#type").stk_val("0");
                            $("#teamInfoTable").stk_query();
                            $("#indusryRelationDiv").stk_html("");
//                            frushOrgTree('0');
                            window.parent.reLoadTree();
                            window.parent.selectNode('${param.id}', '', false);
                            if (close) {
                                $("#addUpdateWindow").stk_hide();
                            }
                        }
                    });
                }
//            }
//        });
    }
    function frushOrgTree(id) {
        if ($.browser.webkit || $.browser.isMozilla) {
            parent.leftFrame.contentWindow.frushTree(id);
        } else {
            parent.leftFrame.frushTree(id);
        }
    }
</script>
<ui:form id="tabForm">
    <div class="search-params-bar">
        <table>
            <tr>
                <td class="tit"><label></label></td>
                <td class="bd"><ui:textfield id="queryteamname" name="teamname" width="80px" emptyText="小组名称"/></td>
                <td><ui:button text="查询" icon="ui-icon-circle-zoomout">
                    <event:onclick>
                        $("#teamInfoTable").stk_query();
                    </event:onclick>
                </ui:button>
                </td>
            </tr>
        </table>
    </div>
    <plugin:colCheckbox id="checkBoxPlugin" name="check"/>
    <plugin:colLink id="updateBtn" text="修改" dataVar="data">
        sirm.use('sirm.org', function(org) {
        org.showUpdateWindow(data);
        });
    </plugin:colLink>
    <plugin:colLink id="postLink" dataVar="link">
        sirm.use('sirm.org', function(org) {
        org.postlocation(link);
        });
    </plugin:colLink>
    <input type="hidden" id="order" name="order">
    <plugin:colRowNum id="rowNumPlugin"/>
    <ui:table id="teamInfoTable" nowrap="true" queryForm="tabForm"
              actionClass="com.sinitek.managerframework.org.action.TeamInfoTableAction" width="100%" allowInit="false"
              allowExport="true" exportFileName="组织结构-小组">
        <layout:tableToolBar position="top">
            <ui:toolbarButton text="新增" icon="ui-icon-document">
                <event:onclick>
                    sirm.use('sirm.org', function(org) {
                    org.showAddWindow();
                    });
                </event:onclick>
            </ui:toolbarButton>
            <ui:toolbarButton text="删除" icon="ui-icon-trash">
                <event:onclick>
                    sirm.use('sirm.org', function(org) {
                    org.remove();
                    });
                </event:onclick>
            </ui:toolbarButton>
            <ui:toolbarButton text="排序" icon="ui-icon-arrow-2-n-s">
                <event:onclick>
                    sirm.use('sirm.org', function(org) {
                    org.showTeamSortWindow();
                    });
                </event:onclick>
            </ui:toolbarButton>
        </layout:tableToolBar>
        <func:tableExport>
            <ui:col property="teamname" title="小组名称" width="15%" align="left"/>
            <%--<ui:col property="teamorg" title="小组长" width="25%" align="left"/>--%>
            <ui:col property="teamdec" title="小组描述" width="60%" align="left"/>
        </func:tableExport>
        <ui:col plugin="checkBoxPlugin" align="center" width="30px"/>
        <ui:col plugin="rowNumPlugin" width="30px"/>
        <ui:col property="teamname" plugin="postLink" title="小组名称" width="100px" align="left" allowTip="true"/>
        <%--<ui:col property="teamorg" title="小组长" width="25%" align="left"/>--%>
        <ui:col property="teamdec" title="小组描述" width="60%" align="left"/>
        <ui:col property="researchflag" title="研究小组" width="60px"/>
        <%--<ui:colCust clazz="com.sinitek.managerframework.org.action.TeamInfoFormAction" method="getIndustry" title="分管行业" width="25%"--%>
        <%--align="left"/>--%>
        <ui:col plugin="updateBtn" title="操作" width="15%"/>
        <event:ontableorder propertyVar="property" orderTypeVar="order">
            $("#order").stk_val(property+":"+order);
            $("#teamInfoTable").stk_query();
        </event:ontableorder>
    </ui:table>
</ui:form>


<!--岗位排序-->
<layout:window id="teamSortWindow" width="300px">
    <ui:form id="teamSortForm" clazz="com.sinitek.managerframework.org.action.TeamFormAction" method="saveTeamSort">
        <div style="padding:10px;" align="center">
                <%--<input type="hidden" id="teamsortid" name="teamsortid" value="${param.orgid}"/>--%>
            <ui:doubleSelect id="teamSort" name="teamSort" selectTitle="排序"/>
            <script type="text/javascript">
                $(document).ready(function () {
                    $("#teamSort_r").unbind("dblclick");
                });
            </script>
            <ui:button text="保存">
                <event:onclick>
                    sirm.use('sirm.org', function(org) {
                    org.saveTeamSort();
                    });
                </event:onclick>
            </ui:button>
        </div>
    </ui:form>
</layout:window>
<layout:window id="addUpdateWindow" width="500px">
    <ui:form id="teamInfoForm" clazz="com.sinitek.managerframework.org.action.TeamInfoFormAction" method="saveTeamInfo">
        <input type="hidden" id="type" name="type"/>
        <input type="hidden" id="objid" name="objid"/>
        <input type="hidden" id="industrycode" name="industrycode"/>

        <div>
            <table class="stk-form-ui-st1">
                <tr>
                    <td class="hd" width="80">小组名称<em>*</em></td>
                    <td class="bd" width="auto">
                        <ui:textfield width="260px" id="teamname" name="teamname"/> <br/>
                        <ui:checkbox name="researchflag" id="researchflag"/>是研究小组
                    </td>
                </tr>
                    <%--<tr>--%>
                    <%--<td class="hd" width="80">分管行业</td>--%>
                    <%--<td class="bd" width="auto">--%>
                    <%--<basedata:industrySprite>--%>
                    <%--<basedata:param name="multi" value="false"/>--%>
                    <%--<basedata:param name="width" value="200px"/>--%>
                    <%--<basedata:param name="prefix" value="query"/>--%>
                    <%--<basedata:param name="stype" value="auto"/>--%>
                    <%--<basedata:param name="relationDiv" value="indusryRelationDiv"/>--%>
                    <%--</basedata:industrySprite>--%>
                    <%--<div id="indusryRelationDiv"></div>--%>
                    <%--</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                    <%--<td class="hd" width="80">小组长</td>--%>
                    <%--<td class="bd" width="auto">--%>
                    <%--<ui:button text="选择人员">--%>
                    <%--<event:onclick>--%>
                    <%--show('user','users','usershidden','wwww','true');--%>
                    <%--</event:onclick>--%>
                    <%--</ui:button>--%>
                    <%--<div id="users" style="width:99%"></div>--%>
                    <%--<input id="usershidden" name="usershidden" type="hidden"/>--%>
                    <%--</td>--%>
                    <%--</tr>--%>
                <tr>
                    <td class="hd" width="80">小组描述</td>
                    <td class="bd" width="auto">
                        <ui:textarea width="280px" rows="10" id="teamdec" name="teamdec"/>
                    </td>
                </tr>
                <tr class="btn-bar">
                    <td class="hd"></td>
                    <td class="bd">
                        <ui:button text="保存并关闭">
                            <event:onclick>
                                submitTeamForm(true);
                            </event:onclick>
                        </ui:button>
                        <ui:button text="保存并新增" id="addUpdateBtn">
                            <event:onclick>
                                submitTeamForm(false);
                            </event:onclick>
                        </ui:button>
                        <ui:button text="关闭">
                            <event:onclick>
                                $("#addUpdateWindow").stk_hide();
                            </event:onclick>
                        </ui:button>
                    </td>
                </tr>
            </table>
        </div>
        <func:checkers>
            <func:checker target="teamname" allowBlank="false" blankText="请输入小组名称" maxLength="40"
                          maxLengthText="小组名称不能超过40字"/>
            <func:checker target="teamdec" maxLength="150" maxLengthText="小组描述不能超过150字"/>
        </func:checkers>
    </ui:form>
</layout:window>

<layout:window id="showInfoWindow" width="500px">
    <div>
        <table class="stk-form-ui-st1">
            <tr>
                <td class="hd" width="80">小组名称</td>
                <td class="bd" width="auto">
                    <label id="labteamname" name="labteamname"></label>
                </td>
            </tr>
            <tr>
                <td class="hd" width="80">小组描述</td>
                <td class="bd" width="auto">
                    <label id="labteamdec" name="labteamdec"></label>
                </td>
            </tr>
            <tr class="btn-bar">
                <td class="hd"></td>
                <td class="bd">
                    <ui:button text="关闭">
                        <event:onclick>
                            $("#showInfoWindow").stk_hide();
                        </event:onclick>
                    </ui:button>
                </td>
            </tr>
        </table>
    </div>
</layout:window>
<%@include file="searchorg/selectorginclude.jsp" %>
</sirm:body>
</html>