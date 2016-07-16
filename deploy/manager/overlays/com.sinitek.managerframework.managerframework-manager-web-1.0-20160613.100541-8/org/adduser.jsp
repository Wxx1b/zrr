<%--
  File Desc:      
  Product Name: SIRM
  Module Name: indicator
  Author:      潘虹
  History:     11-8-3 created by 潘虹
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/orgincludes.jsp" %>
<sirm:page clazz="com.sinitek.managerframework.org.action.UserFormAction" />

<html>
<head><title>添加用户</title>
    <script type="text/javascript" src="../scripts/org/adduser.js">
    </script>
    <script type="text/javascript">
        (function () {
            sirm.define('sirm.org', {
                contextPath:'${contextPath}'
            });
        })();
        /**
         * 页面加载
         */
        $(function () {
            $("#type").stk_val(${ param.type});
            <c:if test="${ param.type==1}">
            <c:if test="${!empty param.orgid}">
            $("#orgid").stk_val(${param.orgid});
            $("#userForm").stk_submit("updateUserInfo", function (result) {
                if (result != "") {
                    var data = jQuery.parseJSON(result);
                    $("#empName").stk_val(data.displayname.replace("(离职)", ""));
                    $("#username").stk_val(data.username);
                    if (data.sex == "1" || data.sex == "2")
                        $("#sex").stk_val(data.sex);
                    $("#email").stk_val(data.email);
                    $("#tel").stk_val(data.tel);
                    $("#job").stk_val(data.job);
                    $("#mobilephone").stk_val(data.mobilephone);
                    $("#inservice").stk_val(data.inservice);//== "1" ? "在职" : "离职"
                    if(data.inservice == '0'){
                        $("#lzrq").stk_disabled(false);
                        $("#lzrq").stk_val(data.lzrq);
                    }
                    $("#rzrq").stk_val(data.rzrq);
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

//                    if ("" != data.photourl && typeof data.photourl != 'undefined') {
//                        $("#userphoto").attr("src", data.path+data.photourl);
//                        $("#userphotourl").stk_val(data.photourl);
//                    }
//                    if ("" != data.signphotourl && typeof data.signphotourl != 'undefined') {
//                        $("#usersignphoto").attr("src", data.path+data.signphotourl);
//                        $("#usersignphotourl").stk_val(data.signphotourl);
//                    }
                    if (data.posts != "") {
                        var posts = data.posts.split(",");
                        for (var k = 0; k < posts.length; k++) {
                            var post = posts[k].split(":");
                            sirm.use('sirm.org', function (org) {
                                org._createDiv(post[0], post[1], 'orgDiv', 'postid');
                            });
                        }
                    }

                    if (data.roles != "") {
                        var roles = data.roles.split(",");
                        for (var i = 0; i < roles.length; i++) {
                            var role = roles[i].split(":");
                            sirm.use('sirm.org', function (org) {
                                org._createDiv(role[0], role[1], 'roleDiv', 'roleid');
                            });
                        }
                    }

                    if (data.teams != "") {
                        var teams = data.teams.split(",");
                        for (var g = 0; g < teams.length; g++) {
                            var team = teams[g].split(":");
                            sirm.use('sirm.org', function (org) {
                                org._createDiv(team[0], team[1], 'teamDiv', 'teamid');
                            });
                        }
                    }
                    if (data.qualifys != "") {
                        var qualifys = data.qualifys.split(",");
                        for (var j = 0; j < qualifys.length; j++) {
                            var info = qualifys[j].split(":");
                            sirm.use('sirm.org', function (org) {
                                org.addQualify(info[1], info[2], info[3]);
                            });
                        }
                    }
                }
            });
            </c:if>
            </c:if>
        });

        function checkusername() {
            var username = $("#username").stk_val();
            if (username.indexOf("$") == 0) {
                return "登录名不能以$开头";
            }
            return true;
        }
    </script>
</head>
<sirm:body>
<ui:form id="userForm" clazz="com.sinitek.managerframework.org.action.UserFormAction" method="saveUserInfo">
<input type="hidden" id="orgid" name="orgid">
<input type="hidden" id="type" name="type"/>
当前位置：用户管理 >> <c:if test="${param.type == '0'}">新增用户信息</c:if>     <c:if test="${param.type == '1'}">修改用户信息</c:if>
<div style="width:1000px;">
    <div style="width:700px;float:left;">
        <table width="100%" border="0" cellpadding="1" cellspacing="0" class="stk-form-ui-st1">
            <tr>
                <td class="hd" width="80">登录名<em>*</em></td>
                <td class="bd" width="auto" colspan="3"><ui:textfield id="username" name="username"/></td>
            </tr>
            <tr>
                <td class="hd" width="80">员工名称<em>*</em></td>
                <td class="bd" width="auto"><ui:textfield id="empName" name="empName"/></td>
                <td class="hd" width="80">员工姓名拼音</td>
                <td class="bd" width="auto"><ui:textfield id="namepy" name="namepy"/></td>
            </tr>
            <tr>
                <td class="hd" width="80">性别</td>
                <td class="bd" width="auto"><ui:radioboxgroup columnWidth="30%" columnHeight="20px" name="sex" id="sex"
                                                              list="#{'1':'男','2':'女'}"/>
                </td>
                <td class="hd" width="80">电子邮箱</td>
                <td class="bd" width="auto"><ui:textfield id="email" name="email"/></td>
            </tr>
            <tr>
                <td class="hd" width="80">办公电话</td>
                <td class="bd" width="auto"><ui:textfield id="tel" name="tel"/></td>
                <td class="hd" width="80">手机</td>
                <td class="bd" width="auto"><ui:textfield id="mobilephone" name="mobilephone"/></td>
            </tr>
            <tr>
                <td class="hd" width="80">职位</td>
                <td class="bd" width="auto"><ui:textfield id="job" name="job"/></td>
                <td class="hd" width="80">在职状态</td>
                <td class="bd" width="auto"><ui:select id="inservice" name="inservice" list="#{'1':'在职','0':'离职'}"
                                                       defaultValue="1" width="130px">
                    <event:onchange valVar="value">
                        if(value == '0'){//选择了离职
                            $("#lzrq").stk_val(new Date().format("yyyy-MM-dd"));
                            $("#lzrq").stk_disabled(false);
                        }else{
                            $("#lzrq").stk_val("");
                            $("#lzrq").stk_disabled(true);
                        }
                    </event:onchange>

                </ui:select>
                </td>
            </tr>
            <tr>
                <td class="hd" width="80">入职日期</td>
                <td class="bd" width="auto"><ui:datefield id="rzrq" name="rzrq"/></td>
                <td class="hd" width="80">离职日期</td>
                <td class="bd" width="auto"><ui:datefield id="lzrq" name="lzrq" disabled="true"/></td>
                <script type="text/javascript">
                    $("#rzrq").width(120);
                    $("#lzrq").width(120);
                </script>
            </tr>
            <tr>
                <td class="hd" width="80">办公电话2</td>
                <td class="bd" width="auto"><ui:textfield id="tel2" name="tel2"/></td>
                <td class="hd" width="80">家庭电话1</td>
                <td class="bd" width="auto"><ui:textfield id="familytelephone" name="familytelephone"/></td>
            </tr>
            <tr>
                <td class="hd" width="80">手机电话2</td>
                <td class="bd" width="auto"><ui:textfield id="mobilephone2" name="mobilephone2"/></td>
                <td class="hd" width="80">家庭电话2</td>
                <td class="bd" width="auto"><ui:textfield id="familytelephone2" name="familytelephone2"/></td>
            </tr>
            <tr>
                <td class="hd" width="80">其他电话1</td>
                <td class="bd" width="auto"><ui:textfield id="otherphone" name="otherphone"/></td>
                <td class="hd" width="80">其他电话2</td>
                <td class="bd" width="auto"><ui:textfield id="otherphone2" name="otherphone2"/></td>
            </tr>
            <tr>
                <td class="hd" width="80">BP机</td>
                <td class="bd" width="auto"><ui:textfield id="bp" name="bp"/></td>
                <td class="hd" width="80">办公室</td>
                <td class="bd" width="auto"><ui:textfield id="office" name="office"/></td>
            </tr>
            <tr>
                <td class="hd" width="80">公司传真1</td>
                <td class="bd" width="auto"><ui:textfield id="fax" name="fax"/></td>
                <td class="hd" width="80">公司传真2</td>
                <td class="bd" width="auto"><ui:textfield id="fax2" name="fax2"/></td>
            </tr>
            <tr>
                <td class="hd" width="80">家庭传真1</td>
                <td class="bd" width="auto"><ui:textfield id="familyfax" name="familyfax"/></td>
                <td class="hd" width="80">家庭传真2</td>
                <td class="bd" width="auto"><ui:textfield id="familyfax2" name="familyfax2"/></td>
            </tr>
            <tr>
                <td class="hd" width="80">公司地址</td>
                <td class="bd" width="auto"><ui:textfield id="companyaddress" name="companyaddress"/></td>
                <td class="hd" width="80">家庭地址</td>
                <td class="bd" width="auto"><ui:textfield id="familyaddress" name="familyaddress"/></td>
            </tr>
            <tr>
                <td class="hd" width="80">公司邮编</td>
                <td class="bd" width="auto"><ui:textfield id="companyzip" name="companyzip"/></td>
                <td class="hd" width="80">家庭邮编</td>
                <td class="bd" width="auto"><ui:textfield id="familyzip" name="familyzip"/></td>
            </tr>
            <tr>
                <td class="hd" width="80">其他地址</td>
                <td class="bd" width="auto"><ui:textfield id="otheraddress" name="otheraddress"/></td>
                <td class="hd" width="80">其他邮编</td>
                <td class="bd" width="auto"><ui:textfield id="otherzip" name="otherzip"/></td>
            </tr>
            <tr>
                <td class="hd" width="80">其他Email 1</td>
                <td class="bd" width="auto"><ui:textfield id="email1" name="email1"/></td>
                <td class="hd" width="80">其他Email 2</td>
                <td class="bd" width="auto"><ui:textfield id="email2" name="email2"/></td>
            </tr>
            <tr>
                <td class="hd" width="80">主页</td>
                <td class="bd" width="auto"><ui:textfield id="homepage" name="homepage"/></td>
                <td class="hd" width="80">QQ</td>
                <td class="bd" width="auto"><ui:textfield id="qq" name="qq"/></td>
            </tr>
            <tr>
                <td class="hd" width="80">MSN</td>
                <td class="bd" width="auto"><ui:textfield id="msn" name="msn"/></td>
                <td class="hd" width="80">工作地</td>
                <td class="bd" width="auto"><ui:select id="where" name="where"
                                                       list="#{'0':'--请选择--','1':'上海','2':'北京','3':'深圳'}"
                                                       defaultValue="0" width="130px"/></td>
            </tr>

            <tr>
                <%--<td class="hd" width="80">andriod终端号</td>--%>
                <%--<td class="bd" width="auto"><ui:textfield id="terminalid" name="terminalid"/></td>--%>
                <%--<td class="hd" width="80">iphone终端号</td>--%>
                <%--<td class="bd" width="auto"><ui:textfield id="terminalid1" name="terminalid1"/></td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td class="hd" width="80">ipad终端号</td>--%>
                <%--<td class="bd" width="auto"><ui:textfield id="terminalid2" name="terminalid2"/></td>--%>
                <td class="hd" width="80">通讯录</td>
                <td class="bd" width="auto" colspan="3"><ui:textfield id="addressbook" name="addressbook"/></td>
            </tr>
            <tr>
                <td class="hd" width="80">个人简介</td>
                <td class="bd" width="auto" colspan="3"><ui:textarea width="500px" rows="5" id="introduction"
                                                                     name="introduction"/></td>
            </tr>
            <tr>
                <td class="hd" width="80">所属岗位</td>
                <td class="bd" width="auto" colspan="3">
                    <org:orgTag orglist="orglist"/>
                    <div id="orgDiv" class="phone-result-table" style="width:400px">
                        <select id="orgselect"
                                onchange="if(this.options[this.selectedIndex].disabled==true)$('#orgselect').stk_val('0');
                                var value=this.value;   var text=this.options[this.selectedIndex].innerText;
                                sirm.use('sirm.org', function (org) {
                                org._createDiv(value,text,'orgDiv','postid');});$('#orgselect').stk_val('0');" style="width: 130px">
                                ${orglist}
                        </select>
                    </div>
                    <input type="hidden" id="postid" name="postid"/>
                </td>
            </tr>
            <c:if test="${roleshow}">
                <tr>
                    <td class="hd" width="80">所属角色</td>
                    <td class="bd" width="auto" colspan="3">
                        <org:roleTag rolelist="rolelist"/>
                        <div id="roleDiv" class="phone-result-table" style="width:400px">
                            <ui:select list="#attr.rolelist" id="roleselect" name="roleselect" headerValue="--请选择--"
                                       headerKey="0" width="130px">
                                <event:onchange valVar="value" textVar="text">
                                    sirm.use('sirm.org', function (org) {
                                    org._createDiv(value,text,'roleDiv','roleid');
                                    });
                                    $("#roleselect").stk_val("0");
                                </event:onchange>
                            </ui:select>
                        </div>
                        <input type="hidden" id="roleid" name="roleid"/>
                    </td>
                </tr>
            </c:if>
            <tr>
                <td class="hd" width="80">所属小组</td>
                <td class="bd" width="auto" colspan="3">
                    <org:Team teamlists="teamlist"/>
                    <div id="teamDiv" class="phone-result-table" style="width:400px">
                        <ui:select list="#attr.teamlist" id="teamselect" name="teamselect" headerValue="--请选择--"
                                   headerKey="0" width="130px">
                            <event:onchange valVar="value" textVar="text">
                                sirm.use('sirm.org', function (org) {
                                org._createDiv(value,text,'teamDiv','teamid');
                                });
                                $("#teamselect").stk_val("0");
                            </event:onchange>
                        </ui:select>
                    </div>
                    <input type="hidden" id="teamid" name="teamid"/>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <input type="hidden" id="qualify"/>
                </td>
            </tr>
        </table>
    </div>
    <div style="float:left;width:200px;height:220px;margin-left:15px;">
        <table align="center" border="0">
            <tr>
                <td width="180px" height="180px" id="photo">
                    <jsp:include page="includes/photoupload.jsp"></jsp:include>
                </td>
            </tr>
        </table>
    </div>
    <div style="float:left;width:200px;height:220px;margin-left:15px;margin-top: 30px">
        <table align="center" border="0">
            <tr>
                <td width="120px" height="55px" id="signphoto">
                    <jsp:include page="includes/signphotoupload.jsp"></jsp:include>
                </td>
            </tr>
        </table>
    </div>
</div>

<%--<table width="100%" border="0" cellpadding="1" cellspacing="0" class="stk-form-ui-st1">
    <tr>
        <td class="hd" width="80">从业资格类型</td>
        <td class="bd" width="auto">
            <param:enumList clazz="com.sinitek.sirm.org.busin.enumerate.QualifyType" var="enumList"/>
            <ui:select id="qualifytype" name="qualifytype" list="#attr.enumList" headerKey="0"
                       headerValue="无" listKey="enumItemValue"
                       listValue="enumItemInfo" width="130px"/></td>
        <td class="hd" width="80">从业资格编号</td>
        <td class="bd" width="auto"><ui:textfield id="qualifyno" name="qualifyno"/></td>
        <td class="hd" width="80">有效期</td>
        <td class="bd" width="auto">
            <ui:datefield id="endtime" name="endtime">
            </ui:datefield>
        </td>
        <td>
            <ui:button text="添加资格证书">
                <event:onclick>
                    var qualifytype = $("#qualifytype").stk_val();
                    var qualifyno = $("#qualifyno").stk_val();
                    var endtime = $("#endtime").stk_val();
                    sirm.use('sirm.org', function(org) {
                    org.addQualify(qualifytype,qualifyno,endtime);
                    });
                </event:onclick>
            </ui:button>
        </td>
    </tr>
</table>
<ui:button text="删除"><event:onclick> sirm.use('sirm.org', function(org) {
    org.removeQualify();
    });</event:onclick></ui:button>
<table id="addQualifyTable" width="100%" border="0" cellpadding="1" cellspacing="0" class="stk-table stk-table-bbline">
    <tr>
        <th class="stk-table-th" align="center" width="20px"><input id="checkAll" type="checkbox"
                                                                    onclick=" sirm.use('sirm.org', function(org) {org.selectAll($('#checkAll').prop('checked')); });"/>
        </th>
        <th class="stk-table-th alignL">资格证书类型</th>
        <th class="stk-table-th alignL">资格证书编号</th>
        <th class="stk-table-th alignL">有效期</th>
    </tr>
</table>--%>
<table class="stk-form-ui-st1">
    <tr class="btn-bar">
        <td class="hd"></td>
        <td class="bd">
            <ui:button text="保存并新增">
                <event:onclick>
                    sirm.use('sirm.org', function(org) {
                    org.submitForm("1");
                    });
                </event:onclick>
            </ui:button>
            <ui:button text="保存并关闭">
                <event:onclick>
                    sirm.use('sirm.org', function(org) {
                    org.submitForm("2");
                    });
                </event:onclick>
            </ui:button>
            <ui:button text="关闭">
                <event:onclick>
                    $(document).stk_removeSelf();
                </event:onclick>
            </ui:button>
        </td>
    </tr>
</table>
<func:checkers>
    <func:checker target="username" allowBlank="false" blankText="请输入登录名" validator="checkusername()" maxLength="40" maxLengthText="登录名不能超过40字"/>
    <func:checker target="empName" allowBlank="false" blankText="请输入员工名称" maxLength="40" maxLengthText="员工名称不能超过40字"/>
    <%--<func:checker target="tel" allowBlank="false" blankText="请输入办公电话"--%>
                  <%--regex="^\d{3,4}-\d{7,8}$|^\d{3,4}-\d{7,8}-\d{3,4}$|^\d{11,12}$" regexText="请输入办公电话{格式:区号-号码}"/>--%>
    <func:checker target="mobilephone" regex="^0?\\d{11}$" regexText="请输入正确格式的手机"/>
    <func:checker target="email"
                  regex="^(?:[a-z0-9A-Z_-]+\.?)*[a-z0-9A-Z_-]+@(?:[a-z0-9A-Z_-]+\.?)*\w+$"
                  regexText="请输入正确格式的Email"/>
    <%--<func:checker target="introduction" allowBlank="false" blankText="请输入个人简介" maxLength="2000"--%>
                  <%--maxLengthText="个人简介不能超过2000字"/>--%>
</func:checkers>
</ui:form>
</sirm:body>
<script>
    setInterval("updateUploadBtn()", 500);
    function updateUploadBtn() {
        $($("#uploader-photouploader").children()[1]).find("a").html("<b class=\"icon-add\"/>上传头像");
        $($("#uploader-photouploader").children()[2]).stk_hide();

        $($("#uploader-photouploader2").children()[1]).find("a").html("<b class=\"icon-add\"/>上传签名图象");
        $($("#uploader-photouploader2").children()[2]).stk_hide();
    }
</script>
</html>