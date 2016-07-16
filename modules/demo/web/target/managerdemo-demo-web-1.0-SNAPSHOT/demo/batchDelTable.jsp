<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/12/14
  Time: 21:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/framework/include/head.jsp" %>
<html>
<head>
    <title></title>
    <%@ include file="/framework/include/innerHead.jsp" %>
    <script type="text/javascript">
        function remove() {
            if ($("#checkBoxPlugin").stk_hasSelect()) {
                stk.confirm("确认删除吗？", function () {
                    $("#checkBoxPlugin").stk_call(function (data) {
                        stk.alert(data);
                        $("#queryTable").stk_query();
                    });
                });
            }
            else {
                stk.alert("请选中要删除的数据");
            }
        }
    </script>
</head>
<body>

<plugin:colRowNum id="rownum"/>
<plugin:colCheckbox id="checkBoxPlugin" name="check"/>
<ui:table id="queryTable" actionClass="com.sinitek.managerdemo.demo.action.DemoBatchDelTableAction">
    <ui:col plugin="checkBoxPlugin"/>
    <ui:col plugin="rownum" title=""/>
    <ui:col property="name" title="姓名"></ui:col>
    <ui:col property="age" title="年龄"></ui:col>
    <ui:colNumber property="income" isMoney="true" pointPlace="2" title="收入"></ui:colNumber>
    <ui:colEnum clazz="com.sinitek.managerdemo.demo.common.enums.GenderEnums" property="gender" title="性别"></ui:colEnum>
    <ui:col plugin="updateBut" title="修改" width="60px"/>
    <layout:tableToolBar position="top">
        <ui:toolbarButton icon="ui-icon-minusthick" text="删除">
            <event:onclick>
                remove();
            </event:onclick>
        </ui:toolbarButton>
    </layout:tableToolBar>
</ui:table>

</body>
</html>
