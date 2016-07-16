<%--
  Created by IntelliJ IDEA.
  Author: 冯奕骅
  Date: 2015/4/2
  Time: 10:30
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/orgincludes.jsp" %>

<html>
<head>
    <title></title>
    <script type="text/javascript">
        //权限配置
        function roleConfig() {
            if ($("#checkBoxPlugin").hasSelect()) {
                $("#checkBoxPlugin").stk_call({type:'0'}, function(result) {
                    window.location = sirm.jsurl("/org/role/configrole.jsp?roleid=" + result + "&type=1");
                });
            }
            else {
                stk.alert("请选中要进行权限配置的角色");
            }
        }

        //人员配置
        function empConfig() {
            if ($("#checkBoxPlugin").hasSelect()) {
                $("#checkBoxPlugin").stk_call({type:'1'}, function(result) {
                    window.location = sirm.jsurl("/org/role/configemployee.jsp?roleid=" + result + "&type=1");
                });
            }
            else {
                stk.alert("请选中要进行人员配置的角色");
            }
        }

        function showRoleSortWindow() {
            var postdata = $("#roleTable").stk_info().data;
            var size = postdata.length;
            var postids = [size], posts = {};
            for (var i = 0; i < size; i++) {
                var postid = postdata[i].objid;
                var name = postdata[i].name;
                posts[postid] = name;
                postids[i] = postid;
            }
            $("#roleSort").stk_init(posts, postids);
            $("#roleSortWindow").stk_show({title:'排序'});
            $(".stk-p-2").hide();
            $(".stk-p-1").hide();
        }

        function saveRoleSort() {
            $("#roleSortForm").stk_submit(function (result) {
                if (result != "") {
                    stk.alert(result);
                } else {
                    $("#roleSortWindow").stk_hide();
                    $("#orgorder").stk_val("");
                    $("#roleTable").stk_query();
                }
            });
        }

        $(function () {
            queryOrgids();
        });

        function queryOrgids() {
            stk.call({
                className: "com.sinitek.managerframework.org.action.RoleTableAction",
                method: 'updateRole',
                param: {roleid:"${param.roleid}"},
                async: false,
                callBack: function (result) {
                    var json = $.parseJSON(result);
                    var orgids = "";
                    var emps = json.empStr.split(",");
                    for (var i = 0; i < emps.length; i++) {
                        if (i > 0) {
                            orgids += ",";
                        }
                        orgids += emps[i].split(":")[0];
                    }
                    $("#orgids").val(orgids);
                },
                exceptionHandler: function (message, e) {
                    stk.error(message)
                }
            });
        }

        function callbackfunction() {
            $("#userForm").stk_submit(function (result) {
                queryOrgids();
                $("#userTable").stk_query();
            });
        }
    </script>
</head>
<sirm:body>
    <ui:form id="roleForm" clazz="com.sinitek.managerframework.org.action.RoleTableAction" method="saveRole">
        <input type="hidden" id="orgids" name="orgids" value=""/>
        <input type="hidden" id="inservice" name="inservice" value="1"/>
        <input type="hidden" id="order" name="order" value=""/>

        <plugin:colCheckbox id="usercheckBoxPlugin" name="usercheck"/>
        <plugin:colRowNum id="rowNumPlugin"/>
        <ui:table id="userTable" nowrap="true" actionClass="com.sinitek.managerframework.org.action.UserTableAction"
                  queryForm="roleForm" width="100%" pageSize="15" allowExport="true">
            <layout:tableToolBar position="top"> &nbsp;&nbsp;
                <ui:toolbarButton text="新增" icon="ui-icon-document">
                    <event:onclick>
                        $("#userForm").stk_reset();
                        show('user', 'users', 'rolehidden', 'wwww', 'true');
                    </event:onclick>
                </ui:toolbarButton>
                <ui:toolbarButton text="删除" icon="ui-icon-trash">
                    <event:onclick>
                        if ($("#usercheckBoxPlugin").hasSelect()) {
                        stk.confirm("确认删除吗？", function () {
                        $("#usercheckBoxPlugin").stk_call({type: 'deleteroles',roleid: '${param.roleid}'}, function (result) {
                        queryOrgids();
                        $("#userTable").stk_query();
                        });
                        });
                        } else {
                        stk.alert("请选中要删除的数据");
                        }
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

    <ui:form id="userForm" clazz="com.sinitek.managerframework.org.action.RoleTableAction" method="saveRole">
        <input type="hidden" id="roleid" name="roleid" value="${param.roleid}"/>

        <div id="users" style="width:99%;height:50px;display:none;"></div>
        <input id="rolehidden" name="rolehidden" type="hidden"/>
    </ui:form>

    <jsp:include page="../searchorg/selectorginclude.jsp">
        <jsp:param name="callbackfunc" value="callbackfunction"/>
    </jsp:include>

    <!--角色排序-->
    <layout:window id="roleSortWindow" width="260px">
        <ui:form id="roleSortForm" clazz="com.sinitek.managerframework.org.action.RoleFormAction" method="saveRoleSort">
            <div style="padding:10px;" align="center">
                <ui:doubleSelect id="roleSort" name="roleSort" selectTitle="排序"/>
                <script type="text/javascript">
                    $(document).ready(function () {
                        $("#roleSort_r").unbind("dblclick");
                    });
                </script>
                <ui:button text="保存">
                    <event:onclick>
                        saveRoleSort();
                    </event:onclick>
                </ui:button>
            </div>
        </ui:form>
    </layout:window>
</sirm:body>
</html>