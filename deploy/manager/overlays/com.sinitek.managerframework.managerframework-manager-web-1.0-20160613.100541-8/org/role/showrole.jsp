<%--
  Created by IntelliJ IDEA.
  Author: 冯奕骅
  Date: 2015/4/2
  Time: 10:52
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/orgincludes.jsp" %>
<%@ include file="../searchorg/selectorginclude.jsp" %>

<html>
<head>
    <title></title>
    <script type="text/javascript">
        //删除角色
        function remove() {
            if ($("#checkBoxPlugin").hasSelect()) {
                stk.confirm("确认删除吗？", function() {
                    $("#checkBoxPlugin").stk_call({type:'2'}, function(result) {
                        $("#roleTable").stk_query();
                        window.parent.reLoadTree();
                    });
                });
            }
            else {
                stk.alert("请选中要删除的数据");
            }
        }

        //修改角色
        function updateRole(data) {
            $("#roleid_window").stk_val(data.objid);
            $("#rolename").stk_val(data.name);
            $("#roledec").stk_val(data.description);
            $("#updateWindow").stk_show({title:'修改角色'});
        }

        //显示角色详细信息
        function showInfoWindow(val) {
            if (val != null) {
                window.location = sirm.jsurl("/org/role/viewroleinfo.jsp?roleid=" + val.objid + "&type=0");
            }
        }

        /**
         *验证角色描述不得为空
         */
        function checkLength() {
            if ($("#roledec").stk_text() != "") {
                if ($("#roledec").stk_text().length > 150) {
                    return "角色描述的长度不得大于150";
                }
            }
            return  true;
        }
    </script>
</head>
<sirm:body>
    <ui:form id="roleForm" clazz="com.sinitek.managerframework.org.action.RoleTableAction" method="saveRole">
        <plugin:colCheckbox id="checkBoxPlugin" name="check"/>
        <plugin:colLink id="linkPlugin" dataVar="val">
            showInfoWindow(val);
        </plugin:colLink>
        <plugin:colLink id="updateRole" text="修改" dataVar="data">
            updateRole(data);
        </plugin:colLink>
        <input type="hidden" id="order" name="order"/>
        <plugin:colRowNum id="rowNumPlugin"/>
        <ui:table id="roleTable" queryForm="roleForm" pageSize="15" actionClass="com.sinitek.managerframework.org.action.RoleTableAction" allowExport="true" exportFileName="用户管理-角色管理">
            <layout:tableToolBar position="top">
                <ui:toolbarButton icon="ui-icon-document" text="新增">
                    <event:onclick>
                        window.parent.location = sirm.jsurl("/org/role/addrole.jsp");
                    </event:onclick>
                </ui:toolbarButton>
                <ui:toolbarButton icon="ui-icon-trash" text="删除">
                    <event:onclick>
                        remove();
                    </event:onclick>
                </ui:toolbarButton>
            </layout:tableToolBar>
            <func:tableExport>
                <ui:col property="name" align="left" title="角色名称"/>
                <ui:col property="description" align="left" title="角色描述"/>
            </func:tableExport>
            <ui:col plugin="checkBoxPlugin" width="20px"/>
            <ui:col plugin="rowNumPlugin" width="30px"/>
            <ui:col property="name" align="left" plugin="linkPlugin" title="角色名称" width="200px" allowSort="false" maxWords="15" allowTip="true"/>
            <ui:col property="description" align="left" title="角色描述" width="100%" allowSort="false"/>
            <ui:col plugin="updateRole" title="操作" width="60px" allowSort="false"/>
            <event:ontableorder propertyVar="property" orderTypeVar="order">
                $("#order").stk_val(property+":"+order);
                $("#roleTable").stk_query();
            </event:ontableorder>
        </ui:table>
    </ui:form>

    <layout:window id="updateWindow">
        <ui:form id="roleForm_window" clazz="com.sinitek.managerframework.org.action.RoleFormAction" method="saveRole">
            <input type="hidden" id="type_window" name="type" value="1"/>
            <input type="hidden" id="roleid_window" name="roleid"/>

            <div style="width:510px">
                <table class="stk-form-ui-st1">
                    <tr>
                        <td class="hd" width="80">角色名称<em>*</em></td>
                        <td class="bd" width="auto"><ui:textfield width="90%" id="rolename" name="rolename" maxLength="50"/></td>
                    </tr>
                    <tr>
                        <td class="hd" width="80">角色描述</td>
                        <td class="bd" width="auto"><ui:textarea rows="10" width="90%" id="roledec" name="roledec"/></td>
                    </tr>
                    <tr class="btn-bar">
                        <td class="hd"></td>
                        <td class="bd">
                            <ui:button id="" text="提交">
                                <event:onclick>
                                    if ($("#roleForm_window").stk_checkForm()) {
                                    $("#roleForm_window").stk_submit(function(result) {
                                    if (result != "")
                                    stk.alert(result);
                                    else{
                                    $("#roleForm_window").stk_reset();
                                    $("#updateWindow").stk_hide();
                                    $("#roleTable").stk_query();
                                    window.parent.reLoadTree();
                                    }
                                    });
                                    }
                                </event:onclick>
                            </ui:button>
                            <ui:button text="关闭">
                                <event:onclick>
                                    $("#updateWindow").stk_hide();
                                </event:onclick>
                            </ui:button>
                        </td>
                    </tr>
                </table>
            </div>
            <func:checkers>
                <func:checker target="rolename" allowBlank="false" blankText="请输入角色名称"  maxLength="40" maxLengthText="角色名称不能超过40字"/>
                <func:checker target="roledec" validator="checkLength()"/>
            </func:checkers>
        </ui:form>
    </layout:window>
</sirm:body>
</html>