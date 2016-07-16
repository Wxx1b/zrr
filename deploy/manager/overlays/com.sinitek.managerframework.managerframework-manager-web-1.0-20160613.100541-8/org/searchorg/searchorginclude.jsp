<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/framework/include/head.jsp" %>
<script type="text/javascript" src="${contextPath}/scripts/org/searchorg/searchorginclude.js">
</script>
<script type="text/javascript">
    $(function () {
        sirm.org.searchorg.${param.prefix}SearchOrg = new sirm.org.searchorg.SearchOrg({
            prefix:'${param.prefix}',
            showdiv:'${param.showdiv}',
            relationDiv:'${param.relationDiv}',
            callbackfunc:'${param.callbackfunc}'
        });
    });
</script>
<ui:autoComplete clazz="com.sinitek.managerframework.org.action.SearchOrgAction" id="_${param.prefix}_searchOrg"
                 emptyText="请输入拼音" interactFunction="sirm.org.searchorg.${param.prefix}SearchOrg._org_searchOrgFun"
                 width="${param.width}">
    <event:onblur valVar="val">
        if(val=='')
        $("#_${param.prefix}_orgid").stk_val("");
    </event:onblur>
</ui:autoComplete>
<input type="hidden" id="_${param.prefix}_orgid"/>