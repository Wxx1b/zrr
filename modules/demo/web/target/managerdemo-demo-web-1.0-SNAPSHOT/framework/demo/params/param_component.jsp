<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table class='stk_demo_table'>
  <tr><td colspan="3" align="center" style="font-size:large;font-weight:bolder;">控件公共参数</td></tr>
  <tr>
    <td width="15%"><p align="center"><strong>参数名</strong><strong> </strong></p></td>
    <td width="15%"><p align="center"><strong>默认值</strong><strong> </strong></p></td>
    <td><p align="center"><strong>说明</strong><strong> </strong></p></td>
  </tr>
  <tr>
    <td><p>id</p></td>
    <td><p>&nbsp;</p></td>
    <td><p>控件唯一标识，不填的话就自动生成uuid作为id</p></td>
  </tr>
  <tr>
    <td><p>name</p></td>
    <td><p>&nbsp;</p></td>
    <td><p>控件name</p></td>
  </tr>
  <tr>
    <td><p>key</p></td>
    <td><p>&nbsp;</p></td>
    <td><p>struts2的key</p></td>
  </tr>
  <tr>
    <td><p>*themeName</p></td>
    <td><p>defalut</p></td>
    <td><p>自定义其它主题(特殊需求时)</p></td>
  </tr>
  <tr>
    <td><p>hidden</p></td>
    <td><p>&nbsp;</p></td>
    <td><p>组件生成时是否隐藏</p></td>
  </tr>
  <tr>
    <td><p>*hideMode </p></td>
    <td><p>display</p></td>
    <td><p> 组件如何隐藏，支持的值有： &quot;visibility&quot; (css visibility), &quot;offsets&quot; (负值位置) 和 &quot;display&quot; (css display)</p></td>
  </tr>
  <tr>
    <td>*feature</td>
    <td>&nbsp;</td>
    <td>可以给组件添加额外特性，多个特性用‘,’分割</td>
  </tr>
</table>