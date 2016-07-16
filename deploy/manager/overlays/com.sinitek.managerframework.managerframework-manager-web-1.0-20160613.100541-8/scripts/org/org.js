$(function() {
    sirm.define('sirm.org', {
        getSelectedOrgIds : function() {
            return $("#orgtreetag_orgsId").stk_val();
        },
        orgtreetag_check:function(id) {
            $("#orgtreetag_orgsId").stk_val(id);
        }
    })
});