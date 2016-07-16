<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table class='stk_demo_table'>
  <tr><td colspan="3" align="center" style="font-size:large;font-weight:bolder;">表单控件公共函数</td></tr>
  <tr>
    <td width="30%"><p align="center"><strong>函数</strong><strong> </strong></p></td>
    <td width="20%"><p align="center"><strong>返回值</strong><strong> </strong></p></td>
    <td><p align="center"><strong>说明</strong><strong> </strong></p></td>
  </tr>
  <tr>
    <td>$(jquery).stk_submit(callBack)</td>
    <td>&nbsp</td>
    <td>表单提交，调用clazz的method. callBack - function(result){}</td>
  </tr>
  <tr>
    <td>$(jquery).stk_submit(method, callBack)</td>
    <td>&nbsp</td>
    <td>表单提交，method - 指定的方法名. callBack - function(result){}</td>
  </tr>
  <tr>
    <td>$(jquery).stk_reset()</td>
    <td>&nbsp;</td>
    <td>重置表单</td>
  </tr>
  <tr>
    <td>$(jquery).stk_checkForm(ignor[选填])</td>
    <td>&nbsp;</td>
    <td>检查表单 ignor是数组，存放不需要检查的checker target</td>
  </tr>
</table>