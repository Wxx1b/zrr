<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 14-3-25
  Time: 下午3:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../includes/commonincludes.jsp" %>
<%@ taglib prefix="org" uri="http://www.sinitek.com/sirm/org/tag" %>
<html>
<head><title>对象设置授权</title>
    <script type="text/javascript">
        function getparam() {
            //如果需要传参
            return {type:"menuorg"};
        }

        function showmenu() {
            $('#menutree').stk_refresh('113', true);
        }
    </script>
</head>
<sirm:body>
    <table border="1">
        <tr>
            <td height="400" valign="top" width="350">
                <ui:button text="显示">
                    <event:onclick>
                        showmenu();
                    </event:onclick>
                </ui:button>
                <ui:tree id="menutree" clazz="com.sinitek.managerframework.menu.action.MenuTree" jsParam="getparam()"/>
            </td>
            <td height="400" valign="top" width="900">
                <ui:form id="menuForm">
                    <div>
                        <table class="stk-form-ui-st1">
                            <tr>
                                <td class="hd" width="110">菜单使用对象</td>
                                <td class="bd" width="auto"><label id="cdname"></label></td>
                            </tr>
                        </table>
                    </div>
                </ui:form>
            </td>
        </tr>
    </table>
</sirm:body>
<script type="text/javascript">
    $(document).ready(function() {
//            $('#menutree').delay(10000).stk_refresh('204', true);
    });
</script>
</html>