<%--
  File Desc:      
  Product Name: SIRM
  Module Name: indicator
  Author:      潘虹
  History:     11-4-27 created by 潘虹
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/orgincludes.jsp" %>
<link href="${contextPath}/org/css/org.css" type="text/css" rel="stylesheet">
<html>
<head><title>树型组织结构</title></head>
<script type="text/javascript">
    function mylink(id, href, rootid) {
        if (window.parent.document.getElementById("mainFrame") != null)
            window.parent.document.getElementById("mainFrame").src = sirm.jsurl('/org/' + href + '.jsp?' + id + "&rootid=" + rootid);
        else
            window.parent.mainFrame.location.href = sirm.jsurl('/org/' + href + '.jsp?' + id);
    }
    function frushTree(id) {
        if (id == '99999' || id == '0') {
            $("#collectionTreeId").stk_refresh(id);
        } else {
            $("#collectionTreeId").stk_refresh(id, true);
        }
    }

    function query() {
        $.ajax({
            type: 'post',
            data: {queryCon: $("#queryCon").stk_text(),
                prefix: '${param.prefix}',
                userinfo: '${param.userinfo}'},
            url: '${contextPath}/org/tree02.jsp',
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

    function reloadPage(){
        query();
    }

    $(document).ready(function () {
        query();
//        $("#queryCon").bind("input propertychange", function () {
//            setTimeout(function () {
//                var queryCon = $("#queryCon").stk_val();
//                loadtree(queryCon);
//            }, 200);
//        });
        $("#queryCon").bind("input propertychange",function(event){
            if (StringUtils.isBlank($("#queryCon").stk_text())) {
                query();
            }
        });
    });
</script>
<sirm:body>
    <%--<input type="text" id="queryCon" name="queryCon">--%>
    <ui:autoComplete id="queryCon" clazz="com.sinitek.managerframework.org.action.SearchOrgNameAction" showOnFocus="true"
                     interactFunction="query" emptyText="请输入名称或拼音" themeName="treeee" icon="ui-icon-search" width="170px"/>
    <div id="dtree" style="padding-top: 5px;">
        <script type="text/javascript">
            $("#queryCon_icon").hide();
        </script>
        <ui:tree clazz="com.sinitek.managerframework.org.action.OrgTreeAction" id="collectionTreeId"/>
    </div>
</sirm:body>
</html>