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
                    className:"com.sinitek.managerdemo.demo.action.DemoDwr",
                    method:'getResult',
                    param:{objid:updateid},
                    callBack:function(result){
                        result=$.parseJSON(result||"{}");
                        if(result.demoenum)
                            result.demoenum=result.demoenum.enumItemValue;
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
            $("#DemoString").stk_val(data.demostring);
            $("#DemoInteger").stk_val(data.demointeger);
            $("#DemoEnum").stk_val(data.demoenum);
            $("#DemoEntity").stk_val(data.demoforeign);
            if (data.demodate)
                $("#DemoDate").stk_val(new Date(data.demodate).format( "yyyy-MM-dd" ));
        }
    </script>
</head>
<body>

<ui:form clazz="com.sinitek.spirit.webcontrol.demo.DemoCurdAjaxAction" method="addUpdate" id="addUpdateForm">
    <input type="hidden" id="type" name="type" value="0">
    <input type="hidden" id="objid" name="objid">
    <table class="stk-form-ui-st1">
        <tr>
            <td class="hd" width="80"><font color="red">*</font>字符串</td>
            <td class="bd" width="auto"><ui:textfield id="DemoString" name="DemoString"/></td>
        </tr>
        <tr>
            <td class="hd" width="80">数字</td>
            <td class="bd" width="auto"><ui:textfield id="DemoInteger" name="DemoInteger"/></td>
        </tr>
        <tr>
            <td class="hd" width="80"><font color="red">*</font>枚举</td>
            <td class="bd" width="auto">
                <param:enumList clazz="com.sinitek.spirit.webcontrol.demo.DemoEnum" var="DemoEnumList"/>
                <ui:select list="#attr.DemoEnumList" id="DemoEnum" name="DemoEnum" headerKey="" headerValue="--请选择--"
                           listKey="enumItemName" listValue="enumItemInfo"></ui:select>
            </td>
        </tr>
        <tr>
            <td class="hd" width="80">日期</td>
            <td class="bd" width="auto"><ui:datefield id="DemoDate" name="DemoDate" /></td>
        </tr>
        <tr>
            <td class="hd" width="80">实体</td>
            <td class="bd" width="auto">
                <ui:select list="#attr.DemoEntityList" id="DemoEntity" name="DemoEntity" headerKey=""
                           headerValue="--请选择--" listKey="objid" listValue="name"></ui:select>
            </td>
        </tr>
        <tr>
            <td class="hd" width="80">实体</td>
            <td class="bd" width="auto">
                <ui:doceditor imageUploadJson="/imageUpload" id="de11" defaultValue="112131"/>
            </td>
        </tr>
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
        <func:checker target="DemoString" allowBlank="false" blankText="请输入字符串"/>
        <func:checker target="DemoEnum" allowBlank="false" blankText="请选择枚举"/>
    </func:checkers>
    <event:onkeypress keyCodeVar="code">
        if(code == 13) submitForm();
    </event:onkeypress>
</ui:form>
</body>
</html>