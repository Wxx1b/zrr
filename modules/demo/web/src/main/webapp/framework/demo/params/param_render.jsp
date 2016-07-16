<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table class='stk_demo_table'>
    <tr>
        <td colspan="3" align="center" style="font-size:large;font-weight:bolder;">stk_render()参数</td>
    </tr>
    <tr>
        <td width="15%"><p align="center"><strong>参数名</strong><strong> </strong></p></td>
        <td width="15%"><p align="center"><strong>必填</strong><strong> </strong></p></td>
        <td><p align="center"><strong>说明</strong><strong> </strong></p></td>
    </tr>
    <tr>
        <td>参数1</td>
        <td>是</td>
        <td>控件名称，取ui:后面名字，注意大小写</td>
    </tr>
    <tr>
        <td>参数2</td>
        <td>可选</td>
        <td>控件参数，类型{}, 完全匹配标签参数名，但只支持传递String类型</td>
    </tr>
    <tr>
        <td>参数3</td>
        <td>可选</td>
        <td>当控件被成功渲染后，执行的函数，比如在这里给控件附上事件</td>
    </tr>
</table>