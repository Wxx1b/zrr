(function () {
    sirm.define('sirm.org.searchorg.SearchPost', function (param) {
        var _this = this;
        if (param.relationDiv) {
            $("#" + param.relationDiv).delegate('span>b', 'click', function () {
                var span = this.parentNode;
                _this._post_removeContent(span.id, $.data(span, 'pluginKeyValue'));
            });
        }

        this._post_searchPostFun = function () {
            var orgid = $("#_" + param.prefix + "_searchPost").stk_val();
            var orgname = $("#_" + param.prefix + "_searchPost").stk_text();
            var orgids = $("#_" + param.prefix + "_postid").stk_val() == null ? "" : $("#_" + param.prefix + "_postid").stk_val();
            //记录是否重复
            var notcf = true;
            if (orgids != "" && param.showdiv == 'true') {
                if (_this._post_repeatIndusty(orgid, "_" + param.prefix + "_postid")) {
                    orgids = orgids + "," + orgid + ":" + orgname;
                } else {
                    notcf = false;
                }
            } else {
                orgids = orgid + ":" + orgname;
            }
            if (param.showdiv == 'true') {
                if (param.relationDiv != '') {
                    $("#_" + param.prefix + "_searchPost").stk_text("");
                    $("#_" + param.prefix + "_searchPost").stk_attr("emptyText", "请输入拼音");
                    if (notcf)
                        _this._post_spellSecurityContent(orgid, orgname);
                }
            } else {
                $("#_" + param.prefix + "_postid").stk_val("");
            }
            $("#_" + param.prefix + "_postid").stk_val(orgids);
            if (param.callbackfunc != "") {
                window[param.callbackfunc](orgids);
            }
        };
        this._post_repeatIndusty = function (scode, tagid) {
            var text_code = $("#" + tagid).val();
            var text_codeList = text_code.split(",");
            if (text_codeList.length > 0) {
                for (var i = 0; i < text_codeList.length; i++) {
                    if (text_codeList[i] == "") {
                        continue;
                    }
                    var baseScode = text_codeList[i].split(":");//.split("-");
                    if (baseScode[0] == scode) {//[1]
                        return false;
                    }
                }
            }
            return true;
        };
        //�����Ӱ�ť��ӵ���Ӧ�Ĳ���
        this._post_spellSecurityContent = function (pluginKeyValue, showContent) {
            var _relationDiv = $("#" + param.relationDiv);
            _relationDiv.addClass("phone-result-table");
            var id = param.relationDiv + "" + Math.ceil(Math.random() * 1000000000) * Math.ceil(Math.random() * 10000);
            var str = $("<span class=\"t-sl\" id=\"" + id + "\">" + showContent + "<b class=\"stk-button-icon ui-icon-close\"></b> </span>");
            str.data('pluginKeyValue', pluginKeyValue);
            _relationDiv.append(str);
        };

        //ɾ�������ѡ
        this._post_removeContent = function (id, key) {
            var orgids = $("#_" + param.prefix + "_postid").stk_val() == null ? "" : $("#_" + param.prefix + "_postid").stk_val();
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
            $("#_" + param.prefix + "_postid").stk_val(result);
        };

        this._post_updateContent = function (hiddentext) {
            _this._post_emptyContent();
            if (hiddentext.length > 0) {
                var hidden = "";
                for (var j = 0; j < hiddentext.length; j++) {
                    hidden += hidden == "" ? hiddentext[j] : "," + hiddentext[j];
                }
                stk.call({
                    className:"com.sinitek.managerframework.org.action.SearchUserAction",
                    method:'getEmpStr',
                    param:{hiddentext:hidden},
                    callBack:function (result) {
                        $("#_" + param.prefix + "_postid").stk_val(result);
                        if (param.showdiv) {
                            var emps = result.split(",");
                            for (var i = 0; i < emps.length; i++) {
                                var emp = emps[i].split(":");
                                if (emp.length > 0) {
                                    _this._post_spellSecurityContent(emp[0], emp[1]);
                                }
                            }
                        } else {
                            if (hiddentext.length == 1) {
                                var empname = result.split(":");
                                $("#_" + param.prefix + "_searchPost").stk_text(empname[1]);
                            } else if (hiddentext.length > 1) {
                                var erroremps = result.split(",")[0];
                                var errorempname = erroremps.split(":");
                                $("#_" + param.prefix + "_searchPost").stk_text(errorempname[1]);
                                $("#_" + param.prefix + "_postid").stk_val(erroremps);
                            }
                        }
                    }, exceptionHandler:function (message, e) {
                    }
                });
            }
        };

        this._post_emptyContent = function () {
            //保存是否需要生成层中图标
            var tf = false;
            //判断是否是多选
            if (param.showdiv) {
                //判断如果层名称不为空，则清空层中内容
                tf = (param.relationDiv != '');
                if (tf) {
                    $("#" + param.relationDiv).stk_html("");
                }
            }
            $("#_" + param.prefix + "_postid").stk_val("");
            $("#_" + param.prefix + "_searchPost").stk_text("");
        }
    });
})();