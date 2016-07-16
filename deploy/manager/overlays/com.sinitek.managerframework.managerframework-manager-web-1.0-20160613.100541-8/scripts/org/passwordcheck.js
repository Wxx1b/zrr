$(function () {
    sirm.define('sirm.org', {
        checkfytype: function () {
            if ($("#qualifytype").stk_val() != 0 && $("#qualifyno").stk_val() == '') {
                return "请输入从业资格编号";
            } else {
                return true;
            }
        },

        checkpw: function () {
            if ($("#password").stk_val() != $("#passwordTwo").stk_val()) {
                return "两次密码输入不一致";
            } else {
                return true;
            }
        },
        updatepw: function () {
            if ($("#updateNewPassword").stk_val() != $("#updatePasswordTwo").stk_val()) {
                return "两次密码输入不一致";
            } else {
                return true;
            }
        },
        /**
         * ����ʸ�֤��
         */
        addQualify: function (qualifytype, qualifyno, endtime) {
            var type = qualifytype == "1" ? "一般证券业务" : "投资咨询业务";
            var qualifyval = qualifytype + ":" + qualifyno + ":" + endtime;
            $("#qualifyTable").append("<tr><td class=\"stk-table-td alignL\">" + type + "</td><td class=\"stk-table-td alignL\">" + qualifyno + "</td><td class=\"stk-table-td alignL\">" + endtime + "</td></tr>");
        }
    });
});

$(document).ready(function () {
    if (undefined == showwarning || null == showwarning || '' == showwarning) {
        stk.call({
            className: 'com.sinitek.managerframework.org.action.UserPasswordCheckAction',
            method: 'outeOfDateCheck',
            callBack: function (result) {
                if (result == "OK") {
                    stk.call({
                        className: 'com.sinitek.managerframework.org.action.UserPasswordCheckAction',
                        method: 'logononCheck',
                        callBack: function (data) {
                            if (data == "OK") {
                                stk.call({
                                    className: 'com.sinitek.managerframework.org.action.UserPasswordCheckAction',
                                    method: 'passwordCheck',
                                    callBack: function (resultinfo) {
                                        if (resultinfo == "ERROR") {
                                            $("#passSecurityWindowclose2").stk_hide();
                                            $("#passSecurityWindowclose1").stk_show();
                                            updatePassWord();
                                            $("#passwordwindowtype").stk_val(1);
                                            $("#alertinfo").html("你的密码已失效，请重新设置密码！");
                                        }
                                    }
                                });
                            } else {
                                var param = data.split(",");
                                if (param[0] == '0' && param.length > 1) {
                                    $("#passSecurityWindowclose1").stk_hide();
                                    $("#passSecurityWindowclose2").stk_show();
                                    $("#passUpdateWindow").stk_show({title: '提醒'});
                                    $("#warncontent").html(param[1]);
                                    $("#passwordwindowtype").stk_val(0);
                                    if (param[1] == '您的密码是默认密码') {
                                        $("#alertinfo").text("您的密码是默认密码，建议修改密码。");
                                    }
                                    if (param[1] == '您的密码已被重置') {
                                        $("#alertinfo").text("您的密码已被重置，必须先修改密码才能正常使用本系统。");
                                    }
                                }
                                if (param[0] == '1' && param.length > 1) {
                                    $("#passSecurityWindowclose2").stk_hide();
                                    $("#passSecurityWindowclose1").stk_show();
                                    updatePassWord();
                                    $("#alertinfo").html(param[1]);
                                    $("#passwordwindowtype").stk_val(1);
                                }
                            }
                        }
                    });
                } else if (result == "OUT") {
                    $("#passSecurityWindowclose2").stk_hide();
                    $("#passSecurityWindowclose1").stk_show();
                    updatePassWord();
                    $("#passwordwindowtype").stk_val(1);
                    $("#alertinfo").html("你的密码已失效，请重新设置密码！");
                } else {
                    $("#passSecurityWindowclose1").stk_hide();
                    $("#passSecurityWindowclose2").stk_show();
                    $("#passUpdateWindow").stk_show({title: '提醒'});
                    $("#warncontent").stk_text(result);
                    $("#passwordwindowtype").stk_val(0);
                    $("#alertinfo").html("你的密码即将失效，请重新设置密码！");
                }
            }
        });


    }
});
function updatePassWord(content) {
    $("#passSecurityWindow").stk_show({title: '修改密码', 'closeOnEscape': false});
    if ("" != content && null != content) {
        $("#alertinfo").html(content);
    }
}
