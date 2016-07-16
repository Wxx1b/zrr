$(function () {
    sirm.define('sirm.org', {
        showAddWindow:function () {
            $("#teamForm").stk_reset();
            $("#users").stk_html("");
            $("#usershidden").stk_val("");
            show('user', 'users', 'usershidden', 'wwww', 'true');
        },
        remove:function () {
            var param = sirm.org.param;
            if ($("#checkBoxPlugin").hasSelect()) {
                stk.confirm("确认删除吗？", function () {
                    $("#checkBoxPlugin").stk_call({teamid:param.teamid}, function (result) {
                        $("#teamTable").stk_query();
                    });
                });
            }
            else {
                stk.alert("请选中要删除的数据");
            }
        }, addconfigTeamer:function () {
            var param = sirm.org.param;
            if ($("#checkBoxPlugin").hasSelect()) {
                $("#checkBoxPlugin").stk_call({teamid:param.teamid, type:'addconfig'}, function (result) {
                    $("#teamTable").stk_query();
                });
            }
            else {
                stk.alert("请选中要配置小组长的人员");
            }
        }, deleteconfigTeamer:function () {
            var param = sirm.org.param;
            if ($("#checkBoxPlugin").hasSelect()) {
                $("#checkBoxPlugin").stk_call({teamid:param.teamid, type:'deleteconfig'}, function (result) {
                    $("#teamTable").stk_query();
                });
            }
            else {
                stk.alert("请选中要删除小组长的人员");
            }
        },
        showInfoWindow:function (val) {
            $("#labcname").stk_text(val.displayname);
            $("#labusername").stk_text(val.username);
            $("#labsex").stk_text(val.sex == "1" ? "男" : val.sex == "2" ? "女" : "");
            $("#labemail").stk_text(val.email);
            $("#labtel").stk_text(val.tel);
            $("#labjob").stk_text(val.job);
            $("#labmobilephone").stk_text(val.mobilephone);
            $("#labinservice").stk_text(val.inservice == "1" ? "在职" : "离职");
            $("#showInfoWindow").stk_show({title:'员工信息'});
        },

        callbackfunction:function () {
            $("#teamForm").stk_submit(function (result) {
                if (result != "")
                    stk.alert(result);
                $("#teamTable").stk_query();
            });
        },

        //验证是否选择员工
        checkUser:function () {
            if ($("#users").stk_html() == "") {
                return "请选择员工";
            } else {
                return true;
            }
        }
    });
    $(function () {
        sirm.use('sirm.org', function (org) {
            var param = org.param;
            stk.call(
                {'className':'com.sinitek.managerframework.org.action.TeamFormAction',
                    'method':'getCurrentMenu',
                    'param':{teamid:param.teamid},
                    'callBack':function (result) {
                        $("#currentSpan").stk_html(result);
                    }
                });
            $("#teamTable").stk_query();
        });
    });
});