<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table class='stk_demo_table'>
<tr>
    <td colspan="3" align="center" style="font-size:large;font-weight:bolder;">col公共参数</td>
</tr>
<tr>
    <td width="15%"><p align="center"><strong>参数名</strong><strong> </strong></p></td>
    <td width="15%"><p align="center"><strong>默认值</strong><strong> </strong></p></td>
    <td><p align="center"><strong>说明</strong><strong> </strong></p></td>
</tr>
<tr>
    <td>group</td>
    <td>&nbsp;</td>
    <td>标题分组组名</td>
</tr>
<tr>
    <td>groupTop</td>
    <td>&nbsp;</td>
    <td>标题一级分组组名</td>
</tr>
<tr>
    <td>title</td>
    <td>&nbsp;</td>
    <td>列标题</td>
</tr>
<tr>
    <td>property</td>
    <td>&nbsp;</td>
    <td>列名，对应数据对象的map的key，忽略大小写</td>
</tr>
<tr>
    <td>width</td>
    <td>&nbsp;</td>
    <td>列宽</td>
</tr>
<tr>
    <td>xlsColWIdth</td>
    <td>25</td>
    <td>导出excel列宽</td>
</tr>
<tr>
    <td>align</td>
    <td>&nbsp;</td>
    <td>单元格水平对齐, 默认center，还可选left，right</td>
</tr>
<tr>
    <td>valign</td>
    <td>&nbsp;</td>
    <td>单元格垂直对齐, 默认middle，还可选top，bottom</td>
</tr>
<tr>
    <td>allowSort</td>
    <td>true</td>
    <td>该列是否允许排序，前提是设置了property参数</td>
</tr>
<tr>
    <td>maxWords</td>
    <td>&nbsp;</td>
    <td>最长文字长度，超过的话用...表示</td>
</tr>
<tr>
    <td>fixed</td>
    <td>&nbsp;</td>
    <td>固定列（固定列表格专用）,忽略用户自定义配置列，一定在最左</td>
</tr>
<tr>
    <td>filter</td>
    <td>&nbsp;</td>
    <td>是否过滤掉html标签，默认false</td>
</tr>
<tr>
    <td>show</td>
    <td>true</td>
    <td>是否显示该列，不管是否显示，显示明细时一定显示</td>
</tr>
<tr>
    <td>beforeText</td>
    <td>&nbsp;</td>
    <td>前缀文本</td>
</tr>
<tr>
    <td>afterText</td>
    <td>&nbsp;</td>
    <td>后缀文本</td>
</tr>
<tr>
    <td>plugin</td>
    <td>&nbsp;</td>
    <td>插件名,可逗号隔开显示多个</td>
</tr>
<tr>
    <td>nowrap</td>
    <td>false</td>
    <td>列是否不换行</td>
</tr>
<tr>
    <td>allowTip</td>
    <td>false</td>
    <td>是否用tip提示数据</td>
</tr>
<tr>
    <td>allowExport</td>
    <td>&nbsp;</td>
    <td>该列是否导出</td>
</tr>
<tr>
    <td>allowDetail</td>
    <td>&nbsp;</td>
    <td>该列是否显示明细</td>
</tr>
<tr>
    <td>mergeCol</td>
    <td>false</td>
    <td>默认false，是否合并相同内容的邻近列</td>
</tr>
<tr>
    <td colspan="3" align="center" style="font-size:large;font-weight:bolder;">colNumber参数</td>
</tr>
<tr>
    <td>pointPlace</td>
    <td>0</td>
    <td>小数位</td>
</tr>
<tr>
    <td>isMoney</td>
    <td>&nbsp;</td>
    <td>是否金额(小数强制保留两位而且有千分符)</td>
</tr>
<tr>
    <td>collect</td>
    <td>&nbsp;</td>
    <td>分类汇总，当table配置allowCollect有效
        汇总方式：oracle的汇总函数，比如 AVG,COUNT,MAX,MIN,SUM(多个用,隔开)，比如AVG,COUNT
    </td>
</tr>
<tr>
    <td colspan="3" align="center" style="font-size:large;font-weight:bolder;">colDate参数</td>
</tr>
<tr>
    <td>format</td>
    <td>yyyy-MM-dd</td>
    <td>日期格式<br>
        如果数据库是字符串或数字，会智能判断
    </td>
</tr>
<tr>
    <td colspan="3" align="center" style="font-size:large;font-weight:bolder;">colEnum参数</td>
</tr>
<tr>
    <td>format</td>
    <td>info</td>
    <td>枚举格式<br>
        还有：name,info,value,displayValue对应枚举类的enumItemName，enumItemInfo，enumItemValue，enumItemDisplayValue<br>
        举例："value - info" 页面显示 "0 - 普通"
    </td>
</tr>
<tr>
    <td colspan="3" align="center" style="font-size:large;font-weight:bolder;">colEntity参数</td>
</tr>
<tr>
    <td>entityName</td>
    <td>&nbsp;</td>
    <td>目标实体名</td>
</tr>
<tr>
    <td>foreignProperty</td>
    <td>&nbsp;</td>
    <td>目标关联字段名</td>
</tr>
<tr>
    <td>format</td>
    <td>&nbsp;</td>
    <td>目标实体显示格式<br>
        格式： 用{Property}表示<br>
        举例：<br>
        {name}:{age}岁 页面显示 XXX:25岁
    </td>
</tr>
<tr>
    <td colspan="3" align="center" style="font-size:large;font-weight:bolder;">colForeign参数</td>
</tr>
<tr>
    <td>tableName</td>
    <td>&nbsp;</td>
    <td>目标表名</td>
</tr>
<tr>
    <td>columnName</td>
    <td>&nbsp;</td>
    <td>目标外键关联表的列名</td>
</tr>
<tr>
    <td>format</td>
    <td>&nbsp;</td>
    <td>目标显示格式<br>
        格式： 用{columnName}表示<br>
        举例：<br>
        {name}:{age}岁 页面显示 XXX:25岁
    </td>
</tr>
<tr>
    <td colspan="3" align="center" style="font-size:large;font-weight:bolder;">colCust参数</td>
</tr>
<tr>
    <td>clazz</td>
    <td>table的actionClass</td>
    <td>自定义类名，默认是表格控件类</td>
</tr>
<tr>
    <td>method</td>
    <td>&nbsp;</td>
    <td>自定义方法名
        方法定义规则：public static XXX methodName(Map data)
    </td>
</tr>
</table>