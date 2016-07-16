<%--
  Created by IntelliJ IDEA.
  User: sinitek
  Date: 12-2-21
  Time: 下午4:20
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="org" uri="http://www.sinitek.com/sirm/org/tag" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../includes/commonincludes.jsp" %>
<link href="${contextPath}/org/css/org.css" type="text/css" rel="stylesheet">
<org:OrgTreeTag orglist="orgtreelist" isshowrole="true" isshowemp="true"></org:OrgTreeTag>
<html>
<head><title>组织结构权限页面</title>
    <%--<script type="text/javascript">--%>
        <%--var allTree =${orgtreelist};--%>
        <%--//获取下拉列表中的内容，显示不同的页面--%>
        <%--function authTypeOnchange(url) {--%>
            <%--$("#_listauth_iframe").attr("src", url);--%>
            <%--if ($("#_listauth_orgid").stk_val() != "")--%>
                <%--mylink("", "", $("#_listauth_orgid").stk_val());--%>
        <%--}--%>
        <%--//点击组织结构树节点的时候触发的事件--%>
        <%--function mylink(id, href, rootid) {--%>
            <%--if ($("#_listauth_authtype").stk_val() == "#") {--%>
                <%--alert("请选择要赋权的页面");--%>
            <%--} else {--%>
                <%--$("#_listauth_orgid").stk_val(rootid);--%>
                <%--var text = _listauth_iframe.window.gettypeentity();//document.getElementById("_listauth_iframe")["gettypeentity"]();--%>
                <%--if (text != "" && text.split(":").length > 0) {--%>
                    <%--$("#_listauth_type").stk_val(text.split(":")[1]);--%>
                    <%--$("#_listauth_entity").stk_val(text.split(":")[0]);--%>
                    <%--$("#_listauth_orgForm").stk_submit("getOrgAuths", function (result) {--%>
                        <%--var data = jQuery.parseJSON(result);--%>
                        <%--var orgresult = ',' + data.orgResult + ',';--%>
                        <%--var empresult = ',' + data.empResult + ',';--%>
                        <%--$("._listauth", document.getElementById("_listauth_iframe").contentWindow.document).each(function () {--%>
                            <%--$(this).next("span").css("color", "black");--%>
                            <%--if (orgresult.indexOf("," + this.value + ",") != -1)--%>
                                <%--this.checked = true;--%>
                            <%--else--%>
                                <%--this.checked = false;--%>
                            <%--this["_checked"] = this.checked;//最初状态--%>
                            <%--if (empresult.indexOf("," + this.value + ",") != -1) {--%>
                                <%--$(this).next("span").css("color", "blue");--%>
                            <%--}--%>
                        <%--});--%>
<%--//                        result = ',' + result + ',';--%>
<%--//                        //获取iframe页面中checkbox--%>
<%--//                        $("._listauth", document.getElementById("_listauth_iframe").contentWindow.document).each(function () {--%>
<%--//                            if (result.indexOf("," + this.value + ",") != -1)--%>
<%--//                                this.checked = true;--%>
<%--//                            else--%>
<%--//                                this.checked = false;--%>
<%--//                            this["_checked"] = this.checked;//最初状态--%>
<%--//                        });--%>
                    <%--});--%>
                <%--} else {--%>
                    <%--alert("获取子页面数据失败");--%>
                <%--}--%>
            <%--}--%>
        <%--}--%>


        <%--//保存权限--%>
        <%--function __submitAuth() {--%>
            <%--//获取选中的数据信息--%>
            <%--var str = "";--%>
            <%--var orgid = $("#_listauth_orgid").stk_val();--%>
            <%--$("._listauth", document.getElementById("_listauth_iframe").contentWindow.document).each(function () {--%>
                <%--if (this["_checked"] != this.checked) {--%>
                    <%--str += (str == "" ? "" : ",") + this.value + ":" + this.checked;--%>
                <%--}--%>
            <%--});--%>
            <%--if (orgid != "") {--%>
                <%--$("#menusid").stk_val(str);--%>
                <%--$("#_listauth_orgForm").stk_submit(function (result) {--%>
                    <%--if (result != "")--%>
                        <%--alert(result);--%>
                    <%--else--%>
                        <%--alert("保存成功!");--%>
                <%--});--%>
            <%--} else if (orgid == "") {--%>
                <%--alert("请选择组织结构");--%>
            <%--}--%>
        <%--}--%>
    <%--</script>--%>
</head>
<sirm:body>
<table width="100%" height="500px">
    <tr>
        <td width="20%" valign="top" height="30px">
            <ui:select id="_listauth_authtype" width="200px" list="#{'#':'请选择','menuauth1.jsp':'菜单权限'}">
                <event:onchange valVar="val">
                    <%--authTypeOnchange(val);--%>
                    sirm.use('sirm.common', function (org) {
                    org.authTypeOnchange(val);
                    });
                </event:onchange>
            </ui:select>
        </td>
        <%--<td valign="top">--%>
        <%--<ui:form id="_listauth_orgForm" clazz="com.sinitek.managerframework.menu.action.MenuTreeAction" method="orgAuth">--%>
        <%--<layout:panel width="100%" title="授权选项">--%>
        <%--<ui:button text="保存">--%>
        <%--<event:onclick>--%>
        <%--__submitAuth();--%>
        <%--</event:onclick>--%>
        <%--</ui:button>--%>
        <%--</layout:panel>--%>
        <%--<input type="hidden" id="menusid" name="menusid"/>--%>
        <%--<input type="hidden" id="_listauth_type" name="authtype">--%>
        <%--<input type="hidden" id="_listauth_entity" name="authentity">--%>
        <%--<input type="hidden" id="_listauth_orgid" name="orgid">--%>
        <%--</ui:form>--%>
        <%--</td>--%>
    </tr>
    <tr>
        <td>
            <jsp:include page="/common/include/setauth.jsp">
                <jsp:param name="page" value=""/>
            </jsp:include>
        </td>
    </tr>
    <%--<tr>--%>
    <%--<td valign="top"><ui:tree jsList="allTree" id="_listauth_collectionTreeId"/></td>--%>
    <%--<td valign="top" width="100%" height="100%">--%>
    <%--<iframe width="100%" height="100%" id="_listauth_iframe"></iframe>--%>
    <%--</td>--%>
    <%--</tr>--%>
</table>
</sirm:body>
</html>