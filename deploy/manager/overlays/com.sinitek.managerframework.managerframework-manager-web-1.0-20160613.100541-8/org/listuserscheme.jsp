<%--
  Created by IntelliJ IDEA.
  User: sinitek
  Date: 12-4-6
  Time: 下午1:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/orgincludes.jsp" %>
<html>
<head>
    <title>选人控件方案管理</title>
    <script type="text/javascript">
        function remove() {
            if ($("#checkBoxPlugin").hasSelect()) {
                stk.confirm("确认删除吗？", function () {
                    $("#checkBoxPlugin").stk_call(function (result) {
                        if (result != "")
                            stk.alert(result);
                        $("#schemeTable").stk_query();
                    });
                });
            }
            else {
                stk.alert("请选中要删除的数据");
            }
        }
    </script>
</head>
<sirm:body>
    <ui:form id="queryForm" clazz="com.sinitek.managerframework.org.action.UserSchemeAction">
        <div class="search-params-bar">
            <table>
                <tr>
                    <td class="tit"><label>方案代码</label></td>
                    <td class="bd">
                        <ui:textfield id="code" name="code" width="100px"/>
                    </td>
                    <td class="tit"><label>用户范围</label></td>
                    <td class="bd">
                        <ui:select id="range" name="range" list="#{'0':'不限定','1':'限定'}" headerKey="-1"
                                   headerValue="--请选择--"/>
                    </td>
                    <td class="tit"><label>用户状态</label></td>
                    <td class="bd">
                        <ui:select id="status" name="status" list="#{'0':'离职','1':'在职','2':'全部'}" headerKey="-1"
                                   headerValue="--请选择--"/>
                    </td>
                    <td class="tit">
                        <ui:button text="查询">
                            <event:onclick>
                                $("#schemeTable").stk_query();
                            </event:onclick>
                        </ui:button>
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="order" name="order">
    </ui:form>
    <plugin:colCheckbox id="checkBoxPlugin" name="check"/>
    <plugin:colRowNum id="rowNumPlugin"/>
    <plugin:colLink id="updateBtn" text="修改" dataVar="data">
        window.location=sirm.jsurl("/org/adduserscheme.jsp?schemeId="+data.objid);
    </plugin:colLink>
    <ui:tablefix pageSize="15" tableWidth="100%" fixWidth="300px" id="schemeTable" queryForm="queryForm"
                 actionClass="com.sinitek.managerframework.org.action.UserSchemeAction"
                 allowExport="true">
        <layout:tableToolBar position="top">
            <ui:toolbarButton text="新增" icon="ui-icon-document">
                <event:onclick>
                    window.location=sirm.jsurl("/org/adduserscheme.jsp");
                </event:onclick>
            </ui:toolbarButton>
            <ui:toolbarButton text="删除" icon="ui-icon-trash">
                <event:onclick>
                    remove();
                </event:onclick>
            </ui:toolbarButton>
        </layout:tableToolBar>
        <ui:col plugin="checkBoxPlugin" fixed="true" width="20px" align="center"/>
        <ui:col plugin="rowNumPlugin" fixed="true" width="30px"/>
        <ui:col fixed="true" property="title" title="方案说明" allowExport="true" allowTip="true" nowrap="false"
                width="120px"/>
        <ui:col fixed="true" property="code" title="方案代码" allowExport="true" allowTip="true" nowrap="false"
                width="120px"/>
        <ui:col property="range" title="用户范围" allowExport="true" allowTip="true" nowrap="false" width="80px">
            range==1 ? "限定" : "不限定"
        </ui:col>
        <ui:col property="status" title="用户状态" allowExport="true" allowTip="true" nowrap="false" width="80px">
            status==2 ? "全部" : status==1 ? "在职" : "离职"
        </ui:col>
        <ui:col property="departmentname" title="部门" align="left" allowExport="true" allowTip="true" nowrap="true" width="20%"
                allowSort="false"/>
        <ui:col property="postname" title="岗位" align="left" allowExport="true" allowTip="true" nowrap="true" width="20%"
                allowSort="false"/>
        <ui:col property="rolename" title="角色" align="left" allowExport="true" allowTip="true" nowrap="true" width="20%"
                allowSort="false"/>
        <ui:col property="teamname" title="小组" align="left" allowExport="true" allowTip="true" nowrap="true" width="20%"
                allowSort="false"/>
        <ui:colCust method="getPath" title="筛选范围" align="left" allowExport="true" allowTip="true" nowrap="true" width="20%"
                allowSort="false"/>
        <ui:col plugin="updateBtn" title="操作" width="80px" allowExport="false"/>
        <event:ontableorder propertyVar="property" orderTypeVar="order">
            $("#order").stk_val(property+":"+order);
            $("#schemeTable").stk_query();
        </event:ontableorder>
        <func:tableExport>
            <ui:col fixed="true" property="title" title="方案说明" allowExport="true" allowTip="true" nowrap="false"
                    width="120px"/>
            <ui:col fixed="true" property="code" title="方案代码" allowExport="true" allowTip="true" nowrap="false"
                    width="120px"/>
            <ui:col property="range" title="用户范围" allowExport="true" allowTip="true" nowrap="false" width="80px">
                range==1 ? "限定" : "不限定"
            </ui:col>
            <ui:col property="status" title="用户状态" allowExport="true" allowTip="true" nowrap="false" width="80px">
                status==2 ? "全部" : status==1 ? "在职" : "离职"
            </ui:col>
            <ui:col property="departmentname" title="部门" align="left" allowExport="true" allowTip="true" nowrap="true" width="20%"
                    allowSort="false"/>
            <ui:col property="postname" title="岗位" align="left" allowExport="true" allowTip="true" nowrap="true" width="20%"
                    allowSort="false"/>
            <ui:col property="rolename" title="角色" align="left" allowExport="true" allowTip="true" nowrap="true" width="20%"
                    allowSort="false"/>
            <ui:col property="teamname" title="小组" align="left" allowExport="true" allowTip="true" nowrap="true" width="20%"
                    allowSort="false"/>
            <ui:colCust method="getPath" title="筛选范围" align="left" allowExport="true" allowTip="true" nowrap="true" width="20%"
                        allowSort="false"/>
        </func:tableExport>
    </ui:tablefix>
</sirm:body>
</html>