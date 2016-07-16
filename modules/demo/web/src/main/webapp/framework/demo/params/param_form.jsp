<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table class='stk_demo_table'>
  <tr>
    <td colspan="3" align="center" style="font-size:large;font-weight:bolder;">表单参数</td></tr>
  <tr>
    <td width="15%"><p align="center"><strong>参数名</strong><strong> </strong></p></td>
    <td width="15%"><p align="center"><strong>默认值</strong><strong> </strong></p></td>
    <td><p align="center"><strong>说明</strong><strong> </strong></p></td>
  </tr>
  <tr>
    <td>clazz</td>
    <td>&nbsp;</td>
    <td>类名,比如com.sinitek.xxx.xxx</td>
  </tr>
  <tr>
    <td>method</td>
    <td>&nbsp;</td>
    <td>方法名<br>
        当allowFileUpload = false,规则：public static String methodName(Map< String,String > param, HttpServletRequest request)<br>
        当allowFileUpload = true,规则：public static String methodName(Map< String,String > param,Map< String, FileTransfer[] > file, HttpServletRequest request)<br>
    </td>
  </tr>
  <tr>
    <td>allowFileUpload</td>
    <td>false</td>
    <td>表单是否有文件上传</td>
  </tr>
    <tr>
    <td>action</td>
    <td>#</td>
    <td>表单action</td>
  </tr>
    <tr>
    <td>actionMethod</td>
    <td>post</td>
    <td>表单action的method，还可选get</td>
  </tr>
  <tr>
      <td>htmlConvertIgnore</td>
      <td>&nbsp;</td>
      <td>html标记转换忽略列表，存放name或id，多个用,分割</td>
  </tr>
</table>