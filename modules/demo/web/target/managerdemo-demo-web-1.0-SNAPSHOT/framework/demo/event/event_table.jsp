<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table class='stk_demo_table'>
    <tr>
        <td colspan="3" align="center" style="font-size:large;font-weight:bolder;">表格事件</td>
    </tr>
    <tr>
        <td width="15%"><p align="center"><strong>事件</strong><strong> </strong></p></td>
        <td><p align="center"><strong>说明</strong><strong> </strong></p></td>
    </tr>

    <tr>
        <td>beforetablequery</td>
        <td>当查询数据前触发</td>
    </tr>
    <tr>
        <td>aftertablequery</td>
        <td>当查询数据后触发</td>
    </tr>
    <tr>
        <td>beforetableinit</td>
        <td>当表格生成前触发（仅用于ui:tablefix）</td>
    </tr>
    <tr>
        <td>aftertableinit</td>
        <td>当表格生成后触发（仅用于ui:tablefix）</td>
    </tr>
    <tr>
        <td>ontableclick</td>
        <td>当行单击时触发</td>
    </tr>
    <tr>
        <td>ontabledbclick</td>
        <td>当行双击时触发</td>
    </tr>
    <tr>
        <td>ontabledorder</td>
        <td>当点击排序时触发</td>
    </tr>
    <tr>
        <td>*onrowrightclick</td>
        <td>当行右键时触发</td>
    </tr>
</table>