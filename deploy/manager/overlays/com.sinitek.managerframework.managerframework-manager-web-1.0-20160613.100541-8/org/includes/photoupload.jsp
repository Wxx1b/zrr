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
    var isloaded = false;
    $(document).ready(function() {
        if (!isloaded){
            window.uploader = new sirm.io.uploader('#photouploader', "photouploader", false, [
                {title : "Image files", extensions : "png,jpg,gif,bmp"}
            ]);

            uploader.bind('FileUploaded', function (up, file, res) {
                $("#uploader-photouploader").find('ul').each(function(n, e) {
                    $(e).stk_hide();
                });
                copyphotoFile(file.target_name);
            });
            isloaded =true;
        }

    });


    function copyphotoFile(filename) {
        $.ajax({
            url: '${contextPath}/org/photo/uploadphoto.action',
            data: {photofilename: filename},
            type: "post",
            cache: false,
            success: function (data) {
                if (data == '0') {
                    stk.info("上传失败!");
                } else {
                    var jdata = jQuery.parseJSON(data);
                    $("#userphoto").attr("src", jdata.src);
                    $("#userphotourl").stk_val(jdata.filepath);
                }
            }
        });
    }
</script>
<table>
    <tr>
        <td width="180px" height="180px" align="center">

            <input type="hidden" id="userphotourl" name="userphotourl">
            <img src="${contextPath}/org/photo/userphotoinfo.action?orgid=${param.orgid}&param=0&type=${param.flag}" height="180px" width="180px" id="userphoto" name="userphoto"
                 style="border:#999999 solid 1px;">
            <div id="photouploader"></div>
        </td>
    </tr>
    <tr>
        <td height="10px" align="center">180px * 180px</td>
    </tr>
</table>