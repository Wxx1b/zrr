<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/5/31
  Time: 15:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    /**
     *验证功能code
     */
    function checkFunctionCode() {
        var result = "";
        if ($("#code").stk_text() != "") {
            if ($("#code").stk_text().length > 50) {
                return "功能分类描述的长度不得大于50";
            }

            stk.call({
                className: "com.sinitek.managerframework.function.action.FunctionInfoActionNew",
                method: 'checkFunctionCode',
                async: false,
                'param': {'objid': $("#objid").val(), 'code': $("#code").val()},
                callBack: function (data) {
                    if (data != "true") {
                        result = "code 重复 请重新输入";
                    }
                }
            });
        }
        if (result != "") {
            return result;
        }
        return true;
    }

    //修改功能
    function showUpdateWindow(data) {
        $("#addFunForm").stk_reset();
        $("#add").stk_hide();
        $("#functionType").stk_val(data.type);
        $("#objid").stk_val(data.objid);
        $("#code").stk_val(data.code);
        $("#funname").stk_val(data.name);
        $("#brief").stk_val(data.brief);
        $("#addFunWindow").stk_show({title: '修改功能'});
        $("#funname").stk_focus();
    }

    //删除功能
    function removeFun() {
        if ($("#checkBoxPlugin").hasSelect()) {
            stk.confirm("确认删除吗？", function () {
                $("#checkBoxPlugin").stk_call(function (result) {
                    $("#functionTable").stk_query();
                });
            });
        }
        else {
            stk.alert("请选中要删除的数据");
        }
    }

</script>

<ui:form id="functionForm">
    <input type="hidden" id="qparentid" name="qparentid" value="${objid}">
    <input type="hidden" id="type" name="type" value="2">

    <div id="childmenudiv" style="margin-top: 20px">
        <layout:panel title="功能菜单">
            <plugin:colLink id="updateBut" text="编辑" dataVar="data">
                $("#add").stk_hide();
                showUpdateWindow(data);
            </plugin:colLink>
            <plugin:colCheckbox id="checkBoxPlugin" name="check"/>
            <plugin:colRowNum id="rowNumPlugin">

            </plugin:colRowNum>
            <ui:table id="functionTable"
                      actionClass="com.sinitek.managerframework.function.action.FunctionInfoActionNew"
                      nowrap="true"
                      queryForm="functionForm" tableWidth="100%" pageSize="10">
                <layout:tableToolBar position="top">
                    <ui:toolbarButton icon="ui-icon-document" text="新增">
                        <event:onclick>
                            $("#functionType").stk_val("2");
                            $("#code").stk_val("");
                            $("#funname").stk_val("");
                            $("#brief").stk_val("");
                            $("#objid").stk_val("0");
                            $("#add").stk_show();
                            $("#addFunWindow").stk_show();
                        </event:onclick>
                    </ui:toolbarButton>
                    <ui:toolbarButton icon="ui-icon-trash" text="删除">
                        <event:onclick>
                            removeFun();
                        </event:onclick>
                    </ui:toolbarButton>
                </layout:tableToolBar>
                <ui:col plugin="checkBoxPlugin" nowrap="false" width="30px"/>
                <%--<ui:col plugin="rowNumPlugin" width="30px"/>--%>
                <ui:colCust method="jspGetFuncName" property="name" title="名称" align="left"
                            width="200px" allowTip="false"/>
                <ui:col property="code" title="code" align="left" width="100%" allowTip="true"/>
                <ui:col property="brief" title="描述" align="left" width="100%" allowTip="true"/>
                <%--<ui:colCust method="setorda" title="排序" width="80px"/>--%>
                <ui:col plugin="updateBut" title="操作" width="120px"/>
            </ui:table>
        </layout:panel>
    </div>
</ui:form>

<layout:window id="addFunWindow" width="540px" cellUnderLine="true" cellMarginBottom="1px" feature="labelBg"
               title="编辑功能">
    <ui:form id='addFunForm' clazz="com.sinitek.managerframework.function.action.FunctionInfoActionNew"
             method="addFunction">
        <input type="hidden" name="functionType" id="functionType"/>

        <div style="width:510px">
            <div>
                <table class="stk-form-ui-st1">
                    <tr>
                        <td class="hd" width="80"><label>菜单名称</label></td>
                        <td class="bd" width="auto">
                            <label name="parentName" id="parentName">${qname}</label>
                            <input type="hidden" id="parentId" name="parentId" value="${objid}">
                            <input type="hidden" id="objid" name="objid" value="0">
                        </td>
                    </tr>
                    <tr>
                        <td class="hd" width="80"><label>名称<em>*</em></label></td>
                        <td class="bd" width="auto">
                            <ui:textfield id="funname" name="funname" width="300px"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="hd" width="80"><label>code</label></td>
                        <td class="bd" width="auto">
                            <ui:textfield id="code" name="code" width="300px"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="hd" width="80"><label>描述</label></td>
                        <td class="bd" width="auto">
                            <ui:textarea id="brief" name="brief" rows="5" width="300px"/>
                        </td>
                    </tr>

                    <tr class="btn-bar">
                        <td class="hd"></td>
                        <td class="bd">
                            <ui:button text="保存并新建" id="add">
                                <event:onclick>
                                    if($("#addFunForm").stk_checkForm()) {
                                    $("#addFunForm").stk_submit(function(result){
                                    $("#functionType").stk_val("2");
                                    $("#code").stk_val("");
                                    $("#funname").stk_val("");
                                    $("#brief").stk_val("");
                                    $("#objid").stk_val("0");
                                    $("#add").stk_show();
                                    $("#addFunWindow").stk_show();
                                    $("#functionTable").stk_query();
                                    if(result!=""){
                                    alert(result);
                                    }
                                    });
                                    }
                                </event:onclick>
                            </ui:button>
                            <ui:button text="保存并关闭">
                                <event:onclick>
                                    var menuselect = $("#menuselect").stk_val();
                                    if($("#addFunForm").stk_checkForm()) {
                                    $("#addFunForm").stk_submit(function(result){
                                    $("#functionType").stk_val("2");
                                    $("#code").stk_val("");
                                    $("#funname").stk_val("");
                                    $("#brief").stk_val("");
                                    $("#addFunWindow").stk_hide();
                                    if(result!=""){
                                    alert(result);
                                    }
                                    $("#functionTable").stk_query();
                                    });
                                    }
                                </event:onclick>
                            </ui:button>

                            <ui:button text="关闭">
                                <event:onclick>
                                    $("#functionType").stk_val("2");
                                    $("#code").stk_val("");
                                    $("#funname").stk_val("");
                                    $("#brief").stk_val("");
                                    $("#addFunWindow").stk_hide();
                                </event:onclick>
                            </ui:button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <func:checkers>
            <func:checker target="funname" allowBlank="false" blankText="请输入名称"/>
            <func:checker target="code" allowBlank="falsse" blankText="请输入code" validator="checkFunctionCode()"/>
        </func:checkers>
    </ui:form>
</layout:window>