<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<ol class="list">
  <li>ui:table参数mode='auto'时自适应宽度，列数较少时推荐使用</li>
  <li>通过IMetadbQuery查询的，所有页面用到dataVar返回的对象属性名全小写</li>
  <li>IMetadbQuery如果是Hql查询，如果有实体字段，将无法使用在表格控件</li>
  <li>如果列过多过长，可以设置tableWidth参数，比如1200px，就会出现水平滚动条</li>
  <li>如果在翻页/查询时，希望列宽不要一直变化，可以对每一个列设置width参数，比如10%或50px</li>
  <li>尽量在Action用createSqlQuery返回IMetaDBQuery对象</li>
  <li>也可以在Action返回List< Map >对象，但是目前暂将失去排序功能，而且数据量大的时候性能较差</li>
</ol>