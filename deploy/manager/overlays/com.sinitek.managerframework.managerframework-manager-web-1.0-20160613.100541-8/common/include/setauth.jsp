<%--
  Created by IntelliJ IDEA.
  User: sinitek
  Date: 12-2-21
  Time: 下午4:20
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="org" uri="http://www.sinitek.com/sirm/org/tag" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/framework/include/head.jsp" %>
<%@include file="/framework/include/innerHead.jsp" %>
<%@include file="/framework/include/sirmHead.jsp" %>
<link href="${contextPath}/org/css/org.css" type="text/css" rel="stylesheet">
<org:OrgTreeTag orglist="orgtreelist" isshowposition="true" isshowrole="false" isshowemp="true" isshowteam="true" shownopositionemp="true"/>
<org:OrgTreeTag orglist="orgrolelist" isshowposition="false" isshowrole="true" isshowemp="true" isshowteam="false" shownopositionemp="false"/>

<script type="text/javascript">
    var allTree =${orgtreelist};
    var roleTree=${orgrolelist};
    var _clickInt;
    var _clickInt_role;
    $(function () {
        document.getElementById("_listauth_iframe").contentWindow.location.href='${param.page}';
        sirm.define('sirm.common', {
            //获取下拉列表中的内容，显示不同的页面
            authTypeOnchange: function (url) {
                $("#_listauth_iframe").attr("src", url + "?_ssid_=${_ssid_}");
                if ($("#_listauth_orgid").stk_val() != "")
                    mylink("", "", $("#_listauth_orgid").stk_val());
            }
        });
        stretch();
        stretchRole();

//        $("#queryCon").bind("input propertychange",function(event){
//            setTimeout(function(){
//                query();
//            },200);
//        });
//        $("#queryCon").bind("input propertychange",function(event){
//            if (StringUtils.isBlank($("#queryCon").stk_text())) {
//                query();
//            }
//        });

        var _query = function(){
            query();
            if(_clickInt){
                _clickInt = window.clearInterval(_clickInt);
            }
        }
        $("#queryCon").bind("keyup",function(event){
            var key = event.keyCode;
            if(key != 8 && key != 46){      //删除键 和 退格键
                return;
            }

            if(_clickInt){
                window.clearInterval(_clickInt);
                _clickInt = setInterval(_query, 300);
            }else{
                _clickInt = setInterval(_query, 300);
            }
        });

        var _query_role = function(){
            queryRole();
            if(_clickInt_role){
                _clickInt_role = window.clearInterval(_clickInt_role);
            }
        }
        $("#queryCon").bind("keyup",function(event){
            var key = event.keyCode;
            if(key != 8 && key != 46){      //删除键 和 退格键
                return;
            }

            if(_clickInt_role){
                window.clearInterval(_clickInt_role);
                _clickInt_role = setInterval(_query_role, 300);
            }else{
                _clickInt_role = setInterval(_query_role, 300);
            }
        });
    });

    function stretch() {
        stretchHeight($("#_tsetauth_"));
        stretchHeight($("#_listauth_iframe"), 5);
        stretchHeight($("#dtree"), 5);
    }

    function stretchRole() {
        stretchHeight($("#_tsetauth_"));
        stretchHeight($("#_listauth_iframe"), 5);
        stretchHeight($("#rtree"), 5);
    }

    var stretchHeight = function (targetobj, delta) {
        var sf = function () {
            var tableWrap = $(targetobj);
            var tableOffset = tableWrap.offset();
            var documentHeight = $(window).height();
            var tableHeight = documentHeight - tableOffset.top - (delta == undefined ? 0 : delta);
            tableWrap.height(tableHeight);
        };
        sf();
        $(window).resize(function () {
            sf();
        });
    };

    //点击组织结构树节点的时候触发的事件
    function mylink(id, href, rootid) {
        var iframeWindow = _listauth_iframe.window == undefined ? _listauth_iframe.contentWindow : _listauth_iframe.window;
        if ($("#_listauth_authtype").stk_val() == "#" && '${param.page}' == "") {
            stk.alert("请选择要赋权的页面");
        } else {
            $("#_listauth_orgid").stk_val(rootid);
            var text = iframeWindow.gettypeentity();//document.getElementById("_listauth_iframe")["gettypeentity"]();
            if (text != "" && text.split(":").length > 0) {
                $("#_listauth_type").stk_val(text.split(":")[1]);
                $("#_listauth_entity").stk_val(text.split(":")[0]);
                $("#_listauth_orgForm").stk_submit("getOrgAuths", function (result) {
//                    stk.debug(result);
                    var data = jQuery.parseJSON(result);
                    var orgresult = ',' + data.orgResult + ',';
                    var empresult = ',' + data.empResult + ',';
                    $("._listauth", document.getElementById("_listauth_iframe").contentWindow.document).each(function () {
                        $(this).next("span").find("a").css("color", "black");
                        if (orgresult.indexOf("," + this.value + ",") != -1)
                            this.checked = true;
                        else
                            this.checked = false;
                        this["_checked"] = this.checked;//最初状态
                        if (empresult.indexOf("," + this.value + ",") != -1) {
                            $(this).next("span").find("a").css("color", "blue");
                        }
                    });
                });
                $(".allreadauth", document.getElementById("_listauth_iframe").contentWindow.document).each(function () {
                    this.checked = false;
                });

            } else {
                stk.alert("获取子页面数据失败");
            }
        }
        if (typeof iframeWindow.callbackfnc == "function") {
            iframeWindow.callbackfnc(rootid);
        }
    }


    //保存权限
    function __submitAuth() {
        //获取选中的数据信息
        var str = "";
        var orgid = $("#_listauth_orgid").stk_val();
        $("._listauth", document.getElementById("_listauth_iframe").contentWindow.document).each(function () {
//            alert(this.value+"--"+this["_checked"]+"--"+this.checked);

            if (this["_checked"] != this.checked) {
                str += (str == "" ? "" : ",") + this.value + ":" + this.checked;
                this["_checked"] = this.checked;
            }
        });
        if (orgid != "") {
            $("#menusid").stk_val(str);
            $("#_listauth_orgForm").stk_submit(function (result) {
                if (result != "")
                    stk.alert(result);
                else {
                    stk.info("保存成功!");
                    mylink(null,null,orgid);
                }
            });
        } else if (orgid == "") {
            stk.alert("请选择组织结构");
        }
    }
    //恢复继承权限
    function __recoverAuth() {
        var orgid = $("#_listauth_orgid").stk_val();
        if (orgid != "") {
            $("#_listauth_orgForm").stk_submit("recoverOrgAuth", function (result) {
                if (result != "")
                    stk.alert(result);
                else {
                    stk.alert("恢复成功!");
                    mylink(null,null,orgid);
                }
            });
        } else if (orgid == "") {
            stk.alert("请选择组织结构");
        }
    }

    //恢复继承权限（保留自身）
    function __recoverAuth1() {
        var orgid = $("#_listauth_orgid").stk_val();
        if (orgid != "") {
            $("#_listauth_orgForm").stk_submit("recoverOrgAuth1", function (result) {
                if (result != "")
                    stk.alert(result);
                else {
                    stk.alert("恢复成功!");
                    mylink(null,null,orgid);
                }
            });
        } else if (orgid == "") {
            stk.alert("请选择组织结构");
        }
    }

    function autoQuery() {
        query();
        queryRole();
    }

    function query() {
        $.ajax({
            type: 'post',
            data: {queryCon: $("#queryCon").stk_text(),
                isshowposition: true,
                isshowrole: false,
                isshowemp: true,
                isshowteam: true},
            url: '${contextPath}/common/include/tree.jsp',
            dataType: "html",
            success: function (str) {
                _listauth_collectionTreeId_hasLoad = undefined;
                $("#dtree").stk_html(str);
                _listauth_collectionTreeId_buildTree();
                _listauth_collectionTreeId_hasLoad = true;
            },
            error: function (result) {
                stk.error("获取树失败");
            }
        });
        stretch();
    }

    function queryRole() {
        $.ajax({
            type: 'post',
            data: {queryCon: $("#queryCon").stk_text(),
                isshowposition: false,
                isshowrole: true,
                isshowemp: true,
                isshowteam: false},
            url: '${contextPath}/common/include/roletree.jsp',
            dataType: "html",
            success: function (str) {
                _listauth_role_collectionTreeId_hasLoad = undefined;
                $("#rtree").stk_html(str);
                _listauth_role_collectionTreeId_buildTree();
                _listauth_role_collectionTreeId_hasLoad = true;
            },
            error: function (result) {
                stk.error("获取树失败");
            }
        });
        stretchRole();
    }
</script>

<ui:form id="_listauth_orgForm" clazz="com.sinitek.managerframework.menu.action.MenuTreeAction" method="orgAuth">
    <table id="_tsetauth_" width="100%">
        <tr>
            <td width="200px" valign="top">
                    <%--<input type="text" id="queryCon" name="queryCon">--%>
                <ui:autoComplete id="queryCon" clazz="com.sinitek.managerframework.org.action.SearchOrgNameAction" showOnFocus="true"
                                 interactFunction="autoQuery" emptyText="请输入名称或拼音" icon="ui-icon-search" width="210px"/>
                <script type="text/javascript">
                    $("#queryCon_icon").hide();
                </script>

                <layout:tabs>
                    <layout:tab title="组织结构">
                        <div id="dtree" style="height:100px;overflow-y:auto;padding-top: 5px;">
                            <ui:tree jsList="allTree" id="_listauth_collectionTreeId"/>
                        </div>
                    </layout:tab>
                    <layout:tab title="角色">
                        <div id="rtree" style="height:100px;overflow-y:auto;padding-top: 5px;">
                            <ui:tree jsList="roleTree" id="_listauth_role_collectionTreeId"/>
                        </div>
                    </layout:tab>
                </layout:tabs>
            </td>
            <td valign="top">
                <div>
                    <layout:panel width="100%" title="授权选项">
                        <ui:button text="保存">
                            <event:onclick>
                                __submitAuth();
                            </event:onclick>
                        </ui:button>
                        <ui:button text="继承权限（清空自身权限）">
                            <event:onclick>
                                __recoverAuth();
                            </event:onclick>
                        </ui:button>
                        <ui:button text="继承权限（保留自身权限）">
                            <event:onclick>
                                __recoverAuth1();
                            </event:onclick>
                        </ui:button>
                        <span style="color:black">黑色为继承权限</span><span style="color:blue">蓝色为自有权限</span>
                    </layout:panel>
                    <input type="hidden" id="menusid" name="menusid"/>
                    <input type="hidden" id="_listauth_type" name="authtype">
                    <input type="hidden" id="_listauth_entity" name="authentity">
                    <input type="hidden" id="_listauth_orgid" name="orgid">
                </div>
                <div>
                    <iframe width="100%" id="_listauth_iframe"></iframe>
                </div>
            </td>
        </tr>
    </table>
</ui:form>