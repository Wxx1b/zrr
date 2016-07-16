$(function() {
    sirm.define('sirm.org', {
        /**
         *验证密码是否输入一致
         */
        checkpw:function() {
            if ($("#password").stk_val() != $("#passwordTwo").stk_val()) {
                return "两次密码输入不一致";
            } else {
                return true;
            }
        },
        /**
         * 添加资格证书
         */
        addQualify:function(qualifytype, qualifyno, endtime) {
            if (qualifytype == "0")
                stk.alert("请输入资格证书类型");
            else if (qualifyno == "")
                stk.alert("请输入资格证书编号");
            else if (endtime == "")
                stk.alert("请输入有效期");
            else {
                var type = qualifytype == "1" ? "一般证券业务" : "投资咨询业务";
                var qualifyval = qualifytype + ":" + qualifyno + ":" + endtime;
                $("#addQualifyTable").append("<tr><td class=\"stk-table-td alignC\" width=\"20px\"><input type=\"checkbox\" name=\"qualifycheck\"/> <input class=\"qualifyhidden\" type=\"hidden\" value=\"" + qualifyval + "\"/></td><td class=\"stk-table-td alignL\">" + type + "</td><td class=\"stk-table-td alignL\">" + qualifyno + "</td><td class=\"stk-table-td alignL\">" + endtime + "</td></tr>");
                $("#qualifytype").stk_val("0");
                $("#qualifyno").stk_val("");
                $("#endtime").stk_val("");
            }

        },
        /**
         * checkbox全选
         */
        selectAll:function(btn) {
            $("#addQualifyTable input[name='qualifycheck']").each(function(i,cb) {
                $(cb).prop("checked", btn);
            });
        },
        /**
         *删除资格证书
         */
        removeQualify:function() {
            var allcheckbox = $("input[name='qualifycheck']"),tableheader = 1,table = $("#addQualifyTable")[0],indexs = [];
            allcheckbox.each(function(i, cb) {
                if (cb.checked) {
                    indexs.push(i + tableheader);
                }
            });
            $.each(indexs, function(i, index) {
                table.deleteRow(index - i);

            });
            $("#checkAll").prop("checked", false);
        },

        /**
         *提交表单
         */
        submitForm:function(type) {
            if(!window.uploader.isComplete() || !window.uploader2.isComplete()){
                return stk.alert("请等待附件上传完成");
            }
            var contextPath = sirm.org.contextPath;
            if ($("#userForm").stk_checkForm()) {
                var qualify = "";
                $(".qualifyhidden").each(function(i, hidden) {
                    if (hidden.value != "") {
                        if (qualify == "")
                            qualify = hidden.value;
                        else
                            qualify += "," + hidden.value;
                    }
                });
                $("#qualify").stk_val(qualify);
                $("#userForm").stk_submit(function(result) {
                    if (result != "") {
                        stk.alert(result);
                    } else {
                        if (type == "1")
                            window.location =  sirm.jsurl("/org/adduser.jsp?type=0");
                        else if (type == "2")
                            $(document).stk_removeSelf();
                    }
                });
            }
        },

        /**
         * 根据所选角色生成图标
         * @param val  角色编号
         * @param text 角色名称
         * @param hidden  存角色信息的隐藏域
         */
        _createDiv:function(val, text, divId, hidden) {
            if (val != "0") {
                var hiddeninput = $("#" + hidden).stk_val();
                var inputval = "," + hiddeninput + ",";
                if (hiddeninput == "" || (inputval.indexOf("," + val + ",") == -1)) {
                    var id = divId + "" + Math.ceil(Math.random() * 1000000000) * Math.ceil(Math.random() * 10000);
                    var str = "<span  id=\"" + id + "\" class=\"t-sl\">" + text +
                            "<b class=\"stk-button-icon ui-icon-close\" onclick=\"sirm.use('sirm.org', function (org) {org._removeSpan('" + id + "','" + val + "','" + hidden + "');});\" ></b></span>";
                    $("#" + divId).append(str);
                    if (hiddeninput == "")
                        $("#" + hidden).stk_val(val);
                    else
                        $("#" + hidden).stk_val(hiddeninput + "," + val);
                }
            }
        },
        /**
         * 删除选中角色
         * @param spanid
         */
        _removeSpan:function(spanid, key, hiddenId) {
            var hidden = $("#" + hiddenId);
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
            $("#" + spanid).remove();
            hidden.stk_val(result);
        }
    });
});