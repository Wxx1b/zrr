(function () {
    sirm.define('sirm.org', {
        /**
         * 添加资格证书
         */
        addQualify:function (qualifytype, qualifyno, endtime) {
            var type = qualifytype == "1" ? "一般证券业务" : "投资咨询业务";
            var qualifyval = qualifytype + ":" + qualifyno + ":" + endtime;
            $("#qualifyTable").append("<tr><td class=\"stk-table-td alignL\">" + type + "</td><td class=\"stk-table-td alignL\">" + qualifyno + "</td><td class=\"stk-table-td alignL\">" + endtime + "</td></tr>");
        },
        closeTab:function () {
            $(document).stk_removeSelf();
        }
    });
    $(document).ready(function () {
        $("#orgid").stk_val(sirm.org.orgid);
        $("#userInfoForm").stk_submit(function (result) {
            if (result != "") {
                var data = jQuery.parseJSON(result);
                $("#labcname").stk_text(data.displayname);
                $("#labusername").stk_text(data.username);
                $("#labsex").stk_text(data.sex == "1" ? "男" : data.sex == "2" ? "女" : "");
                $("#labemail").stk_text(data.email);
                $("#labtel").stk_text(data.tel);
                $("#labjob").stk_text(data.job);
                $("#labmobilephone").stk_text(data.mobilephone);
                $("#labinservice").stk_text(data.inservice == "1" ? "在职" : "离职");
                if(data.inservice == '0'){
                    $("#lzrq").stk_text(data.lzrq);
                }
                $("#rzrq").stk_text(data.rzrq);
                $("#orgid").stk_val(data.orgid);
                $("#labtel2").stk_text(data.tel2);
                $("#labfamilytelephone").stk_text(data.familytelephone);
                $("#labmobilephone2").stk_text(data.mobilephone2);
                $("#labfamilytelephone2").stk_text(data.familytelephone2);
                $("#labotherphone").stk_text(data.otherphone);
                $("#labotherphone2").stk_text(data.otherphone2);
                $("#labbp").stk_text(data.bp);
                $("#laboffice").stk_text(data.office);
                $("#labfax").stk_text(data.fax);
                $("#labfax2").stk_text(data.fax2);
                $("#labfamilyfax").stk_text(data.familyfax);
                $("#labfamilyfax2").stk_text(data.familyfax2);
                $("#labcompanyaddress").stk_text(data.companyaddress);
                $("#labfamilyaddress").stk_text(data.familyaddress);
                $("#labcompanyzip").stk_text(data.companyzip);
                $("#labfamilyzip").stk_text(data.familyzip);
                $("#labotheraddress").stk_text(data.otheraddress);
                $("#labotherzip").stk_text(data.otherzip);
                $("#labemail1").stk_text(data.email1);
                $("#labemail2").stk_text(data.email2);
                $("#labhomepage").stk_text(data.homepage);
                $("#labqq").stk_text(data.qq);
                $("#labmsn").stk_text(data.msn);
                var where = ["", "上海", "北京", "深圳"];
                $("#labwhere").stk_text(where[data.where1]);
                $("#labaddressbook").stk_text(data.addressbook);
                $("#labintroduction").stk_text(data.introduction);
                $("#terminalid").stk_text(data.terminalid);
                $("#terminalid1").stk_text(data.terminalid1);
                $("#terminalid2").stk_text(data.terminalid2);
                $("#jobnum").stk_text(data.jobnum);
                $("#labnamepy").stk_text(data.namepy);

                var postname = "";
                if (data.posts != "" && data.posts != undefined) {
                    var posts = data.posts.split(",");
                    for (var k = 0; k < posts.length; k++) {
                        var post = posts[k].split(":");
                        postname += postname == "" ? post[1] : "," + post[1];
                    }
                }
                var rolename = "";
                if (data.roles != "" && data.roles != undefined) {
                    var roles = data.roles.split(",");
                    for (var i = 0; i < roles.length; i++) {
                        var role = roles[i].split(":");
                        rolename += rolename == "" ? role[1] : "," + role[1];
                    }
                }
                var teamname = "";
                if (data.teams != "" && data.teams != undefined) {
                    var teams = data.teams.split(",");
                    for (var g = 0; g < teams.length; g++) {
                        var team = teams[g].split(":");
                        teamname += teamname == "" ? team[1] : "," + team[1];
                    }
                }
                $("#infoTeamDiv").stk_html(teamname);
                $("#infoPostDiv").stk_html(postname);
                $("#infoRoleDiv").stk_html(rolename);
//                if (data.qualifys != "") {
//                    var qualifys = data.qualifys.split(",");
//                    for (var j = 0; j < qualifys.length; j++) {
//                        var info = qualifys[j].split(":");
//                        sirm.org.addQualify(info[1], info[2], info[3]);
//                    }
//                } else {
//                    $("#qualifyTable").stk_html("<tr><th class=\"stk-table-th alignL\">资格证书类型</th><th class=\"stk-table-th alignL\">资格证书编号</th><th class=\"stk-table-th alignL\">有效期</th></tr>");
//                }
            }
        });
    });
})();
