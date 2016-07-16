<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>增删查改(ajax)</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
    <script type="text/javascript">
        function showAddWindow()
        {
            var form = $( "#addUpdateForm" );
            form.stk_reset();
            form.find( "input[name='type']" ).stk_val( "0" );
            $( "#addUpdateWindow" ).stk_show();
        }

        function showUpdateWindow( data )
        {
            var form = $( "#addUpdateForm" );
            form.stk_reset();
            form.find( "input[name='type']" ).stk_val( "1" );
            form.find( "input[name='objid']" ).stk_val( data.objid );
            $( "#DemoString" ).stk_val( data.demostring );
            $( "#DemoInteger" ).stk_val( data.demointeger );
            if ( data.demodate )
                $( "#DemoDate" ).stk_val( data.demodate.format( "yyyy-MM-dd" ) );
            $( "#DemoEnum" ).stk_val( data.demoenum.enumItemValue );
            $( "#DemoEntity" ).stk_val( data.demoforeign );
            $( "#addUpdateWindow" ).stk_show();
        }

        function remove()
        {
            if ( $( "#checkBoxPlugin" ).stk_hasSelect() )
            {
                stk.confirm( "确认删除吗？", function ()
                {
                    $( "#checkBoxPlugin" ).stk_call( function ()
                    {
                        $( "#testTable" ).stk_query();
                    } );
                } );
            }
            else
            {
                stk.alert( "请选中要删除的数据" );
            }
        }

        function submitForm()
        {
            if ( $( "#addUpdateForm" ).stk_checkForm() )
            {
                $( "#addUpdateForm" ).stk_submit( function ()
                {
                    $( "#addUpdateWindow" ).stk_hide();
                    $( "#testTable" ).stk_query();
                } );
            }
        }
    </script>
</head>
<body>
<ui:form id="testForm">
    <div class="search-params-bar">
    <table>
    <tr><td><ul>
        <li><label>字符串</label><ui:textfield name="DemoString"/></li>
        <li><label>枚举</label>
            <param:enumList clazz="com.sinitek.spirit.webcontrol.demo.DemoEnum" var="DemoEnumList"/>
            <ui:select list="#attr.DemoEnumList" name="DemoEnum" headerKey="" headerValue="--请选择--" listKey="enumItemName" listValue="enumItemInfo"></ui:select>
        </li>
        <li><label>实体</label>
            <param:entityList var="DemoEntityList" entity="DEMOOBJECT2"/>
            <ui:select list="#attr.DemoEntityList" name="DemoEnum" headerKey="" headerValue="--请选择--" listKey="objid" listValue="name"></ui:select>
        </li>
    </ul></td>
    <td>
        <ui:button text="查询">
            <event:onclick>
                $("#testTable").stk_query();
            </event:onclick>
        </ui:button>
        <font color="red">代码请查看：/framework/demo/curd_ajax.jsp</font>
    </td>
    </tr>
    </table>
    </div>
    <event:onkeypress keyCodeVar="code">
        if(code == 13) $("#testTable").stk_query();
    </event:onkeypress>
</ui:form>

<plugin:colCheckbox id="checkBoxPlugin" name="check"/>
<plugin:colButton id="updateBut" text="修改" dataVar="data">
    showUpdateWindow(data);
</plugin:colButton>
<ui:table id="testTable" actionClass="com.sinitek.spirit.webcontrol.demo.DemoCurdAjaxAction" pageSize="10" queryForm="testForm">
    <ui:col plugin="checkBoxPlugin"/>
    <ui:col property="DemoString" title="字符串"/>
    <ui:colNumber property="DemoInteger" title="数字" isMoney="true" afterText="(元)"/>
    <ui:colDate property="DemoDate" title="日期" format="yyyy-MM-dd HH:mm:ss"/>
    <ui:colEnum property="DemoEnum" title="枚举" format="value - info" clazz="com.sinitek.spirit.webcontrol.demo.DemoEnum"/>
    <ui:colEntity property="DemoForeign" title="实体" format="{objid} - {name}" entityName="DEMOOBJECT2" foreignProperty="objid"/>
    <ui:col plugin="updateBut" title="修改" width="60px"/>

    <layout:tableToolBar position="top">
        <ui:toolbarButton icon="ui-icon-plusthick" text="添加">
            <event:onclick>
            showAddWindow();
            </event:onclick>
        </ui:toolbarButton>
        <ui:toolbarButton icon="ui-icon-minusthick" text="删除">
            <event:onclick>
            remove();
            </event:onclick>
        </ui:toolbarButton>
    </layout:tableToolBar>
</ui:table>

<layout:window width="600px" layout="column" id="addUpdateWindow" title="添加/修改">
    <ui:form clazz="com.sinitek.spirit.webcontrol.demo.DemoCurdAjaxAction" method="addUpdate" id="addUpdateForm">
        <input type="hidden" id="type" name="type">
        <input type="hidden" id="objid" name="objid">
        <table class="stk-form-ui-st1">
            <tr>
                <td class="hd" width="80"><font color="red">*</font>字符串</td>
                <td class="bd" width="auto"><ui:textfield id="DemoString" name="DemoString"/></td>
            </tr>
            <tr>
                <td class="hd" width="80">数字</td>
                <td class="bd" width="auto"><ui:textfield id="DemoInteger" name="DemoInteger"/></td>
            </tr>
            <tr>
                <td class="hd" width="80"><font color="red">*</font>枚举</td>
                <td class="bd" width="auto">
                    <ui:select list="#attr.DemoEnumList" id="DemoEnum" name="DemoEnum" headerKey="" headerValue="--请选择--" listKey="enumItemName" listValue="enumItemInfo"></ui:select>
                </td>
            </tr>
            <tr>
                <td class="hd" width="80">日期</td>
                <td class="bd" width="auto"><ui:datefield id="DemoDate" name="DemoDate"/></td>
            </tr>
            <tr>
                <td class="hd" width="80">实体</td>
                <td class="bd" width="auto">
                    <ui:select list="#attr.DemoEntityList" id="DemoEntity" name="DemoEntity" headerKey="" headerValue="--请选择--" listKey="objid" listValue="name"></ui:select>
                </td>
            </tr>
            <tr class="btn-bar">
                <td class="hd"></td>
                <td class="bd">
                    <ui:button text="提交">
                        <event:onclick>
                            submitForm();
                        </event:onclick>
                    </ui:button>
                    <ui:button type="reset" text="重置"/>
                    <ui:button text="取消">
                        <event:onclick>
                            $("#addUpdateWindow").stk_hide();
                        </event:onclick>
                    </ui:button>
                </td>
            </tr>
        </table>
        <func:checkers>
            <func:checker target="DemoString" allowBlank="false" blankText="请输入字符串"/>
            <func:checker target="DemoEnum" allowBlank="false" blankText="请选择枚举"/>
        </func:checkers>
        <event:onkeypress keyCodeVar="code">
            if(code == 13) submitForm();
        </event:onkeypress>
    </ui:form>
</layout:window>
</body>
</html>