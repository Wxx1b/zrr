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
<head><title>访问人员统计</title>
    <script type="text/javascript">
        function useraccessdetail(userid, username) {
            $(document).stk_go("${contextPath}/org/statistical/statisticaluseraccess.jsp?userid=" + userid, username + "_用户访问统计");
        }
    </script>
</head>
<body>
<form id="userstatisticform">
    <div class="search-params-bar">
        <table>
            <tr>
                <td class="tit"><label>用户</label></td>
                <td class="bd">
                    <ui:textfield id="username" name="username" emptyText="输入员工姓名或用户名"/>
                </td>
                <td class="tit"><label>操作日期</label></td>
                <td class="bd">
                    <ui:datefield id="startTime" name="timestart" endDate="timeend"/>
                    至
                    <ui:datefield id="endTime" name="timeend" startDate="timestart"/>
                </td>
                <td>
                    <ui:button text="查询">
                        <event:onclick>
                            $("#userstatistictable").stk_query();
                        </event:onclick>
                    </ui:button>
                </td>
            </tr>
        </table>
    </div>
    <plugin:colLink id="accessLinkPlugin" dataVar="val">
        useraccessdetail(val.userid,val.orgname);
    </plugin:colLink>
    <ui:tablefix id="userstatistictable" width="100%" tableWidth="300px" nowrap="true"
                 actionClass="com.sinitek.managerframework.org.action.UserAccessStatisticsAction" pageSize="15"
                 queryForm="userstatisticform">
        <ui:col plugin="accessLinkPlugin" title="员工姓名" property="orgname" allowTip="true"></ui:col>
        <ui:colDate title="最近访问时间" property="starttime" format="yyyy-MM-dd HH:mm" width="100px"
                    allowTip="false"></ui:colDate>
    </ui:tablefix>
</form>
</body>
</html>