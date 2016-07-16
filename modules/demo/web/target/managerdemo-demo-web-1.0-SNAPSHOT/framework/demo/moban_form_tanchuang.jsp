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
<layout:window autoOpen="true" width="500px">
<div style="width:100%">
<div>
<table class="stk-form-ui-st1">
    <tr>
    <td class="hd" width="80">上级菜单</td>
    <td class="bd" width="auto"><span>投研业务>></span>客户管理</td>
    </tr>
    <tr>
    <td class="hd" width="80">名称</td>
    <td class="bd" width="auto">推荐交流</td>
    </tr>
    <tr>
    <td class="hd" width="80">URL</td>
    <td class="bd" width="auto">/CRM/DEMO.JSP</td>
    </tr>
    <tr>
    <td class="hd" width="80">顺序</td>
    <td class="bd" width="auto">0</td>
    </tr>
	<tr>
    <td class="hd" width="80">描述</td>
    <td class="bd" width="auto">适合将所有交流信息放置于此，可对此进行新增编辑等操作。</td>
    </tr>
    <tr class="btn-bar">
        <td class="hd"></td>
        <td class="bd">
            <button class="stk-button stk-ext-button">关闭</button>
        </td>
    </tr>
</table>
</div>
</div>
</layout:window>
<pre>
&lt;layout:window autoOpen="true" width="500px"&gt;
&lt;div style="width:100%"&gt;
&lt;div&gt;
&lt;table <b><font color="red">class="stk-form-ui-st1"</font></b>&gt;
    &lt;tr&gt;
    &lt;td <b><font color="red">class="hd"</font></b> width="80"&gt;上级菜单&lt;/td&gt;
    &lt;td <b><font color="red">class="bd"</font></b> width="auto"&gt;&lt;span&gt;投研业务&gt;&gt;&lt;/span&gt;客户管理&lt;/td&gt;
    &lt;/tr&gt;
    &lt;tr&gt;
    &lt;td class="hd" width="80"&gt;名称&lt;/td&gt;
    &lt;td class="bd" width="auto"&gt;推荐交流&lt;/td&gt;
    &lt;/tr&gt;
    &lt;tr&gt;
    &lt;td class="hd" width="80"&gt;URL&lt;/td&gt;
    &lt;td class="bd" width="auto"&gt;/CRM/DEMO.JSP&lt;/td&gt;
    &lt;/tr&gt;
    &lt;tr&gt;
    &lt;td class="hd" width="80"&gt;顺序&lt;/td&gt;
    &lt;td class="bd" width="auto"&gt;0&lt;/td&gt;
    &lt;/tr&gt;
    &lt;tr&gt;
    &lt;td class="hd" <b><font color="red">width="80"</font></b>&gt;描述&lt;/td&gt;
    &lt;td class="bd" <b><font color="red">width="auto"</font></b>&gt;适合将所有交流信息放置于此，可对此进行新增编辑等操作。&lt;/td&gt;
    &lt;/tr&gt;
&lt;/table&gt;
&lt;/div&gt;
&lt;div style="padding:10px 0 0 150px"&gt;
    &lt;button class="stk-button stk-ext-button"&gt;关闭&lt;/button&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/layout:window&gt;
</pre>
</body>
</html>