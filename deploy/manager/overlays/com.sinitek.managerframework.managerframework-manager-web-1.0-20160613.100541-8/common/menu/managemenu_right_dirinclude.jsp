<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/5/31
  Time: 15:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    function getselect() {
        var top = document.createElement("optgroup");
        stk.call({
            className: "com.sinitek.managerframework.menu.action.MenuAction",
            method: 'getMenuSelect',
            param: {},
            callBack: function (result) {
                var menuselect = $("#menuselect");
                var html = [];
                html.push("<option value=\"\">请选择</option>");

                for (var i in result) {
                    var blank = [];
                    for (var j = 0; j < result[i].level * 4; j++) {
                        blank.push("&nbsp;");
                    }
                    html.push("<option value=\"" + result[i].objid + "\">" + blank.join("") + result[i].name + "</option>");
                }

                menuselect.html(html.join("\n"));
            },
            exceptionHandler: function (message, e) {
                stk.error(message)
            }
        });
    }

    function showUpdateWindow(data) {
        $("#menuname").stk_val("");
        $("#description2").stk_val("");
        $("#url").stk_val("");


        $("#menuname").stk_val(data.name);
        $("#url").stk_val(data.url);
        $("#objid").stk_val(data.objid);
        $("#description2").stk_val(data.description);
        $("#style").stk_val(data.style);
        $("#addmenuWindow").stk_show();

    }

    function showMoveWindow(data) {
        $("#movemenuWindow").stk_show();
        $("#spanmenuname").text(data.name);
        $("#objid2").val(data.objid);
        $("#menuposition").val("");

        getselect();
    }

    function removeMenu() {
        if ($("#checkBoxPlugin").hasSelect()) {
            stk.confirm("确认删除吗？", function () {
                $("#checkBoxPlugin").stk_call({type: '0'}, function (result) {
//                    $("#industryTree").stk_refresh($("#qparentid").stk_val());
                    $("#menuTable").stk_query();
                    window.parent.reLoadTree();
                });
            });
        }
        else {
            stk.alert("请选中要删除的数据");
        }
    }

    function showPostSortWindow() {
        var postdata = $("#menuTable").stk_info().data;
        var size = postdata.length;
        var postids = [size], posts = {};
        for (var i = 0; i < size; i++) {
            var postid = postdata[i].objid;
            var postname = postdata[i].name;
            posts[postid] = postname;
            postids[i] = postid;
        }
        $("#postSortWindow").stk_show({title: '排序'});
        $("#postSort").stk_init(posts, postids);
        $(".stk-p-2").hide();
        $(".stk-p-1").hide();
    }

    function savePostSort() {
        var param = sirm.org.param;
        $("#postSortForm").stk_submit(function (result) {
            if (result != "") {
                stk.alert(result);
            } else {
                $("#postSortWindow").stk_hide();
                $("#postTable").stk_query();
                freshOrgTree();
            }
            $("#postTable").stk_query();
        });
    }
</script>

<ui:form id="menuForm">
    <input type="hidden" id="qparentid" name="qparentid" value="${objid}">
    <input type="hidden" id="type" name="type" value="1">
    <input type="hidden" id="order" name="order">


    <div id="childmenudiv" style="margin-top: 20px">
        <layout:panel title="下级菜单">
            <plugin:colLink id="updateBut" text="编辑" dataVar="data">
                $("#add").stk_hide();
                $("#selecttr").stk_show();
                showUpdateWindow(data);
            </plugin:colLink>
            <plugin:colLink id="moveBut" text="移动" dataVar="data">
                showMoveWindow(data);
            </plugin:colLink>
            <plugin:colLink id="authBut" text="授权" dataVar="data">
                showAuth(data.objid,data.name);
            </plugin:colLink>
            <plugin:colCheckbox id="checkBoxPlugin" name="check"/>
            <plugin:colRowNum id="rowNumPlugin">

            </plugin:colRowNum>
            <ui:table id="menuTable"
                      actionClass="com.sinitek.managerframework.menu.action.MenuAction"
                      nowrap="true"
                      queryForm="menuForm" tableWidth="100%" pageSize="10">
                <layout:tableToolBar position="top">
                    <ui:toolbarButton icon="ui-icon-document" text="新增">
                        <event:onclick>
                            $("#url").stk_val("");
                            $("#menuname").stk_val("");
                            $("#ord").stk_val("");
                            $("#description2").stk_val("");
                            $("#objid").stk_val("0");
                            $("#add").stk_show();
                            $("#selecttr").stk_hide();
                            $("#addmenuWindow").stk_show();
                        </event:onclick>
                    </ui:toolbarButton>
                    <ui:toolbarButton icon="ui-icon-trash" text="删除">
                        <event:onclick>
                            removeMenu();
                        </event:onclick>
                    </ui:toolbarButton>
                    <ui:toolbarButton icon="ui-icon-arrow-2-n-s" text="排序">
                        <event:onclick>
                            showPostSortWindow();
                        </event:onclick>
                    </ui:toolbarButton>
                </layout:tableToolBar>
                <ui:col plugin="checkBoxPlugin" nowrap="false" width="30px"/>
                <%--<ui:col plugin="rowNumPlugin" width="30px"/>--%>
                <ui:colCust method="jspGetMenuName" property="name" title="名称" align="left"
                            width="200px" allowTip="false">
                    "<input type='hidden' name='menueval_order' value='"+objid+"_"+rownum+"'/><span title='"+name+"'>"+name+"</span>"
                </ui:colCust>
                <ui:col property="url" title="Url" align="left" width="100%" allowTip="true"/>
                <%--<ui:col property="description" title="描述" align="left" width="40%" allowTip="true"/>--%>
                <ui:col property="style" title="样式" width="80px"/>
                <%--<ui:colCust method="setorda" title="排序" width="80px"/>--%>
                <ui:col plugin="updateBut,moveBut,authBut" title="操作" width="120px"/>
                <event:ontableorder propertyVar="property" orderTypeVar="order">
                    $("#order").stk_val(property+":"+order);
                    $("#menuTable").stk_query();
                </event:ontableorder>
            </ui:table>
        </layout:panel>
    </div>
</ui:form>

<layout:window id="addmenuWindow" width="540px" cellUnderLine="true" cellMarginBottom="1px" feature="labelBg"
               title="编辑菜单">
    <ui:form id='addmenuform' clazz="com.sinitek.managerframework.menu.action.MenuAction" method="addChildMenu">
        <div style="width:510px">
            <div>
                <table class="stk-form-ui-st1">
                    <tr>
                        <td class="hd" width="80"><label>上级菜单</label></td>
                        <td class="bd" width="auto">
                            <label name="parentName" id="parentName">${qname}</label>
                            <input type="hidden" id="parentId" name="parentId" value="${objid}">
                            <input type="hidden" id="objid" name="objid" value="0">
                        </td>
                    </tr>
                    <tr>
                        <td class="hd" width="80"><label>名称<em>*</em></label></td>
                        <td class="bd" width="auto">
                            <ui:textfield id="menuname" name="menuname" width="300px"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="hd" width="80"><label>Url</label></td>
                        <td class="bd" width="auto">
                            <ui:textfield id="url" name="url" width="300px"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="hd" width="80"><label>样式</label></td>
                        <td class="bd" width="auto">
                            <ui:textfield id="style" name="style" width="300px"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="hd" width="80"><label>描述</label></td>
                        <td class="bd" width="auto">
                            <ui:textarea id="description2" name="description2" rows="5" width="300px"/>
                        </td>
                    </tr>

                    <tr class="btn-bar">
                        <td class="hd"></td>
                        <td class="bd">
                            <ui:button text="保存并新建" id="add">
                                <event:onclick>
                                    if($("#addmenuform").stk_checkForm()) {
                                    $("#addmenuform").stk_submit(function(result){
                                    <%--$("#addmenuform").stk_reset();--%>
                                    $("#menuname").stk_val("");
                                    <%--$("#functionId").stk_val("");--%>
                                    <%--$("#ord").stk_val("");--%>
                                    $("#description2").stk_val("");
                                    $("#url").stk_val("");
                                    $("#style").stk_val("");
                                    $("#addmenuWindow").stk_hide();
                                    $("#menuTable").stk_query();
                                    <%--$("#industryTree").stk_refresh($("#qparentid").stk_val())--%>

                                    $("#objid").stk_val("0");
                                    $("#addmenuWindow").stk_show();

                                    window.parent.reLoadTree();
                                    });
                                    }
                                </event:onclick>
                            </ui:button>
                            <ui:button text="保存并关闭">
                                <event:onclick>
                                    var menuselect = $("#menuselect").stk_val();
                                    if($("#addmenuform").stk_checkForm()) {
                                    $("#addmenuform").stk_submit(function(result){
                                    <%--$("#addmenuform").stk_reset();--%>
                                    $("#menuname").stk_val("");
                                    <%--$("#functionId").stk_val("");--%>
                                    <%--$("#ord").stk_val("");--%>
                                    $("#style").stk_val("");
                                    $("#description2").stk_val("");
                                    $("#url").stk_val("");
                                    $("#addmenuWindow").stk_hide();
                                    $("#menuTable").stk_query();
                                    <%--$("#industryTree").stk_refresh($("#qparentid").stk_val());--%>
                                    <%--$("#industryTree").stk_refresh(menuselect);--%>

                                    window.parent.reLoadTree();
                                    });
                                    }
                                </event:onclick>
                            </ui:button>

                            <ui:button text="关闭">
                                <event:onclick>
                                    <%--$("#addmenuform").stk_reset();--%>
                                    $("#menuname").stk_val("");
                                    <%--$("#functionId").stk_val("");--%>
                                    <%--$("#ord").stk_val("");--%>
                                    $("#url").stk_val("");
                                    $("#style").stk_val("");
                                    $("#description2").stk_val("");
                                    $("#addmenuWindow").stk_hide();
                                </event:onclick>
                            </ui:button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <func:checkers>
            <func:checker target="menuname" allowBlank="false" blankText="请输入名称"/>
            <%--<func:checker target="ord" regex="^[0-9]*$" regexText="顺序必须为数字" allowBlank="false" blankText="请输入顺序"/>--%>
        </func:checkers>
    </ui:form>
</layout:window>

<%--移动菜单--%>
<layout:window id="movemenuWindow" width="540px" cellUnderLine="true" cellMarginBottom="1px" feature="labelBg"
               title="移动菜单">
    <ui:form id='movemenuform' clazz="com.sinitek.managerframework.menu.action.MenuAction" method="moveMenu">
        <div style="width:510px">
            <div>
                <table class="stk-form-ui-st1">
                    <tr>
                        <td class="hd" width="80"><label>上级菜单</label></td>
                        <td class="bd" width="auto">
                            <label name="parentName" id="parentName2">${qname}</label>
                            <input type="hidden" id="parentId2" name="parentId" value="${objid}">
                            <input type="hidden" id="objid2" name="objid" value="0">
                        </td>
                    </tr>
                    <tr>
                        <td class="hd" width="80"><label>菜单名称</label></td>
                        <td class="bd" width="auto">
                            <span id="spanmenuname"></span>
                        </td>
                    </tr>
                    <tr id="selecttr">
                        <td class="hd" width="80"><label>移动至</label></td>
                        <td class="bd" width="auto">
                            <select id="menuselect" name="menuselect">
                            </select>

                            <select id="menuposition" name="menuposition">
                                <option value="">请选择</option>
                                <option value="1">前方</option>
                                <option value="2">后方</option>
                                <option value="3">下级</option>
                            </select>
                        </td>
                    </tr>

                    <tr class="btn-bar">
                        <td class="hd"></td>
                        <td class="bd">
                            <ui:button text="确定">
                                <event:onclick>
                                    if($("#movemenuform").stk_checkForm()) {
                                    $("#movemenuform").stk_submit(function(result){
                                    if ("ok" == result){
                                    $("#movemenuWindow").stk_hide();
                                    $("#menuTable").stk_query();

                                    window.parent.reLoadTree();
                                    }
                                    else{
                                    stk.info(result);
                                    }
                                    });
                                    }
                                </event:onclick>
                            </ui:button>

                            <ui:button text="取消">
                                <event:onclick>
                                    $("#movemenuWindow").stk_hide();
                                </event:onclick>
                            </ui:button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <func:checkers>
            <func:checker target="menuselect" allowBlank="false" blankText="请选择目标节点"/>
            <func:checker target="menuposition" allowBlank="false" blankText="请选择目标位置"/>
        </func:checkers>
    </ui:form>
</layout:window>

<!--岗位排序-->
<layout:window id="postSortWindow" width="300px">
    <ui:form id="menuSortForm" clazz="com.sinitek.managerframework.menu.action.MenuAction" method="saveMenuSort">
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
                    $("#menuSortForm").stk_submit(function(result){
                    $("#postSortWindow").stk_hide();
                    $("#menuTable").stk_query();

                    window.parent.reLoadTree();
                    });
                </event:onclick>
            </ui:button>
            <ui:button text="取消">
                <event:onclick>
                    $("#postSortWindow").stk_hide();
                </event:onclick>
            </ui:button>
        </div>
    </ui:form>
</layout:window>