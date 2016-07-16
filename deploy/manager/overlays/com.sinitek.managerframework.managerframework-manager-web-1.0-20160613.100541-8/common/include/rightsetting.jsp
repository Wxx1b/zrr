<%@ page import="org.apache.commons.collections.map.LinkedMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.sinitek.base.common.api.CommonAPIFactory" %>
<%@ page import="com.sinitek.managerframework.setting.common.api.ISettingService" %>
<%@ page import="com.sinitek.managerframework.setting.common.entity.IGroupSetting" %>
<%--
  Created by IntelliJ IDEA.
  User: 徐力
  Date: 12-08-20
  Time: 下午7：32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/framework/include/head.jsp" %>
<%@ include file="../../includes/commonincludes.jsp" %>
<html>
<head>
    <title>参数组配置页面</title>
    <%
        Map map = new LinkedMap();
//        String catalogCode = request.getParameter("catalogcode");
        String catalogCode = "RIGHT";
        if ( catalogCode != null && !"".equals( catalogCode ) )
        {
            List<IGroupSetting> groupSettingList = ( ( ISettingService ) CommonAPIFactory.getInstance().getCommonAPI( ISettingService.class ) ).findGroupSettingByCode( catalogCode );
            if ( groupSettingList != null && groupSettingList.size() > 0 )
            {
                for ( IGroupSetting groupSetting : groupSettingList )
                {
                    map.put( groupSetting.getUrl(), groupSetting.getName() );
                }
                pageContext.setAttribute( "defaultvalue", groupSettingList.get( 0 ).getUrl() );
            } else
            {
                pageContext.setAttribute( "defaultvalue", "" );
            }
        }
        pageContext.setAttribute( "catalogCode", catalogCode );
        pageContext.setAttribute( "groupsettinglist", map );
    %>
    <script type="text/javascript">
        $(document).ready(function () {
            stretch();
        });
        function stretch() {
//            stretchHeight($("#_groupsetting_table"));
            stretchHeight($("#_groupsetting_iframe"), 35);
        }
        var stretchHeight = function (targetobj, delta) {
            var sf = function () {
                var tableWrap = $(targetobj);
                var tableOffset = tableWrap.offset();
                var documentHeight = $.offHeight();
                var tableHeight = documentHeight - tableOffset.top - (delta == undefined ? 0 : delta);
                tableWrap.height(tableHeight);
            };
            sf();
            $(window).resize(function () {
                sf();
            });
        }
    </script>
</head>
<sirm:body>
    <table width="100%" id="_groupsetting_table">
        <tr>
            <td>
                <ui:select id="_groupsetting_select" list="#attr.groupsettinglist" headerKey="" headerValue="--请选择--"
                           defaultValue="${defaultvalue}">
                    <event:onchange valVar="val">
                        $("#_groupsetting_iframe").attr("src",val);
                        <%--stretch();--%>
                    </event:onchange>
                </ui:select>
            </td>
        </tr>
        <tr valign="top">
            <td>
                <iframe width="100%" id="_groupsetting_iframe" src="${defaultvalue}" frameborder="no" marginwidth="0"
                        marginheight="0"
                        scrolling="no"></iframe>
            </td>
        </tr>
    </table>
</sirm:body>
</html>