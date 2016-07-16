<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 14-3-10
  Time: 上午9:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/orgincludes.jsp" %>
<sirm:page clazz="com.sinitek.managerframework.org.action.MenuAccessDetailAction"/>
<html>
<head><title>菜单访问统计</title></head>
<sirm:body>
    <form id="statisticalmenuaccessform">
        <input name="menuid" id="menuid" value="${param.menuid}" type="hidden">

        <div class="search-params-bar"
             style="font-size:14px;font-weight:bolder;font-size:12px;font-family:Verdana, Arial, Helvetica,sans-serif;color:red;padding-bottom:10px;">
            菜单名称：[${menuname}]
            <%--访问次数：[${menucnt}次]--%>
        </div>
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
                                $("#statisticalmenuaccesstable").stk_query();
                            </event:onclick>
                        </ui:button>
                    </td>
                </tr>
            </table>
        </div>
        <plugin:colLink id="linkPlugin" dataVar="val">
            $("#detaiwindow").stk_show();
            $("#detailuserid").stk_val(val.userid);
            $("#detaiwindowtable").stk_query();
        </plugin:colLink>
        <ui:tablefix id="statisticalmenuaccesstable" width="100%" tableWidth="600px" nowrap="true"
                     actionClass="com.sinitek.managerframework.org.action.MenuAccessDetailAction" pageSize="15"
                     queryForm="statisticalmenuaccessform">
            <ui:col title="用户名" property="orgname" width="100%" allowTip="true"></ui:col>
            <%--<ui:col title="菜单名称" property="menuname"></ui:col>--%>
            <ui:col title="访问次数" plugin="linkPlugin" property="cnt" width="80px" allowTip="true" align="right"></ui:col>
            <ui:col title="最近访问时间" property="starttime" width="100px" allowTip="false"></ui:col>
            <event:aftertablequery>

            </event:aftertablequery>
        </ui:tablefix>
    </form>

    <layout:window id="detaiwindow" width="600px" height="473px" title="菜单访问详细信息">
        <form id="detaiwindowform">
            <input name="menuid" id="detail_menuid" value="${param.menuid}" type="hidden"/>
            <input name="userid" id="detailuserid" type="hidden"/>
            <ui:tablefix id="detaiwindowtable" width="100%" tableWidth="600px" nowrap="true"
                         actionClass="com.sinitek.managerframework.org.action.BussinessLogDetail" pageSize="15" height="400px"
                         queryForm="detaiwindowform" allowInit="false">
                <ui:col title="描述" property="description"></ui:col>
                <ui:colDate title="访问时间" property="starttime" width="100px" format="yyyy-MM-dd HH:mm"></ui:colDate>
            </ui:tablefix>
        </form>
    </layout:window>
</sirm:body>
</html>