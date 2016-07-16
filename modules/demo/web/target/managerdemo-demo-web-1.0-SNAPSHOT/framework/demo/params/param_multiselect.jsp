<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table class='stk_demo_table'>
    <tr>
        <td colspan="3" align="center" style="font-size:large;font-weight:bolder;">下拉选择框参数</td>
    </tr>
    <tr>
        <td width="15%"><p align="center"><strong>参数名</strong><strong> </strong></p></td>
        <td width="15%"><p align="center"><strong>默认值</strong><strong> </strong></p></td>
        <td><p align="center"><strong>说明</strong><strong> </strong></p></td>
    </tr>
    <tr>
        <td>list</td>
        <td>&nbsp;</td>
        <td>struts2对象比如#attr.xxxx</td>
    </tr>
    <tr>
        <td>listKey</td>
        <td>&nbsp;</td>
        <td>按照list里的元素的设定key</td>
    </tr>
    <tr>
        <td>listValue</td>
        <td>false</td>
        <td>按照list里的元素的设定value</td>
    </tr>
    <tr>
        <td>width</td>
        <td>&nbsp;</td>
        <td>弹出层宽度</td>
    </tr>
    <tr>
        <td>textWidth</td>
        <td>&nbsp;</td>
        <td>文本框宽度</td>
    </tr>
    <tr>
        <td>columnWidth</td>
        <td>&nbsp;</td>
        <td>列宽度，按照组宽度，放不下换行</td>
    </tr>
    <tr>
        <td>columnHeight</td>
        <td>&nbsp;</td>
        <td>列高度</td>
    </tr>
    <tr>
        <td>direction</td>
        <td>默认bottom</td>
        <td>弹出层位置，其它可选top</td>
    </tr>
    <tr>
        <td>defaultValue</td>
        <td>&nbsp;</td>
        <td>初始时选中的值string/array</td>
    </tr>
    <tr>
        <td>interactAction</td>
        <td>&nbsp;</td>
        <td>联动时使用，配置action的类。比如com.sinitek.xxxAction</td>
    </tr>
    <tr>
        <td>interactId</td>
        <td>&nbsp;</td>
        <td>联动时使用,被联动的对象Id</td>
    </tr>
</table>