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
        function showAddWindow() {
            var url = "${path}/demo/editorframe.jsp?type=0";
            $("#windowframe").attr("src",url);
            $( "#addUpdateWindow" ).stk_show();
            /*sirm.openTab(url, "新增", {keyWithoutParams: true}, function () {
                $("#testTable").stk_query();
            });*/
        }

        function closeWindow(){
            $( "#addUpdateWindow" ).stk_hide();
        }

        function showUpdateWindow(data) {
            var url = "${path}/demo/editorframe.jsp?type=1&updateid=" + data.objid;
            $("#windowframe").attr("src",url);
            $( "#addUpdateWindow" ).stk_show();
            /*sirm.openTab(url, "编辑", {keyWithoutParams: true}, function () {
                $("#testTable").stk_query();
            });*/
        }

        function remove() {
            if ($("#checkBoxPlugin").stk_hasSelect()) {
                stk.confirm("确认删除吗？", function () {
                    $("#checkBoxPlugin").stk_call(function () {
                        $("#testTable").stk_query();
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
<ui:form id="testForm">
    <div class="search-params-bar">
        <table>
            <tr>
                <td>
                    <ul>
                        <li><label>字符串</label><ui:textfield name="DemoString" title="多发点发射点发射点法打
发速度射点发阿斯顿发阿斯顿
发生地发士大夫"/></li>

                        <li><label>枚举</label>
                            <param:enumList clazz="com.sinitek.spirit.webcontrol.demo.DemoEnum" var="DemoEnumList"/>
                            <ui:select list="#attr.DemoEnumList" name="DemoEnum" headerKey="" headerValue="--请选择--"
                                       listKey="enumItemName" listValue="enumItemInfo" title="测试title"></ui:select>
                        </li>
                        <div class="help_tips" style="display: none;" id="helpDiv"><img
                                src="../css/blue/images/gongshi.png"></div>


                        <li><label>实体</label>
                            <param:entityList var="DemoEntityList" entity="DEMOOBJECT2"/>
                            <ui:select list="#attr.DemoEntityList" name="DemoEnum" headerKey="" headerValue="--请选择--"
                                       listKey="objid" listValue="name"></ui:select>
                        </li>
                    </ul>
                </td>
                <td>
                    <ui:button text="查询">
                        <event:onclick>
                            $("#testTable").stk_query();
                        </event:onclick>
                    </ui:button>

                </td>
            </tr>
        </table>
    </div>
    <event:onkeypress keyCodeVar="code">
        if(code == 13) $("#testTable").stk_query();
    </event:onkeypress>
</ui:form>

<plugin:colCheckbox id="checkBoxPlugin" name="check"/>
<plugin:colButton id="updateBut" text="修改" dataVar="data">
    showUpdateWindow(data);
</plugin:colButton>
<ui:table id="testTable" actionClass="com.sinitek.spirit.webcontrol.demo.DemoCurdAjaxAction" pageSize="10"
          queryForm="testForm">
    <ui:col plugin="checkBoxPlugin"/>
    <ui:col property="DemoString" title="字符串"/>
    <ui:colNumber property="DemoInteger" title="数字" isMoney="true" afterText="(元)"/>
    <ui:colDate property="DemoDate" title="日期" format="yyyy-MM-dd HH:mm:ss"/>
    <ui:colEnum property="DemoEnum" title="枚举" format="value - info"
                clazz="com.sinitek.spirit.webcontrol.demo.DemoEnum"/>
    <ui:colEntity property="DemoForeign" title="实体" format="{objid} - {name}" entityName="DEMOOBJECT2"
                  foreignProperty="objid"/>
    <ui:col plugin="updateBut" title="修改" width="60px"/>

    <layout:tableToolBar position="top">
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
    </layout:tableToolBar>
</ui:table>

<layout:window width="700px" layout="column" id="addUpdateWindow" title="添加/修改">
    <iframe frameborder="0" width="700px" height="450px" scrolling="no" src="editorframe.jsp"  style="" id="windowframe"/>
</layout:window>
</body>
</html>