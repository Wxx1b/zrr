$(function () {
    sirm.define('sirm.org.searchorg', {//�ж��Ƿ����
        _user_repeatIndusty:function (scode, text_code) {
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
            return true;
        },
        //�����Ӱ�ť��ӵ���Ӧ�Ĳ���
        _user_spellSecurityContent:function (relationDivId, pluginKeyValue, showContent, prefix, hiddenname) {
            var _relationDiv = parent.document.getElementById(relationDivId);
            _relationDiv.className = "phone-result-table";
            var id = relationDivId + "" + Math.ceil(Math.random() * 1000000000) * Math.ceil(Math.random() * 10000);
            var str = "<span  id=\"" + id + "\" class=\"t-sl\">" + showContent +
                "<b class=\"stk-button-icon ui-icon-close\" onclick=\"usersiframe.window._user_removeContent('" + id + "','" + pluginKeyValue + "','" + hiddenname + "')\" ></b></span>";
            _relationDiv.innerHTML = _relationDiv.innerHTML + str;
        },
        _user_spellSecurityCheck:function (fromstr, tostr, hiddenstr) {
            var formtext = $("#" + fromstr);
            var topanel = $("#" + tostr);
            $("#" + tostr).attr("class", "phone-result-table");
            var hiddentext = $("#" + hiddenstr);
            if (formtext.stk_val() != '') {
                var baseScode = formtext.stk_val().split(":");
                if (sirm.org.searchorg._user_repeatIndusty(baseScode[0], hiddentext.stk_val())) {
                    var result = hiddentext.stk_val();
                    if (result != '') {
                        result += ',' + formtext.stk_val();
                    } else {
                        result += formtext.stk_val();
                    }
                    hiddentext.stk_val(result);
                    var id = tostr + "" + Math.ceil(Math.random() * 1000000000) * Math.ceil(Math.random() * 10000);
//                    var str = "<span  id=\"" + id + "\" class=\"t-sl\">" + baseScode[1] +
//                            "<b class=\"stk-button-icon ui-icon-close\"  onclick=\"_user_removeContent('" + id + "','" + baseScode[0] + "','" + hiddenstr + "')\" ></b></span>";
                    var str = "<span  id=\"" + id + "\" class=\"t-sl\">" + baseScode[1] +
                        "<b class=\"stk-button-icon ui-icon-close\"  onclick=\"sirm.org.searchorg._user_removeContent('" + id + "','" + baseScode[0] + "','" + hiddenstr + "')\" ></b></span>";
                    topanel.append(str);
                }
            } else {
                parent.stk.alert("未选择添加项");
            }
        },
        //添加到页面的div中
        _user_addContent:function (dicContent, hiddenname, divname, prefix) {
            var text_codeList = dicContent.split(",");
            var hiddenObj = parent.document.getElementById(hiddenname);
            var result = hiddenObj.value;

            for (var i = 0; i < text_codeList.length; i++) {
                var text = text_codeList[i];
                var baseScode = text.split(":");
                if (sirm.org.searchorg._user_repeatIndusty(baseScode[0], hiddenObj.value)) {
                    if (result != '') {
                        result += ',' + text;
                    } else {
                        result += text;
                    }
                    sirm.org.searchorg._user_spellSecurityContent(divname, baseScode[0], baseScode[1], prefix, hiddenname);
                }
            }
            hiddenObj.value = result;
        },
        //ɾ�������ѡ
        _user_removeContent:function (id, key, hiddenId) {
            var hidden = parent.document.getElementById(hiddenId);
            var orgids = hidden.value == null ? "" : hidden.value;
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
            if (id != null && id != "") {
                var obj = parent.document.getElementById(id);
                obj.parentNode.removeChild(obj);
            }
            hidden.value = result;
        },
        functionName:function (obj) {
            var param = sirm.org.searchorg.param;
            var _nodeid = $(obj).attr("nodeId");
            var _nodetype = $(obj).attr("nodetype");
            var _nodename = $(obj).attr("nodename");
            var result = _nodeid + ":" + _nodename + ":" + _nodetype;

            $("#_user_" + param.prefix + "_post").stk_val("");
            $("#_user_" + param.prefix + "_org").stk_val("");
            $("#_user_" + param.prefix + "_team").stk_val("");
            if (_nodetype == '2') {
                $("#_user_" + param.prefix + "_post").stk_val(result);
            } else if (_nodetype == '1') {
                $("#_user_" + param.prefix + "_org").stk_val(result);
            } else if (_nodetype == '4') {
                $("#_user_" + param.prefix + "_team").stk_val(result);
            }
            $("#_user_org_orgid").stk_val(_nodeid);
            $("#_org_userstable").stk_query();
        }

    });
});