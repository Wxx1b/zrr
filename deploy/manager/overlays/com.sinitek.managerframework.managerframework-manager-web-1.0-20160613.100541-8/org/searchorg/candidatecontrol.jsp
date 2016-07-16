<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/framework/include/head.jsp" %>
<script type="text/javascript" src="${contextPath}/scripts/org/searchorg/candidatecontrol.js"></script>
<script type="text/javascript">
    //callbackfn=回调函数   multi=是否是多选人    mode=是否是选人   code=方案代码   width=控件宽度   selectWidth=控件自动完成层的宽度  hiddenId=隐藏域Id  readOnly=是否是只读
    (function () {
        sirm.org.searchorg.${param.prefix}CandidateControl = new sirm.org.searchorg.CandidateControl({
            callbackfn:'${param.callbackfn}',
            multi:'${param.multi}',
            mode:'${param.mode}',
            code:'${param.code}',
            prefix:'${param.prefix}',
            hiddenId:'${param.hiddenId}',
            render:'${param.render}',
            path:'${param.path}',
            unitlimitflag:'${param.unitlimitflag}',
            showposition: '${param.showposition}',
            readOnlyStr:'${param.readOnly}',
            deptid:'${param.deptid}',
            teamid:'${param.teamid}',
            positionid:'${param.positionid}'
        });
    })();
    function _user_getValue(prefix) {
        var f = "sirm.org.searchorg." + prefix + "CandidateControl._user_getValue()";
        return eval(f);
    }
    function _user_updateValue(prefix, item) {
        var f = "sirm.org.searchorg." + prefix + "CandidateControl._user_updateValue(item)";
        return eval(f);
    }
    function _user_emptyValue(prefix) {
        var f = "sirm.org.searchorg." + prefix + "CandidateControl._user_emptyValue()";
        return eval(f);
    }
    /**
     *为自动完成框的查询准备参数
     */
    function get${param.prefix}Param() {
        //获取部门值
        var deptid = "";
        if (${not empty param.deptid and param.deptid != "0"}) {
            var a = "sirm.org.searchorg.${param.prefix}CandidateControl._user_getValue()";
            deptid = eval(a);
        }
        //获取小组值
        var teamid = "";
        if (${not empty param.teamid and param.teamid != "0"}) {
            var b = "sirm.org.searchorg.${param.prefix}CandidateControl._user_getValue()";
            teamid = eval(b);
        }
        //获取岗位值
        var positionid = "";
        if (${not empty param.positionid and param.positionid != "0"}) {
            var c = "sirm.org.searchorg.${param.prefix}CandidateControl._user_getValue()";
            positionid = eval(c);
        }
        return {__schemeCode: '${param.code}', prefix: '${param.prefix}', path: '${param.path}', unitlimitflag: '${param.unitlimitflag}', mode: '${param.mode}', multi: '${param.multi}', deptid: deptid, teamid: teamid, positionid: positionid,showposition: '${param.showposition}'};
    }


    /**
     *  兼容老版选人控件
     * @param prefix
     * @param relationDiv
     * @param hiddenname
     * @param showWindow
     * @param hiddenvalue
     * @param userinfo
     */
    function showframe(prefix, relationDiv, hiddenname, showWindow, hiddenvalue, userinfo) {
        var text_codeList = hiddenvalue.split(",");
        var item = [];
        for (var i = 0; i < text_codeList.length; i++) {
            var text = text_codeList[i];
            item[i] = text.split(":")[0];
        }
        var f = "sirm.org.searchorg." + prefix + "CandidateControl._user_updateValue(item)";
        return eval(f);
    }

</script>

<%--<ui:form id="_${param.prefix}_usersForm">--%>
<%--<input type="text" id="_${param.prefix}_order" name="__order"> <!--window中表格排序-->--%>
<%--<input type="text" id="_${param.prefix}_schemeCode" name="__schemeCode" value="${param.code}"><!--选人控件方案代码-->--%>
<%--<input type="text" id="_${param.prefix}_check_hidden" name="checkhidden"/> <!--window中左边组织结构树存放处-->--%>
<%--<input type="text" id="_${param.prefix}_checkall"/><!--window中存值的地方-->--%>
<input type="hidden" id="_${param.prefix}_candidateHidden" name="_${param.prefix}_candidateHidden"/><!--最终存值的地方-->
<c:set var="width" value="${empty param.width ? '100px' : param.width}"/>
<c:set var="selectWidth" value="${empty param.selectWidth ? '200px' : param.selectWidth}"/>
<c:set var="readOnly" value="${empty param.readOnly ? 'false' : param.readOnly}"/>
<c:set var="render" value="${empty param.render || param.render=='false'? 'block' :'none'}"/>
<ui:autoComplete clazz="com.sinitek.managerframework.org.action.CandidateControlAction" id="_${param.prefix}_searchUser"
                 name="_${param.prefix}_searchUser" emptyText="请输入拼音"
                 interactFunction="sirm.org.searchorg.${param.prefix}CandidateControl.searchUserFun"
                 width="${width}" selectWidth="${selectWidth}" icon="ui-icon-search"
                 jsParam="get${param.prefix}Param" readOnly="${readOnly}" disabled="${readOnly}">
    <c:if test="${empty readOnly||readOnly=='false'}">
        <event:oniconclick>
            sirm.org.searchorg.${param.prefix}CandidateControl.openWindow('${contextPath}');
        </event:oniconclick>
    </c:if>
    <event:onblur valVar="val">
        <c:if test="${empty param.multi || param.multi=='false'}">
            if(val==''){
            $("#_${param.prefix}_candidateHidden").stk_val("");
            if ('${param.hiddenId}' != "")
            $("#${param.hiddenId}").stk_val($("#_${param.prefix}_candidateHidden").stk_val());
            }
        </c:if>
    </event:onblur>
</ui:autoComplete>

<div id="_${param.prefix}_candidateControlDiv" style="display: ${render}"></div>
<c:choose>
    <c:when test="${param.mode != 'DEPT' and param.mode != 'TEAM'}">
        <layout:window id="_${param.prefix}_window" width="620px" layout="column" position="top">
            <iframe name="_${param.prefix}_iframe" id="_${param.prefix}_iframe"
                    src="${path}/org/searchorg/blankpage.jsp"
                    scrolling="no" frameborder="0" width="99%" height="350px"></iframe>
        </layout:window>
    </c:when>
    <c:otherwise>
        <layout:window id="_${param.prefix}_window" width="250px" layout="column" position="top">
            <iframe name="_${param.prefix}_iframe" id="_${param.prefix}_iframe"
                    src="${path}/org/searchorg/blankpage.jsp"
                    scrolling="no" frameborder="0" width="99%" height="350px"></iframe>
        </layout:window>
    </c:otherwise>
</c:choose>
<input type="button" style="display: none;" id="_${param.prefix}_closebtn"
       onclick="$('#_${param.prefix}_window').stk_hide()"/>
<input type="button" style="display: none;" id="_${param.prefix}_submitbtn"
       onclick="sirm.org.searchorg.${param.prefix}CandidateControl.closeBtnClick();"/>