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
        $(function () {
            var type = '${param.type}';

            if (type == '1') {
                var updateid = '${param.updateid}';
                stk.call({
                    className:"com.sinitek.managerdemo.sirmdemo.actions.SirmdemoAction",
                    method:'getResultByObjid',
                    param:{objid:updateid},
                    callBack:function(result){
                        showUpdateWindow(result);
                    }
                });
                $("#objid").stk_val(updateid);

            } else {
                showAddWindow();
            }
        })

        function submitForm() {
            if ($("#addUpdateForm").stk_checkForm()) {
                $("#addUpdateForm").stk_submit(function (result) {
                    stk.alert("成功", "提示", {
                        "确认": function () {
                            <%--window.location.href="managemessagetemplate.jsp";--%>
                            <%--stk.closeDialog();--%>
                            $(document).stk_removeSelf();
                        }
                    })
                });
            }
        }

        function showAddWindow() {
            var form = $("#addUpdateForm");
            form.stk_reset();
            form.find("input[name='type']").stk_val("0");
        }

        function showUpdateWindow(data) {
            var form = $("#addUpdateForm");
            form.stk_reset();
            form.find("input[name='type']").stk_val("1");
            form.find("input[name='objid']").stk_val(data.objid);
            $("#productname").stk_val(data.productname);
            $("#productprice").stk_val(data.productprice);
            $("#quantity").stk_val(data.quantity);
            $("#categoryEnum").stk_val(data.category);
            $("#origin").stk_val(data.origin);
            $("#desperation").stk_val(data.desperation);
            $("#productdate").stk_val((data.productdate));
        }
    </script>
</head>
<sirm:body>

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
                <param:enumList clazz="com.sinitek.managerdemo.sirmdemo.common.enums.ProductTypeEnums" var="ProductTypeList"/>
                <ui:select list="#attr.ProductTypeList" id="categoryEnum" name="categoryEnum" headerKey="" headerValue="--请选择--"
                           listKey="enumItemName" listValue="enumItemInfo"></ui:select>
            </td>
        </tr>
        <tr>
            <td class="hd" width="80"><font color="red">*</font>生产日期</td>
            <td class="bd" width="auto"><ui:datefield id="productdate" name="productdate" /></td>
        </tr>
        <tr>
            <td class="hd" width="80">产地</td>
            <td class="bd" width="auto"><ui:textfield id="origin" name="origin" /></td>
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
</sirm:body>
</html>