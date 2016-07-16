$(function() {
    sirm.define('sirm.org', {
        checkfytype:function() {
            if ($("#qualifytype").stk_val() != 0 && $("#qualifyno").stk_val() == '') {
                return "请输入从业资格编号";
            } else {
                return true;
            }
        },

        checkpw:function() {
            if ($("#password").stk_val() != $("#passwordTwo").stk_val()) {
                return "两次密码输入不一致";
            } else {
                return true;
            }
        },
        updatepw:function() {
            if ($("#updateNewPassword").stk_val() != $("#updatePasswordTwo").stk_val()) {
                return "两次密码输入不一致";
            } else {
                return true;
            }
        },
        /**
         * ����ʸ�֤��
         */
        addQualify:function(qualifytype, qualifyno, endtime) {
            var type = qualifytype == "1" ? "一般证券业务" : "投资咨询业务";
            var qualifyval = qualifytype + ":" + qualifyno + ":" + endtime;
            $("#qualifyTable").append("<tr><td class=\"stk-table-td alignL\">" + type + "</td><td class=\"stk-table-td alignL\">" + qualifyno + "</td><td class=\"stk-table-td alignL\">" + endtime + "</td></tr>");
        }
    });

    $(document).ready(function() {
        $("#type").stk_val("0");
        $("#employeeForm").stk_submit(function(emp) {
            if (emp != null) {
                var data = jQuery.parseJSON(emp);
                $("#employeeForm").stk_reset();
                $("#empName").html(data.displayname.replace("(离职)", ""));
                $("#username").html(data.username);
                if (data.sex == "1" || data.sex == "2")
                    $("#sex").stk_val(data.sex);
                $("#email").html(data.email);
                $("#tel").stk_val(data.tel);
                $("#job").stk_val(data.job);
                $("#mobilephone").stk_val(data.mobilephone);
                $("#inservice").stk_text(data.inservice== "1" ? "在职" : "离职");
                if(data.inservice == '0'){
                    $("#lzrq").stk_text(data.lzrq);
                }
                $("#rzrq").stk_text(data.rzrq);
                $("#tel2").stk_val(data.tel2);
                $("#familytelephone").stk_val(data.familytelephone);
                $("#mobilephone2").stk_val(data.mobilephone2);
                $("#familytelephone2").stk_val(data.familytelephone2);
                $("#otherphone").stk_val(data.otherphone);
                $("#otherphone2").stk_val(data.otherphone2);
                $("#bp").stk_val(data.bp);
                $("#office").stk_val(data.office);
                $("#fax").stk_val(data.fax);
                $("#fax2").stk_val(data.fax2);
                $("#familyfax").stk_val(data.familyfax);
                $("#familyfax2").stk_val(data.familyfax2);
                $("#companyaddress").stk_val(data.companyaddress);
                $("#familyaddress").stk_val(data.familyaddress);
                $("#companyzip").stk_val(data.companyzip);
                $("#familyzip").stk_val(data.familyzip);
                $("#otheraddress").stk_val(data.otheraddress);
                $("#otherzip").stk_val(data.otherzip);
                $("#email1").stk_val(data.email1);
                $("#email2").stk_val(data.email2);
                $("#homepage").stk_val(data.homepage);
                $("#qq").stk_val(data.qq);
                $("#msn").stk_val(data.msn);
                $("#where").stk_val(data.where1);
                $("#addressbook").stk_val(data.addressbook);
                $("#introduction").stk_val(data.introduction);
                $("#namepy").stk_val(data.namepy);
//                $("#empName").stk_val(data.displayname);
//                if (data.sex == "1" || data.sex == "2")
//                    $("#sex").stk_val(data.sex);
//                $("#email").stk_val(data.email);
//                $("#tel").stk_val(data.tel);
//                $("#mobilephone").stk_val(data.mobilephone);
//                $("#job").stk_val(data.job);
//                $("#inservice").stk_val(data.inservice);
//                if (data.qualifys != "") {
//                    var qualifys = data.qualifys.split(",");
//                    for (var j = 0; j < qualifys.length; j++) {
//                        var info = qualifys[j].split(":");
//                        sirm.org.addQualify(info[1], info[2], info[3]);
//                    }
//                }
                if (data.userupdatepw == "true") {
                    $("#passwordBtn").stk_show();
                }
                else {
                    $("#passwordBtn").stk_hide();
                }
            }
        });
    });
});