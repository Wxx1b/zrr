<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table class='stk_demo_table'>
    <tr>
        <td colspan="3" align="center" style="font-size:large;font-weight:bolder;">文本输入栏参数</td>
    </tr>
    <tr>
        <td width="15%"><p align="center"><strong>参数名</strong><strong> </strong></p></td>
        <td width="15%"><p align="center"><strong>默认值</strong><strong> </strong></p></td>
        <td><p align="center"><strong>说明</strong><strong> </strong></p></td>
    </tr>
    <tr>
        <td>defaultValue</td>
        <td>&nbsp;</td>
        <td>初始时文本</td>
    </tr>
    <tr>
        <td>emptyText</td>
        <td>&nbsp;</td>
        <td>显示在空输入栏中的默认文本</td>
    </tr>
    <tr>
        <td>*grow</td>
        <td>false</td>
        <td>输入栏将自动增长并缩短其内容</td>
    </tr>
    <tr>
        <td>*growMax</td>
        <td>100</td>
        <td>当grow配置项为true时，允许输入的最大长度</td>
    </tr>
    <tr>
        <td>*growMin</td>
        <td>1</td>
        <td>当grow配置项为true时，允许输入的最小长度</td>
    </tr>
    <tr>
        <td>*mask</td>
        <td>&nbsp;</td>
        <td>掩码类型(number, alphabet 等) 于过滤不匹配的按键</td>
    </tr>
    <tr>
        <td>*maskConfig</td>
        <td>&nbsp;</td>
        <td>在 mask 被设定时，这里可以进行详细设置，比如 mask=”number”,这里可以设置 2表示 2位小数</td>
    </tr>
    <tr>
        <td>maxLength</td>
        <td>&nbsp;</td>
        <td>输入最大长度</td>
    </tr>
    <tr>
        <td>selectOnFocus</td>
        <td>false</td>
        <td>如果为 true，当输入栏获得焦点时将自动选中其中的文本</td>
    </tr>
    <tr>
        <td>type</td>
        <td>text</td>
        <td>可选：text,password,file</td>
    </tr>
    <tr>
        <td>textAlign</td>
        <td>&nbsp;</td>
        <td>文字对齐方式：left,right</td>
    </tr>
    <tr>
        <td>icon</td>
        <td>&nbsp;</td>
        <td>配置图标，用法和按钮图标一致</td>
    </tr>
    <tr>
        <td>areaEdit</td>
        <td>false</td>
        <td>是否可用textArea编辑</td>
    </tr>
    <tr>
        <td>areaRows</td>
        <td>5</td>
        <td>areaEdit为true时的行数</td>
    </tr>
    <tr>
        <td>areaWidth</td>
        <td>300px</td>
        <td>areaEdit为true时的宽度</td>
    </tr>
    <tr>
        <td>passwordStrength</td>
        <td>false</td>
        <td>为true,开启密码强度检查</td>
    </tr>
</table>