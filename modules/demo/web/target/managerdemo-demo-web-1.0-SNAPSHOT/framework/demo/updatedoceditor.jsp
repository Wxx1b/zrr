<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 15-6-23
  Time: 下午4:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/framework/include/head.jsp" %>
<html>
<head>
    <title></title>
    <%@ include file="/framework/include/innerHead.jsp" %>

    <script type="text/javascript">
        function showUpdateWindow() {
            var url = "${path}/framework/demo/editordoc.jsp";
            $("#windowframe").attr("src",url);
            $( "#addUpdateWindow" ).stk_show();
        }

        function closeWindow(){
            $( "#addUpdateWindow" ).stk_hide();
        }
    </script>
</head>
<body>
<%--<ui:button text="123">
    <event:onclick>
        showAddWindow();
    </event:onclick>
</ui:button>--%>
<plugin:colButton id="updateBut" text="修改" dataVar="data">
    showUpdateWindow(data);
</plugin:colButton>
<ui:table id="testTable" actionClass="com.sinitek.spirit.webcontrol.demo.DemoCurdAjaxAction" pageSize="10">
    <ui:col plugin="checkBoxPlugin"/>
    <ui:col property="DemoString" title="字符串"/>
    <ui:colNumber property="DemoInteger" title="数字" isMoney="true" afterText="(元)"/>
    <ui:colDate property="DemoDate" title="日期" format="yyyy-MM-dd HH:mm:ss"/>
    <ui:colEnum property="DemoEnum" title="枚举" format="value - info"
                clazz="com.sinitek.spirit.webcontrol.demo.DemoEnum"/>
    <ui:colEntity property="DemoForeign" title="实体" format="{objid} - {name}" entityName="DEMOOBJECT2"
                  foreignProperty="objid"/>
    <ui:col plugin="updateBut" title="修改" width="60px"/>

    <%--<layout:tableToolBar position="top">
        <ui:toolbarButton icon="ui-icon-plusthick" text="添加">
            <event:onclick>
                showAddWindow();
            </event:onclick>
        </ui:toolbarButton>
        <ui:toolbarButton icon="ui-icon-minusthick" text="删除">
            <event:onclick>
                remove();
            </event:onclick>
        </ui:toolbarButton>
    </layout:tableToolBar>--%>
</ui:table>
<layout:window width="700px" layout="column" id="addUpdateWindow" title="添加/修改">
    <iframe frameborder="0" width="700px" height="450px" scrolling="no" src="editordoc.jsp"  style="" id="windowframe"/>
</layout:window>
</body>
</html>