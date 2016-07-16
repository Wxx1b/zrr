<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/orgincludes.jsp" %>
<sirm:page clazz="com.sinitek.managerframework.org.action.PasswordSettingAction"></sirm:page>
<html>
<head><title>组织机构参数设置</title></head>
<sirm:body>
<ui:form id="passwordform" clazz="com.sinitek.managerframework.org.action.PasswordSettingAction" method="savePassWordSetting">
<table class="stk-table stk-table-bbline" width="650px" cellpadding="0" cellspacing="0">
<tr>
    <th class="stk-table-th" width="250px">组织机构参数名称</th>
    <th class="stk-table-th">参数设置</th>
</tr>
<tr class="stk-table-tr-even">
    <td class="stk-table-td" width="160px">
        用户初始密码
    </td>
    <td class="stk-table-td">
        <ui:textfield name="PASSWORD" id="PASSWORD" width="60px"
                      defaultValue="${PASSWORD}"></ui:textfield>
        <input type="hidden" name="PASSWORD_MEMO" id="PASSWORD_MEMO" value="用户初始密码">
    </td>
</tr>
<tr class="stk-table-tr-odd">
    <td class="stk-table-td" width="160px">
        用户是否能修改密码
    </td>
    <td class="stk-table-td">
        <ui:textfield name="USERUPDATEPW" id="USERUPDATEPW" width="60px"
                      defaultValue="${USERUPDATEPW}"></ui:textfield>
        <input type="hidden" name="USERUPDATEPW_MEMO" id="USERUPDATEPW_MEMO" value="用户是否能修改密码">
    </td>
</tr>
<tr class="stk-table-tr-odd">
    <td class="stk-table-td" width="160px">
        用户切换默认密码
    </td>
    <td class="stk-table-td">
        <ui:textfield name="SWITCHINGPWD" id="SWITCHINGPWD" width="60px"
                      defaultValue="${SWITCHINGPWD}"></ui:textfield>
        <input type="hidden" name="SWITCHINGPWD_MEMO" id="SWITCHINGPWD_MEMO" value="用户切换默认密码">
    </td>
</tr>
<tr class="stk-table-tr-even">
    <td class="stk-table-td" width="160px">
        密码最长使用周期
    </td>
    <td class="stk-table-td">
        <ui:textfield name="ORGSIRM001" id="ORGSIRM001" width="60px"
                      defaultValue="${ORGSIRM001}"></ui:textfield>天
        <input type="hidden" name="ORGSIRM001_MEMO" id="ORGSIRM001_MEMO" value="密码最长使用周期配置，单位：天">
    </td>
</tr>
<tr class="stk-table-tr-odd">
    <td class="stk-table-td">
        密码失效前提前提醒天数
    </td>
    <td class="stk-table-td">
        <ui:textfield name="ORGSIRM002" id="ORGSIRM002" width="60px"
                      defaultValue="${ORGSIRM002}"></ui:textfield>天
        <input type="hidden" name="ORGSIRM002_MEMO" id="ORGSIRM002_MEMO" value="后台增加密码失效前提前提醒天数设置，单位：天">
    </td>
</tr>
<tr class="stk-table-tr-even">
    <td class="stk-table-td">密码重复次数</td>
    <td class="stk-table-td">
        <ui:textfield name="ORGSIRM003" id="ORGSIRM003" width="60px"
                      defaultValue="${ORGSIRM003}"></ui:textfield>次
        <input type="hidden" name="ORGSIRM003_MEMO" id="ORGSIRM003_MEMO" value="后台增加密码重复次数设置 单位：次数">
    </td>
</tr>
<tr class="stk-table-tr-odd">
    <td class="stk-table-td">密码长度</td>
    <td class="stk-table-td">
        <ui:textfield name="ORGSIRM004" id="ORGSIRM004" width="60px"
                      defaultValue="${ORGSIRM004}"></ui:textfield>位
        <input type="hidden" name="ORGSIRM004_MEMO" id="ORGSIRM004_MEMO" value="后台增加密码长度设置">
    </td>
</tr>
<tr class="stk-table-tr-even">
    <td class="stk-table-td">是否必须包含数字</td>
    <td class="stk-table-td">
        <ui:select name="ORGSIRM005" id="ORGSIRM005" list="#{'0':'非必须','1':'必须'}"
                   defaultValue="${ORGSIRM005}" width="65px"></ui:select>
        <input type="hidden" name="ORGSIRM005_MEMO" id="ORGSIRM005_MEMO" value="是否必须包含数字，1表示必须，0表示非必须">
    </td>
</tr>
<tr class="stk-table-tr-odd">
    <td class="stk-table-td">是否必须包含小写字母</td>
    <td class="stk-table-td">
        <ui:select name="ORGSIRM006" id="ORGSIRM006" list="#{'0':'非必须','1':'必须'}"
                   defaultValue="${ORGSIRM006}" width="65px"></ui:select>
        <input type="hidden" name="ORGSIRM006_MEMO" id="ORGSIRM006_MEMO" value="是否必须包含小写字母，1表示必须，0表示非必须">
    </td>
</tr>
<tr class="stk-table-tr-even">
    <td class="stk-table-td">是否必须包含大写字母</td>
    <td class="stk-table-td">
        <ui:select name="ORGSIRM007" id="ORGSIRM007" list="#{'0':'非必须','1':'必须'}"
                   defaultValue="${ORGSIRM007}" width="65px"></ui:select>
        <input type="hidden" name="ORGSIRM007_MEMO" id="ORGSIRM007_MEMO" value="是否必须包含大写字母，1表示必须，0表示非必须">
    </td>
</tr>
<tr class="stk-table-tr-odd">
    <td class="stk-table-td">是否必须包含特殊字符</td>
    <td class="stk-table-td">
        <ui:select name="ORGSIRM008" id="ORGSIRM008" list="#{'0':'非必须','1':'必须'}"
                   defaultValue="${ORGSIRM008}" width="65px"></ui:select>
        <input type="hidden" name="ORGSIRM008_MEMO" id="ORGSIRM008_MEMO" value="是否必须包含特殊字符，1表示必须，0表示非必须">
    </td>
</tr>
<tr class="stk-table-tr-even">
    <td class="stk-table-td">以上4选N (0< n <= 4)</td>
    <td class="stk-table-td">
        <ui:textfield name="ORGSIRM018" id="ORGSIRM018" width="60px" defaultValue="${ORGSIRM018}"></ui:textfield>
        <input type="hidden" name="ORGSIRM018_MEMO" id="ORGSIRM018_MEMO" value="4选N">
    </td>
</tr>
<tr class="stk-table-tr-odd">
    <td class="stk-table-td">密码是否允许包含用户名</td>
    <td class="stk-table-td">
        <ui:select name="ORGSIRM009" id="ORGSIRM009" list="#{'0':'不允许','1':'允许'}"
                   defaultValue="${ORGSIRM009}" width="65px"></ui:select>
        <input type="hidden" name="ORGSIRM009_MEMO" id="ORGSIRM009_MEMO" value="密码是否允许包含用户名的配置：1为允许，0为不允许">
    </td>
</tr>

<tr class="stk-table-tr-even">
    <td class="stk-table-td">密码输入错误次数</td>
    <td class="stk-table-td">
        <ui:textfield name="ORGSIRM010" id="ORGSIRM010" width="60px"
                      defaultValue="${ORGSIRM010}"></ui:textfield>次
        <input type="hidden" name="ORGSIRM010_MEMO" id="ORGSIRM010_MEMO" value="后台增加密码输入错误次数配置 单位：次数">
    </td>
</tr>
<tr class="stk-table-tr-odd">
    <td class="stk-table-td">锁定周期</td>
    <td class="stk-table-td">
        <ui:textfield name="ORGSIRM011" id="ORGSIRM011" width="60px"
                      defaultValue="${ORGSIRM011}"></ui:textfield>分钟
        <input type="hidden" name="ORGSIRM011_MEMO" id="ORGSIRM011_MEMO" value="锁定周期配置，单位：分钟">
    </td>
</tr>
<tr class="stk-table-tr-even">
    <td class="stk-table-td">账户密码输入错误次数复位时间</td>
    <td class="stk-table-td">
        <ui:textfield name="ORGSIRM012" id="ORGSIRM012" width="60px"
                      defaultValue="${ORGSIRM012}"></ui:textfield>分钟
        <input type="hidden" name="ORGSIRM012_MEMO" id="ORGSIRM012_MEMO" value="账户密码输入错误次数复位时间配置，单位：分钟">
    </td>
</tr>
<tr class="stk-table-tr-odd">
    <td class="stk-table-td">首次登录是否强制修改密码</td>
    <td class="stk-table-td">
        <ui:select name="ORGSIRM013" id="ORGSIRM013" list="#{'0':'不强制','1':'强制'}"
                   defaultValue="${ORGSIRM013}" width="65px"></ui:select>
        <input type="hidden" name="ORGSIRM013_MEMO" id="ORGSIRM013_MEMO"
               value="首次登录是否强制修改密码的配置，0：为不强制，1为强制">
    </td>
</tr>
<tr class="stk-table-tr-even">
    <td class="stk-table-td">重置密码后是否强制修改密码</td>
    <td class="stk-table-td">
        <ui:select name="ORGSIRM014" id="ORGSIRM014" list="#{'0':'不强制','1':'强制'}"
                   defaultValue="${ORGSIRM014}" width="65px"></ui:select>
        <input type="hidden" name="ORGSIRM014_MEMO" id="ORGSIRM014_MEMO"
               value="重置密码后是否强制修改密码的配置，0：为不强制，1为强制">
    </td>
</tr>
<tr class="stk-table-tr-odd">
    <td class="stk-table-td">密码安全策略开关</td>
    <td class="stk-table-td">
        <ui:select name="ORGSIRM015" id="ORGSIRM015" list="#{'0':'关闭','1':'打开'}"
                   defaultValue="${ORGSIRM015}" width="65px"></ui:select>
        <input type="hidden" name="ORGSIRM015_MEMO" id="ORGSIRM015_MEMO" value="密码安全策略开关 0: 关闭; 1: 打开">
    </td>
</tr>
<tr class="stk-table-tr-even">
    <td class="stk-table-td">系统管理员登录名</td>
    <td class="stk-table-td">
        <ui:textfield name="ORGSIRM016" id="ORGSIRM016" width="127px"
                      defaultValue="${ORGSIRM016}"></ui:textfield>
        <input type="hidden" name="ORGSIRM016_MEMO" id="ORGSIRM016_MEMO" value="系统管理员登录名">
    </td>
</tr>
<tr class="stk-table-tr-odd">
    <td class="stk-table-td">系统管理员登录密码</td>
    <td class="stk-table-td">
        <input name="ORGSIRM017" id="ORGSIRM017" width="60px" value="${ORGSIRM017}" type="password">
        <input type="hidden" name="ORGSIRM017_MEMO" id="ORGSIRM017_MEMO" value="系统管理员登录密码">
    </td>
</tr>
</table>
<table width="600px" cellpadding="0" cellspacing="0">
    <tr>
        <td align="center" style="padding-top: 20px">
            <ui:button text="保存">
                <event:onclick>
                    if ($("#passwordform").stk_checkForm()) {
                    $("#passwordform").stk_submit(function(result){
                    stk.info(result);
                    });
                    }
                </event:onclick>
            </ui:button>
        </td>
    </tr>
</table>
<func:checkers>
    <func:checker target="ORGSIRM001" allowBlank="true" regex="^\\d+$"
                  regexText="密码最长使用周期 ，请输入数字（如：1、2、3、5、10等）"/>
    <func:checker target="ORGSIRM002" allowBlank="true" regex="^\\d+$"
                  regexText="密码失效前提前提醒天数 ，请输入数字（如：1、2、3、5、10等）"/>
    <func:checker target="ORGSIRM003" allowBlank="true" regex="^\\d+$" regexText="密码重复次数，请输入数字（如：1、2、3、5、10等）"/>
    <func:checker target="ORGSIRM004" allowBlank="true" regex="^\\d+$" regexText="密码长度，请输入数字（如：1、2、3、5、10等）"/>
    <func:checker target="ORGSIRM010" allowBlank="true" regex="^\\d+$"
                  regexText="密码输入错误次数，请输入数字（如：1、2、3、5、10等）"/>
    <func:checker target="ORGSIRM011" allowBlank="true" regex="^\\d+$" regexText="锁定周期，请输入数字（如：1、2、3、5、10等）"/>
    <func:checker target="ORGSIRM012" allowBlank="true" regex="^\\d+$"
                  regexText="账户密码输入错误次数复位时间，请输入数字（如：1、2、3、5、10等）"/>
    <func:checker target="ORGSIRM016" allowBlank="false" blankText="请输入系统管理员登录名"/>
    <func:checker target="ORGSIRM017" allowBlank="false" blankText="请输入系统管理员登录密码"/>
    <func:checker target="ORGSIRM018" allowBlank="true" regex="^^[0-4]$" regexText="4选N ，N只能输入0-4的整数"/>
</func:checkers>
</ui:form>
</sirm:body>
</html>