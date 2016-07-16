(function () {
    sirm.define('sirm.org.searchorg.SearchUnit', function (param) {
        var _this = this;
        if (param.relationDiv) {
            parent.$("#" + param.relationDiv).delegate('span>b', 'click', function () {
                var span = this.parentNode;
                var id = span.id,idstr = $.data(span, 'pluginKeyValue');
                sirm.org.searchorg.SearchUnit.__removeContent(id, idstr);
            });
        }
        this.__addContent = function (tf) {
            var checkvalue = '';
            if (param.relationDiv != '' && param.hiddenname != '') {
                var _relationDiv = $("#" + param.relationDiv);
//                var _relationDiv = document.getElementById(param.relationDiv);
                var hidden = document.getElementById(param.hiddenname);
//                _relationDiv.className = "phone-result-table";
                _relationDiv.addClass("phone-result-table");

                if (param.hiddenvalue != '') {
                    checkvalue = hidden.value;
                } else {
                    var checks = $("input[type='checkbox']");
                    if (param.radiounit != '') {
                        checks = $("input[type='radio']");
                    }
                    checks.each(function () {
                        if ($(this).prop("checked")) {
                            if (checkvalue != '') {
                                checkvalue += "," + $(this).attr("value");
                            } else {
                                checkvalue += $(this).attr("value");
                            }
                        }
                    });
                }
                if (checkvalue != '') {
                    var checkstr = checkvalue.split(",");
                    var check = '';
                    if (param.radiounit != '') {
                        hidden.value = "";
                        _relationDiv.html('');
                    }
                    for (var i = 0; i < checkstr.length; i++) {
                        var unit = checkstr[i].split(":");
                        var id = unit[0] + new Date().getTime();
                        var str = $("<span  id=\"" + id + "\" class=\"t-sl\">" + unit[1] +
                                "<b class=\"stk-button-icon ui-icon-close\"></b></span>");
                        //onclick=\"unit.window.__removeContent('" + id + "','" + unit[0] + "')\"
                        str.data('pluginKeyValue', unit[0]);
                        _relationDiv.append(str);

                        if (param.hiddenvalue != '') {
                            _relationDiv.append(str);
                        } else {

                            if (_this._unit_repeatIndusty(unit[0], hidden.value)) {
                                _relationDiv.append(str);
                                if (check != '')
                                    check = check + "," + checkstr[i];
                                else {
                                    check += checkstr[i];
                                }
                            }
                            checkvalue = check;
                        }
                    }
                }
                if (param.hiddenvalue == '') {
                    if (hidden.value != '' && checkvalue != '')
                        hidden.value = hidden.value + "," + checkvalue;
                    else
                        hidden.value += checkvalue;
                }
            }
            if (tf) {
                sirm.org.searchorg.SearchUnit._closeWindow();
            }
        }

        this._unit_repeatIndusty = function (scode, text_code) {
            var text_codeList = text_code.split(",");
            for (var i = 0; i < text_codeList.length; i++) {
                if (text_codeList[i] == '') {
                    continue;
                }
                var baseScode = text_codeList[i].split(":");
                if (baseScode[0] + '' == scode + '') {
                    return false;
                }
            }
            return true;
        }


    });
    sirm.org.searchorg.SearchUnit.__removeContent = function (id, idstr) {
        var hidden = document.getElementById(param.hiddenname);
        var orgids = hidden.value == null ? "" : hidden.value;
        var text_codeList = orgids.split(",");
        var result = "";
        for (var i = 0; i < text_codeList.length; i++) {
            var text = text_codeList[i];
            var baseScode = text_codeList[i].split(":");
            if (baseScode[0] == idstr) {
                continue;
            }
            if (result != "") {
                result = result + "," + text;
            } else {
                result = text;
            }
        }
        var obj = document.getElementById(id);
        obj.parentNode.removeChild(obj);
        hidden.value = result;
    };

})();
