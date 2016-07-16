<%@ page import="com.sinitek.managerframework.setting.common.utils.StringUtil" %>
<%--
  File Desc:
  Product Name: SIRM
  Module Name: indicator
  Author:      潘虹
  History:     11-5-17 created by 潘虹
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/framework/include/head.jsp" %>
<%@ include file="/framework/include/innerHead.jsp" %>
<link href="${contextPath}/org/css/org.css" type="text/css" rel="stylesheet">

<%
    String relationDiv = StringUtil.safeToString(request.getParameter("relationDiv"), "");
    request.setAttribute("relationDiv", relationDiv.replaceAll("[^0-9a-zA-Z_]", ""));
    String hiddenname = StringUtil.safeToString(request.getParameter("hiddenname"), "");
    request.setAttribute("hiddenname", hiddenname.replaceAll("[^0-9a-zA-Z_]", ""));
%>

<html>
<head>
    <title>选择部门</title>
    <script type="text/javascript" language="javascript">
        function __change(obj) {
//            var _orgid = $(obj).attr("id");
//            var _orgname = $(obj).attr("name");
//            var isbool = $('#' + _orgid)[0].checked;
//            //遍历所有子checkbox，前提是该节点打开。
//            $("input[name='" + _orgid + "']").each(function() {
//                $(this).stk_attr("checked", isbool);
//            });
//            if (_orgname != "") {
//                var parent = $("#" + _orgname);
//                if (parent != undefined) {
//                    var ischeck = false;
//                    //遍历所有同等级checkbox
//                    $("input[name='" + _orgname + "']").each(function() {
//                        if ($(this).stk_attr("checked")) {
//                            ischeck = true;
//                            return false;
//                        }
//                    });
//                    //判断父节点选中状态
//                    if (isbool || ischeck)
//                        parent.stk_attr("checked", true);
//                    else
//                        parent.stk_attr("checked", false);
//                }
//            }
        }

        function __addContent(tf) {

            var checkvalue = '';
            if ('${relationDiv}' != '' && '${hiddenname}' != '') {
                var _relationDiv = parent.document.getElementById('${relationDiv}');
                var hidden = parent.document.getElementById('${hiddenname}');
                _relationDiv.className = "phone-result-table";
                //判断如果是修改则直接赋值，否则遍历当前选中节点。
                if ('${param.hiddenvalue}' != '') {
                    checkvalue = hidden.value;
                } else {
                    var checks = $("input[type='checkbox']");
                    if ('${param.radiounit}' != '') {
                        checks = $("input[type='radio']");
                    }
                    checks.each(function () {
                        if ($(this).prop("checked")) {
                            if (checkvalue != '') {
                                checkvalue += "," + $(this).attr("value");
                            } else {
                                checkvalue += $(this).attr("value");
                            }
                        }
                    });
                }
                if (checkvalue != '') {
                    var checkstr = checkvalue.split(",");
                    var check = '';
                    if ('${param.radiounit}' != '') {
                        hidden.value = "";
                        _relationDiv.innerHTML = "";
                    }
                    for (var i = 0; i < checkstr.length; i++) {
                        var unit = checkstr[i].split(":");
                        var id = unit[0] + Math.ceil(Math.random() * 1000000000) * Math.ceil(Math.random() * 10000);
                        var str = "<span  id=\"" + id + "\" class=\"t-sl\">" + unit[1] +
                                "<b class=\"stk-button-icon ui-icon-close\"  onclick=\"unit.window.__removeContent('" + id + "','" + unit[0] + "')\" ></b></span>"
                        //判断如果是修改还是增加，如果是修改则不判断是否重复
                        if ('${param.hiddenvalue}' != '') {
                            _relationDiv.innerHTML = _relationDiv.innerHTML + str;
                        } else {
                            //判断如果不包含，则增加
                            if (_unit_repeatIndusty(unit[0], hidden.value)) {
                                _relationDiv.innerHTML = _relationDiv.innerHTML + str;
                                if (check != '')
                                    check = check + "," + checkstr[i];
                                else {
                                    check += checkstr[i];
                                }
                            }
                            checkvalue = check;
                        }
                    }
                }
                if ('${param.hiddenvalue}' == '') {
                    if (hidden.value != '' && checkvalue != '')
                        hidden.value = hidden.value + "," + checkvalue;
                    else
                        hidden.value += checkvalue;
                }
            }
            if (tf) {
                window.parent.document.getElementById("_org_unit_close").click();
            }
        }

        //判断是否存在  不包含的话返回true，包含的话返回false
        function _unit_repeatIndusty(scode, text_code) {
            var text_codeList = text_code.split(",");
            for (var i = 0; i < text_codeList.length; i++) {
                if (text_codeList[i] == '') {
                    continue;
                }
                var baseScode = text_codeList[i].split(":");
                if (baseScode[0] + '' == scode + '') {
                    return false;
                }
            }
            return true;
        }
        //删除选中部门
        function __removeContent(id, idstr) {
            var hidden = parent.document.getElementById('${hiddenname}');
            var orgids = hidden.value == null ? "" : hidden.value;
            var text_codeList = orgids.split(",");
            var result = "";
            for (var i = 0; i < text_codeList.length; i++) {
                var text = text_codeList[i];
                var baseScode = text_codeList[i].split(":");
                if (baseScode[0] == idstr) {
                    continue;
                }
                if (result != "") {
                    result = result + "," + text;
                } else {
                    result = text;
                }
            }
            var obj = parent.document.getElementById(id);
            obj.parentNode.removeChild(obj);
            hidden.value = result;
        }

        $(document).ready(function() {
            __addContent(false);
        });

        function _treefunction() {
            return{_radiounit:'${param.radiounit}'};
        }

        function loadtree() {
            $.ajax({
                type: 'post',
                data: {queryCon: $("#queryCon").stk_val(),
                    _radiounit:'${param.radiounit}'},
                url: '${contextPath}/org/searchorg/unittree.jsp',
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                dataType: "html",
                success: function (str) {
                    _listauth_collectionTreeId_hasLoad = undefined;
                    $("#dtree").html(str);
                    _listauth_collectionTreeId_buildTree();
                    _listauth_collectionTreeId_hasLoad = true;
                    $("div[class='loading-st1']").eq(0).parent().css("display","none");

                },
                error: function (result) {
                    stk.error("获取树失败");
                }
            });
        }

        $(document).ready(function () {
            loadtree();
            $("#queryCon").bind("input propertychange", function () {
                setTimeout(function () {
                    loadtree();
                }, 200);
            })
        });
    </script>
</head>
<sirm:body>
<layout:box layout="row" width="310px" height="330px">
    <ui:form id="_org_usersForm">
        <input type="text" id="queryCon" name="queryCon">
       <div id="dtree" style="height:280px;overflow-y:auto">
        <ui:tree id="_orgunit_tree" clazz="com.sinitek.managerframework.org.action.SearchUnitAction" jsParam="_treefunction" width="310px" height="280px"></ui:tree>
        </div>
        <layout:box layout="column" width="310px" align="center">
            <ui:button text="确定">
                <event:onclick>
                    __addContent(true);
                    <%--window.parent.document.getElementById("_org_unit_close").click();--%>
                </event:onclick>
            </ui:button>
            <ui:button text="关闭">
                <event:onclick>
                    window.parent.document.getElementById("_org_unit_close").click();
                </event:onclick>
            </ui:button>
        </layout:box>

    </ui:form>
</layout:box>
</sirm:body>
</html>