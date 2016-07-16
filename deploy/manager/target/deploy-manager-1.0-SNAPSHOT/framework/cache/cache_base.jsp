<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 15-6-23
  Time: 下午4:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/framework/include/head.jsp" %>
<html>
<head>
    <title></title>
    <%@ include file="/framework/include/innerHead.jsp" %>

    <script type="text/javascript">

        function refreshCache(data) {
            stk.call({
                className: "com.sinitek.managerframework.base.cache.FlushCacheAction",
                method: 'flushCache',
                'param': {'entityname': data.entityname},
                callBack: function (data) {
                    stk.alert(data)
                },
                exceptionHandler: function (message, e) {
                    stk.error(message)
                }
            });
        }

        function refreshAllCache() {
            stk.call({
                className: "com.sinitek.managerframework.base.cache.FlushCacheAction",
                method: 'flushCache',
                callBack: function (data) {
                    stk.alert(data)
                },
                exceptionHandler: function (message, e) {
                    stk.error(message)
                }
            });
        }
    </script>
</head>
<body>
<ui:form id="cacheForm">
    <div class="search-params-bar">
        <table>
            <tr>
                <td>
                    <ul>
                        <li><label>实体信息</label><ui:textfield name="entityinfo"/></li>
                        <li><label>实体名</label>
                            <ui:textfield name="entityname"/>
                        </li>
                            <%--<li><label>实体</label>
                                <ui:doceditor id="aadc" name="aadc" defaultValue="112131"/>
                            </li>--%>
                    </ul>
                </td>
                <td>
                    <ui:button text="查询">
                        <event:onclick>
                            $("#cacheTable").stk_query();
                        </event:onclick>
                    </ui:button>

                </td>
                </td>
                <td>
                    <ui:button text="刷新全部缓存">
                        <event:onclick>
                            refreshAllCache();
                        </event:onclick>
                    </ui:button>

                </td>
            </tr>
        </table>
    </div>
    <event:onkeypress keyCodeVar="code">
        if(code == 13) $("#cacheTable").stk_query();
    </event:onkeypress>
</ui:form>

<plugin:colButton id="flushBut" text="刷新缓存" dataVar="data">
    refreshCache(data);
</plugin:colButton>
<ui:table id="cacheTable" actionClass="com.sinitek.managerframework.base.cache.FlushCacheAction" queryForm="cacheForm">
    <ui:col property="catalogname" title="实体种类" allowSort="false"/>
    <ui:col property="entityinfo" title="实体信息" allowSort="false"/>
    <ui:col property="entityname" title="实体名" allowSort="false"/>
    <ui:col plugin="flushBut" title="操作" width="60px"/>
</ui:table>

</body>
</html>