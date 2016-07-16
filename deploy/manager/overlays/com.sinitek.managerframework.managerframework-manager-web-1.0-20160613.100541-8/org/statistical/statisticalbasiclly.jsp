<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 14-3-10
  Time: 上午9:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/orgincludes.jsp" %>
<html>
<head><title>基本统计</title></head>
<sirm:body>
    <layout:tabs>
        <event:ontabselect tabVar="tab">
            if(tab.id == 'usertab'){
                $("#userstatistictable").stk_query();
            }
            if(tab.id == 'menutab'){
                $("#menustatistictable").stk_query();
            }
        </event:ontabselect>
        <layout:tab title="访问人员统计" id="usertab">

            <jsp:include page="userstatistics.jsp"/>
        </layout:tab>
        <layout:tab title="访问菜单统计" id="menutab">

            <jsp:include page="menustatistics.jsp"/>
        </layout:tab>
    </layout:tabs>
</sirm:body>
</body>
</html>