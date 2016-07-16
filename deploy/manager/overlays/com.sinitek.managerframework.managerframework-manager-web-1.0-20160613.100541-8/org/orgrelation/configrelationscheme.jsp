<%--
  Created by IntelliJ IDEA.
  User: sinitek
  Date: 12-5-15
  Time: 下午4:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/orgincludes.jsp" %>
<html>
<head>
    <title>配置组织结构上下级关系</title>
    <script type="text/javascript">
        $(document).ready(function () {
            if ('${param.schemeId}' != '') {

            }
        });

        /**
         *  新增组织结构上下级关系
         */
        function addOrgRelation() {
            $("#orgRelationWindow").stk_show({title:'请选择'})
        }

        /**
         *  删除组织结构上下级关系
         */
        function delOrgRelation() {
            if ($("#relationId").stk_val() != "") {
                $("#orgRelationForm").stk_submit("delOrgRelation", function (result) {
                    if (result != "")
                        stk.alert(result);
                    $("#relationTree").stk_refresh();
                });
            }
        }

        /**
         *  保存组织结构上下级关系
         */
        function submitOrgRelation() {

        }

        /**
         * 选择新增类型时改变事件
         */
        function changeType() {
            var type = $("#addtype").stk_val();
            if (type == 1) {
                $("#addtypestr").stk_text("单选");
//                $("#oneOrgDiv").stk_show();
//                $("#allOrgDiv").stk_hide();
            } else {
                $("#addtypestr").stk_text("多选");
//                $("#allOrgDiv").stk_show();
//                $("#oneOrgDiv").stk_hide();
            }
        }
        function checkType() {
            var type = $("#addtype").stk_val();
            var selectOrg = $("#selectOrg").stk_val();
            if (selectOrg != "") {
                var length = selectOrg.split(",").length;
                if (type == 1) {
                    if (length > 1)
                        return "新增上级请单选组织结构";
                }
                return true;
            } else {
                return "请选择组织结构";
            }
        }

        /**
         *  关闭窗口
         */
        function closeWindow() {
            $("#orgRelationWindow").stk_hide();
        }

        /**
         *  保存关系
         */
        function saveRelation(tf) {
            if ($("#orgRelationForm").stk_checkForm()) {
                $("#orgRelationForm").stk_submit(function (result) {
                    if (result != "") {
                        stk.alert(result);
                    } else {
                        if (tf)
                            closeWindow();
                        $("#relationTree").stk_refresh();
                    }
                });
            }
        }
    </script>
</head>
<sirm:body>
<ui:form id="relationSchemeForm" clazz="com.sinitek.managerframework.org.action.OrgRelationSchemeAction" method="saveOrgRelation">
    <input type="hidden" id="relationId" name="relationId"/>
    <ui:button id="addBtn" text="新增">
        <event:onclick>
            addOrgRelation();
        </event:onclick>
    </ui:button>
    <ui:button id="delBtn" text="删除">
        <event:onclick>
            delOrgRelation();
        </event:onclick>
    </ui:button>
    <ui:button id="submitBtn" text="返回">
        <event:onclick>
            window.location=sirm.jsurl("/org/orgrelation/listrelationscheme.jsp");
            <%--submitOrgRelation();--%>
        </event:onclick>
    </ui:button>
</ui:form>
<ui:tree id="relationTree" clazz="com.sinitek.managerframework.org.action.OrgRelationSchemeAction" />
<%--jsList="RelationTree"--%>
<layout:window id="orgRelationWindow">
    <ui:form id="orgRelationForm" clazz="com.sinitek.managerframework.org.action.OrgRelationSchemeAction"
             method="saveRelation">
        <input type="hidden" id="schemeId" name="schemeId" value="${param.schemeId}"/>
        <table class="stk-form-ui-st1">
            <tr>
                <td class="hd" width="80">新增类型<em>*</em></td>
                <td class="bd" width="auto">
                    <ui:radioboxgroup name="addtype" id="addtype" list="#{'1':'新增上级','2':'新增下级'}" defaultValue="1">
                        <event:onchange>
                            changeType();
                        </event:onchange>
                    </ui:radioboxgroup>
                    <em>新增上级请单选组织结构，新增下级可多选组织结构</em>
                </td>
            </tr>
            <tr>
                <td class="hd" width="80">所选组织结构<em>*</em><br/><em id="addtypestr">单选</em></td>
                <td class="bd" width="auto">
                    <input type="hidden" id="selectOrg" name="selectOrg"/>
                        <%--<div id="oneOrgDiv">--%>
                        <%--<org:SelectOrg prefix="oneOrg" multi="false" mode="ORG" hiddenId="selectOrg"/>--%>
                        <%--</div>--%>
                        <%--<div id="allOrgDiv" style="display: none">--%>
                    <org:SelectOrg prefix="allOrg" multi="true" mode="ORG" hiddenId="selectOrg"/>
                        <%--</div>--%>
                </td>
            </tr>
            <tr class="btn-bar">
                <td class="bd" align="center" colspan="2">
                    <ui:button text="保存并新增">
                        <event:onclick>
                            saveRelation(false);
                        </event:onclick>
                    </ui:button>
                    <ui:button text="保存并关闭">
                        <event:onclick>
                            saveRelation(true);
                        </event:onclick>
                    </ui:button>
                    <ui:button text="关闭">
                        <event:onclick>
                            closeWindow();
                        </event:onclick>
                    </ui:button>
                </td>
            </tr>
        </table>
        <func:checkers>
            <func:checker target="selectOrg" allowBlank="false" blankText="请选择组织结构" validator="checkType()"/>
        </func:checkers>
    </ui:form>
</layout:window>
</sirm:body>
</html>