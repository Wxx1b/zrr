(function () {
    sirm.define('sirm.org.searchorg.CandidateControl', function (param) {
        var _candidateControl = this;
        /**
         * 自动完成下拉框触发的方法
         */
        this.searchUserFun = function (data) {
            //组织结构类型
            var orgData = data.orgData;
            var orgType = 8;
            if(orgData != null){
                orgType = orgData.orgtype;
            }
            orgType = StringUtils.isBlank(orgType) ? 8 : orgType;
            var searchUser = $("#_" + param.prefix + "_searchUser");
            var str = $(searchUser).stk_val() + ":" + $(searchUser).stk_text() + ":" + orgType;
            var result = "";
            if (param.multi == "" || param.multi == "false") {
                $("#_" + param.prefix + "_candidateHidden").stk_val(str);
            } else {
                if (param.hiddenId != "" && param.hiddenId.length > 0) {
                    _candidateControl._searchUser_addSpan("_" + param.prefix + "_candidateControlDiv", param.hiddenId, str);
                } else {
                    _candidateControl._searchUser_addSpan("_" + param.prefix + "_candidateControlDiv", "_" + param.prefix + "_candidateHidden", str);
                }
                $("#_" + param.prefix + "_searchUser").stk_val("");
                $("#_" + param.prefix + "_searchUser").stk_text("");
                $("#_" + param.prefix + "_searchUser").stk_attr("emptyText", "请输入拼音");
            }
            if (param.hiddenId != "" && param.hiddenId.length > 0) {
                if (param.multi == "" || param.multi == "false") {
                    $("#" + param.hiddenId).stk_val(str);
                } else {
                    var hiddenval = $("#" + param.hiddenId).stk_val();
//                var strval = $("#_" + param.prefix + "_candidateHidden").stk_val();
                    if (hiddenval.indexOf(str) < 0) {
                        if (hiddenval != undefined && hiddenval != "") {
                            hiddenval += "," + str;
                        } else {
                            hiddenval += str;
                        }
                        $("#" + param.hiddenId).stk_val(hiddenval);
                    }
                }
            }
            if (param.callbackfn != "") {
                window[param.callbackfn](_candidateControl._user_getValue());
            }
        };

        this.closeBtnClick = function () {
            $("#_" + param.prefix + "_window").stk_hide();
            if (param.hiddenId != "" && param.hiddenId.length > 0)
                $("#_" + param.prefix + "_candidateHidden").stk_val("");
//            alert(_candidateControl._user_getValue());
            if (param.callbackfn != "") {
                window[param.callbackfn](_candidateControl._user_getValue());
            }
        };
        /**
         * 增加相应内容到相应层中    自动完成控件
         * @param divname  层名称
         * @param tohidden  最终保存值得隐藏域名称
         * @param fromhidden  将要保存的值
         */
        this._searchUser_addSpan = function (divname, tohidden, fromhidden) {
            if (fromhidden != "" && fromhidden.length > 0) {
                var result = $("#" + tohidden); //保存最终值得变量
//                if ((result == undefined || $(result).stk_val() == "") && param.hiddenId != "" && param.hiddenId.length > 0) {  如果使用这个语句，将导致弹出框中的组织结构无法选中
                if (result == undefined && param.hiddenId != "" && param.hiddenId.length > 0) {
                    result = $("#" + param.hiddenId); //保存最终值得变量
                }
                var resultval = $(result).stk_val(); //获取隐藏域值
                var item = fromhidden.split(":");
                if (_candidateControl._user_repeatIndusty(item[0], resultval)) {
                    var div = $("#" + divname);
                    $(div).attr("class", "phone-result-table");
                    if (resultval != '') {
                        resultval += ',' + fromhidden;
                    } else {
                        resultval += fromhidden;
                    }
                    result.stk_val(resultval);
//                    var id = divname + "" + new Date().getTime();
                    var id = divname + "" + item[0];
                    var close = "";
                    if (param.readOnlyStr == "" || param.readOnlyStr == "false")
                        close = "<b class=\"stk-button-icon ui-icon-close\" id=\"close" + item[0] + "\"  onclick=\"sirm.org.searchorg." + param.prefix + "CandidateControl._user_removeContent('" + id + "','" + item[0] + "','" + tohidden + "')\" ></b>";
                    var str = "<span  id=\"" + id + "\" class=\"t-sl\">" + item[1] + close + "</span>";
                    div.append(str);
                } else {
                    $("#close" + item[0]).click();
                }
            }
        };

        this._selecteduser_addSpan = function (divname, tohidden, fromhidden) {
            if (fromhidden != "" && fromhidden.length > 0) {
                var result = $("#" + tohidden); //保存最终值得变量
//                if ((result == undefined || $(result).stk_val() == "") && param.hiddenId != "" && param.hiddenId.length > 0) {  如果使用这个语句，将导致弹出框中的组织结构无法选中
                if (result == undefined && param.hiddenId != "" && param.hiddenId.length > 0) {
                    result = $("#" + param.hiddenId); //保存最终值得变量
                }
                var resultval = $(result).stk_val(); //获取隐藏域值
                var item = fromhidden.split(":");
                if (_candidateControl._user_repeatIndusty(item[0], resultval)) {
                    var div = $("#" + divname);
                    $(div).attr("class", "phone-result-table");
                    if (resultval != '') {
                        resultval += ',' + fromhidden;
                    } else {
                        resultval += fromhidden;
                    }
                    result.stk_val(resultval);
//                    var id = divname + "" + new Date().getTime();
                    var id = divname + "" + item[0];
                    var close = "";
                    if (param.readOnlyStr == "" || param.readOnlyStr == "false")
                        close = "<b class=\"stk-button-icon ui-icon-close\" id=\"close" + item[0] + "\"  onclick=\"sirm.org.searchorg." + param.prefix + "CandidateControl._user_removeContent('" + id + "','" + item[0] + "','" + tohidden + "')\" ></b>";
                    var str = "<span  id=\"" + id + "\" class=\"t-sl\">" + item[1] + close + "</span>";
                    div.append(str);
                }
            }
        };

        //打开输入框后选人控件弹出框
        this.openWindow = function (contextpath) {
            //获取部门值
            var deptid = "";
            if (null != param.deptid && "" != param.deptid && undefined != param.deptid) {
                var a = "sirm.org.searchorg."+param.deptid+"CandidateControl._user_getValue()";
                deptid = eval(a);
            }
            //获取小组值
            var teamid = "";
            if (null != param.teamid && "" != param.teamid && undefined != param.teamid) {
                var b = "sirm.org.searchorg."+param.teamid+"CandidateControl._user_getValue()";
                teamid = eval(b);
            }
            //获取岗位值
            var positionid = "";
            if (null != param.positionid && "" != param.positionid && undefined != param.positionid){
                var c = "sirm.org.searchorg."+param.positionid+"CandidateControl._user_getValue()";
                positionid = eval(c);
            }
            $("#_" + param.prefix + "_check_hidden").stk_val("");
            var str = contextpath + "/org/searchorg/candidateiframe.jsp?prefix=" + param.prefix + "&multi="
                + param.multi + "&mode=" + param.mode + "&code=" + param.code + "&readOnly=" + param.readOnlyStr
                + "&hiddenId=" + param.hiddenId + "&callbackfn=" + param.callbackfn + "&path=" + param.path + "&unitlimitflag=" + param.unitlimitflag + "&showposition=" + param.showposition
                + "&deptid=" + deptid + "&teamid=" + teamid + "&positionid=" + positionid;
            $("#_" + param.prefix + "_iframe")[0].src = str;
            $("#_" + param.prefix + "_window").stk_show({title: '请选择'});
        };
        //关闭选人控件框
        this.closeWindow = function (tf) {
            //清空hidden中的值及选中内容层中的内容
            $("#_" + param.prefix + "_checkall").stk_val("");        //选中汇总中值
            $("#_" + param.prefix + "_check_hidden").stk_val("");   //选中值
            $("#_" + param.prefix + "_queryuserName").stk_val(""); //查询条件
            $("#_" + param.prefix + "_checkorgs_div").stk_html(""); //已选层中的内容--部门
            $("#_" + param.prefix + "_checkposts_div").stk_html(""); //已选层中的内容--岗位
            $("#_" + param.prefix + "_checkteams_div").stk_html(""); //已选层中的内容--小组
            $("#_" + param.prefix + "_checkroles_div").stk_html(""); //已选层中的内容--角色
            if (tf)
                window.parent.document.getElementById("_" + param.prefix + "_submitbtn").click();
            else
                window.parent.document.getElementById("_" + param.prefix + "_closebtn").click();
        };
        //弹出框中点击确定
        this.submitForm = function () {
            //判断是否选中人员
            if ($("#_" + param.prefix + "_checkBoxPlugin").hasSelect() || $("#_" + param.prefix + "_radioboxPlugin").hasSelect() || ((param.mode == 'DEPT' || param.mode == 'TEAM') && param.multi == "false")) {
                var checkall = $("#_" + param.prefix + "_checkall").stk_val();
                //如果单选为空则为多选
                if (param.multi == "" || param.multi == "false") {
                    if (param.mode == 'DEPT' || param.mode == 'TEAM') {
                        var flag = _candidateControl.getItem(checkall);
                        if (flag) {
                            _candidateControl.closeWindow(true);
                        }
                    } else {
                        if(param.mode == 'org' || param.mode == 'ORG'){
                            $("#_" + param.prefix + "_checkall").stk_val(checkall);
                            var flag = _candidateControl.getItem(checkall);
                            if (flag) {
                                _candidateControl.closeWindow(true);
                            }
                        }else{
                            $("#_" + param.prefix + "_radioboxPlugin").stk_call({type: '0'}, function (result) {
                                $("#_" + param.prefix + "_checkall").stk_val(checkall);
                                var flag = _candidateControl.getItem(result);
                                if (flag) {
                                    _candidateControl.closeWindow(true);
                                }
                            });
                        }

                    }
                } else {
                    $("#_" + param.prefix + "_checkBoxPlugin").stk_call({type: '0'}, function (result) {
                        $("#_" + param.prefix + "_checkall").stk_val(checkall);
                        var flag = _candidateControl.getItem(result);
                        if (flag) {
                            _candidateControl.closeWindow(true);
                        }

                    });
                }
            } else {
                var flag = _candidateControl.getItem("");
                if (flag) {
                    _candidateControl.closeWindow(true);
                }
            }
            if (param.multi != "" && param.multi == "true") {
                $(window.parent.document).find("#_" + param.prefix + "_searchUser").stk_val("");
                $(window.parent.document).find("#_" + param.prefix + "_searchUser").stk_attr("emptyText", "请输入拼音");
            }
            //关闭弹出框
//            _candidateControl.closeWindow(true);
        };

        this.getItem = function (usersid) {
            //保存部门、岗位、小组、角色项
            var checkall = $("#_" + param.prefix + "_checkall").stk_val();//$("#_" + param.prefix + "_checkall").stk_val();
            //判断是否调用回调函数和是否关闭弹出窗口
            var tf = false;
            //判断如果为单选的话，则直接把值赋在自动完成框中，否则则以层中增加span显示
            if (param.multi == "" || param.multi == "false") {
                if (usersid == "") {
                    parent.stk.alert("未选择添加项");
                } else {
                    var searchuser = $(window.parent.document).find("#_" + param.prefix + "_searchUser");//$("#_" + param.prefix + "_searchUser");
                    var useritem = usersid.split(":");
                    $(searchuser).stk_val(useritem[1]);  //给自动完成框赋值
                    $(window.parent.document).find("#_" + param.prefix + "_searchUser_keyId").val(useritem[1]);
                    $(window.parent.document).find("#_" + param.prefix + "_candidateHidden").stk_val(usersid);//$("#_" + param.prefix + "_candidateHidden").stk_val(usersid);
                    tf = true;
                }
            } else {
                if ((param.multi == "false" && param.mode == "DEPT") || (param.multi == "false" && param.mode == "TEAM")) {
                    $(window.parent.document).find("#_" + param.prefix + "_candidateControlDiv").stk_empty();
                    $(window.parent.document).find("#_" + param.prefix + "_candidateHidden").stk_val("");
                }

                if (checkall != "" || usersid != "") {
                    //如果所选项不为空则所选项加上选人所选的值，否则则为选人所选的值
                    if (checkall != undefined && checkall != "")
                        checkall += "," + usersid;
                    else
                        checkall = usersid;
                    var checkitem = checkall.split(",");
//                    $("#_" + param.prefix + "_candidateHidden").stk_val();
                    for (var i = 0; i < checkitem.length; i++) {
                        _candidateControl._user_addSpan("_" + param.prefix + "_candidateControlDiv", "_" + param.prefix + "_candidateHidden", checkitem[i]);
                    }
//                    alert(checkall);
                    tf = true;
                } else {
//                    stk.alert("请选择要增加的选项");
                    return true;
                }
            }
            //判断隐藏域中是否有值，如果有则追加值
            if (param.hiddenId != "" && param.hiddenId.length > 0) {
                var hiddenval = $(window.parent.document).find("#" + param.hiddenId);
                var candidateval = $(window.parent.document).find("#_" + param.prefix + "_candidateHidden"); //保存最终值得变量
                if (candidateval[0] == undefined) {
                    candidateval = $("#_" + param.prefix + "_candidateHidden");
                }
                if (hiddenval[0] == undefined) {
                    hiddenval = $("#" + param.hiddenId);
                }
                if (param.multi == "" || param.multi == "false") {
                    hiddenval.stk_val(candidateval.stk_val());
                } else {
                    var hiddentext = $(hiddenval).stk_val();
                    var candidatevalitems = candidateval.stk_val().split(",");
                    for (var i = 0; i < candidatevalitems.length; i++) {
                        if (hiddentext.indexOf(candidatevalitems[i]) < 0) {
                            hiddentext += ((hiddentext.length > 0 ? "," : "") + candidatevalitems[i]);
                        }
                    }
                    hiddenval.stk_val(hiddentext);
                }
            }

            return tf;
        };
        /**
         * 点击左边组织结构树触发的事件
         * @param nodeStr 选中项的内容  id:name:type
         */
        this.functionName = function (nodeStr) {
            $("#_" + param.prefix + "_check_hidden").stk_val(nodeStr);
            $("#_" + param.prefix + "_userstable").stk_query();
        };

        /**
         * 点击添加，添加到相应的panel里
         * @param tostr 层名称
         * @param type  类型
         */
        this._users_spellSecurityCheck = function (tostr, type) {
            var formtext = $("#_" + param.prefix + "_check_hidden");
            if (formtext.stk_val() != '') {
                var baseScode = formtext.stk_val().split(":");
                if (baseScode[0] == "00000" || baseScode[2] != type) {
                    parent.stk.alert("未选择添加项");
                } else {
                    _candidateControl._searchUser_addSpan(tostr, "_" + param.prefix + "_checkall", formtext.stk_val());
                }
            } else {
                parent.stk.alert("未选择添加项");
            }
        };

        this._emps_spellSecurityCheck = function (tostr, type) {
            var formtext = $("#_" + param.prefix + "_checkuser_hidden");
            if (formtext.stk_val() != '') {
                var baseScode = formtext.stk_val().split(":");
                if (baseScode[0] == "00000" || baseScode[2] != type) {
                    parent.stk.alert("未选择添加项");
                } else {
                    _candidateControl._searchUser_addSpan(tostr, "_" + param.prefix + "_checkall", formtext.stk_val());
                }
            } else {
                parent.stk.alert("未选择添加项");
            }
        };

        this._emps_spellSecurityCheckonlyadd = function (tostr, type) {
            var formtext = $("#_" + param.prefix + "_checkuser_hidden");
            if (formtext.stk_val() != '') {
                var baseScode = formtext.stk_val().split(":");
                if (baseScode[0] == "00000" || baseScode[2] != type) {
                    parent.stk.alert("未选择添加项");
                } else {
                    _candidateControl._selecteduser_addSpan(tostr, "_" + param.prefix + "_checkall", formtext.stk_val());
                }
            } else {
                parent.stk.alert("未选择添加项");
            }
        };

        /**
         * 增加相应内容到相应层中
         * @param divname  层名称
         * @param tohidden  最终保存值得隐藏域名称
         * @param fromhidden  将要保存的值
         */
        this._user_addSpan = function (divname, tohidden, fromhidden) {
            if (fromhidden != "" && fromhidden.length > 0) {
                var result = $(window.parent.document).find("#" + tohidden);
//                alert(result);
                if (result[0] == undefined)
                    result = $("#" + tohidden);
                if ((result == undefined || $(result).stk_val() == "") && param.hiddenId != "" && param.hiddenId.length > 0) {
                    result = $(window.parent.document).find("#" + param.hiddenId); //保存最终值得变量
                }
                if (result[0] == undefined)
                    result = $("#" + param.hiddenId);
//                if (param.hiddenId != "" && param.hiddenId.length > 0) {
//                    result = $(window.parent.document).find("#" + param.hiddenId); //保存最终值得变量
//                    if (result[0] == undefined)
//                        result = $(window.parent.document).find("#" + tohidden);
//                } else {
//                    result = $(window.parent.document).find("#" + tohidden);
//                }
                var resultval = $(result).stk_val(); //获取隐藏域值
                var item = fromhidden.split(":");
                if (_candidateControl._user_repeatIndusty(item[0], resultval)) {
                    var div = $(window.parent.document).find("#" + divname);
                    if (div[0] == undefined)
                        div = $("#" + divname);
                    $(div).attr("class", "phone-result-table");
                    if (resultval != '') {
                        resultval += ',' + fromhidden;
                    } else {
                        resultval += fromhidden;
                    }
                    result.stk_val(resultval);
//                    var id = divname + "" + new Date().getTime();
                    var id = divname + "" + item[0];
                    var close = "";
                    if (param.readOnlyStr == "" || param.readOnlyStr == "false")
                        close = "<b class=\"stk-button-icon ui-icon-close\"  onclick=\"sirm.org.searchorg." + param.prefix + "CandidateControl._user_removeContent('" + id + "','" + item[0] + "','" + tohidden + "')\" ></b>";
                    var str = "<span  id=\"" + id + "\" class=\"t-sl\">" + item[1] + close + "</span>"
                    div.append(str);
                }
            }
        };

        /**
         * 判断该内容是否在某个隐藏域中
         * @param scode
         * @param text_code
         */
        this._user_repeatIndusty = function (scode, text_code) {
            if (text_code != undefined && text_code != "") {
                var text_codeList = text_code.split(",");
                if (text_codeList.length > 0) {
                    for (var i = 0; i < text_codeList.length; i++) {
                        if (text_codeList[i] == '') {
                            continue;
                        }
                        var baseScode = text_codeList[i].split(":");
                        if (baseScode[0] + '' == scode + '') {
                            return false;
                        }
                    }
                }
            }
            return true;
        };

        /**
         *删除panel中所选
         */
        this._user_removeContent = function (id, key, hiddenId) {

            var hidden = $(window.parent.document).find("#" + hiddenId);
            if (hidden[0] == undefined)
                hidden = $("#" + hiddenId);
            if ((hidden == undefined || hidden.stk_val() == "") && param.hiddenId != "" && param.hiddenId.length > 0)  //弹出框中删除内容的时候获取值
                hidden = $(window.parent.document).find("#" + param.hiddenId); //保存最终值得变量
            if (hidden[0] == undefined)
                hidden = $("#" + param.hiddenId);
//                if (hidden[0] == undefined)
//                    hidden = $(window.parent.document).find("#" + hiddenId);
//            else {
//                hidden = $(window.parent.document).find("#" + hiddenId);
//            }
//            var hidden = $("#" + hiddenId);
            var orgids = hidden.stk_val() == null ? "" : hidden.stk_val();
            var text_codeList = orgids.split(",");
            var result = "";
            for (var i = 0; i < text_codeList.length; i++) {
                var text = text_codeList[i];
                var baseScode = text_codeList[i].split(":");
                if (baseScode[0] == key) {
                    continue;
                }
                if (result != "") {
                    result = result + "," + text;
                } else {
                    result = text;
                }
            }
            $("#" + id).remove();
            hidden.stk_val(result);
//            if (param.hiddenId != "" && param.hiddenId.length > 0)
//                $("#" + param.hiddenId).stk_val($("#_" + param.prefix + "_candidateHidden").stk_val());
            $("#_" + param.prefix + "_searchUser").stk_val("");
            $("#_" + param.prefix + "_searchUser").stk_attr("emptyText", "请输入拼音");
            $("#checkbox" + key).stk_checked(false);
            $("input[type='checkbox'][name='check'][value='" + key + "']").stk_checked(false);
            $("input[type='radio'][name='radioBox'][value='" + key + "']").stk_checked(false);
        };


        //对外暴露的方法


        /**
         * 获取值
         */
        this._user_getValue = function () {
            if (param.hiddenId != "" && param.hiddenId.length > 0)
                return  $("#" + param.hiddenId).stk_val();
            else
                return  $("#_" + param.prefix + "_candidateHidden").stk_val();
        };
        /**
         * 修改值
         */
        this._user_updateValue = function (hiddentext) {
            _candidateControl._user_emptyValue();
            if (hiddentext.length > 0) {
                var hidden = "";
                for (var j = 0; j < hiddentext.length; j++) {
                    hidden += hidden == "" ? hiddentext[j] : "," + hiddentext[j];
                }
                stk.call({
                    className: "com.sinitek.managerframework.org.action.CandidateControlAction",
                    method: 'getEmpStr',
                    param: {hiddentext: hidden},
                    async: false,
                    callBack: function (result) {
                        if (result != "") {
                            if (param.multi == "" || param.multi == "false") {
                                if (result.split(",").length > 0) {
                                    var usersid = result.split(",")[0];
                                    var searchuser = $("#_" + param.prefix + "_searchUser");
                                    var useritem = usersid.split(":");
                                    $(searchuser).stk_val(useritem[0]);  //给自动完成框复制
                                    $(searchuser).stk_text(useritem[1]); //自动完成框显示名称复制
                                    $("#_" + param.prefix + "_candidateHidden").stk_val(usersid);
                                    if (param.hiddenId != "" && param.hiddenId.length > 0)
                                        $("#" + param.hiddenId).stk_val(usersid);
                                }
                            } else {
                                if (param.render == "" || param.render == "false")
                                    _candidateControl.getItem(result);
                                else {
                                    $("#_" + param.prefix + "_candidateHidden").stk_val(result);
                                    if (param.hiddenId != "" && param.hiddenId.length > 0)
                                        $("#" + param.hiddenId).stk_val(result);
                                }
                            }
                        }
                    }, exceptionHandler: function (message, e) {
                    }
                });
            }
        };
        /**
         * 清空值
         */
        this._user_emptyValue = function () {
            $("#_" + param.prefix + "_checkall").stk_val("");        //选中汇总中值
            $("#_" + param.prefix + "_check_hidden").stk_val("");   //选中值
            $("#_" + param.prefix + "_queryuserName").stk_val(""); //查询条件
            $("#_" + param.prefix + "_checkorgs_div").stk_html(""); //已选层中的内容--部门
            $("#_" + param.prefix + "_checkposts_div").stk_html(""); //已选层中的内容--岗位
            $("#_" + param.prefix + "_checkteams_div").stk_html(""); //已选层中的内容--小组
            $("#_" + param.prefix + "_checkroles_div").stk_html(""); //已选层中的内容--角色
            $("#_" + param.prefix + "_checkusers_div").stk_html(""); //已选层中的内容--人员
            $("#_" + param.prefix + "_candidateHidden").stk_val("");
            $("#_" + param.prefix + "_searchUser").stk_val("");
            $("#_" + param.prefix + "_searchUser").stk_text("");
            if (param.hiddenId != "")
                $("#" + param.hiddenId).stk_val("");
            $("#_" + param.prefix + "_candidateControlDiv").stk_html("");
        }
    });
})();