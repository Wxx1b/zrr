$(function () {
    sirm.define('sirm.org', {
        showAddWindow:function () {
            $("#users").stk_html("");
            $("#usershidden").stk_val("");
            $("#addUpdateBtn").stk_show();
            $("#teamInfoForm").stk_reset();
            $("#type").stk_val("0");
//            $("#indusryRelationDiv").stk_html("");
            $("#addUpdateWindow").stk_show({title:'添加小组'});

        },
        remove:function () {
            var param = sirm.org.param;
            if ($("#checkBoxPlugin").hasSelect()) {
                stk.confirm("确认删除吗？", function () {
                    $("#checkBoxPlugin").stk_call({teamid:param.teamid}, function (result) {
                        $("#teamInfoTable").stk_query();
//                        frushOrgTree('0');

                        window.parent.reLoadTree();
                        window.parent.selectNode(param.id, '', false);
                    });
                });
            }
            else {
                stk.alert("请选中要删除的数据");
            }
        },
        showUpdateWindow:function (data) {
            $("#users").stk_html("");
            $("#usershidden").stk_val("");
            $("#addUpdateBtn").stk_hide();
            $("#teamInfoForm").stk_reset();
            $("#objid").stk_val(data.objid);
            $("#type").stk_val(1);
            $("#teamname").stk_val(data.teamname);

            $("#researchflag").stk_checked(data.researchflag == "是");
//            if (data.orgs != "")
//                showframe('user', 'users', 'usershidden', 'wwww', data.orgs);
            $("#teamdec").stk_val(data.teamdec);
            $("#addUpdateWindow").stk_show({title:'修改小组'});
//            $("#indusryRelationDiv").stk_html("");
//            $("#teamInfoForm").stk_submit("getIndustry", function (result) {
//                if (result != "") {
//                    for (var i = 0; i < result.split(";").length; i++) {
//                        var data = result.split(";")[i].split(":");
//                        _addqueryIndustryContent(":" + data[0], data[1] + "(" + data[0] + ")");
//                    }
//                }
//            });
            $("#teamInfoForm").stk_validateForm();
        },

        postlocation:function (link) {
//            window.location.href = sirm.jsurl("/org/teamemps.jsp?teamid=" + link.objid);
            window.parent.selectNode(link.objid, '', true);

        },
        showTeamSortWindow:function () {
            var postdata = $("#teamInfoTable").stk_info().data;
            var size = postdata.length;
            var postids = [size], posts = {};
            for (var i = 0; i < size; i++) {
                var postid = postdata[i].objid;
                var postname = postdata[i].teamname;
                posts[postid] = postname;
                postids[i] = postid;
            }
            $("#teamSort").stk_init(posts, postids);
            $("#teamSortWindow").stk_show({title:'排序'});
            $(".stk-p-2").hide();
            $(".stk-p-1").hide();
        },
        saveTeamSort:function () {
            var param = sirm.org.param;
            $("#teamSortForm").stk_submit(function (result) {
                if (result != "") {
                    stk.alert(result);
                } else {
                    $("#teamSortWindow").stk_hide();
                    $("#teamInfoTable").stk_query();
//                    frushOrgTree('0');

                    window.parent.reLoadTree();
                    window.parent.selectNode(param.id, '', false);
                }
            });
        }
    });
    $(document).ready(function () {
        $("#teamInfoTable").stk_query();
        $("#teamdec").stk_checkInputContent(150);
    });
});