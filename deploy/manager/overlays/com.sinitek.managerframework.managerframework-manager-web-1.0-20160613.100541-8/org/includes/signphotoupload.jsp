<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 13-10-17
  Time: 上午11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="orgincludes.jsp" %>
<script>
    var isloaded2 = false;
    $(document).ready(function() {
        if (!isloaded2){
            window.uploader2 = new sirm.io.uploader('#photouploader2', "photouploader2", false, [
                {title : "Image files", extensions : "png,jpg,gif,bmp"}
            ]);

            uploader2.bind('FileUploaded', function (up, file, res) {
                $("#uploader-photouploader2").find('ul').each(function(n, e) {
                    $(e).stk_hide();
                });
                copysignphotoFile(file.target_name);
            });
            isloaded2 =true;
        }

    });


    function copysignphotoFile(filename) {
        $.ajax({
            url: '${contextPath}/org/photo/uploadsignphoto.action',
            data: {photofilename: filename},
            type: "post",
            cache: false,
            success: function (data) {
                if (data == '0') {
                    stk.info("上传失败!");
                } else {
                    var jdata = jQuery.parseJSON(data);
                    $("#usersignphoto").attr("src", jdata.src);
                    $("#usersignphotourl").stk_val(jdata.filepath);
                }
            }
        });
    }
</script>
<table>
    <tr>
        <td width="120px" height="55px" align="center">
            <input type="hidden" id="usersignphotourl" name="usersignphotourl">
            <img src="${contextPath}/org/photo/userphotoinfo.action?orgid=${param.orgid}&param=1&type=${param.flag}" height="55px" width="120px" id="usersignphoto" name="usersignphoto"
                 style="border:#999999 solid 1px;">
            <div id="photouploader2"></div>
        </td>
    </tr>
    <tr>
        <td height="10px" align="center">120px * 55px</td>
    </tr>
</table>