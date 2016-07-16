<%@ page import="com.sinitek.base.common.api.CommonAPIFactory" %>
<%@ page import="com.sinitek.managerframework.setting.common.entity.*" %>
<%@ page import="com.sinitek.managerframework.setting.common.api.ISettingService" %>
<%--
  Created by IntelliJ IDEA.
  User: sinitek
  Date: 12-4-20
  Time: 下午5:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/org/includes/orgincludes.jsp" %>
<link href="${contextPath}/org/css/org.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="${contextPath}/scripts/org/searchorg/candidatecontrol.js"></script>
<script type="text/javascript">
    //callbackfn=回调函数   multi=是否是多选人    mode=是否是选人   code=方案代码   width=控件宽度   selectWidth=控件自动完成层的宽度  hiddenId=隐藏域Id  readOnly=是否是只读
    $(function () {
        sirm.org.searchorg.${param.prefix}CandidateControl = new sirm.org.searchorg.CandidateControl({
            callbackfn: '${param.callbackfn}',
            multi: '${param.multi}',
            mode: '${param.mode}',
            code: '${param.code}',
            prefix: '${param.prefix}',
            hiddenId: '${param.hiddenId}',
            unitlimitflag: '${param.unitlimitflag}',
            showposition: '${param.showposition}',
            readOnlyStr: '${param.readOnly}',
            deptid:'${param.deptid}',
            teamid:'${param.teamid}',
            positionid:'${param.positionid}'
        });
    });

    /**
     *为自动完成框的查询准备参数
     */
    function get${param.prefix}Param() {
        return {__schemeCode: $("#_${param.prefix}_schemeCode").stk_val(), prefix: '${param.prefix}', path: '${param.path}', mode: '${param.mode}', multi: '${param.multi}', unitlimitflag: '${param.unitlimitflag}',deptid:'${param.deptid}',teamid:'${param.teamid}',positionid:'${param.positionid}',showposition: '${param.showposition}'};
    }


    /**
     *  checkbox选中后把值存到相应的隐藏域中
     * @param values
     */
    function _${param.prefix}_checkbox(values) {
        $("#_${param.prefix}_check_hidden").stk_val(values);
        chearHiddenValue();
    }
    /**
     * 单选清理隐藏域值
     */
    function chearHiddenValue(){
        if((${param.mode == 'org'} || ${param.mode == 'ORG'}) && ${param.multi == 'false'}){
            $("#_${param.prefix}_checkall").stk_val("");
        }

    }


    function selectemps(orgid, callback) {
        $("#_${param.prefix}_checkuser_hidden").stk_val(orgid);
        chearHiddenValue();
        sirm.org.searchorg.${param.prefix}CandidateControl._emps_spellSecurityCheck('_${param.prefix}_checkusers_div', 8);
        if (callback != null) callback();
    }


    function selectempsall(orgid, callback) {
        $("#_${param.prefix}_checkuser_hidden").stk_val(orgid);
        chearHiddenValue();
        sirm.org.searchorg.${param.prefix}CandidateControl._emps_spellSecurityCheckonlyadd('_${param.prefix}_checkusers_div', 8);
        if (callback != null) callback();
    }

    function loadtree() {
        $.ajax({
            type: 'post',
            data: {queryCon: $("#queryCon").stk_val(),
                __schemeCode: $("#_${param.prefix}_schemeCode").stk_val(),
                prefix: '${param.prefix}',
                path: '${param.path}',
                mode: '${param.mode}',
                multi: '${param.multi}',
                unitlimitflag: '${param.unitlimitflag}',
                showposition: '${param.showposition}',
                deptid:'${param.deptid}',
                teamid:'${param.teamid}',
                positionid:'${param.positionid}'},
            url: '${contextPath}/org/searchorg/tree.jsp',
            dataType: "html",
            success: function (str) {
                _listauth_collectionTreeId_hasLoad = undefined;
                $("#dtree").html(str);
                _listauth_collectionTreeId_buildTree();
                _listauth_collectionTreeId_hasLoad = true;
                $("div[class='loading-st1']").eq(0).parent().css("display","none");

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
        })
    });

</script>
<html>
<head>
    <title></title>
    <%
        ISetting setting = (( ISettingService ) CommonAPIFactory.getInstance().getCommonAPI( ISettingService.class )).getSetting("ORG", "ROLESHOW");
        request.setAttribute("showrole", setting != null && "false".equals(setting.getValue()) ? false : true);
    %>
</head>
<sirm:body>
    <ui:form id="_${param.prefix}_usersForm">
        <input type="hidden" id="_${param.prefix}_order" name="__order"> <!--window中表格排序-->
        <input type="hidden" id="_${param.prefix}_schemeCode" name="__schemeCode" value="${param.code}"><!--选人控件方案代码-->
        <input type="hidden" id="_${param.prefix}_check_hidden" name="checkhidden"/>
        <input type="hidden" id="_${param.prefix}_checkuser_hidden" name="checkuserhidden"/>
        <input type="hidden" id="_${param.prefix}_checkall"/>
        <input type="hidden" id="_${param.prefix}_Path" name="path" value="${param.path}"/><!--存访问路径的地方-->
        <input type="hidden" id="_${param.prefix}_unitlimitflag" name="unitlimitflag" value="${param.unitlimitflag}"/><!--存访问路径的地方-->
        <input type="hidden" id="_${param.prefix}_org_mode" name="org_mode" value="${param.mode}"/><!--存访问路径的地方-->
        <input type="hidden" id="_${param.prefix}_org_multi" name="_org_multi" value="${param.multi}"/><!--存访问路径的地方-->
        <input type="hidden" id="_${param.prefix}_org_deptid" name="_org_deptid" value="${param.deptid}"/><!--存访问路径的地方-->
        <input type="hidden" id="_${param.prefix}_org_teamid" name="_org_teamid" value="${param.teamid}"/><!--存访问路径的地方-->
        <input type="hidden" id="_${param.prefix}_org_positionid" name="_org_positionid" value="${param.positionid}"/><!--存访问路径的地方-->
        <table width="620px">
            <tr valign="top">
                <td width="37%">
                    <input type="text" id="queryCon" name="queryCon">
                    <div id="dtree" style="height:${(param.mode == 'DEPT' or param.mode == 'TEAM')?"250px":"300px"};overflow-y:auto;width:${(param.mode == 'DEPT' or param.mode == 'TEAM')?"240px":"100%"};">
                        <c:if test="${empty param.deptid && empty param.teamid && empty param.positionid}">
                            <ui:tree id="_${param.prefix}_tree"
                                     clazz="com.sinitek.managerframework.org.action.CandidateControlAction"
                                     jsParam="get${param.prefix}Param"/>
                        </c:if>
                    </div>
                </td>
                <c:choose>
                    <c:when test="${param.mode != 'DEPT' and param.mode != 'TEAM'}">
                        <td>
                            <div style="height:${(!empty param.mode or !empty param.code) &&  (fn:toLowerCase(param.mode)=='org'or fn:toLowerCase(param.mode)=='user' or not empty param.code ) and param.multi?'200px':'280px'};overflow-y:auto">
                                <div class="search-params-bar">
                                    <table>
                                        <tr>
                                            <td class="bd">
                                                <ui:textfield id="_${param.prefix}_queryuserName"
                                                              themeName="double-cancel"
                                                              name="userName" width="120px" emptyText="登录名 / 员工姓名">
                                                    <event:onkeypress keyCodeVar="code">
                                                        if(code=="13")
                                                        $("#_${param.prefix}_querybtn").onclick();
                                                    </event:onkeypress>
                                                </ui:textfield>
                                            </td>
                                            <td class="bd">
                                                <ui:select id="city" name="city"
                                                           list="#{'':'--请选择--','1':'上海','2':'北京','3':'深圳'}"/>
                                            </td>
                                            <td class="bd">
                                                <ui:checkbox name="inservice" label="显示离职">
                                                    <event:onclick>
                                                        $("#_${param.prefix}_userstable").stk_query();
                                                    </event:onclick>
                                                </ui:checkbox>
                                            </td>
                                            <td>
                                                <ui:button text="查询" id="_${param.prefix}_querybtn">
                                                    <event:onclick>
                                                        $("#_${param.prefix}_userstable").stk_query();
                                                    </event:onclick>
                                                </ui:button>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <layout:VSpacing height="5px"/>

                                <div style="height:${(!empty param.mode or !empty param.code) && (fn:toLowerCase(param.mode)=='org'or fn:toLowerCase(param.mode)=='user' or not empty param.code)  and param.multi?'170px':'250px'};overflow-y:auto;width:370px;">
                                    <plugin:colRowNum id="rowNumPlugin"/>
                                    <plugin:colCheckbox id="_${param.prefix}_checkBoxPlugin" name="check"
                                                        allowCache="true" dataVar="data">
                                        selectemps(data.orgid+":"+data.displayname+":8");
                                    </plugin:colCheckbox>
                                    <plugin:colRadiobox id="_${param.prefix}_radioboxPlugin" name="radioBox"
                                                        dataVar="data">
                                        selectemps(data.orgid+":"+data.displayname+":8");
                                    </plugin:colRadiobox>
                                    <ui:table pageInfoType="simple" rowHeight="19px" width="350px" nowrap="true"
                                              id="_${param.prefix}_userstable"
                                              queryForm="_${param.prefix}_usersForm"
                                              actionClass="com.sinitek.managerframework.org.action.CandidateControlAction"
                                              allowBlankRow="true">
                                        <c:choose>
                                            <c:when test="${empty param.multi || param.multi=='false'}">
                                                <ui:col plugin="_${param.prefix}_radioboxPlugin" width="25px"/>
                                            </c:when>
                                            <c:otherwise>
                                                <ui:col plugin="_${param.prefix}_checkBoxPlugin" width="25px"/>
                                            </c:otherwise>
                                        </c:choose>
                                        <ui:col plugin="rowNumPlugin" width="30px"/>
                                        <%--<ui:col property="username" title="登录名" width="45%" align="left"/>--%>
                                        <ui:col property="displayname" title="员工姓名" width="80px" align="left"
                                                allowTip="false">
                                            "<input type='hidden' name='name"+orgid+"' id='name"+orgid+"' value='"+displayname+"'/><span title=\""+displayname+"\">"+displayname+"</span>"
                                        </ui:col>
                                        <ui:col property="positionname" title="岗位/部门" width="140px" align="left"
                                                allowTip="true"/>
                                        <event:ontableorder propertyVar="property" orderTypeVar="order">
                                            $("#_${param.prefix}_order").stk_val(property+":"+order);
                                            $("#_${param.prefix}_userstable").stk_query();
                                        </event:ontableorder>
                                    </ui:table>
                                </div>
                            </div>
                            <div>
                    <c:if test="${(!empty param.mode or !empty param.code) && (fn:toLowerCase(param.mode)=='org'or fn:toLowerCase(param.mode)=='user' or not empty param.code) and param.multi}">
                        <div style="border:#000000 0px solid; height:100px;overflow:auto;width:370px">
                            <table>
                                <c:choose>
                                    <c:when test="${fn:toLowerCase(param.mode)=='org'}">
                                        <tr>
                                            <td nowrap="" height="20px">已选部门</td>
                                            <td>
                                                <div id="_${param.prefix}_checkorgs_div"></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="" height="20px">已选岗位</td>
                                            <td>
                                                <div id="_${param.prefix}_checkposts_div"></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="" height="20px">已选小组</td>
                                            <td>
                                                <div id="_${param.prefix}_checkteams_div"></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="" height="20px">已选角色</td>
                                            <td>
                                                <div id="_${param.prefix}_checkroles_div"></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="" height="20px">已选人员</td>
                                            <td>
                                                <div id="_${param.prefix}_checkusers_div"></div>
                                            </td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td nowrap="" height="20px">已选人员</td>
                                            <td>
                                                <div id="_${param.prefix}_checkusers_div"></div>
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </table>
                        </div>
                        <layout:VSpacing height="5px"/>
                    </c:if>
                                <ui:button text="确定">
                                    <event:onclick>
                                        <%--alert($("#_${param.prefix}_checkall").stk_val());--%>
                                        sirm.org.searchorg.${param.prefix}CandidateControl.submitForm();
                                    </event:onclick>
                                </ui:button>
                                <ui:button text="关闭">
                                    <event:onclick>
                                        sirm.org.searchorg.${param.prefix}CandidateControl.closeWindow(false);
                                    </event:onclick>
                                </ui:button>
                            </div>
                        </td>
                    </c:when>
                    <c:otherwise>
                        <div style="margin: 10px 0 10px 0">
                            <ui:button text="确定">
                                <event:onclick>
                                    <%--alert($("#_${param.prefix}_checkall").stk_val());--%>
                                    sirm.org.searchorg.${param.prefix}CandidateControl.submitForm();
                                </event:onclick>
                            </ui:button>
                            <ui:button text="关闭">
                                <event:onclick>
                                    sirm.org.searchorg.${param.prefix}CandidateControl.closeWindow(false);
                                </event:onclick>
                            </ui:button>
                        </div>
                    </c:otherwise>
                </c:choose>
            </tr>
        </table>
    </ui:form>
</sirm:body>
<script type="text/javascript">
    $(document).ready(function(){
        $("#_${param.prefix}_userstable tr:eq(0) th:nth-child(1)").bind("click",function(){
            <%--$.each(result,function(i,data){--%>
            var check = $("#check_all").stk_checked();
            $("#_${param.prefix}_userstable input[type='checkbox'][name='check']").each(function(i,val){
                if(check){
                    selectempsall(val.value+":"+$("#name"+val.value).stk_val()+":8");
                }else{
                    <%--$("#close" + val.value).click();--%>
                    sirm.org.searchorg.${param.prefix}CandidateControl._user_removeContent('_${param.prefix}_checkusers_div'+val.value,val.value,'_${param.prefix}_checkall');
                }
            });
            <%--selectemps(data.orgid+":"+data.displayname+":8");--%>
            <%--});--%>
        });
    });
</script>
</html>