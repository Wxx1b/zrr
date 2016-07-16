<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table class='stk_demo_table'>
  <tr>
    <td colspan="3" align="center" style="font-size:large;font-weight:bolder;">自动填充栏参数</td></tr>
  <tr>
    <td width="15%"><p align="center"><strong>参数名</strong><strong> </strong></p></td>
    <td width="15%"><p align="center"><strong>默认值</strong><strong> </strong></p></td>
    <td><p align="center"><strong>说明</strong><strong> </strong></p></td>
  </tr>
  <tr>
    <td>clazz</td>
    <td>&nbsp;</td>
    <td>类名,实现IAutoCompleteAware接口</td>
  </tr>
  <tr>
    <td>delay</td>
    <td>50</td>
    <td>延迟加载时间(毫秒)</td>
  </tr>
  <tr>
    <td>jsParam</td>
    <td>&nbsp;</td>
    <td>额外传入的js Map参数</td>
  </tr>
    <tr>
    <td>minChars</td>
    <td>1</td>
    <td>最小输入多少长度开始查询</td>
  </tr>
    <tr>
    <td>maxNum</td>
    <td>100</td>
    <td>最大显示数据数量</td>
  </tr>
    <tr>
    <td>selectWidth</td>
    <td>300</td>
    <td>弹出式选择框宽度</td>
  </tr>
    <tr>
    <td>showId</td>
    <td>false</td>
    <td>是否显示id</td>
  </tr>
    <tr>
    <td>scrollHeight</td>
    <td>150</td>
    <td>滚动高度</td>
  </tr>
    <tr>
    <td>interactFunction</td>
    <td>&nbsp;</td>
    <td>选中后调用的函数function name(data)</td>
  </tr>
    <tr>
    <td>showOnFocus</td>
    <td>false</td>
    <td>聚焦时是否触发下拉</td>
  </tr>
</table>