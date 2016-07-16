<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 14-3-10
  Time: 上午9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/orgincludes.jsp" %>

<html>
<head><title>用户访问统计</title></head>
<body>
<sirm:body>
    <form id="useraccessstatisticsform">
        <input name="userid" id="userid" value="${param.userid}" type="hidden"/>

        <div class="search-params-bar">
            <table>
                <tr>
                    <td class="tit"><label>模块名称</label></td>
                    <td class="bd">
                        <ui:textfield id="modulename" name="modulename" emptyText="输入模块名称"/>
                    </td>
                    <td class="tit"><label>操作日期</label></td>
                    <td class="bd">
                        <ui:datefield id="startTime" name="timestart" endDate="endTime"/>
                        至
                        <ui:datefield id="endTime" name="timeend" startDate="startTime"/>
                    </td>
                    <td>
                        <ui:button text="查询">
                            <event:onclick>
                                $("#useraccessstatisticstable").stk_query();
                            </event:onclick>
                        </ui:button>
                    </td>
                </tr>
            </table>
        </div>
        <plugin:colLink id="linkPlugin" dataVar="val">
            $("#detaiwindow").stk_show();
            $("#detail_modulename").stk_val(val.modulename);
            $("#detaiwindowtable").stk_query();
        </plugin:colLink>
        <ui:tablefix id="useraccessstatisticstable" width="100%" tableWidth="600px" nowrap="true"
                     actionClass="com.sinitek.managerframework.org.action.UserAccessDetailAction" pageSize="15"
                     queryForm="useraccessstatisticsform">
            <ui:col title="用户名" property="orgname" width="100px" allowTip="true"></ui:col>
            <ui:col title="模块名" property="modulename" width="300px" allowTip="true"></ui:col>
            <ui:col title="访问次数" plugin="linkPlugin" property="cnt" width="100px" allowTip="true"
                    align="right"></ui:col>
            <ui:colDate title="最近访问时间" property="starttime" width="100px" format="yyyy-MM-dd HH:mm"
                        allowTip="false"></ui:colDate>
        </ui:tablefix>
    </form>

    <layout:window id="detaiwindow" width="600px" height="473px" title="用户访问详细信息">
        <form id="detaiwindowform">
            <input name="modulename" id="detail_modulename" type="hidden"/>
            <input name="userid" id="detailuserid" type="hidden" value="${param.userid}"/>
            <ui:tablefix id="detaiwindowtable" width="100%" tableWidth="600px" nowrap="true"
                         actionClass="com.sinitek.managerframework.org.action.BussinessLogDetail" pageSize="15" height="400px"
                         queryForm="detaiwindowform" allowInit="false">
                <ui:col title="描述" property="description"></ui:col>
                <ui:colDate title="访问时间" property="starttime" width="100px" format="yyyy-MM-dd HH:mm"></ui:colDate>
            </ui:tablefix>
        </form>
    </layout:window>
</sirm:body>
</body>
</html>