<%--
  Created by IntelliJ IDEA.
  User: HF.fay
  Date: 14-7-30
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/org/includes/orgincludes.jsp" %>
<sirm:page clazz="com.sinitek.managerframework.function.action.FunctionInfoAction" method="getFunctionGroupInfo"/>

<script type="text/javascript">
    /**
     *验证功能分类描述不得为空
     */
    function checkLength() {
        if ($("#typedec").stk_text() != "") {
            if ($("#typedec").stk_text().length > 50) {
                return "功能分类描述的长度不得大于50";
            }
        }
        return  true;
    }
    /**
     *验证功能描述不得为空
     */
    function checkFunLength() {
        if ($("#fundec").stk_text() != "") {
            if ($("#fundec").stk_text().length > 50) {
                return "功能描述的长度不得大于50";
            }
        }
        return  true;
    }
    //是否可做菜单
    function ismenuFun() {
        var functiontype = $("#functiontype").stk_val();
        if (functiontype == "0") {
            return "请输入功能类型";
        } else {
            if (functiontype == "1") {
                if ($("#url").stk_val() == "") {
                    return "请输入功能Url";
                }
            } else if (functiontype == "2") {
                if ($("#action").stk_val() == "") {
                    return "请输入功能Action";
                }
                if ($("#method").stk_val() == "") {
                    return "请输入功能Method";
                }
            }
        }
        return true;
    }

    /**
     *  获取功能分类列表
     */
    function getParentFun(funtype) {
        $("#parentfun").stk_val(funtype);
        var selectedId = '${objid}';
        dwr.engine.setAsync(false);
        $("#addTypeForm").stk_submit('getParentFun', function (result) {
            if (funtype) {
                $("#parentid").stk_html(result);
                if (selectedId == 0)
                    $("#parentid").stk_val(0);
                else
                    $("#parentid").stk_val(selectedId);
            } else {
                $("#functionGroupId").stk_html(result);
                $("#functionGroupId").stk_val(selectedId);
            }
//            dwr.engine.setAsync(true);
        });
    }

    //添加功能
    function addFun() {
        if (${empty objid || objid == 0}) {
            stk.alert("请选择功能分类");
            return;
        } else {
            $("#addFunForm").stk_reset();
            getParentFun(false);
            $("#funtype").stk_val("0");
            $("#menuflag").stk_val("0");
            $("#addFunWindow").stk_show({title: '新增功能'});
            $("#funcode").stk_focus();

            stk.call({
                className: "com.sinitek.managerframework.function.action.FunctionInfoAction",
                method: 'getMaxInfoSort',
                param: {
                    groupid: '${objid}'
                },
                callBack: function (result) {
                    $("#funsort").stk_val(result + 1);
                },
                exceptionHandler: function (message, e) {
                    stk.error(message)
                }
            });
        }
    }

    //修改功能
    function showUpdateWindow(data) {
//    stk.debug(data);
        $("#addFunForm").stk_reset();
        getParentFun(false);
        $("#addFunBtn").stk_hide();
        $("#funtype").stk_val("1");
        $("#funid").stk_val(data.objid);
        $("#funcode").stk_val(data.code);
        $("#funname").stk_val(data.name);
        $("#functiontype").stk_val(data.type);
        $("#funsort").stk_val(data.sort);
        $("#url").stk_val(data.url);
        $("#action").stk_val(data.action);
        $("#method").stk_val(data.method);
        $("#fundec").stk_val(data.brief);
        $("#addFunWindow").stk_show({title: '修改功能'});
        $("#funcode").stk_focus();
    }

    //删除功能
    function removeFun() {
        if ($("#checkBoxPlugin").hasSelect()) {
            stk.confirm("确认删除吗？", function () {
                $("#checkBoxPlugin").stk_call({type: '0'}, function (result) {
                    $("#funTable").stk_query();
                });
            });
        }
        else {
            stk.alert("请选中要删除的数据");
        }
    }

    //增加功能分类
    function addColumn() {
        if (${empty objid || objid == 0}) {
            stk.confirm("增加根节点吗？", function() {
                $("#addTypeForm").stk_reset();
                getParentFun(true);
                $("#type").stk_val("0");
                $("#addBtn").stk_show();
                $("#addTypeWindow").stk_show({title:"新增分类"});
                $("#typename").stk_focus();
            });
        } else {
            $("#addTypeForm").stk_reset();
            getParentFun(true);
            $("#type").stk_val("0");
            $("#addBtn").stk_show();
            $("#addTypeWindow").stk_show({title:"新增分类"});
            $("#typename").stk_focus();
        }
    }

    //修改功能分类
    function editColumn(){
        $("#addTypeForm").stk_reset();
        getParentFun(true);
        $("#addBtn").stk_hide();
        $("#type").stk_val("1");
        $("#typeid").stk_val(${objid});
        $("#parentid").stk_val(${parentid});
        $("#typename").stk_val("${groupname}");
        $("#typedec").stk_val("${groupdescription}".replaceAll("<br>", "\n"));
        $("#addTypeWindow").stk_show({title:'修改分类'});
        $("#typename").stk_focus();
    }

    //删除当前选中栏目
    function deleteColumn() {
        var id = ${not empty objid ? objid : 0};
        if (id == 0) {
            stk.alert("功能分类根节点不得删除");
        } else {
            if (id == undefined) {
                stk.alert("请选择要删除的栏目");
                return;
            } else {
                var parentnode = window.parent.getNodeInfo('${objid}');
                var parentid = 0;
                if (parentnode) {
                    parentid = parentnode.parentid;
                }
                stk.confirm("确认删除当前分类吗？", function() {
                    $("#queryForm").stk_submit("removeSelect", function(result) {
                        if (result != "")
                            stk.alert(result);
                        else {
                            window.parent.reLoadTree();
                            window.parent.selectNode(parentid, "");
                        }
                    });
                });
            }
        }
    }

    function gotourl(groupid) {
        window.parent.selectNode(groupid, '');
    }
    /**
     * 显示排序窗口
     */
    function showSortWindow() {
        var postdata = $("#funTable").stk_info().data;
        var size = postdata.length;
        var postids = [size], posts = {};
        for (var i = 0; i < size; i++) {
            var postid = postdata[i].objid;
            var postname = postdata[i].name;
            posts[postid] = postname;
            postids[i] = postid;
        }
        $("#funSortWindow").stk_show({title: '排序'});
        $("#postSort").stk_init(posts, postids);
        $(".stk-p-2").hide();
        $(".stk-p-1").hide();
    }

    $(document).ready(function () {
        $("#queryForm").stk_submit("getCurrentMenu", function (strmeun) {
            var sb = [];
            var datas = $.parseJSON(strmeun);
            for (var i = datas.length - 1; i >= 0; i--) {
                var data = $(datas).get(i);
                if (i == datas.length - 1) {
                    sb.push("<a href=\"javascript:gotourl('" + data.id + "')\">" + data.code + "</a>");
                } else {
                    sb.push("&nbsp;&gt;&gt;&nbsp;<a href=\"javascript:gotourl('" + data.id + "')\">" + data.code + "</a>");
                }
            }
            $("#currentMeun").html(sb.join("\n"));
        });
    });
</script>


<ui:form id="queryForm" clazz="com.sinitek.managerframework.function.action.FunctionInfoAction">
    <input type="hidden" id="groupid" name="groupid" value="${objid}"/> <!--当前节点的ID-->
    <input type="hidden" id="updateid" name="updateid"/><!--目标节点的ID-->
    <input type="hidden" id="groupsort" name="groupsort"/> <!--当前节点的排序-->
    <input type="hidden" id="updatesort" name="updatesort"/><!--目标节点的排序-->
</ui:form>

<div>

    <div style="margin: 10px; font-size: 15px;">
        当前位置 : <span id="currentMeun"></span>
    </div>

    <layout:panel title="分类信息">
        <div>
            <table>
                <tr>
                    <td>
                        <ui:button text="新增分类" icon="ui-icon-plus">
                            <event:onclick>
                                addColumn();
                            </event:onclick>
                        </ui:button>
                        <c:if test="${objid > 0}">
                            <ui:button text="编辑分类" icon="ui-icon-pencil">
                                <event:onclick>
                                    editColumn();
                                </event:onclick>
                            </ui:button>
                            <%--<ui:button text="删除分类" icon="ui-icon-minus">--%>
                                <%--<event:onclick>--%>
                                    <%--deleteColumn();--%>
                                <%--</event:onclick>--%>
                            <%--</ui:button>--%>
                        </c:if>
                    </td>
                </tr>
            </table>
        </div>
        <div style="margin-top: 5px">
            <table class="stk-form-ui-st1">
                <tr>
                    <td class="hd" width="110">分类名称</td>
                    <td class="bd" width="auto"><ui:label>${groupname}</ui:label></td>
                </tr>
                <tr>
                    <td class="hd" width="110">分类描述</td>
                    <td class="bd" width="auto"><ui:label>${groupdescription}</ui:label></td>
                </tr>
            </table>
        </div>
    </layout:panel>




    <div class="prem-sec-box" style="margin-top: 20px;"> <!-- style="width:100%"-->
        <layout:panel title="功能列表">
            <plugin:colCheckbox id="checkBoxPlugin" name="check"/>
            <plugin:colRowNum id="rowNumPlugin"/>
            <plugin:colLink id="updateBtn" text="修改" dataVar="data">
                showUpdateWindow(data);
            </plugin:colLink>
            <plugin:colLink id="authBut" text="授权" dataVar="data">
                showAuth(data.objid,data.name);
            </plugin:colLink>
            <ui:table id="funTable" actionClass="com.sinitek.managerframework.function.action.FunctionInfoAction"
                      queryForm="queryForm" width="100%" allowInit="true" pageSize="10">
                <layout:tableToolBar position="top">
                    <ui:toolbarButton text="新增" icon="ui-icon-document">
                        <event:onclick>
                            addFun();
                        </event:onclick>
                    </ui:toolbarButton>
                    <ui:toolbarButton text="删除" icon="ui-icon-trash">
                        <event:onclick>
                            removeFun();
                        </event:onclick>
                    </ui:toolbarButton>
                    <ui:toolbarButton icon="ui-icon-arrow-2-n-s" text="排序">
                        <event:onclick>
                            showSortWindow();
                        </event:onclick>
                    </ui:toolbarButton>
                </layout:tableToolBar>
                <ui:col plugin="checkBoxPlugin" width="20px"/>
                <ui:col plugin="rowNumPlugin" width="30px"/>
                <ui:col property="Code" title="代码" align="left" width="70px" allowTip="true"/>
                <ui:col property="Name" title="名称" align="left" width="80px" allowTip="true"/>
                <ui:colCust allowSort="false" method="getFunctionType" property="functiontype" title="类型" align="center"
                            width="30px"/>
                <ui:col property="Url" title="Url" align="left" nowrap="true" width="33%" allowTip="true"/>
                <ui:col property="Action" title="Action" align="left" nowrap="true" width="33%" allowTip="true"/>
                <ui:col property="Method" title="Method" align="left" nowrap="true" width="33%" allowTip="true"/>
                <ui:col property="sort" title="排序" align="right" width="30px"/>
                <ui:col plugin="updateBtn,authBut" title="操作" nowrap="false" width="80px"/>
            </ui:table>
        </layout:panel>
    </div>
</div>


<!--新增分类-->
<layout:window id="addTypeWindow">
    <ui:form id="addTypeForm" clazz="com.sinitek.managerframework.function.action.FunctionInfoAction" method="saveType">
        <input type="hidden" id="type" name="type"/>
        <input type="hidden" id="typeid" name="typeid"/>
        <%--<input type="hidden" id="parentid" name="parentid"/>--%>
        <input type="hidden" id="parentfun" name="parentfun"/>

        <div style="width:510px">
            <div>
                <table class="stk-form-ui-st1">
                    <tr>
                        <td class="hd" width="80">上级分类<em>*</em></td>
                        <td class="bd" width="auto">
                            <ui:select id="parentid">
                            </ui:select>
                        </td>
                    </tr>
                    <tr>
                        <td class="hd" width="80">分类名称<em>*</em></td>
                        <td class="bd" width="auto"><ui:textfield width="90%" id="typename" name="typename"/></td>
                    </tr>
                        <%--<tr>--%>
                        <%--<td class="hd" width="80">顺序<em>*</em></td>--%>
                        <%--<td class="bd" width="auto"><ui:textfield width="90%" id="typesort" name="typesort"/></td>--%>
                        <%--</tr>--%>
                    <tr>
                        <td class="hd" width="80">分类描述</td>
                        <td class="bd" width="auto">
                            <ui:textarea rows="10" width="90%" id="typedec" name="typedec"/>
                        </td>
                    </tr>
                    <tr class="btn-bar">
                        <td class="hd"></td>
                        <td class="bd">
                            <ui:button id="addBtn" text="保存并新增">
                                <event:onclick>
                                    if ($("#addTypeForm").stk_checkForm()) {
                                        $("#addTypeForm").stk_submit(function(result) {
                                            if (result != "")
                                                stk.alert(result);
                                            else{
                                                window.parent.reLoadTree();
                                                $("#typename").stk_val("");
                                                $("#typedec").stk_val("");
                                                $("#typename").stk_focus();
                                            }
                                        });
                                    }
                                </event:onclick>
                            </ui:button>
                            <ui:button id="" text="保存并关闭">
                                <event:onclick>
                                    if ($("#addTypeForm").stk_checkForm()) {
                                        $("#addTypeForm").stk_submit(function(result) {
                                            if (result != "")
                                                stk.alert(result);
                                            else{
                                                $("#addTypeWindow").stk_hide();
                                                window.parent.reLoadTree();
                                                window.parent.selectNode('${objid}', '');
                                            }
                                        });
                                    }
                                </event:onclick>
                            </ui:button>
                            <ui:button text="关闭">
                                <event:onclick>
                                    $("#addTypeWindow").stk_hide();
                                </event:onclick>
                            </ui:button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <func:checkers>
            <func:checker target="parentid" allowBlank="false" blankText="请输入上级分类"/>
            <func:checker target="typename" allowBlank="false" blankText="请输入分类名称"/>
            <%--<func:checker target="typesort" allowBlank="false" regex="^[0-9]*$" regexText="请输入数字格式的分类顺序" blankText="请输入分类顺序"/>--%>
            <func:checker target="typedec" validator="checkLength()"/>
        </func:checkers>
    </ui:form>
</layout:window>
<!--新增功能-->
<layout:window id="addFunWindow">
    <ui:form id="addFunForm" clazz="com.sinitek.managerframework.function.action.FunctionInfoAction" method="saveFunction">
        <input type="hidden" id="funtype" name="funtype"/>
        <input type="hidden" id="funid" name="funid"/>

        <div style="width:510px">
            <div>
                <table class="stk-form-ui-st1">
                    <tr>
                        <td class="hd" width="80">功能分类<em>*</em></td>
                        <td class="bd" width="auto"><ui:select id="functionGroupId"></ui:select></td>
                    </tr>
                    <tr>
                        <td class="hd" width="80">功能代码<em>*</em></td>
                        <td class="bd" width="auto"><ui:textfield id="funcode" name="funcode" width="80%"/></td>
                    </tr>
                    <tr>
                        <td class="hd" width="80">功能名称<em>*</em></td>
                        <td class="bd" width="auto"><ui:textfield id="funname" name="funname" width="80%"/></td>
                    </tr>
                    <tr>
                        <td class="hd" width="80">功能类型<em>*</em></td>
                        <td class="bd" width="auto">
                            <param:enumList clazz="com.sinitek.managerframework.function.common.enums.FunctionType"
                                            var="enumList"/>
                            <ui:select id="functiontype" name="functiontype" list="#attr.enumList" headerKey="0"
                                       headerValue="--请选择--" listKey="enumItemValue"
                                       listValue="enumItemInfo"></ui:select>
                        </td>
                    </tr>
                    <tr>
                        <td class="hd" width="80">顺序<em>*</em></td>
                        <td class="bd" width="auto"><ui:textfield id="funsort" name="funsort" width="80%"/></td>
                    </tr>
                    <tr>
                        <td class="hd" width="80">Url</td>
                        <td class="bd" width="auto"><ui:textfield id="url" name="url" width="80%"/></td>
                    </tr>
                    <tr>
                        <td class="hd" width="80">Action</td>
                        <td class="bd" width="auto"><ui:textfield id="action" name="action"/>
                            &nbsp;&nbsp; Method &nbsp;<ui:textfield id="method" name="method"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="hd" width="80">说明</td>
                        <td class="bd" width="auto">
                            <ui:textarea rows="10" id="fundec" name="fundec" width="80%"/>
                        </td>
                    </tr>
                    <tr class="btn-bar">
                        <td class="hd"></td>
                        <td class="bd">
                            <ui:button id="addFunBtn" text="保存并新增">
                                <event:onclick>
                                    if ($("#addFunForm").stk_checkForm()) {
                                        $("#addFunForm").stk_submit(function(result) {
                                            if (result != "")
                                                stk.alert(result);
                                            else{
                                                $("#funTable").stk_query();
                                                $("#addFunWindow").stk_hide();
                                                addFun();
                                            }
                                        });
                                    }
                                </event:onclick>
                            </ui:button>
                            <ui:button id="" text="保存并关闭">
                                <event:onclick>
                                    if ($("#addFunForm").stk_checkForm()) {
                                        $("#addFunForm").stk_submit(function(result) {
                                            if (result != "")
                                                stk.alert(result);
                                            else{
                                                $("#addFunWindow").stk_hide();
                                                $("#funTable").stk_query();
                                            }
                                        });
                                    }
                                </event:onclick>
                            </ui:button>
                            <ui:button text="关闭">
                                <event:onclick>
                                    $("#addFunWindow").stk_hide();
                                </event:onclick>
                            </ui:button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <func:checkers>
            <func:checker target="functionGroupId" allowBlank="false" blankText="请输入功能分类"/>
            <func:checker target="funcode" allowBlank="false" blankText="请输入功能代码"/>
            <func:checker target="funname" allowBlank="false" blankText="请输入功能名称"/>
            <func:checker target="functiontype" validator="ismenuFun()"/>
            <func:checker target="fundec" validator="checkFunLength()"/>
            <func:checker target="funsort" allowBlank="false" blankText="请输入顺序" regex="^[0-9]*$"
                          regexText="请输入数字格式的分类顺序"/>
        </func:checkers>
    </ui:form>
</layout:window>
<!--功能排序-->
<layout:window id="funSortWindow" width="300px">
    <ui:form id="funSortForm" clazz="com.sinitek.managerframework.function.action.FunctionInfoAction" method="saveFunctionSort">
        <div style="padding:10px;" align="center">
            <input type="hidden" id="parentId3" name="parentId" value="${objid}">
            <ui:doubleSelect id="postSort" name="postSort" selectTitle="排序"/>
            <script type="text/javascript">
                $(document).ready(function () {
                    $("#postSort_r").unbind("dblclick");
                });
            </script>
            <ui:button text="保存">
                <event:onclick>
                    $("#funSortForm").stk_submit(function(result){
                    $("#funSortWindow").stk_hide();
                    $("#funTable").stk_query();
                    });
                </event:onclick>
            </ui:button>
            <ui:button text="取消">
                <event:onclick>
                    $("#funSortWindow").stk_hide();
                </event:onclick>
            </ui:button>
        </div>
    </ui:form>
</layout:window>
<jsp:include page="../include/objectright.jsp">
    <jsp:param name="rightdefinekey" value="FUNCTIONINFO"/>
</jsp:include>