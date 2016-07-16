<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table class='stk_demo_table'>
    <tr>
        <td colspan="3" align="center" style="font-size:large;font-weight:bolder;">表格函数</td>
    </tr>
    <tr>
        <td width="30%"><p align="center"><strong>函数</strong><strong> </strong></p></td>
        <td width="20%"><p align="center"><strong>返回值</strong><strong> </strong></p></td>
        <td><p align="center"><strong>说明</strong><strong> </strong></p></td>
    </tr>
    <tr>
        <td>$(jquery).stk_init()</td>
        <td>&nbsp;</td>
        <td>调用表格的初始化</td>
    </tr>
    <tr>
        <td>$(jquery).stk_query()</td>
        <td>&nbsp;</td>
        <td>调用表格的查询，会根据查询表单当前的数据查询</td>
    </tr>
    <tr>
        <td>$(jquery).stk_jump(param)</td>
        <td>&nbsp;</td>
        <td>调用表格的页面跳转，param - 第几页</td>
    </tr>
    <tr>
        <td>$(jquery).stk_collectData()</td>
        <td>&nbsp;</td>
        <td>返回汇总数据（可用stk.debug()查看返回对象）</td>
    </tr>
    <tr>
        <td>$(jquery).stk_removeRow(objid)</td>
        <td>&nbsp;</td>
        <td>删除行</td>
    </tr>
    <tr>
        <td>$(jquery).stk_detail(objid)</td>
        <td>&nbsp;</td>
        <td>显示该行详细</td>
    </tr>
</table>