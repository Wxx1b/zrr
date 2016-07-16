<%@ page import="com.sinitek.base.common.api.CommonAPIFactory" %>
<%@ page import="com.sinitek.managerframework.setting.common.entity.*" %>
<%@ page import="com.sinitek.managerframework.setting.common.api.ISettingService" %>
<%--
  Created by IntelliJ IDEA.
  User: sinitek
  Date: 12-4-6
  Time: 下午1:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/orgincludes.jsp" %>
<%
    ISetting roleSetting = ( ( ISettingService ) CommonAPIFactory.getInstance().getCommonAPI( ISettingService.class ) ).getSetting( "COMMON", "ROLESHOW" );
    boolean roleshow = false;
    if ( roleSetting == null || "true".equals( roleSetting.getValue() ) )
    {
        roleshow = true;
    }
    request.setAttribute( "roleshow", roleshow );
%>
<html>
<head>
    <title>新增选人控件方案</title>
    <script type="text/javascript" src="${contextPath}/scripts/org/adduser.js"></script>
    <script type="text/javascript">
        function submitForm() {
            if ($("#schemeFrom").stk_checkForm()) {
                $("#schemeFrom").stk_submit("saveScheme", function (result) {
                    if (result != "")
                        stk.alert(result);
                    else
                        back();
                });
            }
        }
        //如果勾选用户范围，则判断用户是否选择部门、岗位、角色、小组中任意一项
        function checkRange() {
            var range = $("#range").prop("checked");
            if (range) {
                //部门、岗位、角色、小组中任意一项不为空就算通过
                if ($("#departmentid").stk_val() != "" || $("#roleid").stk_val() != "" || $("#teamid").stk_val() != "" || $("#postid").stk_val() != "") {
                    return true;
                } else {
                    return "请选择用户范围（选择部门、岗位、角色、小组中任意一项）";
                }
            }
            return true;
        }

        function back() {
            window.location = sirm.jsurl("/org/listuserscheme.jsp");
        }
        $(document).ready(function () {
            if ("${param.schemeId}" != "") {
                $("#schemeFrom").stk_submit("getUserScheme", function (result) {
                    if (result != "") {
                        var data = jQuery.parseJSON(result);
                        $("#code").stk_val(data.code);
                        $("#title").stk_val(data.title);
                        if (data.range == 1)
                            $("#range").stk_checked(true);
                        else
                            $("#range").stk_checked(false);
                        $("#status").stk_val(data.status);
                        if (data.departmentname != "") {
                            var departments = data.departmentname.split(",");
                            for (var i = 0; i < departments.length; i++) {
                                var department = departments[i].split(":");
                                sirm.use('sirm.org', function (org) {
                                    org._createDiv(department[0], department[1], 'departmentDiv', 'departmentid');
                                });
                            }
                        }
                        if (data.postname != "") {
                            var posts = data.postname.split(",");
                            for (var k = 0; k < posts.length; k++) {
                                var post = posts[k].split(":");
                                sirm.use('sirm.org', function (org) {
                                    org._createDiv(post[0], post[1], 'orgDiv', 'postid');
                                });
                            }
                        }

                        if (data.teamname != "") {
                            var teamnames = data.teamname.split(",");
                            for (var j = 0; j < teamnames.length; j++) {
                                var team = teamnames[j].split(":");
                                sirm.use('sirm.org', function (org) {
                                    org._createDiv(team[0], team[1], 'teamDiv', 'teamid');
                                });
                            }
                        }
                        if (data.rolename != "") {
                            var rolenames = data.rolename.split(",");
                            for (var g = 0; g < rolenames.length; g++) {
                                var role = rolenames[g].split(":");
                                sirm.use('sirm.org', function (org) {
                                    org._createDiv(role[0], role[1], 'roleDiv', 'roleid');
                                });
                            }
                        }
                        if (data.path != "") {
                            $("#rangeSpan").stk_html("");
                            var path = data.path.split(",");
                            var str = [];
                            for (var b = 0; b < path.length; b++) {
                                str.push("<span id=\"ranges" + b + "span\"><input id=\"ranges" + b + "\" type=\"text\" name=\"ranges\" style=\" width: 200px\" value=\"" + path[b] + "\" /><button class=\"stk-button stk-button-st-3\" type=\"button\" onclick=\"removeRanges('ranges" + b + "span')\"><span> - </span></button>");
                                if (b != path.length - 1) {
                                    str.push("<br/>");
                                }
                                str.push("</span>");
                            }
                            $("#rangeSpan").append(str.join(""));
                        }
                    }
                });
            }
        });

        function removeRanges(id) {
            $("span").remove("#" + id);
        }

        function schemeOnblur() {
            $("#schemeFrom").stk_submit("checkUserScheme", function (result) {
                if (result != null && result != "") {
                    $("#schemeIdError").stk_text(result);
                    $("#code").stk_focus();
                } else {
                    $("#schemeIdError").stk_text("");
                }
            });
        }
    </script>
</head>
<sirm:body>
    <ui:form id="schemeFrom" clazz="com.sinitek.managerframework.org.action.UserSchemeAction">
        <input type="hidden" id="schemeId" name="schemeId" value="${param.schemeId}"/>
        <table width="100%" border="0" cellpadding="1" cellspacing="0" class="stk-form-ui-st1">
            <tr>
                <td class="hd" width="120">方案说明<em>*</em></td>
                <td class="bd" width="auto">
                    <ui:textfield id="title" name="title" width="200px"/>
                </td>
            </tr>
            <tr>
                <td class="hd" width="120">方案代码<em>*</em></td>
                <td class="bd" width="auto">
                    <ui:textfield id="code" name="code" width="200px">
                        <event:onblur>
                            schemeOnblur();
                        </event:onblur>
                    </ui:textfield>
                    <em id="schemeIdError"></em>
                </td>
            </tr>
            <tr>
                <td class="hd" width="120">用户范围</td>
                <td class="bd" width="auto">
                    <input id="range" name="range" type="checkbox" checked="checked"/>限定用户范围&nbsp;&nbsp;&nbsp;&nbsp;
                    <em>勾选此项则需要选择部门、岗位、角色、小组中任意一项</em>
                </td>

            </tr>
            <tr>
                <td class="hd" width="120">用户状态<em>*</em></td>
                <td class="bd" width="auto">
                    <ui:radioboxgroup list="#{'2':'全部','1':'在职','0':'离职'}" defaultValue="2" name="status" id="status"/>
                </td>
            </tr>
            <tr>
                <td class="hd" width="120">部门（可多选）</td>
                <td class="bd" width="auto">
                    <org:structure structurelists="structurelists"/>
                    <div id="departmentDiv" class="phone-result-table">
                        <ui:select list="#attr.structurelists" id="departments" name="departments" headerValue="--请选择--"
                                   headerKey="0" width="200px">
                            <event:onchange valVar="value" textVar="text">
                                sirm.use('sirm.org', function (org) {
                                org._createDiv(value,text,'departmentDiv','departmentid');
                                });
                                $("#departments").stk_val("0");
                            </event:onchange>
                        </ui:select>
                    </div>
                    <input type="hidden" id="departmentid" name="departmentid"/>
                </td>
            </tr>
            <tr>
                <td class="hd" width="120">岗位（可多选）</td>
                <td class="bd" width="auto" colspan="3">
                    <org:orgTag orglist="orglist"/>
                    <div id="orgDiv" class="phone-result-table">
                        <select id="orgselect" style="width: 200px"
                                onchange="if(this.options[this.selectedIndex].disabled==true)$('#orgselect').stk_val('0');
                                var value=this.value;   var text=this.options[this.selectedIndex].innerText;
                                sirm.use('sirm.org', function (org) {
                                org._createDiv(value,text,'orgDiv','postid');});$('#orgselect').stk_val('0');">
                                ${orglist}
                        </select>
                    </div>
                    <input type="hidden" id="postid" name="postid"/>
                </td>
            </tr>
            <c:if test="${roleshow}">
                <tr>
                    <td class="hd" width="120">角色（可多选）</td>
                    <td class="bd" width="auto" colspan="3">
                        <org:roleTag rolelist="rolelist"/>
                        <div id="roleDiv" class="phone-result-table">
                            <ui:select list="#attr.rolelist" id="roleselect" name="roleselect" headerValue="--请选择--"
                                       headerKey="0" width="200px">
                                <event:onchange valVar="value" textVar="text">
                                    sirm.use('sirm.org', function (org) {
                                    org._createDiv(value,text,'roleDiv','roleid');
                                    });
                                    $("#roleselect").stk_val("0");
                                </event:onchange>
                            </ui:select>
                        </div>
                        <input type="hidden" id="roleid" name="roleid"/>
                    </td>
                </tr>
            </c:if>
            <tr>
                <td class="hd" width="120">小组（可多选）</td>
                <td class="bd" width="auto" colspan="3">
                    <org:Team teamlists="teamlist"/>
                    <div id="teamDiv" class="phone-result-table">
                        <ui:select list="#attr.teamlist" id="teamselect" name="teamselect" headerValue="--请选择--"
                                   headerKey="0" width="200px">
                            <event:onchange valVar="value" textVar="text">
                                sirm.use('sirm.org', function (org) {
                                org._createDiv(value,text,'teamDiv','teamid');
                                });
                                $("#teamselect").stk_val("0");
                            </event:onchange>
                        </ui:select>
                    </div>
                    <input type="hidden" id="teamid" name="teamid"/>
                </td>
            </tr>
            <tr>
                <td class="hd" width="120"><label>筛选范围</label></td>
                <td class="bd" width="auto" colspan="3">
                    <span id="rangeSpan"><input type="text" name="ranges" style=" width: 200px"/></span>
                    <ui:button text="＋">
                        <event:onclick>
                            $("#rangeSpan").append("<br/><input type=\"text\" name=\"ranges\" style=\" width: 200px\" />");
                        </event:onclick>
                    </ui:button>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <ui:button text="保存">
                        <event:onclick>
                            submitForm();
                        </event:onclick>
                    </ui:button>
                    <ui:button text="返回">
                        <event:onclick>
                            back();
                        </event:onclick>
                    </ui:button>
                </td>
            </tr>
        </table>
        <func:checkers>
            <func:checker target="title" allowBlank="false" blankText="请填写方案说明" maxLength="50"
                          maxLengthText="方案说明不得超过50个字"/>
            <func:checker target="code" allowBlank="false" blankText="请填写方案代码"/>
            <func:checker target="range" validator="checkRange()"/>
        </func:checkers>
    </ui:form>
</sirm:body>
</html>