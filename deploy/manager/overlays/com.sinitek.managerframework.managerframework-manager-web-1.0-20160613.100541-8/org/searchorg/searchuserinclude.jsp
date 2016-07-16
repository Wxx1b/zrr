<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/framework/include/head.jsp" %>
<script type="text/javascript" src="${contextPath}/scripts/org/searchorg/searchuserinclude.js">
</script>
<script type="text/javascript">
    $(function() {
        sirm.org.searchorg.${param.prefix}SearchUser = new sirm.org.searchorg.SearchUser({
            prefix:'${param.prefix}',
            showdiv:'${param.showdiv}',
            relationDiv:'${param.relationDiv}',
            callbackfunc:'${param.callbackfunc}'
        });
    });
</script>
<c:set var="width" value="${empty param.width ? \"100px\" : param.width}"/>
<c:choose>
    <c:when test="${empty param.selectWidth }">
        <ui:autoComplete clazz="com.sinitek.managerframework.org.action.SearchUserAction" id="_${param.prefix}_searchUser" name="_${param.prefix}_searchUser" emptyText="请输入拼音"
                         interactFunction="sirm.org.searchorg.${param.prefix}SearchUser._user_searchUserFun" width="${width}">
            <event:onblur valVar="val">
                if(val=='')
                $("#_${param.prefix}_userid").stk_val("");
            </event:onblur>
        </ui:autoComplete>
    </c:when>
    <c:otherwise>
        <ui:autoComplete clazz="com.sinitek.managerframework.org.action.SearchUserAction" id="_${param.prefix}_searchUser" name="_${param.prefix}_searchUser" emptyText="请输入拼音"
                         interactFunction="sirm.org.searchorg.${param.prefix}SearchUser._user_searchUserFun" width="${width}" selectWidth="${param.selectWidth}"><!-- -->
            <event:onblur valVar="val">
                if(val=='')
                $("#_${param.prefix}_userid").stk_val("");
            </event:onblur>
        </ui:autoComplete>
    </c:otherwise>
</c:choose>

<input type="hidden" id="_${param.prefix}_userid" name="_${param.prefix}_userid"/>
<input type="hidden" id="_${param.prefix}_username" name="_${param.prefix}_username"/>