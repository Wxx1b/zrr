$(function () {
    sirm.define('sirm.org', {
        showAddWindow:function () {
            $("#employeeForm").stk_reset();
            show('user', 'users', 'usershidden', 'wwww', 'true');
        },
        callbackfunction:function () {
            $("#employeeForm").stk_submit(function (result) {
                $("#employeeTable").stk_query();
            });
        },
        remove:function () {
            if ($("#checkBoxPlugin").hasSelect()) {
                var param = sirm.org.param;
                stk.confirm("确认删除吗？", function () {
                    $("#checkBoxPlugin").stk_call({postpid:param.postid}, function (result) {
                        $("#employeeTable").stk_query();
                    });
                });
            }
            else {
                stk.alert("请选中要删除的数据");
            }
        },
        showEmpMoveWindow:function(data){
            var param = sirm.org.param;
            $("#moveemployeeform").stk_reset();
            $("#orgid").stk_val(data.orgid);
            $("#empname").stk_text(data.displayname);
            stk.call({
                className:'com.sinitek.managerframework.org.action.OrgStructureAction',
                method:'loadOrgSelectData',
                param: {},
                callBack: function (result) {
                    if(result != ""){
                        $("#empselect").html(result);
                    }
                }
            });
            stk.call({
                className:'com.sinitek.managerframework.org.action.UserTableAction',
                method:'getEmpSuperInfo',
                param: {'parentid':param.postid},
                callBack: function (result) {
                    if(result != ""){
                       $("#parentpositionname").stk_text(result);
                    }
                }
            });
            $("#moveemployeeWindow").stk_show({title:'员工移动'})
        },
        showInfoWindow:function (data) {
            $("#labcname").stk_text(data.displayname);
            $("#labusername").stk_text(data.username);
            $("#labsex").stk_text(data.sex == "1" ? "男" : data.sex == "2" ? "女" : "");
            $("#labemail").stk_text(data.email);
            $("#labtel").stk_text(data.tel);
            $("#labjob").stk_text(data.job);
            $("#labmobilephone").stk_text(data.mobilephone);
            $("#labinservice").stk_text(data.inservice == "1" ? "在职" : "离职");
            $("#showInfoWindow").stk_show({title:'用户信息'});
        },
        //显示排序窗口
        showEmpSortWindow: function () {
            var empdata = $("#employeeTable").stk_info().data;
            var size = empdata.length;
            var empids = [size], emps = {};
            for (var i = 0; i < size; i++) {
                var empid = empdata[i].orgid;
                var empname = empdata[i].displayname;
                emps[empid] = empname;
                empids[i] = empid;
            }
            $("#empSort").stk_init(emps, empids);
            $("#empSortWindow").stk_show({title: '排序'});
            $(".stk-p-2").hide();
            $(".stk-p-1").hide();
        },
        //保存员工排序
        saveEmpSort: function () {
            var param = sirm.org.param;
            $("#empSortForm").stk_submit(function (result) {
                if (result != "") {
                    stk.alert(result);
                } else {
                    $("#empSortWindow").stk_hide();
                    $("#employeeTable").stk_query();
                    freshOrgTree();
                }
                $("#employeeTable").stk_query();
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
                {'className':'com.sinitek.managerframework.org.action.PostFormAction',
                    'method':'getCurrentMenu',
                    'param':{orgid:param.postid},
                    'callBack':function (result) {
                        var ctrl = "";
                        var data = jQuery.parseJSON(result);
                        for (var i = 0, size = data.length; i < size; i++) {
                            if (ctrl == "")
//                                ctrl += "<a href=\"" + sirm.jsurl("/org/orgstructure.jsp?orgid=" + data[i].id + "&rootid=" + data[i].id) + "\">" + data[i].name + "</a>";
                                ctrl += "<a href=\"javascript:selectTreeNode('" + data[i].id + "')\">" + data[i].name + "</a>";
                            else {
//                                if (data[i].unitType == 'UNIT')
//                                    ctrl += "&nbsp;>>&nbsp;<a href=\"" + sirm.jsurl("/org/orgstructure.jsp?orgid=" + data[i].id + "&rootid=" + data[i].id) + "\">" + data[i].name + "</a>";
//                                else if (data[i].unitType == 'POSITION')
//                                    ctrl += "&nbsp;>>&nbsp;<a href=\"" + sirm.jsurl("/org/postinfo.jsp?orgid=" + data[i].id + "&postid=" + data[i].id) + "\">" + data[i].name + "</a>";
                                ctrl += "&nbsp;>>&nbsp;<a href=\"javascript:selectTreeNode('" + data[i].id + "')\">" + data[i].name + "</a>";
                            }
                        }
                        $("#currentSpan").stk_html(ctrl);
                    }
                });
            $("#employeeTable").stk_query();
        });
    });
});