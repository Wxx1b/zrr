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
            var form = $("#addUpdateForm");
            form.stk_reset();
            form.find("input[name='type']").stk_val("0");
            $("#addUpdateWindow").stk_show();
        }
        function showUpdateWindow(data) {
            var form = $("#addUpdateForm");
            form.find("input[name='type']").stk_val("1");
            form.find("input[name='objid']").stk_val(data.objid);
            $("#productname").stk_val(data.productname);
            $("#productprice").stk_val(data.productprice);
            $("#quantity").stk_val(data.quantity);
            $("#categoryEnum").stk_val(data.category);
            $("#origin").stk_val(data.origin);
            $("#desperation").stk_val(data.desperation);
            $("#productdate").stk_val(data.productdate);
            $("#addUpdateWindow").stk_show();
        }

        function showDetailedWindow(data) {
            var form = $("#detailForm");
            form.find("input[name='objid']").stk_val(data.objid);
            $("#desperation_info").stk_val(data.desperation);
            alert(data.desperation);
            $("#detailWindow").stk_show();

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

        function submitForm() {
            if ($("#addUpdateForm").stk_checkForm()) {
                $("#addUpdateForm").stk_submit(function () {
                    $("#addUpdateWindow").stk_hide();
                    $("#testTable").stk_query();
                });
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
        <ui:col plugin="detailed" title="查看" width="60px"/>

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

    <layout:window width="600px" layout="column" id="addUpdateWindow" title="添加/修改">
        <ui:form clazz="com.sinitek.managerdemo.sirmdemo.actions.SirmdemoAction" method="addUpdate" id="addUpdateForm">
            <input type="hidden" id="type" name="type" value="0">
            <input type="hidden" id="objid" name="objid">
            <table class="stk-form-ui-st1">
                <tr>
                    <td class="hd" width="80"><font color="red">*</font>商品名称</td>
                    <td class="bd" width="auto"><ui:textfield id="productname" name="productname"/></td>
                </tr>
                <tr>
                    <td class="hd" width="80">数量</td>
                    <td class="bd" width="auto"><ui:textfield id="quantity" name="quantity"/></td>
                </tr>
                <tr>
                    <td class="hd" width="80">价格</td>
                    <td class="bd" width="auto"><ui:textfield id="productprice" name="productprice"/></td>
                </tr>

                <tr>
                    <td class="hd" width="80"><font color="red">*</font>商品类型</td>
                    <td class="bd" width="auto">
                        <param:enumList clazz="com.sinitek.managerdemo.sirmdemo.common.enums.ProductTypeEnums"
                                        var="ProductTypeList"/>
                        <ui:select list="#attr.ProductTypeList" id="categoryEnum" name="categoryEnum" headerKey=""
                                   headerValue="--请选择--"
                                   listKey="enumItemName" listValue="enumItemInfo"></ui:select>
                    </td>
                </tr>
                <tr>
                    <td class="hd" width="80">生产日期</td>
                    <td class="bd" width="auto"><ui:datefield id="productdate" name="productdate"/></td>
                </tr>
                <tr>
                    <td class="hd" width="80">产地</td>
                    <td class="bd" width="auto"><ui:textfield id="origin" name="origin"/></td>
                </tr>
                <tr>
                    <td class="hd" width="80">商品描述</td>
                    <td class="bd" width="auto">
                        <ui:doceditor imageUploadJson="/imageUpload" id="desperation" defaultValue=""/>
                    </td>
                </tr>
                    <%--<tr>--%>
                    <%--<td class="hd" width="80">实体</td>--%>
                    <%--<td class="bd" width="auto">--%>
                    <%--<ui:select list="#attr.DemoEntityList" id="DemoEntity" name="DemoEntity" headerKey=""--%>
                    <%--headerValue="--请选择--" listKey="objid" listValue="name"></ui:select>--%>
                    <%--</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                    <%--<td class="hd" width="80">实体</td>--%>
                    <%--<td class="bd" width="auto">--%>
                    <%--<ui:doceditor imageUploadJson="/imageUpload" id="de11" defaultValue="112131"/>--%>
                    <%--</td>--%>
                    <%--</tr>--%>
                <tr class="btn-bar">
                    <td class="hd"></td>
                    <td class="bd">
                        <ui:button text="提交">
                            <event:onclick>
                                submitForm();
                            </event:onclick>
                        </ui:button>
                        <ui:button type="reset" text="重置"/>
                        <ui:button text="取消">
                            <event:onclick>
                                $(document).stk_removeSelf();
                            </event:onclick>
                        </ui:button>
                    </td>
                </tr>
            </table>
            <func:checkers>
                <func:checker target="productname" allowBlank="false" blankText="请输入字符串"/>
                <func:checker target="categoryEnum" allowBlank="false" blankText="请选择枚举"/>
                <func:checker target="desperation" maxLength="300" maxLengthText="输入描述过长"/>
                <func:checker target="productdate" allowBlank="false" blankText="请输入生产日期"/>
            </func:checkers>
            <event:onkeypress keyCodeVar="code">
                if(code == 13) submitForm();
            </event:onkeypress>
        </ui:form>
    </layout:window>
    <layout:window width="600px" layout="column" id="detailWindow" title="查看商品详情">
        <ui:form id="detailForm">
            <input type="hidden" id="objid" name="objid">
            <table class="stk-form-ui-st1">
                <tr>
                    <td class="hd" width="80">商品描述</td>
                    <td class="bd" width="auto">
                        <ui:doceditor imageUploadJson="/imageUpload" id="desperation_info" readonly="true" defaultValue=""/>
                    </td>
                </tr>
                <tr class="btn-bar">
                    <td class="hd"></td>
                    <td class="bd">
                        <ui:button text="关闭">
                            <event:onclick>
                                $(document).stk_removeSelf();
                            </event:onclick>
                        </ui:button>
                    </td>
                </tr>
            </table>
        </ui:form>
    </layout:window>

</sirm:body>
</html>