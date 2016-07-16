<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>模板 - 按钮</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<div style="width:510px">
<div>
<table class="stk-form-ui-st1">
    <tr>
    <td class="hd" width="80">上级菜单</td>
    <td class="bd" width="auto"><span>投研业务>></span>客户管理</td>
    </tr>
    <tr>
    <td class="hd" width="80">名称<em>*</em></td>
    <td class="bd" width="auto"><input type="text" class="stk-input w180"></td>
    </tr>
    <tr>
    <td class="hd" width="80">URL</td>
    <td class="bd" width="auto"><input type="text" class="stk-input w180"></td>
    </tr>
    <tr>
    <td class="hd" width="80">顺序<em>*</em></td>
    <td class="bd" width="auto"><input type="text" class="stk-input w20"><span class="asi-note">&nbsp;请填写数字</span></td>
    </tr>
	<tr>
    <td class="hd" width="80">描述</td>
    <td class="bd" width="auto"><textarea class="stk-textarea w320 h80"></textarea></td>
    </tr>
    <tr>
    <td class="hd" width="80">日期<em>*</em></td>
    <td class="bd" width="auto">
    <div style="clear:both" class="stk-date-search" >
    <div class="stk-date-aside">
        <div class="stk-ui-icon stk-date-aside-icon"></div>
    </div>
    <input type="text" class="stk-date-search-input" style="width:150px">
</div></td>
    </tr>
    <tr class="btn-bar">
    	<td class="hd"></td>
        <td class="bd">
        <button class="stk-button stk-ext-button">继续新增</button>&nbsp;&nbsp;<button class="stk-button stk-ext-button">保存并关闭</button>&nbsp;&nbsp;<button class="stk-button stk-ext-button">直接关闭</button>
        </td>
    </tr>
</table>
</div>
</div>

<p></p>
<pre>
&lt;div <b>style="width:510px"</b>&gt;<font color="red">通过style方式指定查询区域的宽度</font>
&lt;div&gt;
&lt;table <b>class="stk-form-ui-st1"</b>&gt;<font color="red">table的样式必须是stk-form-ui-st1</font>
    &lt;tr&gt;
    &lt;td <b>class="hd"</b> <b>width="80"</b>&gt;上级菜单&lt;/td&gt;<font color="red">指定Label宽度,Label的样式必须是hd</font>
    &lt;td <b>class="bd"</b> <b>width="auto"</b>&gt;&lt;span&gt;投研业务&gt;&gt;&lt;/span&gt;客户管理&lt;/td&gt;<font color="red">宽度为auto(自动计算剩余宽度),样式必须是bd</font>
    &lt;/tr&gt;
    &lt;tr&gt;
    &lt;td class="hd" width="80"&gt;名称&lt;em&gt;*&lt;/em&gt;&lt;/td&gt;<font color="red">需要用&lt;em&gt;*&lt;/em&gt;做必填项标识</font>
    &lt;td class="bd" width="auto"&gt;&lt;input type="text" class="stk-input w180"&gt;&lt;/td&gt;<font color="red">使用控件，如果是js渲染，那么input[type="text"]的输入框的样式必须是stk-input</font>
    &lt;/tr&gt;
    &lt;tr&gt;
    &lt;td class="hd" width="80"&gt;URL&lt;/td&gt;
    &lt;td class="bd" width="auto"&gt;&lt;input type="text" class="stk-input w180"&gt;&lt;/td&gt;
    &lt;/tr&gt;
    &lt;tr&gt;
    &lt;td class="hd" width="80"&gt;顺序&lt;em&gt;*&lt;/em&gt;&lt;/td&gt;
    &lt;td class="bd" width="auto"&gt;&lt;input type="text" class="stk-input w20"&gt;&lt;span class="asi-note"&gt;&nbsp;请填写数字&lt;/span&gt;&lt;/td&gt;
    &lt;/tr&gt;
	&lt;tr&gt;
    &lt;td class="hd" width="80"&gt;描述&lt;/td&gt;
    &lt;td class="bd" width="auto"&gt;&lt;textarea class="stk-textarea w320 h80"&gt;&lt;/textarea&gt;&lt;/td&gt;<font color="red">使用控件，如果是js渲染，那么textarea样式必须是stk-textarea</font>
    &lt;/tr&gt;
    &lt;tr&gt;
    &lt;td class="hd" width="80"&gt;日期&lt;em&gt;*&lt;/em&gt;&lt;/td&gt;<font color="red">使用日期控件</font>
    &lt;td class="bd" width="auto"&gt;
    &lt;div style="clear:both" class="stk-date-search" &gt;
    &lt;div class="stk-date-aside"&gt;
        &lt;div class="stk-ui-icon stk-date-aside-icon"&gt;&lt;/div&gt;
    &lt;/div&gt;
    &lt;input type="text" class="stk-date-search-input" style="width:150px"&gt;
&lt;/div&gt;&lt;/td&gt;
    &lt;/tr&gt;
    &lt;tr class="btn-bar"&gt;<font color="red">使用btn-bar按钮组样式</font>
    	&lt;td class="hd"&gt;&lt;/td&gt;
        &lt;td class="bd"&gt;
        &lt;button class="stk-button stk-ext-button"&gt;继续新增&lt;/button&gt;&nbsp;&nbsp;&lt;button class="stk-button stk-ext-button"&gt;保存并关闭&lt;/button&gt;&nbsp;&nbsp;&lt;button class="stk-button stk-ext-button"&gt;直接关闭&lt;/button&gt;
        &lt;/td&gt;
    &lt;/tr&gt;
&lt;/table&gt;
&lt;/div&gt;
<b>
</b>
&lt;/div&gt;
</pre>
</body>
</html>