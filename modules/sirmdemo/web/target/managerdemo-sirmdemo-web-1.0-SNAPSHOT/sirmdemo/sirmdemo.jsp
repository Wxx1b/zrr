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
            var url = "${path}/sirmdemo/sirmEditor.jsp?type=0";
            sirm.openTab(url, "新增", {keyWithoutParams: true}, function () {
                $("#testTable").stk_query();
            });
        }

        function showUpdateWindow(data) {
            var url = "${path}/sirmdemo/sirmEditor.jsp?type=1&updateid=" + data.objid;
            sirm.openTab(url, "编辑", {keyWithoutParams: true}, function () {
                $("#testTable").stk_query();
            });
        }
        function showDetailedWindow(data) {
            var url = "${path}/sirmdemo/sirmDetailed.jsp?updateid=" + data.objid;
            sirm.openTab(url, "查看", {keyWithoutParams: true}, function () {
                $("#testTable").stk_query();
            });

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
<sirm:body>
    <ui:form id="testForm">
        <div class="search-params-bar">
            <table>
                <tr>
                    <td>
                        <ul>
                            <li><label>商品编号</label><ui:textfield name="productid" title="商品编号"/></li>
                            <li><label>商品名称</label><ui:textfield name="productname" title="商品名称"/></li>
                            <li><label>商品类型</label>
                                <param:enumList clazz="com.sinitek.managerdemo.sirmdemo.common.enums.ProductTypeEnums"
                                                var="ProductTypeList"/>
                                <ui:select list="#attr.ProductTypeList" name="category" headerKey=""
                                           headerValue="--请选择--"
                                           listKey="enumItemName" listValue="enumItemInfo" title="商品类型"></ui:select>
                            </li>

                            <div class="help_tips" style="display: none;" id="helpDiv"><img
                                    src="../css/blue/images/gongshi.png"></div>

                                <%--<li><label>实体</label>--%>
                                <%--<param:entityList var="DemoEntityList" entity="DEMOOBJECT2"/>--%>
                                <%--<ui:select list="#attr.DemoEntityList" name="DemoEnum" headerKey="" headerValue="--请选择--"--%>
                                <%--listKey="objid" listValue="name"></ui:select>--%>
                                <%--</li>--%>
                                <%--<li><label>实体</label>
                                    <ui:doceditor id="aadc" name="aadc" defaultValue="112131"/>
                                </li>--%>
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
    <plugin:colButton id="detailed" text="查看" dataVar="data">
        showDetailedWindow(data);
    </plugin:colButton>
    <ui:table id="testTable" actionClass="com.sinitek.managerdemo.sirmdemo.actions.SirmdemoAction" pageSize="10"
              queryForm="testForm">
        <ui:col plugin="checkBoxPlugin"/>
        <ui:col property="productid" title="商品编号"/>
        <ui:col property="productname" title="名称"/>
        <ui:colNumber property="productprice" title="价格" isMoney="true" pointPlace="2" afterText="(元)"/>
        <ui:colNumber property="quantity" title="数量"/>
        <ui:colDate property="productdate" title="生产日期" format="yyyy-MM-dd"/>
        <ui:col property="chineseDate" title="替换后的日期格式"/>
        <ui:col property="origin" title="产地"/>
        <ui:colEnum property="category" title="类型" format="value - info"
                    clazz="com.sinitek.managerdemo.sirmdemo.common.enums.ProductTypeEnums"/>
        <ui:col plugin="detailed" title="商品描述" width="60px"/>
        <%--<ui:colEntity property="DemoForeign" title="实体" format="{objid} - {name}" entityName="DEMOOBJECT2"--%>
        <%--foreignProperty="objid"/>--%>
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

</sirm:body>
</html>