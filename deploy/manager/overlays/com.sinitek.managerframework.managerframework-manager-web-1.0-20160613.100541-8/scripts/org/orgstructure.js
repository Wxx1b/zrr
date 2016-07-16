$(function () {
    sirm.define('sirm.org', {
        showPositionMoveWindow:function(data){
            var param = sirm.org.param;
            $("#movepositionform").stk_reset();
            $("#orgid").stk_val(data.objid);
            $("#postname1").stk_text(data.postname);
            stk.call({
                className:'com.sinitek.managerframework.org.action.OrgStructureAction',
                method:'loadOrgSelectData',
                param: {},
                callBack: function (result) {
                    if(result != ""){
                        $("#postselect").html(result);
                    }
                }
            });
            stk.call({
                className:'com.sinitek.managerframework.org.action.PostFormAction',
                method:'getSuperUnitInfo',
                param: {'parentid':param.orgid},
                callBack: function (result) {
                    if(result != ""){
                        $("#parentunitname").stk_text(result);
                    }
                }
            });
            $("#movepositionWindow").stk_show({title:'岗位移动'})
        },
        showDeptMoveWindow:function(data){
            var param = sirm.org.param;
            $("#movedeptform").stk_reset();
            $("#deptid").stk_val(data.objid);
            $("#deptname").stk_text(data.orgname);
            stk.call({
                className:'com.sinitek.managerframework.org.action.OrgStructureAction',
                method:'loadOrgSelectData',
                param: {},
                callBack: function (result) {
                    if(result != ""){
                        $("#deptselect").html(result);
                    }
                }
            });
            stk.call({
                className:'com.sinitek.managerframework.org.action.StructureFormAction',
                method:'getSuperUnitInfo',
                param: {'parentid':param.orgid},
                callBack: function (result) {
                    if(result != ""){
                        $("#parentunitname2").stk_text(result);
                    }
                }
            });
            $("#movedeptWindow").stk_show({title:'部门移动'})
        },
        showUsersAddWindow: function () {
            var param = sirm.org.param;
//            window.location.href = sirm.jsurl("/org/addstructureemp.jsp?orgid=" + param.orgid + "&rootid=" + param.rootid);
            $("#employeeForm").stk_reset();
            $("#users").html("");
            $("#usershidden").stk_val("");
            $("#addemployeeWindow").stk_show();
        },
        removeuser: function () {
            if ($("#usercheckBoxPlugin").hasSelect()) {
                stk.confirm("确认删除吗？", function () {
                    var param = sirm.org.param;
                    $("#usercheckBoxPlugin").stk_call({type: 'orgstructure', positionid: param.rootid}, function (result) {
                        $("#userTable").stk_query();
                    });
                });
            }
            else {
                stk.alert("请选中要删除的数据");
            }
        },
        //////////////////////////////////////////////////////////////////
        showPostSortWindow: function () {
//            postSort
            var postdata = $("#postTable").stk_info().data;
            var size = postdata.length;
            var postids = [size], posts = {};
            for (var i = 0; i < size; i++) {
                var postid = postdata[i].postid;
                var postname = postdata[i].postname;
                posts[postid] = postname;
                postids[i] = postid;
            }
            $("#postSort").stk_init(posts, postids);
            $("#postSortWindow").stk_show({title: '排序'});
            $(".stk-p-2").hide();
            $(".stk-p-1").hide();
        },
        savePostSort: function () {
            var param = sirm.org.param;
            $("#postSortForm").stk_submit(function (result) {
                if (result != "") {
                    stk.alert(result);
                } else {
                    $("#postSortWindow").stk_hide();
                    $("#postTable").stk_query();
                    freshOrgTree();
                }
                $("#postTable").stk_query();
            });
        },
        showAddWindow: function () {
            $("#postForm").stk_reset();
            $("#postpid").stk_val($("#postid").stk_val());
            $("#type").stk_val(0);
            $("#objid").stk_val("");
            $("#postWindow").stk_show({title: '新增'});
        },

        remove: function () {
            var param = sirm.org.param;
            if ($("#checkBoxPlugin").hasSelect()) {
                stk.confirm("确认删除吗？", function () {
                    $("#checkBoxPlugin").stk_call({type: '0'}, function (result) {
                        $("#postTable").stk_query();
                        freshOrgTree();
                    });
                });
            }
            else {
                stk.alert("请选中要删除的数据");
            }
        },
        showUpdateWindow: function (data) {
            $("#postForm").stk_reset();
            $("#updatePostBtn").stk_hide();
            $("#postpid").stk_val($("#postid").stk_val());
            $("#type").stk_val(1);
            $("#objid").stk_val(data.postid);
            $("#postname").stk_val(data.postname);
            $("#postdec").stk_val(data.postdec);
            $("#executeId").stk_val(data.executeId);
            $("#businessId").stk_val(data.businessId);
            $("#postWindow").stk_show({title: '修改'});
        },
        postlocation: function (link) {
//            window.location.href = sirm.jsurl("/org/postinfo.jsp?postid=" + link.postid);
            window.parent.selectNode(link.postid, '', true);
        },
        //////////////////////////////////////////////////////
        showStructureSortWindow: function () {
            var postdata = $("#structureTable").stk_info().data;
            var size = postdata.length;
            var postids = [size], posts = {};
            for (var i = 0; i < size; i++) {
                var postid = postdata[i].objid;
                var postname = postdata[i].orgname;
                posts[postid] = postname;
                postids[i] = postid;
            }
            $("#structureSort").stk_init(posts, postids);
            $("#structureSortWindow").stk_show({title: '排序'});
            $(".stk-p-2").hide();
            $(".stk-p-1").hide();
        },
        saveStructureSort: function () {
            var param = sirm.org.param;
            $("#structureSortForm").stk_submit(function (result) {
                if (result != "") {
                    stk.alert(result);
                } else {
                    $("#structureSortWindow").stk_hide();
                    $("#orgorder").stk_val("");
                    $("#structureTable").stk_query();
                    freshOrgTree();
                }
            });
        },
        updateStructureWindow: function (data) {
            $("#structureForm").stk_reset();
            $("#updateAndAddBtn").stk_hide();
            $("#parentid").stk_val($("#orgparamid").stk_val());
            $("#orgid").stk_val(data.orgid);
            $("#orgname").stk_val(data.orgname);
            $("#orgdec").stk_val(data.orgdec);
            $("#orgtype").stk_val(1);
            $("#structureWindow").stk_show({title: '修改'});
        },
        addStructureWindow: function () {
            $("#structureForm").stk_reset();
            $("#updateAndAddBtn").stk_text("保存并新增");
            $("#parentid").stk_val($("#orgparamid").stk_val());
            $("#orgtype").stk_val(0);
            $("#structureWindow").stk_show({title: '新增'});
        },
        removeStructure: function () {
            if ($("#structurePlugin").hasSelect()) {
                var param = sirm.org.param;
                stk.confirm("确认删除吗？", function () {
                    $("#structurePlugin").stk_call({type: '0'}, function (result) {
                        $("#structureTable").stk_query();
                        freshOrgTree();
                    });
                });
            }
            else {
                stk.alert("请选中要删除的数据");
            }
        },
        structurelocation: function (link) {
            var param = sirm.org.param;
//            window.location.href = sirm.jsurl("/org/orgstructure.jsp?orgid=" + link.orgid + "&rootid=" + param.rootid);
            window.parent.selectNode(link.orgid, '', true);
        },
        checkPost: function (postcheck) {
            var str = $("#" + postcheck).stk_val();
            var postid = $("#objid").stk_val();
            if (str != "0") {
                if (postid != "" && postid == str)
                    return "上级岗位不能选本岗位";
            }
            return true;
        }

    });
    $(function () {
        sirm.use('sirm.org', function (org) {
            var param = org.param;
            stk.call(
                {'className': 'com.sinitek.managerframework.org.action.PostFormAction',
                    'method': 'getCurrentMenu',
                    'param': {orgid: param.orgid},
                    'callBack': function (result) {
                        var ctrl = "";
                        var data = jQuery.parseJSON(result);
                        for (var i = 0, size = data.length; i < size; i++) {
                            if (ctrl == "")
//                                ctrl += "<a href=\"" + sirm.jsurl("/org/orgstructure.jsp?orgid=" + data[i].id) + "\">" + data[i].name + "</a>";
                                ctrl += "<a href=\"javascript:selectTreeNode('" + data[i].id + "')\">" + data[i].name + "</a>";
                            else
//                                ctrl += "&nbsp;>>&nbsp;<a href=\"" + sirm.jsurl("/org/orgstructure.jsp?orgid=" + data[i].id) + "\">" + data[i].name + "</a>";
                                ctrl += "&nbsp;>>&nbsp;<a href=\"javascript:selectTreeNode('" + data[i].id + "')\">" + data[i].name + "</a>";
                        }
                        $("#currentSpan").stk_html(ctrl);
                    }
                });
            $("#postTable").stk_query();
            $("#structureTable").stk_query();
            $("#userTable").stk_query();
        });
    });
})
;