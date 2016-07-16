<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<ol class="list">
  <li><b>plugin:colCheckbox 该列是复选框组，用来多选数据行，一般放在最左列,body体里是onclick的函数</b><br>
  id - 插件id， name - 复选框name， checkedVar - checkbox是否选中var， dataVar - 该行数据， selectAll - 是否需要全选， allowCache - 是否支持翻页保留勾选
  </li>
  <li><b>plugin:colRadiokbox 该列是单选框组，用来多选数据行，一般放在最左列,body体里是onclick的函数</b><br>
  id - 插件id， name - 复选框name， checkedVar - radiobox是否选中var， dataVar - 该行数据
  </li>
  <li><b>plugin:colButton 该列是按钮,body体里是onclick的函数</b><br>
  id - 插件id， text - 按钮文本， dataVar - 该行数据
  </li>
  <li><b>plugin:colLink 该列是超链接,body体里是onclick的函数</b><br>
  id - 插件id， text - 按钮文本， dataVar - 该行数据
  </li>
  <li><b>plugin:colRowNum 该列是行编号</b><br>
  id - 插件id
  </li>
</ol>