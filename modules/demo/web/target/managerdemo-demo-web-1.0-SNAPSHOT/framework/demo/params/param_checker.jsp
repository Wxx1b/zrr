<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table class='stk_demo_table'>
    <tr>
        <td colspan="3" align="center" style="font-size:large;font-weight:bolder;">checkers参数</td>
    </tr>
    <tr>
        <td width="15%"><p align="center"><strong>参数名</strong><strong> </strong></p></td>
        <td width="15%"><p align="center"><strong>默认值</strong><strong> </strong></p></td>
        <td><p align="center"><strong>说明</strong><strong> </strong></p></td>
    </tr>
    <tr>
        <td>formId</td>
        <td>&nbsp;</td>
        <td>表单的id，默认外层form的id</td>
    </tr>
    <tr>
        <td>msgTarget</td>
        <td>qtip</td>
        <td>
            出错提示文本显示的位置。 应该是下列值之一(默认值为 qtip):<br>
            Value Description<br>
            ----------- --------------------------------------------<br>
            qtip 调用Jquery.bt插件<br>
            alert 调用stk.alert<br>
            title 显示一个默认的浏览器弹出标题属性<br>
            [element id] 直接在指定元素的innerHTML中加入出错文本
        </td>
    </tr>
    <tr>
        <td>validateOnBlur</td>
        <td>true</td>
        <td>失去焦点时验证</td>
    </tr>
    <tr>
        <td>oneByOne</td>
        <td>false</td>
        <td>是否一个个检查，在msgTarget为alert时强制true</td>
    </tr>
    <tr>
        <td>alertOnFalse</td>
        <td>true</td>
        <td>是否检查出错时弹出alert</td>
    </tr>
    <tr>
    <td colspan="3" align="center" style="font-size:large;font-weight:bolder;">checker参数</td></tr>
  <tr>
    <tr>
        <td>target</td>
        <td>&nbsp;</td>
        <td>目标id或Name,name优先</td>
    </tr>
    <tr>
        <td>targetName</td>
        <td>&nbsp;</td>
        <td>目标名称，一般为中文</td>
    </tr>
    <tr>
        <td>allowBlank</td>
        <td>true</td>
        <td>如果是false,就是不允许空</td>
    </tr>
    <tr>
        <td>blankText</td>
        <td>&nbsp;</td>
        <td>假如不为空时，定义提示信息</td>
    </tr>
    <tr>
        <td>msgTarget</td>
        <td>&nbsp;</td>
        <td>单独设置msgTarget，同checker</td>
    </tr>
    <tr>
        <td>maxLength</td>
        <td>&nbsp;</td>
        <td>最大长度</td>
    </tr>
    <tr>
        <td>maxLengthText</td>
        <td>&nbsp;</td>
        <td>超出最大长度的设置信息</td>
    </tr>
    <tr>
        <td>minLength</td>
        <td>&nbsp;</td>
        <td>最小长度</td>
    </tr>
    <tr>
        <td>minLengthText</td>
        <td>&nbsp;</td>
        <td>没有达到最小长度的设置信息</td>
    </tr>
    <tr>
        <td>regexText</td>
        <td>&nbsp;</td>
        <td>定义不符合正则表达式的提示信息</td>
    </tr>
    <tr>
        <td>regex</td>
        <td>&nbsp;</td>
        <td>正则表达式，不满足就会出现提示信息<br>
                比如<br>
                1) Email：^(?:\w+\.?)*\w+@(?:\w+\.?)*\w+$<br>
                2) 纯数字：^[0-9]*$<br>
                3) 邮编：^[0-9]{6}$</td>
    </tr>
    <tr>
        <td>validateOnBlur</td>
        <td>true</td>
        <td>失去焦点时验证</td>
    </tr>
    <tr>
        <td>validator</td>
        <td>&nbsp;</td>
        <td>自定义验证，如果合法返回true</td>
    </tr>
</table>