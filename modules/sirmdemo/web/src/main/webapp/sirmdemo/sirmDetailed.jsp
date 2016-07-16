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
            var updateid = '${param.updateid}';
            stk.call({
                className: "com.sinitek.managerdemo.sirmdemo.actions.SirmdemoAction",
                method: 'getResultByObjid',
                param: {objid: updateid},
                callBack: function (result) {
                    showUpdateWindow(result);
                }
            });
            $("#objid").stk_val(updateid);

        })

        function showUpdateWindow(data) {
            var form = $("#detailForm");
            form.stk_reset();
            form.find("input[name='objid']").stk_val(data.objid);
            $("#desperation").stk_val(data.desperation);
        }
    </script>
</head>
<sirm:body>

    <ui:form id="detailForm">
        <input type="hidden" id="objid" name="objid">
        <table class="stk-form-ui-st1">
            <tr>
                <td class="hd" width="80">商品描述详情</td>
                <td class="bd" width="auto">
                    <ui:doceditor imageUploadJson="/imageUpload" id="desperation" readOnly="true"/>
                </td>
            </tr>
            <tr class="btn-bar">
                <td class="hd"></td>
                <td class="bd">
                    <ui:button  text="关闭">
                        <event:onclick>
                            $(document).stk_removeSelf();
                        </event:onclick>
                    </ui:button>
                </td>
            </tr>
        </table>
    </ui:form>
</sirm:body>
</html>