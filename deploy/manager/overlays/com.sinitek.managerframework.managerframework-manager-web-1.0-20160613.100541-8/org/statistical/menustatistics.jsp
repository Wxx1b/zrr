<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 14-3-10
  Time: 上午10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/orgincludes.jsp" %>
<html>
<head><title>访问菜单统计</title>
    <script type="text/javascript">
        function menuaccessdetail(menuid, menuname, menucnt) {
            $(document).stk_go("${contextPath}/org/statistical/statisticalmenuaccess.jsp?menuid=" + menuid + "&menucnt=" + menucnt, menuname + "_菜单访问统计");
        }
    </script>
</head>
<body>
<form id="menustatisticform">
    <div class="search-params-bar">
        <table>
            <tr>
                <td class="tit"><label>菜单</label></td>
                <td class="bd">
                    <ui:textfield id="menuname" name="menuname" emptyText="输入菜单名称"/>
                </td>
                <td class="tit"><label>操作日期</label></td>
                <td class="bd">
                    <ui:datefield id="timestart" name="timestart" endDate="timeend"/>
                    至
                    <ui:datefield id="timeend" name="timeend" startDate="timestart"/>
                </td>
                <td>
                    <ui:button text="查询">
                        <event:onclick>
                            $("#menustatistictable").stk_query();
                        </event:onclick>
                    </ui:button>
                </td>
            </tr>
        </table>
    </div>
    <plugin:colLink id="linkPlugin" dataVar="val">
        menuaccessdetail(val.menuid,val.menuname,val.cnt);
    </plugin:colLink>
    <ui:tablefix id="menustatistictable" width="100%" tableWidth="600px" nowrap="true"
                 actionClass="com.sinitek.managerframework.org.action.MenuAccessStatisticsAction" pageSize="15"
                 queryForm="menustatisticform">
        <ui:col title="菜单名称" property="menuname" allowTip="true"></ui:col>
        <ui:col plugin="linkPlugin" title="访问次数" property="cnt" width="100px" align="right" allowTip="true"></ui:col>
        <ui:colDate title="最近访问时间" property="starttime" format="yyyy-MM-dd HH:mm" width="100px"></ui:colDate>
    </ui:tablefix>
</form>
</body>
</html>