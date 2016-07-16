$(function () {
    sirm.define('sirm.org', {
        checkupdatefytype:function () {
            if ($("#updatequalifytype").stk_val() != 0 && $("#updatequalifyno").stk_val() == '') {
                return "请输入从业资格编号";
            } else {
                return true;
            }
        },
        updatepw:function () {
            if ($("#updatepassword").stk_val() != $("#updatepasswordTwo").stk_val()) {
                return "两次密码输入不一致";
            } else {
                return true;
            }
        },
        showAddWindow:function () {
            var contextPath = sirm.org.contextPath;
//            window.location = sirm.jsurl("/org/adduser.jsp?type=0");
            sirm.openTab(contextPath+"/org/adduser.jsp?type=0", "新增用户信息", {keyWithoutParams: true}, function () {
                $("#userTable").stk_query();
            });

        },
        roleConfig:function () {
            if ($("#checkBoxPlugin").hasSelect()) {
                $("#checkBoxPlugin").stk_call({type:'0'}, function (result) {
                    $("#rolediv").stk_text("");
                    showframe('user', 'rolediv', 'rolehidden', 'wwww', result);
                    $("#roleConfigWindow").stk_show({title:'角色配置'});
                });
            }
            else {
                stk.alert("请选中要配置角色的用户");
            }
        }, batchUpdatePassword:function () {
            if ($("#checkBoxPlugin").hasSelect()) {
                stk.confirm("确认批量重置密码吗？", function () {
                    $("#checkBoxPlugin").stk_call({type:'updatepassword'}, function (result) {
                        if (result != "")
                            stk.alert(result);
                        $("#userTable").stk_query();
                    });
                });
            }
            else {
                stk.alert("请选中要批量重置密码的用户");
            }
        }, batchLockUser:function () {
            if ($("#checkBoxPlugin").hasSelect()) {
                stk.confirm("确认批量锁定用户吗？", function () {
                    $("#checkBoxPlugin").stk_call({type:'batchlockuser'}, function (result) {
                        if (result != "")
                            stk.alert(result);
                        $("#userTable").stk_query();
                    });
                });
            }
            else {
                stk.alert("请选中要配置锁定的用户");
            }
        }, batchUpdateInservice:function () {
            if ($("#checkBoxPlugin").hasSelect()) {
                stk.confirm("确认批量离职吗？", function () {
                    $("#checkBoxPlugin").stk_call({type:'updateinservice'}, function (result) {
                        if (result != "")
                            stk.alert(result);
                        $("#userTable").stk_query();
                    });
                });
            }
            else {
                stk.alert("请选中要配置离职的用户");
            }
        }, batchdeleteUers:function () {
            if ($("#checkBoxPlugin").hasSelect()) {
                stk.confirm("确认要删除用户吗？", function () {
                    $("#checkBoxPlugin").stk_call({type:'deleteusers'}, function (result) {
                        if (result != "")
                            stk.alert(result);
                        $("#userTable").stk_query();
                    });
                });
            }
            else {
                stk.alert("请选中要删除的用户");
            }
        }, postConfig:function () {
            if ($("#checkBoxPlugin").hasSelect()) {
                $("#checkBoxPlugin").stk_call({type:'0'}, function (result) {
                    $("#postdiv").stk_text("");
                    $("#postEmpId").stk_val(0);
                    showframe('user', 'postdiv', 'posthidden', 'wwww', result);
                    $("#postConfigWindow").stk_show({title:'岗位配置'});
                });
            }
            else {
                stk.alert("请选中要配置岗位的用户");
            }
        },
        teamConfig:function () {
            if ($("#checkBoxPlugin").hasSelect()) {
                $("#checkBoxPlugin").stk_call({type:'0'}, function (result) {
                    $("#teamdiv").stk_text("");
                    $("#teamid").stk_val(0);
                    showframe('user', 'teamdiv', 'usershidden', 'wwww', result);
                    $("#teamConfigWindow").stk_show({title:'小组配置'});
                });
            }
            else {
                stk.alert("请选中要配置小组的用户");
            }
        },
        SynchronousUsers:function () {
            $("#synchronoustype").stk_val("synchronous");
            $("#userForm").stk_submit("SynchronousUsers", function (result) {
                stk.alert(result);
            });
        },
        FailureUsers:function () {
            var failures = "";
            $("#userForm").stk_submit("FailureUsers", function (result) {
                if (result != "") {
                    failures = result;
                    $("#failures").stk_text(failures);
                    $("#failureUsersWindow").stk_show({title:'失败用户'});
                } else {
                    stk.alert("无失败用户");
                }
            });
        },
        saveFailureUsers:function () {
            $("#synchronoustype").stk_val("failure");
            $("#userForm").stk_submit("SynchronousUsers", function (result) {
                stk.alert(result);
                $("#failureUsersWindow").stk_hide();
            });
        },
        showUpdateWindow:function (data) {
            var contextPath = sirm.org.contextPath;
//            window.location = sirm.jsurl("/org/adduser.jsp?type=1&orgid=" + data.orgid);
            sirm.openTab(contextPath+"/org/adduser.jsp?type=1&orgid=" + data.orgid, "修改用户信息", {keyWithoutParams: true}, function () {
                $("#userTable").stk_query();
            });
        },
        showPassWindow:function (data) {
            $("#updateuserid").stk_val(data.userid);
            $("#userForm").stk_submit(function (result) {
                stk.alert(result);
                $("#userTable").stk_query();
            });
        },
        unlockUser:function (data) {
            $("#updateuserid").stk_val(data.userid);
            $("#userForm").stk_submit("unlockUser", function (result) {
                stk.alert(result);
                $("#userTable").stk_query();
            });
        },
        showInfoWindow:function (data) {
            var contextPath = sirm.org.contextPath;
            $(document).stk_go(sirm.jsurl('/org/viewuser.jsp?orgid=' + data.orgid), '员工详细信息');

//            window.location = contextPath + "/org/viewuser.jsp?orgid=" + data.orgid;
//            $("#labcname").stk_text(data.displayname);
//            $("#labusername").stk_text(data.username);
//            $("#labsex").stk_text(data.sex == "1" ? "男" : data.sex == "2" ? "女" : "");
//            $("#labemail").stk_text(data.email);
//            $("#labtel").stk_text(data.tel);
//            $("#labjob").stk_text(data.job);
//            $("#labmobilephone").stk_text(data.mobilephone);
//            $("#labinservice").stk_text(data.inservice == "1" ? "在职" : "离职");
//            $("#orgid").stk_val(data.orgid);
//            $("#infoTeamDiv").stk_text(data.teamname);
//            $("#infoPostDiv").stk_text(data.positionname);
//            $("#infoRoleDiv").stk_text(data.rolename);
//            $("#InfoForm").stk_submit(function(result) {
//                if (result != "") {
//                    var data = jQuery.parseJSON(result);
//                    if (data.qualifys != "") {
//                        var qualifys = data.qualifys.split(",");
//                        for (var j = 0; j < qualifys.length; j++) {
//                            var info = qualifys[j].split(":");
//                            sirm.org.addQualify(info[1], info[2], info[3]);
//                        }
//                    } else {
//                        $("#qualifyTable").stk_html("<tr><th class=\"stk-table-th alignL\">资格证书类型</th><th class=\"stk-table-th alignL\">资格证书编号</th><th class=\"stk-table-th alignL\">有效期</th></tr>");
//                    }
//                }
//            });
//            $("#showInfoWindow").stk_show({title:'用户信息'});
        },
        /**
         * 根据所选角色生成图标
         * @param val  角色编号
         * @param text 角色名称
         */
        _createDiv:function (text, divId) {
            var str = "<span  class=\"t-sl\">" + text + "</span>";
            $("#" + divId).append(str);
        },

        /**
         * 添加资格证书
         */
//        addQualify:function(qualifytype, qualifyno, endtime) {
//            var type = qualifytype == "1" ? "一般证券业务" : "投资咨询业务";
//            var qualifyval = qualifytype + ":" + qualifyno + ":" + endtime;
//            $("#qualifyTable").append("<tr><td class=\"stk-table-td alignL\">" + type + "</td><td class=\"stk-table-td alignL\">" + qualifyno + "</td><td class=\"stk-table-td alignL\">" + endtime + "</td></tr>");
//        },

        checkpostId:function () {
            if ($("#postEmpId").stk_val() == 0) {
                return "请输入设置岗位";
            } else {
                return true;
            }
        }
    });
});
