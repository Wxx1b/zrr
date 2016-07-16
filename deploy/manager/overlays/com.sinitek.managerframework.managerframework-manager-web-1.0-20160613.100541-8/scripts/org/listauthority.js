$(function () {
    sirm.define('sirm.org', {

        showSortWindow: function (data) {
            var tableName;
            var tempName = $("#tableName").stk_val();
            if (tempName == "") {
                tableName = "table" + $("#initName").stk_val();
            } else {
                tableName = "table" + tempName;
            }
            var autghData = data;
            var size = autghData.length;
            var authids = [size], auths = {};
            for (var i = 0; i < size; i++) {
                var authid = autghData[i].objid;
                var authname = autghData[i].name;
                auths[authid] = authname;
                authids[i] = authid;
            }
            $("#authSort").stk_init(auths, authids);
            $("#authSortWindow").stk_show({title: '排序'});
            $(".stk-p-2").hide();
            $(".stk-p-1").hide();
        },
        saveAuthSort: function () {
            $("#authSortForm").stk_submit(function (result) {
                if (result != "") {
                    stk.alert(result);
                } else {
                    $("#authSortWindow").stk_hide();
                    window.location = sirm.jsurl("/org/listauthority.jsp");
                }
            });
        },
        search:function(){
            var tableName = $("#tableName").stk_val();
            if(tableName == ""){
                $("#"+$("#initName").stk_val()).stk_query();
            }else{
                $("#"+tableName).stk_query();
            }
        }
    });


});