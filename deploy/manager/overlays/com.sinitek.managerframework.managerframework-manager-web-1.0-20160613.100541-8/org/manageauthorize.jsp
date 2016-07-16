<%--
  Created by IntelliJ IDEA.
  User: HF.fay
  Date: 14-12-15
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/orgincludes.jsp" %>
<sirm:page clazz="com.sinitek.managerframework.org.action.AuthorizeAction" method="loadPage"/>
<%@ taglib prefix="org" uri="http://www.sinitek.com/sirm/org/tag" %>

<html>
<head>
    <title>授权管理</title>
    <script type="text/javascript">


        function addAuth() {
            $("#addAuthWindow").stk_show({"title": "新增授权"});
            $("#addAuthForm").stk_reset();

            $("#objid").stk_val(0);
            _user_emptyValue("_dept");
            _user_emptyValue("_org");
            $('#__dept_searchUser').blur();
            $('#__org_searchUser').blur();
            document.getElementById("alowgrant1").checked = false;
            document.getElementById("alowgrant2").checked = true;
        }

        function editAuth(data) {
            $("#addAuthWindow").stk_show({"title": "编辑授权"});
            $("#addAuthForm").stk_reset();

            $("#objid").stk_val(data.objid);
            _user_updateValue("_dept", [data.sourceid]);
            _user_updateValue("_org", [data.begrantid]);
            document.getElementById("alowgrant1").checked = data.alowgrant == 1 ? true : false;
            document.getElementById("alowgrant2").checked = data.alowgrant == 1 ? false : true;
        }

        function removeAuth(data) {
            stk.alert("是否将下级部门的授权信息一并删除？", "询问", {
                "是":function(){
                    stk.closeDialog();
                    callRemoveAuth(data.objid, 1);
                },
                "否":function(){
                    stk.closeDialog();
                    callRemoveAuth(data.objid, 0);
                },
                "取消":function(){
                    stk.closeDialog();
                    $("#authtable").stk_query();
                }
            })
        }

        function callRemoveAuth(objid, type){
            stk.call({
                className: "com.sinitek.managerframework.org.action.AuthorizeAction",
                method: 'removeAuth',
                param: {
                    objid: objid,
                    type: type
                },
                callBack: function (result) {
                    if (StringUtils.isNotBlank(result)) {
                        stk.alert(result);
                        return;
                    }
                    stk.alert("删除成功", "提示");
                    $("#authtable").stk_query();
                }
            });
        }


        function saveAuth() {
            if ($("#addAuthForm").stk_checkForm()) {
                $("#addAuthForm").stk_submit("saveAuthorize", function (result) {
                    if (StringUtils.isNotBlank(result)) {
                        stk.alert(result);
                    } else {
                        stk.info("保存成功");
                        $('#addAuthWindow').stk_hide();
                        $("#authtable").stk_query();
                    }
                });
            }
        }

        function checkBegrant() {
            var a = $('#begrantid').stk_val();
            var array = a.split(':');
            if (StringUtils.isNotBlank(a)) {
                if(array[2] != 2 && array[2] != 8)
                    return "被授权对象请选择岗位或人员！";
                else
                    return true;
            } else {
                return "请选择被授权对象！";
            }
        }
    </script>
</head>
<sirm:body>

    <div style="padding-top: 5px">

        <ui:form id="queryForm">
            <div class="search-params-bar">
                <table>
                    <tr>
                        <td class="tit" nowrap="true"><label>授权部门</label></td>
                        <td class="bd" nowrap="true">
                            <jsp:include page="/org/searchorg/searchorginclude.jsp">
                                <jsp:param name="prefix" value="unitq"/>
                                <jsp:param name="width" value="120px"/>
                            </jsp:include>
                        </td>
                        <%--<td class="tit" nowrap="true"><label>任务名称</label></td>--%>
                        <%--<td class="bd" nowrap="true">--%>
                            <%--<ui:textfield id="tasknamequery" name="taskname"/>--%>
                        <%--</td>--%>
                        <%--<td class="tit" nowrap="true"><label>任务分类</label></td>--%>
                        <%--<td class="bd">--%>
                            <%--<ui:select id="tasktypequery" name="tasktype" list="#attr.typeMap" headerKey=""--%>
                                       <%--headerValue="-全部-"/>--%>
                        <%--</td>--%>
                        <td class="tit" nowrap="true"><label>允许授权</label></td>
                        <td class="bd">
                            <ui:select id="alowgrantq" name="alowgrantq" list="#{1:'是',0:'否'}" headerKey=""
                                       headerValue="--全部--" width="80px"/>
                        </td>
                        <td class="bd">
                            <ui:button text="查询" icon="ui-icon-circle-zoomout">
                                <event:onclick>
                                    $("#authtable").stk_query();
                                </event:onclick>
                            </ui:button>
                        </td>
                    </tr>
                </table>
            </div>
            <input type="hidden" id="ismanager" name="ismanager" value="${isManager}"/>
        </ui:form>


        <plugin:colLink id="edit" dataVar="data" text="编辑">
            editAuth(data);
        </plugin:colLink>
        <plugin:colLink id="remove" dataVar="data" text="删除">
            removeAuth(data);
        </plugin:colLink>
        <ui:table id="authtable"
                  actionClass="com.sinitek.managerframework.org.action.AuthorizeAction"
                  queryForm="queryForm" width="100%" nowrap="true" pageSize="15">
            <layout:tableToolBar position="top">
                <ui:toolbarButton icon="ui-icon-plus" text="新增">
                    <event:onclick>
                        addAuth();
                    </event:onclick>
                </ui:toolbarButton>
            </layout:tableToolBar>
            <ui:col property="name" title="授权部门" width="30%" align="left" allowTip="true" allowSort="false"/>
            <ui:col property="begrantname2" title="被授权对象" width="120px" align="left" allowSort="false"/>
            <ui:colCust method="getAlowgrantName" property="alowgrant" title="允许授权" width="80px" allowSort="false"/>
            <ui:col property="grantname" title="授权人" width="120px" align="left" maxWords="30" allowSort="false"/>
            <ui:colDate property="granttime"  title="授权时间" format="yyyy-MM-dd HH:mm" width="120px" align="center" maxWords="30" allowSort="false"/>
            <ui:col plugin="edit,remove" title="操作" width="80px" allowSort="false"/>
        </ui:table>
    </div>


    <layout:window id="addAuthWindow" title="新增授权" width="320px">
        <ui:form id="addAuthForm" clazz="com.sinitek.managerframework.org.action.AuthorizeAction" method="saveAuthorize">
            <input type="hidden" id="objid" name="objid">
            <table class="stk-form-ui-st1">
                <tr>
                    <td class="hd" width="80px">授权部门<em>*</em></td>
                    <td class="bd" width="auto" nowrap="true">
                        <input type="hidden" id="sourceid" name="sourceid">
                        <org:SelectOrg prefix="_dept" mode="DEPT" multi="false" hiddenId="sourceid" width="120px"/>
                    </td>
                </tr>
                <tr>
                    <td class="hd" width="80px">被授权对象<em>*</em></td>
                    <td class="bd" width="auto" nowrap="true">
                        <input type="hidden" id="begrantid" name="begrantid">
                        <org:SelectOrg prefix="_org" mode="org" multi="false" hiddenId="begrantid" width="120px"/>
                    </td>
                </tr>
                <tr>
                    <td class="hd" width="80px">允许授权</td>
                    <td class="bd" width="auto" nowrap="true">
                        <div>
                            <input type="radio" id="alowgrant1" name="alowgrant" value="1">是</input>
                            &nbsp;&nbsp;
                            <input type="radio" id="alowgrant2" name="alowgrant" value="0">否</input>
                        </div>
                    </td>
                </tr>
            </table>
            <layout:boxcell width="320px" align="center">
                <ui:button text="保存">
                    <event:onclick>
                        saveAuth();
                    </event:onclick>
                </ui:button>&nbsp;
                <ui:button text="关闭">
                    <event:onclick>
                        $('#addAuthWindow').stk_hide();
                    </event:onclick>
                </ui:button>
            </layout:boxcell>
            <func:checkers>
                <func:checker target="sourceid" allowBlank="false" blankText="请选择授权部门！"/>
                <func:checker target="begrantid" allowBlank="false" blankText="请选择被授权对象！" validator="checkBegrant()"/>
            </func:checkers>
        </ui:form>
    </layout:window>

</sirm:body>
</html>
