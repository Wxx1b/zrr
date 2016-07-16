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
<div class="rep-alert-top">
    	<span class="con">您有&nbsp;&nbsp;<a href="#">6条新闻为查看</a></span>
        <span class="opt"><a class="o-l" href="javascript:void(0);"></a><a class="o-r" href="javascript:void(0);"></a></span>
    </div>
<div class="report-in-all">
    <div>
    	<table class="stk-form-ui-st1">
        <tr>
            <td class="hd" width="110"><label>标题</label></td>
            <td class="bd" width="auto">推荐交流</td>
        </tr>
        <tr>
            <td class="hd"><label>副标题</label></td>
            <td class="bd">推荐交流之应用实践</td>
        </tr>
        <tr>
            <td class="hd"><label>报告作者</label></td>
            <td class="bd">
            李刚 10%，李刚 10%，李刚 10%，李刚 10%，李刚 10%
            </td>
        </tr>
        <tr>
            <td class="hd"><label>报告署名作者</label></td>
            <td class="bd">
            郭子
            </td>
        </tr>
        <tr>
            <td class="hd"><label>报告摘要</label></td>
            <td class="bd">报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要</td>
        </tr>
         <tr>
            <td class="hd"><label>短信摘要</label></td>
            <td class="bd">报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要</td>
        </tr>
        <tr>
        	<td colspan="2">
            <table class="w100p">
            	<tr>
                	<td class="hd" width="110"><label>文档密级<em>*</em></label></td>
                    <td class="bd" width="200">无</td>
                    <td class="hd" width="110"><label>文档重要程度<em>*</em></label></td>
                    <td class="bd">
                    <div>
                    <div id="J_starts" class="stk-starts-ui fl">
                    <b class="b-s b-sc"></b>
                    <b class="b-s b-sc"></b>
                    <b class="b-s b-sc"></b>
                    <b class="b-s b-sc"></b>
                    <b class="b-s b-sc"></b>
                    </div>
                    </div>

                    </td>
                </tr>
            </table>
            </td>
        </tr>
        <tr>
            <td class="hd"><label>上传文件</label></td>
            <td class="bd"><div class="file-item">文件1</div></td>
        </tr>
        <tr class="btn-bar">
        <td class="hd"></td>
        <td class="bd">
            <button class="stk-button stk-ext-button">返回</button>
        </td>
    </tr>
</table>
    </div>
</div>
<p></p>
<pre>
&lt;div <b>class="report-in-all"</b>&gt;<font color="red">指定div样式report-in-all用于四周留白</font>
    &lt;div&gt;
    	&lt;table <b><font color="red">class="stk-form-ui-st1"</font></b>&gt;
        &lt;tr&gt;
            &lt;td <b><font color="red">class="hd"</font></b> width="110"&gt;&lt;label&gt;标题&lt;/label&gt;&lt;/td&gt;
            &lt;td <b><font color="red">class="bd"</font></b> <b><font color="red">width="auto"</font></b>&gt;推荐交流&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;td class="hd"&gt;&lt;label&gt;副标题&lt;/label&gt;&lt;/td&gt;
            &lt;td class="bd"&gt;推荐交流之应用实践&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;td class="hd"&gt;&lt;label&gt;报告作者&lt;/label&gt;&lt;/td&gt;
            &lt;td class="bd"&gt;
            李刚 10%，李刚 10%，李刚 10%，李刚 10%，李刚 10%
            &lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;td class="hd"&gt;&lt;label&gt;报告署名作者&lt;/label&gt;&lt;/td&gt;
            &lt;td class="bd"&gt;
            郭子
            &lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;td class="hd"&gt;&lt;label&gt;报告摘要&lt;/label&gt;&lt;/td&gt;
            &lt;td class="bd"&gt;报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要&lt;/td&gt;
        &lt;/tr&gt;
         &lt;tr&gt;
            &lt;td class="hd"&gt;&lt;label&gt;短信摘要&lt;/label&gt;&lt;/td&gt;
            &lt;td class="bd"&gt;报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要报告摘要&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
        	&lt;td colspan="2"&gt;
            &lt;table class="w100p"&gt;
            	&lt;tr&gt;
                	&lt;td class="hd" width="110"&gt;&lt;label&gt;文档密级&lt;em&gt;*&lt;/em&gt;&lt;/label&gt;&lt;/td&gt;
                    &lt;td class="bd" width="200"&gt;无&lt;/td&gt;
                    &lt;td class="hd" width="110"&gt;&lt;label&gt;文档重要程度&lt;em&gt;*&lt;/em&gt;&lt;/label&gt;&lt;/td&gt;
                    &lt;td class="bd"&gt;
                    &lt;div&gt;
                    &lt;div id="J_starts" class="stk-starts-ui fl"&gt;
                    &lt;b class="b-s b-sc"&gt;&lt;/b&gt;
                    &lt;b class="b-s b-sc"&gt;&lt;/b&gt;
                    &lt;b class="b-s b-sc"&gt;&lt;/b&gt;
                    &lt;b class="b-s b-sc"&gt;&lt;/b&gt;
                    &lt;b class="b-s b-sc"&gt;&lt;/b&gt;
                    &lt;/div&gt;
                    &lt;/div&gt;

                    &lt;/td&gt;
                &lt;/tr&gt;
            &lt;/table&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;td class="hd"&gt;&lt;label&gt;上传文件&lt;/label&gt;&lt;/td&gt;
            &lt;td class="bd"&gt;&lt;div class="file-item"&gt;文件1&lt;/div&gt;&lt;/td&gt;
        &lt;/tr&gt;
        &lt;/table&gt;
    &lt;/div&gt;
    &lt;div class="submit-btn-bar"&gt;&lt;button class="stk-button stk-ext-button"&gt;返回&lt;/button&gt;&lt;/div&gt;
&lt;/div&gt;
</pre>
</body>
</html>