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
<head><title>组织结构</title></head>
<sirm:body>
<script type="text/javascript" src="${contextPath}/scripts/org/orgstructure.js">
</script>
<script type="text/javascript">
    (function () {
        sirm.define('sirm.org.param', {
            orgid: '${param.orgid}',
            rootid: '${param.rootid}'
        });
    })();
    function freshOrgTree() {
//        if ($.browser.webkit || ($.browser.mozilla && $.browser.version != '11.0')) {
//            parent.leftFrame.contentWindow.reloadPage();
//        } else {
//            parent.leftFrame.reloadPage();
//        }
        window.parent.reLoadTree();
        window.parent.selectNode('${param.rootid}', '', false);
    }
    function frushOrgTreetemp(id) {
//        if ($.browser.webkit || ($.browser.mozilla && $.browser.version != '11.0')) {
//            parent.leftFrame.contentWindow.frushTree(id);
//        } else {
//            parent.leftFrame.frushTree(id);
//        }
        window.parent.reLoadTree();
    }

    function selectTreeNode(id){
        window.parent.selectNode(id, '');
    }
</script>
当前位置：<span id="currentSpan"></span>
<layout:tabs width="99%">
    <layout:tab title="部门员工">
        <ui:form id="usersForm">
            <div class="search-params-bar">
                <table>
                    <tr>
                        <td class="tit"><label></label></td>
                        <td class="bd"><ui:textfield id="querycname" name="empName" width="120px" emptyText="登录名 / 员工姓名"/></td>
                        <td><ui:button text="查询" icon="ui-icon-circle-zoomout">
                            <event:onclick>
                                $("#userTable").stk_query();
                            </event:onclick>
                        </ui:button>
                        </td>
                    </tr>
                </table>
            </div>
            <plugin:colCheckbox id="usercheckBoxPlugin" name="usercheck"/>
            <input type="hidden" id="strutureId" name="strutureId" value="${param.orgid}"/>
            <input type="hidden" id="inservice" name="inservice" value="1"/>
            <input type="hidden" id="order" name="order">
            <plugin:colRowNum id="rowNumPlugin"/>
            <ui:table id="userTable" nowrap="true" actionClass="com.sinitek.managerframework.org.action.UserTableAction"
                      queryForm="usersForm" width="100%" pageSize="15" allowInit="false"
                      allowExport="true" exportFileName="组织结构-部门员工">
                <layout:tableToolBar position="top"> &nbsp;&nbsp;
                    <ui:toolbarButton text="新增" icon="ui-icon-document">
                        <event:onclick>
                            sirm.use('sirm.org', function(org) {
                            org.showUsersAddWindow();
                            });
                        </event:onclick>
                    </ui:toolbarButton>
                    <ui:toolbarButton text="删除" icon="ui-icon-trash">
                        <event:onclick>
                            sirm.use('sirm.org', function(org) {
                            org.removeuser();
                            });
                        </event:onclick>
                    </ui:toolbarButton>
                </layout:tableToolBar>
                <ui:col plugin="usercheckBoxPlugin" allowSort="true" align="center" width="20px"/>
                <ui:col plugin="rowNumPlugin" width="30px"/>
                <ui:col property="displayname" title="员工姓名" width="60px" align="left" allowTip="true"/>
                <ui:col property="username" title="登录名" width="80px" align="left" allowTip="true"/>
                <%--<ui:col property="orgid" title="工号" width="70px" align="left" allowTip="true"/>--%>
                <ui:col property="email" title="Email" align="left" width="25%" allowTip="true"/>
                <ui:col property="tel" title="办公电话" align="left" width="25%" allowTip="true"/>
                <ui:col property="positionname" title="岗位部门名称" width="50%" align="left" allowTip="true"/>
                <%--<ui:col property="unitname" title="部门名称" width="35%" align="left" allowTip="true"allowSort="false"/>--%>
                <event:ontableorder propertyVar="property" orderTypeVar="order">
                    $("#order").stk_val(property+":"+order);
                    $("#userTable").stk_query();
                </event:ontableorder>
            </ui:table>
        </ui:form>
    </layout:tab>

    <!--岗位信息开始-->
    <layout:tab title="部门岗位">
        <ui:form id="tabForm">
            <plugin:colCheckbox id="checkBoxPlugin" name="postInfocheck"/>
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
            <plugin:colLink id="moveBtn" text="移动" dataVar="data">
                sirm.use('sirm.org', function(org) {
                org.showPositionMoveWindow(data);
                });
            </plugin:colLink>
            <input type="hidden" id="postid" name="postid" value="${param.orgid}"/>
            <input type="hidden" id="postorder" name="postorder">
            <plugin:colRowNum id="rowNumPlugin2"/>
            <ui:table id="postTable" nowrap="true" queryForm="tabForm"
                      actionClass="com.sinitek.managerframework.org.action.PostTableAction" width="100%" allowInit="false"
                      allowExport="true"
                      exportFileName="组织结构-部门岗位">
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
                            org.showPostSortWindow();
                            });
                        </event:onclick>
                    </ui:toolbarButton>
                </layout:tableToolBar>
                <func:tableExport>
                    <ui:col property="postname" title="岗位名称" width="100px" align="left" allowTip="true"/>
                    <ui:col property="postdec" title="岗位描述" width="33%" align="left"/>
                    <ui:col property="executeName" title="行政上级" width="33%" align="left"/>
                    <ui:col property="businessName" title="业务上级" width="33%" align="left"/>
                </func:tableExport>
                <ui:col plugin="checkBoxPlugin" allowSort="true" align="center" width="20px"/>
                <ui:col plugin="rowNumPlugin2" width="30px"/>
                <ui:col property="postname" plugin="postLink" title="岗位名称" width="100px" align="left" allowTip="true"/>
                <ui:col property="postdec" title="岗位描述" width="25%" align="left"/>
                <ui:col property="executeName" title="行政上级" width="25%" align="left"/>
                <ui:col property="businessName" title="业务上级" width="25%" align="left"/>
                <ui:col plugin="updateBtn,moveBtn" title="操作" width="100px"/>
                <event:ontableorder propertyVar="property" orderTypeVar="order">
                    $("#postorder").stk_val(property+":"+order);
                    $("#postTable").stk_query();
                </event:ontableorder>
            </ui:table>
        </ui:form>
    </layout:tab>
    <!--岗位移动-->
    <layout:window id="movepositionWindow" width="540px" cellUnderLine="true" cellMarginBottom="1px" feature="labelBg"
                   title="岗位移动">
        <ui:form id='movepositionform' clazz="com.sinitek.managerframework.org.action.PostFormAction" method="movePosition">
            <input type="hidden" id="orgid" name="orgid" value="0">
            <div style="width:510px">
                <div>
                    <table class="stk-form-ui-st1">
                        <tr>
                            <td class="hd" width="80"><label>上级部门名称</label></td>
                            <td class="bd" width="auto">
                                <label id="parentunitname"></label>

                            </td>
                        </tr>
                        <tr>
                            <td class="hd" width="80"><label>岗位名称</label></td>
                            <td class="bd" width="auto">
                                <label id="postname1"></label>
                            </td>
                        </tr>
                        <tr id="selecttr">
                            <td class="hd" width="80"><label>移动至</label></td>
                            <td class="bd" width="auto">
                                <select id="postselect" name="postselect"></select>

                                <select id="position" name="position">
                                    <option value="">请选择</option>
                                    <option value="1">前方</option>
                                    <option value="2">后方</option>
                                    <option value="3">下级</option>
                                </select>
                            </td>
                        </tr>

                        <tr class="btn-bar">
                            <td class="hd"></td>
                            <td class="bd">
                                <ui:button text="确定">
                                    <event:onclick>
                                        if($("#movepositionform").stk_checkForm()) {
                                        $("#movepositionform").stk_submit(function(result){
                                        if ("ok" == result){
                                        $("#movepositionWindow").stk_hide();
                                        $("#postTable").stk_query();
                                        window.parent.reLoadTree();
                                        stk.info("操作成功");
                                        }
                                        else{
                                        stk.alert(result);
                                        }
                                        });
                                        }
                                    </event:onclick>
                                </ui:button>

                                <ui:button text="取消">
                                    <event:onclick>
                                        $("#movepositionWindow").stk_hide();
                                    </event:onclick>
                                </ui:button>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <func:checkers>
                <func:checker target="postselect" allowBlank="false" blankText="请选择目标节点"/>
                <func:checker target="position" allowBlank="false" blankText="请选择目标位置"/>
            </func:checkers>
        </ui:form>
    </layout:window>
    <!--部门信息开始-->
    <layout:tab title="下级部门">
        <ui:form id="structureTableForm">
            <plugin:colCheckbox id="structurePlugin" name="structurecheck"/>
            <plugin:colLink id="updateStruBtn" text="修改" dataVar="data">
                sirm.use('sirm.org', function(org) {
                org.updateStructureWindow(data);
                });
            </plugin:colLink>
            <plugin:colLink id="structureLink" dataVar="link">
                sirm.use('sirm.org', function(org) {
                org.structurelocation(link);
                });
            </plugin:colLink>
            <plugin:colLink id="moveBtn2" text="移动" dataVar="data">
                sirm.use('sirm.org', function(org) {
                org.showDeptMoveWindow(data);
                });
            </plugin:colLink>
            <input type="hidden" id="orgparamid" name="orgparamid" value="${param.orgid}"/>
            <input type="hidden" id="orgorder" name="orgorder">
            <plugin:colRowNum id="rowNumPlugin3"/>
            <ui:table id="structureTable" nowrap="true" queryForm="structureTableForm"
                      actionClass="com.sinitek.managerframework.org.action.StructureTableAction" width="100%"
                      allowInit="false" allowExport="true" exportFileName="组织结构-下级部门">
                <layout:tableToolBar position="top">
                    <ui:toolbarButton text="新增" icon="ui-icon-document">
                        <event:onclick>
                            sirm.use('sirm.org', function(org) {
                            org.addStructureWindow();
                            });
                        </event:onclick>
                    </ui:toolbarButton>
                    <ui:toolbarButton text="删除" icon="ui-icon-trash">
                        <event:onclick>
                            sirm.use('sirm.org', function(org) {
                            org.removeStructure();
                            });
                        </event:onclick>
                    </ui:toolbarButton>
                    <ui:toolbarButton text="排序" icon="ui-icon-arrow-2-n-s">
                        <event:onclick>
                            sirm.use('sirm.org', function(org) {
                            org.showStructureSortWindow();
                            });
                        </event:onclick>
                    </ui:toolbarButton>
                </layout:tableToolBar>
                <func:tableExport>
                    <ui:col property="orgname" title="部门名称" width="40%" align="left"/>
                    <ui:col property="orgdec" title="部门描述" width="40%" align="left"/>
                </func:tableExport>
                <ui:col plugin="structurePlugin" allowSort="true" align="center" width="20px"/>
                <ui:col plugin="rowNumPlugin3" width="30px"/>
                <ui:col property="orgname" plugin="structureLink" title="部门名称" width="100px" align="left"
                        allowTip="true"/>
                <ui:col property="orgdec" title="部门描述" width="80%" align="left" allowTip="true"/>
                <ui:col plugin="updateStruBtn,moveBtn2" title="操作" width="100px"/>
                <event:ontableorder propertyVar="property" orderTypeVar="order">
                    $("#orgorder").stk_val(property+":"+order);
                    $("#structureTable").stk_query();
                </event:ontableorder>
            </ui:table>
        </ui:form>
    </layout:tab>
</layout:tabs>
<!--部门移动-->
<layout:window id="movedeptWindow" width="540px" cellUnderLine="true" cellMarginBottom="1px" feature="labelBg"
               title="岗位移动">
    <ui:form id='movedeptform' clazz="com.sinitek.managerframework.org.action.StructureFormAction" method="moveDepartment">
        <input type="hidden" id="deptid" name="deptid" value="0">
        <div style="width:510px">
            <div>
                <table class="stk-form-ui-st1">
                    <tr>
                        <td class="hd" width="80"><label>上级部门名称</label></td>
                        <td class="bd" width="auto">
                            <label id="parentunitname2"></label>

                        </td>
                    </tr>
                    <tr>
                        <td class="hd" width="80"><label>部门名称</label></td>
                        <td class="bd" width="auto">
                            <label id="deptname"></label>
                        </td>
                    </tr>
                    <tr id="selecttr2">
                        <td class="hd" width="80"><label>移动至</label></td>
                        <td class="bd" width="auto">
                            <select id="deptselect" name="deptselect"></select>

                            <select id="deptposition" name="deptposition">
                                <option value="">请选择</option>
                                <option value="1">前方</option>
                                <option value="2">后方</option>
                                <option value="3">下级</option>
                            </select>
                        </td>
                    </tr>

                    <tr class="btn-bar">
                        <td class="hd"></td>
                        <td class="bd">
                            <ui:button text="确定">
                                <event:onclick>
                                    if($("#movedeptform").stk_checkForm()) {
                                    $("#movedeptform").stk_submit(function(result){
                                    if ("ok" == result){
                                    $("#movedeptWindow").stk_hide();
                                    $("#structureTable").stk_query();
                                    window.parent.reLoadTree();
                                    stk.info("操作成功");
                                    }
                                    else{
                                    stk.alert(result);
                                    }
                                    });
                                    }
                                </event:onclick>
                            </ui:button>

                            <ui:button text="取消">
                                <event:onclick>
                                    $("#movedeptWindow").stk_hide();
                                </event:onclick>
                            </ui:button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <func:checkers>
            <func:checker target="deptselect" allowBlank="false" blankText="请选择目标节点"/>
            <func:checker target="deptposition" allowBlank="false" blankText="请选择目标位置"/>
        </func:checkers>
    </ui:form>
</layout:window>
<!--岗位排序-->
<layout:window id="postSortWindow" width="300px">
    <ui:form id="postSortForm" clazz="com.sinitek.managerframework.org.action.PostFormAction" method="savePostSort">
        <div style="padding:10px;" align="center">
            <input type="hidden" id="postsortid" name="postsortid" value="${param.orgid}"/>
            <ui:doubleSelect id="postSort" name="postSort" selectTitle="排序"/>
            <script type="text/javascript">
                $(document).ready(function () {
                    $("#postSort_r").unbind("dblclick");
                });
            </script>
            <ui:button text="保存">
                <event:onclick>
                    sirm.use('sirm.org', function(org) {
                    org.savePostSort();
                    });
                </event:onclick>
            </ui:button>
        </div>
    </ui:form>
</layout:window>
<layout:window id="postWindow" width="500px">
    <ui:form id="postForm" clazz="com.sinitek.managerframework.org.action.PostFormAction" method="savePostInfo">
        <input type="hidden" id="postpid" name="postpid"/>
        <input type="hidden" id="objid" name="objid"/>
        <input type="hidden" id="type" name="type"/>

        <div style="width:510px">
            <div>
                <table class="stk-form-ui-st1">
                    <tr>
                        <td class="hd" width="80">岗位名称<em>*</em></td>
                        <td class="bd" width="auto"><ui:textfield width="260px" id="postname" name="postname"/></td>
                    </tr>
                    <tr>
                        <td class="hd" width="80">行政上级</td>
                        <td class="bd" width="auto">
                            <org:orgTag orglist="executelist"/>
                            <select id="executeId"
                                    onchange="if(this.options[this.selectedIndex].disabled==true)$('#executeId').stk_val('0');" style="width: 265px;">
                                    ${executelist}
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="hd" width="80">业务上级</td>
                        <td class="bd" width="auto">
                            <org:orgTag orglist="businesslist"/>
                            <select id="businessId"
                                    onchange="if(this.options[this.selectedIndex].disabled==true)$('#businessId').stk_val('0');" style="width: 265px;">
                                    <%--onchange="if(this.options[this.selectedIndex].disabled==true) this.selectedIndex=0">--%>
                                    ${businesslist}
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="hd" width="80">岗位描述</td>
                        <td class="bd" width="auto"><ui:textarea width="280px" rows="10" id="postdec"
                                                                 name="postdec"/></td>
                    </tr>
                    <tr class="btn-bar">
                        <td class="hd"></td>
                        <td class="bd">
                            <ui:button text="保存并新增" id="updatePostBtn">
                                <event:onclick>
                                    if($("#postForm").stk_checkForm()){
                                    $("#postForm").stk_submit(function(result){
                                    if(result!=""){
                                    stk.alert(result);
                                    }else{
                                    stk.info("保存成功");
                                    $("#postForm").stk_reset();
                                    $("#postpid").stk_val($("#postid").stk_val());
                                    $("#type").stk_val(0);
                                    $("#postTable").stk_query();
                                    freshOrgTree();
                                    }
                                    });
                                    }
                                </event:onclick>
                            </ui:button>
                            <ui:button text="保存并关闭">
                                <event:onclick>
                                    if ($("#postForm").stk_checkForm()) {
                                    $("#postForm").stk_submit(function(result) {
                                    if (result != "") {
                                    stk.alert(result);
                                    } else {
                                    stk.info("保存成功");
                                    $("#postWindow").stk_hide();
                                    $("#postTable").stk_query();
                                    freshOrgTree();
                                    }
                                    });
                                    }
                                </event:onclick>
                            </ui:button>
                            <ui:button text="关闭">
                                <event:onclick>
                                    $("#postWindow").stk_hide();
                                </event:onclick>
                            </ui:button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <func:checkers>
            <%--<func:checker target="postname" allowBlank="false" blankText="请输入岗位名称" maxLength="40"--%>
                          <%--maxLengthText="岗位名称不能超过40字"/>--%>
            <func:checker target="postdec" maxLength="150" maxLengthText="岗位描述不能超过150字"/>
            <func:checker target="businessId" validator="sirm.org.checkPost('businessId')"/>
            <func:checker target="executeId" validator="sirm.org.checkPost('executeId')"/>
        </func:checkers>
    </ui:form>
</layout:window>
<!--岗位信息结束-->

<!--部门排序-->
<layout:window id="structureSortWindow" width="300px">
    <ui:form id="structureSortForm" clazz="com.sinitek.managerframework.org.action.StructureFormAction" method="saveStructureSort">
        <div style="padding:10px;" align="center">
            <input type="hidden" id="structuresortid" name="structuresortid" value="${param.orgid}"/>
            <ui:doubleSelect id="structureSort" name="structureSort" selectTitle="排序"/>
            <script type="text/javascript">
                $(document).ready(function () {
                    $("#structureSort_r").unbind("dblclick");
                });
            </script>
            <ui:button text="保存">
                <event:onclick>
                    sirm.use('sirm.org', function(org) {
                    org.saveStructureSort();
                    });
                </event:onclick>
            </ui:button>
        </div>
    </ui:form>
</layout:window>
<layout:window id="structureWindow" width="500px">
    <ui:form id="structureForm" clazz="com.sinitek.managerframework.org.action.StructureFormAction" method="saveStructure">
        <input type="hidden" id="parentid" name="parentid"/>
        <input type="hidden" id="orgid" name="orgid"/>
        <input type="hidden" id="orgtype" name="orgtype"/>

        <div style="width:510px">
            <div>
                <table class="stk-form-ui-st1">
                    <tr>
                        <td class="hd" width="80">部门名称<em>*</em></td>
                        <td class="bd" width="auto"><ui:textfield id="orgname" name="orgname" width="260px"/></td>
                    </tr>
                    <tr>
                        <td class="hd" width="80">部门描述</td>
                        <td class="bd" width="auto">
                            <ui:textarea id="orgdec" rows="10" name="orgdec" width="280px"/>
                        </td>
                    </tr>
                    <tr class="btn-bar">
                        <td class="hd"></td>
                        <td class="bd">
                            <ui:button text="保存并新增" id="updateAndAddBtn">
                                <event:onclick>
                                    if($("#structureForm").stk_checkForm())
                                    {
                                    $("#structureForm").stk_submit(function(result){
                                    if(result!=""){
                                    stk.alert(result);
                                    }else{
                                    $("#structureForm").stk_reset();
                                    $("#parentid").stk_val($("#orgparamid").stk_val());
                                    $("#orgtype").stk_val(0);
                                    $("#structureTable").stk_query();
                                    freshOrgTree();
                                    }
                                    });
                                    }
                                </event:onclick>
                            </ui:button>
                            <ui:button text="保存并关闭">
                                <event:onclick>
                                    if($("#structureForm").stk_checkForm())
                                    {
                                    $("#structureForm").stk_submit(function(result){
                                    if(result!=""){
                                    stk.alert(result);
                                    }else{
                                    $("#structureWindow").stk_hide();
                                    $("#structureTable").stk_query();
                                    freshOrgTree();
                                    }
                                    });
                                    }
                                </event:onclick>
                            </ui:button>
                            <ui:button text="关闭">
                                <event:onclick>
                                    $("#structureWindow").stk_hide();
                                </event:onclick>
                            </ui:button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <func:checkers>
            <func:checker target="orgname" allowBlank="false" blankText="请输入部门名称" maxLength="40"
                          maxLengthText="部门名称不能超过40字"/>
            <func:checker target="orgdec" maxLength="150" maxLengthText="部门描述不能超过150字"/>
        </func:checkers>
    </ui:form>
</layout:window>
<%@include file="/org/addstructureemp.jsp" %>
<%@include file="searchorg/selectorginclude.jsp" %>
</sirm:body>
</html>