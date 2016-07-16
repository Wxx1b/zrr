<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 11-10-14
  Time: 上午11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/includes/commonincludes.jsp" %>
<sirm:page clazz="com.sinitek.managerframework.setting.action.SettingTableAction" />
<html>
<head><title>配置参数管理</title>
    <script type="text/javascript">
        function getTreeParam() {
            return{
                ids:$("#value").stk_val()
            };
        }
        function showAddWindow() {
            $("#add").stk_show();
            $("#addUpdateForm").stk_reset();
            $("#description").stk_val("");
//            $("#ipbuttion").stk_hide();
            var a = $("#module").stk_val();
            if ("all" != a) {
                $("#modulename").stk_val(a);
            }

            $("#addUpdateWindow").stk_show();
        }
        function closeWindow() {
            $("#addUpdateWindow").stk_hide();
        }

        function showUpdateWindow(data) {
//            stk.debug(data);

            $("#description").stk_val("");
            $("#objid").stk_val(data.objid);
            $("#modulename").stk_val(data.module);
            $("#valuename").stk_val(data.name);
            $("#add").hide();
            if (data.encryptionflag == 1) {
                stk.call({
                    className:'com.sinitek.managerframework.setting.action.SettingTableAction',
                    method:'getSetting',
                    param:{'objid':data.objid},
                    callBack:function(result){
                        if(result != null){
                            $("#encryption").val(result);
                        }
                    }
                });
                $("#encryption").stk_show();
                $("#value").stk_hide();
            } else {
                $("#value").stk_val(data.value);
                $("#encryption").stk_hide();
                $("#value").stk_show();
            }
            $("#encryptionflag").stk_val(data.encryptionflag);
            $("#description").stk_val(data.brief);
            $("#addUpdateWindow").stk_show({title:'修改参数'});
        }


        function remove(cboxname) {
//             alert(cboxname);
            var a = cboxname + "cbox";
            if ("all" == cboxname) {
                a = "checkBoxPlugin";
            }
//            alert(a);
            if ($("#" + a).hasSelect()) {
                stk.confirm("确认删除吗？", function() {
                    $("#" + a).stk_call({type:'0'}, function(result) {
                        selecttab2();
                    });
                });
            }
            else {
                stk.alert("请选中要删除的数据", "提示");
            }
        }

        function selecttab(tabname, title) {
            $("#selectname").stk_val("");
            if ("all" == tabname) {
                $("#selectmodule").stk_val("");
//                $("#modulename").stk_val("");
                $("#" + tabname).stk_query();
            } else {
                $("#selectmodule").stk_val(tabname);
                $("#modulename").stk_val(title);
                $("#" + tabname).stk_query();
//                $("#selectmodule").stk_val("");
            }


        }

        function selecttab2() {
            var a = $("#module").stk_val();
            $("#" + a).stk_query();
        }

        function checkValue() {
            var a = $("#valuename").stk_val();
            var b = $("#value").stk_val();
            if ("EMPHASISPOOL1" == a || "PROHIBITEDPOOL" == a || "FORBIDPOOLID" == a || "BONDBUSINESSPOOLID" == a || "BONDWARNINGPOOLID" == a
                    || "BONDPROHIBITPOOLID" == a || "BONDINVESTPOOLID" == a) {
                if (b.indexOf(",") != -1) {
                    return "该参数只能选择一个投资池！";
                } else {
                    return true;
                }
            } else {
                return true;
            }
        }
    </script>
</head>
<sirm:body>
<ui:form id="queryForm">
    <input type="hidden" id="module" name="module" value="all">
    <div class="search-params-bar">
        <table>
            <tr>
                <td class="tit"><label>模块名称</label></td>
                <td class="bd">
                    <%--<ui:textfield name="selectmodule" id="selectmodule"/>--%>
                        <ui:select list="#attr.map" headerKey="" name="selectmodule" id="selectmodule" headerValue="--请选择--">
                        </ui:select>
                </td>
                <td class="tit"><label>参数名称</label></td>
                <td class="bd"><ui:textfield name="selectname" id="selectname"/></td>
                <td>
                    <ui:button text="查询">
                        <event:onclick>
                            selecttab2();
                        </event:onclick>
                    </ui:button>
                </td>
            </tr>
        </table>
    </div>
    <plugin:colLink id="updateBut" text="修改" dataVar="data">
        showUpdateWindow(data);
    </plugin:colLink>
    <plugin:colCheckbox id="checkBoxPlugin" name="checkBoxPlugin" dataVar="data"/>
    <plugin:colRowNum id="rowNumPlugin"/>
    <ui:tablefix tableWidth="100%" id="all" nowrap="true" actionClass="com.sinitek.managerframework.setting.action.SettingTableAction" pageSize="15" queryForm="queryForm">
        <%--<ui:col plugin="checkBoxPlugin" align="left" width="20px"/>--%>
        <ui:col plugin="rowNumPlugin" title="ID" width="30px"/>
        <ui:col property="module" title="模块名称" width="130px" align="left"/>
        <ui:col property="name" title="参数名称" width="230px" align="left"/>
        <ui:col property="value" title="参数值" width="40%" align="left">
            encryptionflag==1 ? "*******" : value
        </ui:col>
        <ui:col property="brief" title="参数说明" width="52%" allowTip="true" align="left"/>
        <ui:col plugin="updateBut" title="操作" width="8%"/>
        <%--<layout:tableToolBar position="top">--%>
            <%--<ui:toolbarButton icon="ui-icon-plusthick" text="添加">--%>
                <%--<event:onclick>--%>
                    <%--showAddWindow();--%>
                <%--</event:onclick>--%>
            <%--</ui:toolbarButton>--%>
            <%--<ui:toolbarButton icon="ui-icon-minusthick" text="删除">--%>
                <%--<event:onclick>--%>
                    <%--remove("all");--%>
                <%--</event:onclick>--%>
            <%--</ui:toolbarButton>--%>
        <%--</layout:tableToolBar>--%>
    </ui:tablefix>
</ui:form>


<layout:window width="510px" layout="rows" id="addUpdateWindow" position="top" title="添加参数" cellUnderLine="true" cellMarginBottom="1px" feature="labelBg">
    <ui:form clazz="com.sinitek.managerframework.setting.action.SettingTableAction" method="addsetting" id="addUpdateForm">
        <input type="hidden" id="objid" name="objid" value="0">
        <input type="hidden" id="encryptionflag" name="encryptionflag" value="0">

        <div style="width:510px">
            <div>
                <table class="stk-form-ui-st1">
                    <tr>
                        <td class="hd" width="80"><label>模块名称<em>*</em></label></td>
                        <td class="bd" width="auto"><ui:textfield name="modulename" id="modulename" width="350px"/></td>
                    </tr>

                    <tr>
                        <td class="hd" width="80"><label>参数名称<em>*</em></label></td>
                        <td class="bd" width="auto"><ui:textfield name="valuename" id="valuename" width="350px"/></td>
                    </tr>

                    <tr>
                        <td class="hd" width="80"><label>参数值</label></td>
                        <%--<em>*</em>--%>
                        <td class="bd" width="auto">
                            <ui:textfield name="value" id="value" width="350px"/>
                            <ui:textfield name="encryption" id="encryption" width="350px" hidden="true" type="password"/>
                            <%--<ui:button id="ipbuttion" title="选择投资池" hidden="true" icon="stk-button-icon ui-icon-circle-plus">--%>
                                <%--<event:onclick>--%>
                                    <%--// 清空--%>
                                    <%--$("#mytree2").find("input[type=checkbox]").attr("checked", false);//重新设置--%>
                                    <%--// 设置值--%>
                                    <%--var tv = $("#value").val();//文本框里面的值--%>
                                    <%--if (tv.length > 0) {--%>
                                    <%--var vids = tv.split(",");//取得里面的id--%>
                                    <%--$.each(vids, function(i, n) {--%>
                                    <%--$("#mytree2").find("input[type=checkbox][value='" + n + "']").attr("checked", true);--%>
                                    <%--});--%>
                                    <%--}--%>
                                    <%--$("#AllPoolWindow").stk_show();--%>
                                <%--</event:onclick>--%>
                            <%--</ui:button>--%>
                        </td>
                    </tr>
                    <tr>
                        <td class="hd" width="80"><label>参数说明</label></td>
                        <td class="bd" width="auto"><ui:textarea rows="4" name="description" id="description" width="350px"/></td>
                    </tr>
                    <tr>
                    <tr class="btn-bar">
                        <td class="hd"></td>
                        <td class="bd">
                            <ui:button text="保存并新建" id="add">
                                <event:onclick>
                                    if($("#addUpdateForm").stk_checkForm())
                                    {
                                    $("#addUpdateForm").stk_submit(function(result){
                                    $("#addUpdateForm").stk_reset();
                                    <%--$("#selectmodule").stk_val($("#module").stk_val())--%>
                                    selecttab2();
                                    <%--$("#selectmodule").stk_val("")--%>
                                    });
                                    }
                                </event:onclick>
                            </ui:button>
                            <ui:button text="保存并关闭">
                                <event:onclick>
                                    if($("#addUpdateForm").stk_checkForm())
                                    {
                                    $("#addUpdateForm").stk_submit(function(result){
                                    $("#addUpdateWindow").stk_hide();
                                    <%--$("#selectmodule").stk_val($("#module").stk_val())--%>
                                    selecttab2();
                                    <%--$("#selectmodule").stk_val("")--%>
                                    });
                                    }
                                </event:onclick>
                            </ui:button>
                            <ui:button text="关闭">
                                <event:onclick>
                                    $("#addUpdateWindow").stk_hide();
                                </event:onclick>
                            </ui:button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <func:checkers>
            <func:checker target="modulename" allowBlank="false" blankText="请输入模块名称"/>
            <func:checker target="valuename" allowBlank="false" blankText="请输入参数名称"/>
            <%--<func:checker target="value" allowBlank="false" blankText="请输入参数值" validator="checkValue()"/>--%>
        </func:checkers>
    </ui:form>
</layout:window>

<%--<ui:form id="getDataForm1" clazz="com.sinitek.sirm.web.kpi.KpiBusinessAction">--%>
    <%--<input type="hidden" id="manageid" name="manageid" value="">--%>
<%--</ui:form>--%>

<%--<layout:window width="60%" height="300" id="AllPoolWindow" title="投资池菜单">--%>
    <%--<ui:tree jsParam="getTreeParam" clazz="com.sinitek.sirm.web.investpool.InvestPoolTreeManageAction" rootText="股票池" id="mytree2"/>--%>
    <%--<ui:button text="确定">--%>
        <%--<event:onclick>--%>
            <%--var v=stk.checkBox.getValue("myck");--%>
            <%--var t=stk.checkBox.getText("myck");--%>
            <%--$("#value").val(v);//把值放到隐藏表单域里面--%>
            <%--$("#AllPoolWindow").stk_hide();//把窗口隐藏起来--%>
            <%--// $("#AllPoolWindowFrom").stk_reset();//从新设置--%>
        <%--</event:onclick>--%>
    <%--</ui:button>--%>
<%--</layout:window>--%>

<%--<layout:window title="添加报告" id="relationreport" width="800">--%>
    <%--<iframe id="realtionwindow" width="800" height="500"--%>
            <%--src="${path}/rschreport/include/relationinnerreport.jsp?callback=relationreportName&type_=1&reportids=relationname&windowid=realtionwindow&showdiv=_show_report_div"--%>
            <%--name="realtionwindow"/>--%>
<%--</layout:window>--%>

</sirm:body>
</html>