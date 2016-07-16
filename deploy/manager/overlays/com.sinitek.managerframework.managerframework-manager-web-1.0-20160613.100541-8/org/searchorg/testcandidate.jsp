<%--
  Created by IntelliJ IDEA.
  User: sinitek
  Date: 12-4-11
  Time: 下午1:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/org/includes/orgincludes.jsp" %>
<html>
<head>
    <title></title>

    <script type="text/javascript">
        $(document).ready(function(){
            showframe('test', 'usersdiv1', 'contactpersontr1', '_personwindow', '999000222:王志华:8');
//            var item1=['999000222','999002183'];
//            sirm.org.searchorg.testCandidateControl._user_updateValue(item1);
        })

        function aa(empid){
            alert(empid);
        }
    </script>
</head>
<sirm:body>
<!--callbackfn=回调函数-->
<!--oneuser=是否是单选人-->
<!--userinfo=是否是选人-->
<!--width=控件宽度-->
<!--selectWidth=控件自动完成层的宽度-->
<!--code=方案代码-->
<ui:form id="testCandidateForm" clazz="com.sinitek.managerframework.org.action.CandidateControlAction" method="testCandidate">
    <ui:button text="speak">
        <event:onclick>
            alert($("#_test_candidateHidden").val());
        </event:onclick>
    </ui:button>
    选人控件无隐藏域
    <ui:button text="获取值">
        <event:onclick>
            var val= _user_getValue('user');
            stk.alert(val);
        </event:onclick>
    </ui:button>
    <ui:button text="更新值">
        <event:onclick>
            var item=['999002183'];
            _user_updateValue('test',item);
            <%--sirm.org.searchorg.userCandidateControl._user_updateValue(item);--%>
        </event:onclick>
    </ui:button>
    <org:SelectOrg prefix="user" multi="true"/>
    选组织结构控件无隐藏域
    <ui:button text="获取值">
        <event:onclick>
            var val= _user_getValue('org');
            stk.alert(val);
        </event:onclick>
    </ui:button>
    <ui:button text="更新值">
        <event:onclick>
            var item=['999002183'];
            _user_updateValue('org',item);
            <%--sirm.org.searchorg.userCandidateControl._user_updateValue(item);--%>
        </event:onclick>
    </ui:button>
    <org:SelectOrg prefix="org" multi="true" mode="ORG"/>
    <%--hiddenId="userhidden"--%>
    <%--<input type="hidden" id="userhidden" name="userhidden"/>--%>
    <br/><br/><br/>
    选人控件方案001<org:SelectOrg prefix="test" code="001" multi="true" hiddenId="contactpersontr1" mode="ORG"  />
    <%--//sirm.org.searchorg.testCandidateControl._user_getValue();--%>
    <ui:button text="获取值">
        <event:onclick>
            var val= _user_getValue('test');
            stk.alert(val);
        </event:onclick>
    </ui:button>
    <input type="text" id="contactpersontr1" name="testhidden"/>
    <ui:button text="更新值">
        <event:onclick>
            showframe('test', 'usersdiv1', 'contactpersontr1', '_personwindow', '999000222:王志华1:8');
            <%--var item1=['999000222','999002183']--%>
            <%--_user_updateValue('test',item1);--%>
            <%--sirm.org.searchorg.testCandidateControl._user_updateValue(item1);--%>
        </event:onclick>
    </ui:button>
    <ui:button text="提交">
        <event:onclick>
              $("#testCandidateForm").stk_submit("testCandidate", function (result) { });
        </event:onclick>
    </ui:button>
      <%--<ui:button text="弹出框">--%>
        <%--<event:onclick>--%>
              <%--&lt;%&ndash;$("#testWindow").stk_show();&ndash;%&gt;--%>
        <%--</event:onclick>--%>
    <%--</ui:button>--%>

</ui:form>
   <%--<layout:window id="testWindow">--%>
       选人控件RT001
       <org:SelectOrg prefix="test1" code="RT001" hiddenId="contactpersontr11" />
       <%--//sirm.org.searchorg.testCandidateControl._user_getValue();--%>
       <ui:button text="获取值">
           <event:onclick>
               var val= _user_getValue('test');
               stk.alert(val);
           </event:onclick>
       </ui:button>
       <input type="text" id="contactpersontr11" name="testhidden"/>
   <%--</layout:window>--%>
</sirm:body>
</html>