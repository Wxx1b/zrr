<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>
<html>
<head><title>欢迎使用携宁EC 新版 Spirit Web控件</title>
    <%@ include file="../include/innerHead.jsp" %>

    <style type="text/css">
        .list {
            margin-bottom: 10px;
        }

        .list li {
            padding-bottom: 10px;
        }
    </style>
</head>
<body>
<div style="font-size:x-large;">
    <b style="font-size:x-large;">Web控件，版本 3.0.1 2015-12-12</b>
    <br>很多都来不及测试，尽情谅解，欢迎提供bug详情和您的宝贵建议。<br>
    <%--<a style="font-size:x-large;" href="mailto:jw.fang@sinitek.com">请给我写信:jw.fang@sinitek.com</a>--%>
    <a style="font-size:x-large;" href="mailto:hy.ao@sinitek.com">请给我写信:hy.ao@sinitek.com</a> <br/>
    本版本是基于原 方佳伟 的web控件上所做的改进
</div>
<br>

<layout:panel title="ChangeLog">
    <layout:fieldSet title="Version:3.0.1 2015-12-12">
        <ol class="list">
            <li>
                <b>升级：</b><br>
                1）适应EC的模块化开发模式，进行web控件升级<br>
                2）很多功能废弃了，所以对功能树进行重新排版<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:2.1.2 2013-10-29">
        <ol class="list">
            <li>
                <b>Bug修复：</b><br>
                1）由于上一个版本的调整，修复表格控件在排序时，排序箭头换行的bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:2.1.1 2013-09-27">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）增加第三方控件select2<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）也不算bug，struts2升级后，list相关控件传入数据为空字符串也能兼容这个错误<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:2.1.0 2013-09-22">
        <ol class="list">
            <li>yihou
                <b>功能加强：</b><br>
                1）文本输入栏增加密码强度功能，详情见：表单类控件->文本输入栏<br>
                2）复选框增加额外样式，详情见：表单类控件-> 复/单选框<br>
                3）增加第三方控件：右键菜单，详情见：第三方控件->右键菜单<br>
                4）日期控件增加参数minuteStep, 默认5, 分钟步进间隔<br>
                5）表格控件列，新增xlsColWidth, 设置了就能设置导出excel的列宽，默认25<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:2.0.2 2013-09-16">
        <ol class="list">
            <li>
                <b>Bug修复：</b><br>
                1）修复分类选择器重复ID的bug<br>
                2）修复第三方控件poshy-tip一个bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:2.0.1 2013-09-12">
        <ol class="list">
            <li>
                <b>Bug修复：</b><br>
                1）修复升级到新版struts2，有时候报错list.keyValue为空的错误<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:2.0.0 2013-09-03">
        <ol class="list">
            <li>
                <b>静态模板：</b><br>
                1）储备项目页面<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）增加信息提示控件，调用方式stk.message(param,option), 详情见：布局类控件->信息提示框<br>
                2）增加进度条控件，ui:progressBar, 详情见：数据类控件->进度条<br>
                3）增加浮动控件，调用方式$(jquery).stk_float(options), 详情见：布局类控件->浮动层<br>
                4）增加第三方控件：浮动树多选，详情见：第三方控件->浮动树多选<br>
                5）增加第三方控件使用说明<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.8.0 2013-08-09">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）requestData对象功能加强<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复firefox下keydown事件无效bug<br>
                2）修复ui:button设置disabled为true样式无变化的bug<br>
                3）修复某些浏览器，表格标题过长会换行的bug
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.7.5 2013-07-15">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）ui:multiselect 多选控件改进，点击文字也能选中复选框<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.7.4 2013-07-08">
        <ol class="list">
            <li>
                <b>静态模板：</b><br>
                1）新增外部报告查询列表<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.7.3 2013-07-05">
        <ol class="list">
            <li>
                <b>Bug修复：</b><br>
                1）修复表格控件2人同时对同一表格导出，可能会覆盖的bug<br>
                2）修复日期控件缺少2个小图标的bug<br>
                3）修复多行输入框在IE8下，行数太多之后光标错乱bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.7.2 2013-06-25">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）代码重构，部分代码写法改善提高性能
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）新增update控件的不同样式<br>
                2) 解决select在ie8下立体的问题<br>
                3）解决IE10下图表控件错位bug<br>
                4) 修复ui:select 当multiple=true时显示一行的bug
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.7.1 2013-05-27">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）自动填充栏控件下拉列表文字不换行，并有tip提示
                2）如果表格控件有排序，那表格控件导出excel也一样
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复IE10的表格控件纵向滚动条遮住文字<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.7.0 2013-05-15">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）表格控件增加参数faster,如果为true，提速50%.但失去stk_info().data功能，而且aftertableQuery事件也不稳定
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.6.6 2013-04-16">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）表格控件导出excel增加exportMaxRow参数<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复表格控件网格线对齐bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.6.5 2013-03-13">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）表格控件导出excel支持列合并<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.6.4 2013-03-05">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）tablefix控件增加 adjustRow参数，为true就会自动调整表格左右两部分行高一致<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.6.2 2013-02-19">
        <ol class="list">
            <li>
                <b>静态模板：</b><br>
                1）新增券商会议<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）表格控件api: stk_query,stk_init,stk_jump增加回调函数，比如 $('#tableId')stk_query(function(){...});<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.6.1 2013-02-04">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）分类选择器和字母选择器增加参数:selectAll,为true时支持全选<br>
                2）表格控件导出excel智能转换成数字列和日期列<br>
                3) 表格控件增加extraOrderBy参数，最后会自动加上这段orderby，用来解决部分问题<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）表格控件在IE8以下bug修复<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.6.0 2013-01-21">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）新增代码自动生成器，可选择一个实体或一句sql生成增删查改jsp和java代码，访问/framework/autogen/index.jsp<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复ui:colNumber 四舍五入的bug<br>
                2）修复表格控件一处样式
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.5.2 2013-01-07">
        <ol class="list">
            <li>
                <b>静态模板：</b><br>
                1）新增高级搜索输入<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）首页增加菜单查询功能<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）调整部分控件z-index避免flash上传控件影响<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.5.1 2013-01-04">
        <ol class="list">
            <li>
                <b>静态模板：</b><br>
                1）首页增加消息提示<br>
                2）增加样式 .stk-table-td-span<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）增加api: $(jquery).stk_showMenu(menuId) 用法和菜单按钮类似，支持所有元素调用<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.5.0 2012-12-20">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）stk.call和表单的stk_call 方法可以用void<br>
                2）新增控件：颜色选择器 ui:colorSelect<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.4.5 2012-12-11">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）增加api函数 $(document).stk_getParentTab() 获得父tab函数<br>
                2）个人中心增加恢复默认尺寸的功能<br>
                3）新增已读、未读图标，以及7色的重要度标签
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）css样式调整<br>
                2）去除一些IE6的专门写法<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.4.4 2012-11-27">
        <ol class="list">
            <li>
                <b>静态模板：</b><br>
                1）项目执行<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）表单检查器当表单开始输入，不提示文字<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复表格控件在IE9下错位的bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.4.3 2012-11-15">
        <ol class="list">
            <li>
                <b>Bug修复：</b><br>
                1）下拉框增加.stk-select-new样式，表单里和文字完美对齐<br>
                2）固定列表格和普通表格行高统一<br>
                3）个人中心升级可拖拽、改变大小<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.4.2 2012-10-24">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）stk_hasSelect()支持缓存模式<br>
                2）表格控件导出，勾选模式支持缓存模式<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复文件表单提交发生ConcurrentModificationException的异常<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.4.1 2012-10-16">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）表格控件新增参数 allowDuplicate如果为false则保证翻页无重复数据<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复双向选择器bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.4.0 2012-10-9">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）页面里只要写个回调函数，就能在外框tab被关闭时触发。写法：top.$( window.frameElement ).one( "close", function (){。。。})<br>
                2）layout:window 增加关闭的事件： event:onwindowclose<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）表格控件helpContent修复bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.3.0 2012-09-26">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）新增函数 $(document).stk_refreshHomeModule(objid) 刷新个人中心某个模块,详情看范例：控件API<br>
                2）更好的调整表格控件样式<br>
                3）日期控件增加showSecond参数，为false时不显示秒
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复按钮控件的disabled的样式在谷歌浏览器无效bug<br>
                2）修复固定列表格checkbox插件bug<br>
                3）修正外框挂壁tab时可能发生的bug
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.2.0 2012-09-16">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）表格控件新增api:stk_renderRow,调整表格行样式,详情看范例：控件API<br>
                2）stk_removeSelf 增加参数，详情看范例控件API
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）表格控件特定情况报错的bug修复<br>
                2）外框bug修复<br>
                3）修复固定列表格换pageSize在IE8下bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.1.5 2012-08-24">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）增加控件默认属性配置，目前支持表格列的对齐ui.table.col.align, ui.table.col.valign配在spirit-webframework.properties<br>
                2）ui:select控件增加属性allowTip,如果true，下拉每个选项鼠标上去会提示
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.1.4 2012-08-10">
        <ol class="list">
            <li>
                <b>Bug修复：</b><br>
                1）修复表格控件checkbox插件bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.1.3 2012-08-21">
        <ol class="list">
            <li>
                <b>静态模板：</b><br>
                1）更新外部报告详细页<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.1.2 2012-08-10">
        <ol class="list">
            <li>
                <b>静态模板：</b><br>
                1）新增周日程<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）固定表格如果在ipad里自动转换成普通表格<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.1.1 2012-08-08">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）表单提交为了避免','问题,java参数把第一个参数换成RequestData比如：public [static] String test(RequestData
                requestData,HttpServletRequest request)<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复框架在ipad里没有滚动条的问题<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.1.0 2012-08-06">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）表格控件新增“自定义分页”模式，详情见数据类控件->表格->自定义分页List<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.0.10 2012-08-03">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）新增stk_remove()和stk_empty()用来删除和清空控件<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复表格控件导出excel时表头有时错位的bug<br>
                2）修复页面部分css的问题<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.0.9 2012-06-27">
        <ol class="list">
            <li>
                <b>静态模板：</b><br>
                1）新增竖标签<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）表格控件导出中文文件bug<br>
                2）修复外框tab标题有特殊字符下无法关闭的bug<br>
                3）修复页面的四周没有留白，在ie兼容模式下表格的高度变得很小<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.0.8a 2012-06-13">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）新增橙色皮肤<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）部分页面在IE6下滚动条问题修复<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.0.8 2012-06-05">
        <ol class="list">
            <li>
                <b>Bug修复：</b><br>
                1）部分css样式问题修复和调整<br>
                2）修复控件defaultValue参数，会把 < > 转义的bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.0.7a 2012-05-30">
        <ol class="list">
            <li>
                <b>静态模板：</b><br>
                1）新增报告审批<br>
                2）新增报告编辑<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）表格控件tip控件换一个<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复日期控件在IE6下被选择框遮住的bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.0.7 2012-05-23">
        <ol class="list">
            <li>
                <b>静态模板：</b><br>
                1）新增基金全景图<br>
                2）更新个股全景图<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）表格控件新增合并列功能，参数mergeCol，为true开启<br>
                2）通过js判断页号等信息去设置行号宽度<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复日期控件可脚本注入的bug<br>
                2）修复字母选择器，把Q漏掉的bug<br>
                3）修正遮罩，无法遮罩全部页面的问题<br>
                4）其它样式修正<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.0.6 2012-05-16">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）取消表单数据html转义，改成将<>前后加空格<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复 event:ontabselect 在页面加载时也触发的bug<br>
                2）修复表格控件导出文件在本页面刷新的bug<br>
                3）修复表格控件tip太长会被频幕两侧遮住的bug<br>
                4）彻底解决IE浏览器多余滚动条问题<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.0.5 2012-05-10">
        <ol class="list">
            <li>
                <b>静态模板：</b><br>
                1）新增基金经理全景图<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）自动转义表单提交时的html标记，ui:form增加参数htmlConvertIgnore，设置忽略转义的控件，存放参数里的key，多个用,分割<br>
                2）表格控件新增api函数：$("tableId").stk_showCol("property") 和 $("tableId").stk_hideCol("property")
                控制表格列的显示和隐藏<br>
                3）个人中心每个小块增加一个配置按钮，通过sprt_webmodule表增加字段configFunction，执行js脚本<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）表格里tip根据文本居左居右居中，箭头指向位置调整<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.0.4 2012-05-04">
        <ol class="list">
            <li>
                <b>静态模板：</b><br>
                1）新增管理人全景图<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）表格控件增加到3层表头,参数是groupTop<br>
                2）表格控件列新增帮助信息，参数helpContent,一个div的id<br>
                3）表格控件allowtip使用qtip2控件<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）新版固定列表格bug修复<br>
                2）修复级联控件排序问题<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.0.3 2012-04-10">
        <ol class="list">
            <li>
                <b>静态模板：</b><br>
                1）工作流明细<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）新版固定列表格<br>
                &nbsp;1.1）当不设置height时就会自动满屏<br>
                &nbsp;1.2）强制不换行，就不会错位了<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）ui:select补上disabled属性<br>
                2）修复表格控件标题会换行的bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.0.2 2012-03-21">
        <ol class="list">
            <li>
                <b>静态模板：</b><br>
                1）日程模式<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）加强stk.alert()可以对非字符串有效<br>
                2）加强stk.debug()可以不和stk.alert冲突，可同时在页面产生<br>
                3）表格控件分页修改，改成输入框跳转<br>
                4）表格控件新增blankText参数，数据为空时的文本，默认" "<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复表格控件导出excel在IE下要点击2次的bug<br>
                2）修复表格控件超链接列会换行的bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.0.1 2012-01-12">
        <ol class="list">
            <li>
                <b>静态模板：</b><br>
                1）语言中心<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复复选框单选按钮点击文字也能勾选的bug<br>
                2）修复stk_reset() api无法把表单检查失败的迹象清除的bug
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:1.0.0 2012-01-06">
        <ol class="list">
            <li>
                <b>Bug修复：</b><br>
                1）表格控件超链接列nowrap无效的bug<br>
                2）修复格控件若干bug
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.9c 2011-11-30">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）表格控件导出excel会有分组行<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复textarea设置defaultValue没有换行的bug<br>
                2）修复日期检查 2011-1-1w 认为合法的bug<br>
                3）修复IE6表格控件bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.9b 2011-11-17">
        <ol class="list">
            <li>
                <b>静态模板：</b><br>
                1）支持中心<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）部分css修改<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.9 2011-11-14">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）表格控件增加exportOption 默认 all,select 表示全部和勾选都有，如果表格控件增加exportOption="all" 则只有全部<br>
                2）外框tab跳回个人中心不会刷新，个人中心增加刷新按钮<br>
                3）自动填充栏增加参数delay，比如delay="500"就是延迟0.5秒再显示<br>
                4）自动填充栏设置showOnFocus，聚焦时也能缓存<br>
                5）自动填充栏新增api，$(jquery).stk_flushCache() 清除缓存<br>
                6）ui:tabs增加api， $(tabs).stk_show('tabId') $(tabs).stk_hide('tabId')，详情见范例：布局类控件->标签面板<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）ui:form 里按回车不会提交表单<br>
                2）修复自动填充栏有时key清除的bug<br>
                3）修复ui:colNumber属性pointPlace没有默认值的bug<br>
                4）修复ui:tab设置hide=true时无法隐藏title的bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.8c 2011-10-31">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）日期控件检查输入合法采用同步方式，并且没有等待圈<br>
                2）日期控件检查错误，也能用日期选择控件<br>
                3）个人中心添加模块时左右顺序添加，而不是只加在左边<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复固定列表格在IE6下的bug<br>
                2）修复表格控件在断网时加载错误的bug<br>
                3）修复自定义配置pageSize时的行号显示错误bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.8b 2011-10-27">
        <ol class="list">
            <li>
                <b>静态模板：</b><br>
                1）电话沟通-新<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）stk.call增加async参数，设置为false表示同步调用，详情见控件Api->ajax调用<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复树控件一些隐藏bug<br>
                2）修复菜单按钮弹出框在IE6下的bug<br>
                3）修复表格超链接插件点击后回到页面顶部的bug<br>
                4）修复ui:tabs控件在IE6下的显示bug<br>
                5）修复外框菜单过长换行的bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.8a 2011-10-18">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）增加文本编辑器控件样式恢复<br>
                2）表格和固定列表格即使有group也能调整宽度<br>
                3）加强(jquery).stk_text(text)可修改按钮控件的文字，包括工具栏按钮<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复ui:tabs参数selected默认选中第N个tab无效的bug<br>
            </li>
        </ol>
    </layout:fieldSet>

    <layout:fieldSet title="Version:0.0.8 2011-10-10">
        <ol class="list">
            <li>
                <b>静态模板：</b><br>
                1）新增手动批量调整<br>
                2）调整投资池样式<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）表格控件允许result返回的list里存放javaBean<br>
                2）菜单按钮弹出层美化<br>
                3）菜单按钮增加feature="noBg" 就没有按钮渐变背景<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复单选框和复选框组的defaultValue在IE6下无效的bug<br>
                2）修复固定列表格的一些Api函数调用中的bug<br>
                3）修复蓝色皮肤下表单检查器tip被窗口遮住的bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.7d 2011-09-30">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）当页面不处于框架中时，$(jquery).stk_go(url,title,config)会被window.open(url,title)代替<br>
                2）当页面不处于框架中时，$(jquery).stk_navigate(url,title,config)会被window.open(url,'_self')代替<br>
                3）树控件新增event:aftertreeinit事件,在树初始化后触发<br>
                4）ui:tabs控件增加函数stk_title，可以修改每个tab的标题，详情见控件API
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复表格控件pageSizeType="simple"时也会读取用户配置的bug<br>
                2）修复字母选择器文字过短换行的bug<br>
                3）调整外框左边菜单缩进按钮的zIndex<br>
                4）修复页面蒙板函数第二次生成可能不会覆盖全部的bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.7c 2011-09-21">
        <ol class="list">
            <li>
                <b>新增静态模板：</b><br>
                1）模板：个人中心<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）表格控件新增列插件，plugin:colRowNum 详情见数据类控件->表格->行号<br>
                2）修改表格控件maxWord功能，抛弃apache的abbreviate方法<br>
                3）实现日期输入框的stk_disabled和stk_readOnly<br>
                4）外框菜单可调整，外框tab添加右键功能<br>
                5）个人中心美化<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复多个ajax同时申请时，可能导致蒙板很快消失的bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.7b 2011-09-15">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）更改日期输入栏错误提示方式，报错时不清空而且焦点移到输入框<br>
                2）表格控件导出和明细支持超链接，而且列属性增加allowExport和allowDetail<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复图表控件在IE6下的bug<br>
                2）修复ui:combobox的defaultValue和stk_val(data)无效的bug<br>
                3）修复ui:combobox在表单检查器下的bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.7a 2011-09-09">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）自动填充栏增加参数icon，可配置图标；showOnFocuse，设置为true当聚焦时就能弹出数据<br>
                2）表格列新增表达式功能，详情见：数据类控件->表格->表达式<br>
                3）表格控件新增参数：exportFileName可以自定义导出excel文件名<br>
                4）个人中心增加7:3选项<br>
                5）日期输入栏新增startDate和endDate参数，分别填写日期控件id，日期选择时检查是否早于晚于目标控件<br>
                6）表格控件queryForm支持对应多个formId，用逗号隔开<br>
                7）表格控件新增Api获得表格显示的html数据，详情见:数据类控件->表格->普通<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复表格控件列，maxWord和allowTip共用情况下的bug<br>
                2）修复字母选择器、分类选择器和多选框选项高度，避免错位<br>
                3）修复外框tab有时候切换过去会刷新的bug<br>
                4）修复用户读取表格pageSize无效的bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.7 2011-08-31">
        <ol class="list">
            <li>
                <b>新增静态模板：</b><br>
                1）模板：固定列表格<br>
                2）模板：报告简易<br>
            </li>
            <li>
                <b>新增控件：</b><br>
                1）新增固定列表格: ui:tablefix，详情见：数据类控件->固定列表格<br>
                2）新增滑动条ui:slider控件，详情见：表单类控件->高级选择器<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）web模块表增加字段：操作内容<br>
                2）表格控件可以保存用户pageSize，当配置allowConfigPageSize="true" 默认true<br>
                3）表格控件自定义列对应的方法，允许参数 String method(Map,HttpServletRequest)，之前只有Map<br>
                4）整改登录页<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.6c 2011-08-26">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）表格控件新增导出功能，详情见：数据类控件->表格控件<br>
                2）表格控件新增详细功能，详情见：数据类控件->表格控件<br>
                3）日期输入框增加格式检查，焦点离开时自动检查<br>
                4）ui:colNumber 的pointPlace和isMoney可以混合使用<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.6b 2011-08-18">
        <ol class="list">
            <li>
                <b>新增静态模板：</b><br>
                1）模板：个股全景图<br>
            </li>
            <li>
                <b>新增控件：</b><br>
                1）新增股票图表，详情见：图表类控件->股票图标<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）退回hicharts到2.1.5稳定版本，2.1.6有bug<br>
                2）修复当控件设置emptyText时设置stk_val()的bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.6a 2011-08-12">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）实现换肤，大幅度调整样式和图片文件结构<br>
                2）新增2个外框tab的api，stk_removeSelf和stk_navigate,详情见范例：控件API<br>
                3）星级选择器实现stk_disabled(boolean) 函数<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复textField当type=file时高度太小的bug<br>
                2）调整投资池页面css样式<br>
                3）修复灰色空白提示框在google和ff浏览器下的bug<br>
                4）修复自动填充栏在设置宽度和高度的bug<br>
            <li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.6 2011-08-03">
        <ol class="list">
            <li>
                <b>新增静态模板：</b><br>
                1）模板：全文检索<br>
            </li>
            <li>
                <b>新增控件：</b><br>
                1）新增表格事件:beforetablequery和aftertablequery 表格查询前后的事件<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）新增范例:表格控件/复选框应用，利用aftertablequery，disabled复选框插件的例子<br>
                2）新增控件API文档:ajax调用<br>
                3）layout:tabletoolbar 增加参数hidden而且支持stk_show()和stk_hide()<br>
                4）stk_submit() api增加异常处理参数，详情看：控件API/Form相关/stk_submit<br>
                5）textField和textArea实现selectOnFocus参数，为true时聚焦时自动选择全部文本<br>
                6）ui:form增加参数 action和actionMethod 相当于 普通form的action和method<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复双向选择器调用stk_init() api的bug<br>
                2）修复文本输入框在IE8下含有中文时错位的bug<br>
                3）修复表格控件在IE9的bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.5c 2011-07-28">
        <ol class="list">
            <li>
                <b>新增静态模板：</b><br>
                1）模板：投资池<br>
            </li>
            <li>
                <b>新增控件：</b><br>
                1）新增工具栏控件，详情见：布局类控件/工具栏<br>
                2）新版表格控件工具栏，大家把layout:tableToolBar里的ui:button 改成 ui:toolbarButton，ui:buttonMenu 改成
                ui:toolbarButtonMenu。属性和事件都不用变<br>
                3）表格控件新增参数 allowHead 默认true 是否显示表格头<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）稍微优化一下ajax调用的性能<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.5b 2011-07-21">
        <ol class="list">
            <li>
                <b>新增静态模板：</b><br>
                1）模板：内部报告<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）表格自定义列和所有表单提交的方法，不强制static方法<br>
                2）新增函数stk.call({className:'xxx',method:'',param})，范例见：范例应用/自定义Ajax调用
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复外框架页面tab切换会刷新的bug<br>
                2）修复表单检查器设置allowBlank的bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.5a 2011-07-15">
        <ol class="list">
            <li>
                <b>新增静态模板：</b><br>
                1）模板：多人协作<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）表格控件新增排序事件，详情见表格控件/事件范例<br>
                2）按钮控件增加disabled参数disabled='true'则禁用<br>
                3）分类选择器和字母选择器的stk_show函数可传参数，是id或者对象，就会在该控件处弹出div<br>
                4）ui:tabs控件增加参数tabWidth,设置tab的最大宽度，默认100px<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复分类选择器和字母选择器弹出层在IE6的bug<br>
                2）修复多选框在IE6的bug<br>
                3）修复日期控件在google浏览器的bug<br>
                4）修复窗口控件在设置position后，在有滚动条的界面显示位置bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.5 2011-07-08">
        <ol class="list">
            <li>
                <b>新增控件</b><br>
                1）图表类基础控件封装完成<br>
                2）新增控件：双向选择器，详情参考表单类控件/高级选择器
            </li>
            <li>
                <b>功能加强：</b><br>
                1）外框架的tab关闭，模拟FF浏览器，不是每次都跳到第一个tab<br>
                2）标签面板控件，当tab数量过多放不下时，自动变窄<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复日期控件defaultValue无效的bug<br>
                2）修复个人中心，当用户无模块时无法添加模块的bug<br>
                3）修复表格控件当pageSize没有设置时，底线没有的bug<br>
                4）修复外框tab的bug<br>
                5）修复树节点在某情况下无法刷新的bug<br>
                6）修复按钮文字很多时有黑点的bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.4d 2011-06-29">
        <ol class="list">
            <li>
                <b>新增静态模板：</b><br>
                1）模板：权限管理<br>
            </li>
            <li>
                <b>新增控件</b><br>
                1）标签面板控件stk:tabs, 抛弃jqueryUI，自己研发了该控件<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）修改树控件点击的背景显示样式<br>
                2）个人中心改版：增加刷新按钮，最大化最小化按钮，删除前有提示<br>
                3）添加函数stk.setModuleLink(id,html) 个人中心模块里调用此方法，可以设置标题信息。比如stk.setModuleLink("1","&lt;a href='#'
                onclick=\"$(document).stk_go('b.jsp','更多')\"&gt;更多&lt;/a&gt;");<br>
                4）新增表格控件参数：allowBlankRow，默认true，是否产生空白行<br>
                5）表格控件添加行的单击双击事件，详情见demo:数据类控件/表格控件/事件<br>
                6）实验性增加工具方法：FormatUtils.mapToBean
                可以把map对象转换成目标JavaBean对象。必须map的key对应bean的name，忽略大小写的。当然只能转换基本类型和日期，然后自己再set无法转换的部分。<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复个人中心当模块为空时报错的bug<br>
                2）修复文件输入框显示文字不全的bug<br>
                3）修复Hql查询和表格控件不兼容的bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.4c 2011-06-23">
        <ol class="list">
            <li>
                <b>新增静态模板：</b><br>
                1）模板：报告数量统计<br>
            </li>
            <li>
                <b>新增控件</b><br>
                1）星级选择器，详情见：表单类控件/高级选择器/<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）表格控件数据行高由默认22px调整到20px，内容上下padding改成1px<br>
                2）调整树控件叶子节点右移一个格子<br>
                3）完善控件API范例文档<br>
                4）静态模版：查看表单和输入表单模板样式调整<br>
                5）新版表格分页样式<br>
                6）添加API函数：$(document).stk_showMask() 和 $(document).stk_closeMask() 打开和关闭加载蒙板<br>
                7）所有ajax调用都会触发上面蒙板打开<br>
                8）表格控件新增height参数，可以固定高度<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）全局 html { overflow-x: hidden; overflow-y: scroll; }改成 html { overflow-x: auto; overflow-y: scroll;
                }<br>
                2）修复表格控件复选框有时候被遮住的bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.4b 2011-06-16">
        <ol class="list">
            <li>
                <b>新增静态模板：</b><br>
                1）查看表单和输入表单模板<br>
            </li>
            <li>
                <b>新增控件</b><br>
                1）文本编辑器升级到官方最新版本，兼容IE9<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）文本输入栏增加areaRows和areaWidth，控制当areaEdit="true"时弹出控件<br>
                2）文本输入栏当areaEdit="true"时,把textField改成单行textArea<br>
                3）日期输入栏当没有时间选择时，选中后自动关闭<br>
                4）日期输入栏增加函数event:ondateselect，用法见范例<br>
                5）树控件超链接点击后改变背景颜色<br>
                6）新增函数$(jquery).stk_render()，用于js直接渲染成控件，详情见教程/控件API/控件渲染<br>
                7）为了避免很多问题，凡是控件标签参数 xxx = "" 或者动态传参为空字符串 一律视为null<br>
                8）表格控件新增参数mode，默认fixed，还可选auto，前者固定宽度，后者自动调整<br>
                9）表格控件点击行时高亮，并且可以通过$(jquery).stk_selectData()获取选中的数据，详情见范例<br>
                10）树控件的stk_refresh()函数，如果stk_refresh(nodeId,true)可以先刷新父节点再刷新目标节点<br>
                11）表格控件新增$(jquery).stk_checkedData(name,allowCache)获得打勾行数据，详情见范例
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复窗口控件无法弹出时更改标题的bug<br>
                2）修复函数$(document).stk_removeTab()和$(document).stk_getTab()的bug<br>
                3）修复stk.confirm里用stk.alert无效的bug
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.4a 2011-06-10">
        <ol class="list">
            <li>
                <b>新增控件</b><br>
                1）新增图表类控件(不成熟阶段)：线状图、面积图<br>
                2）新增时间标签控件：ui:timeLabel<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）多选框、字母、分类选择器增加参数positionX,positionY 用于相对定位弹出位置，比如positionY='-10px'相对现有位置上偏10px<br>
                2）增加$(jquery).stk_map() 用来获取字母、分类选择器多选时，被选择的对象map<br>
                3）文本输入栏增加参数：areaEdit 是否可用textArea编辑，详情查看文本输入栏范例<br>
                4）ui:tabs控件增加函数：$(jquery).stk_select(index/id) 切换到指定子tab<br>
                5）表格控件的列增加参数allowTip，在固定宽度下配合nowrap="true"，文字很长就会被遮住但鼠标放上去显示全部<br>
                6）增加函数$(document).stk_removeTab()和$(document).stk_getTab()函数，参数和stk_go一致才会有效<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复表格控件在IE9下，出现莫名滚动条的bug<br>
                2）修复多选框会在window上方显示的bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.4 2011-06-01">
        <ol class="list">
            <li>
                <b>新增控件</b><br>
                1）实验性更换日期控件，但是没有纯时间输入框了<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）func:checkers增加alertOnFalse参数，默认true，是否检查出错时弹出alert<br>
                2）ui:checkbox 点击文字也能触发onchange事件<br>
                3）字母、分类选择器增加target参数，目标控件id，就会显示时定位到目标控件下方<br>
                4）ui:tabs 增加事件：ontabselect ,当切换tab时出发，使用方法参考例子<br>
                5）分类选择器添加参数：allowSelectClass， 当单选时可以选择大类，默认false<br>
                6）文本输入栏增加参数：icon，以及事件 oniconclick, 详情查看文本输入栏范例<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）改善表单提示框在IE6里会产生多个的bug<br>
                2）修复树控件在google浏览器无法获取nodeId的bug
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.3d 2011-05-30">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）字母选择器和分类选择器增加参数：allowInit 是否初始化， 而且支持$(jquery).stk_refresh()<br>
                2）可删除选择器支持$(jquery).stk_val()<br>
                3）QueryUtils支持 or 方式，所有方法可以多第一个参数，比如QueryUtils.buildEqual( "or", "DemoInteger", map.get("DemoInteger"),
                sql,
                paras );<br>
                4）调整部分控件样式<br>
                5）表格控件增加nowrap参数，默认false，是否表格列不换行。(ui:table和ui:col都有)<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）新版表单提示器,兼容IE6<br>
                2）修复新版表单提示器,提示重复的bug<br>
                3）修复表单自定义检查器当输入为空时不检查的bug<br>
                4）日期控件默认宽度加长<br>
                5）修复按钮控件在ie6里的漂浮显示的bug
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.3c 2011-05-17">
        <ol class="list">
            <li>
                <b>新增控件</b><br>
                1）新增表格列单选按钮插件，plugin:colRadiobox 用法类似多选，目标类需实现IRadioBoxPluginAware <br>
                2）实验性更换表单检查器tip提示控件，抛弃jquery.bt插件<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）plugin:colCheckbox 增加参数：allowCache，默认false，是否支持翻页保留勾选<br>
                2）表格超链接插件，多个插件之间用'|' 隔开<br>
                3）表格控件新增参数 pageInfoType，默认normal，还可选simple - 简易分页信息<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复菜单按钮连续点击多次，弹出多层菜单bug<br>
                2）修复textArea复杂文本的defalutValue赋值bug<br>
                3）修复日期控件设置宽度时的显示bug<br>
                4）修复表单检查器设定ignor，有时出现的bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.3b 2011-05-12">
        <ol class="list">
            <li>
                <b>新增静态模板：</b><br>
                1）模板 - 发表评论<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）ui:col控件，支持多个插件排列，如： plugin="plugin1,plugin2"... <br>
                2）表格控件相关varData里增加rowNum<br>
                3) 菜单按钮增加clickToShow参数，默认true，是否点击按钮展开，否则仅点击三角展开
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.3a 2011-05-11">
        <ol class="list">
            <li>
                <b>新增静态模板：</b><br>
                1）模板 - 高级查询<br>
            </li>
            <li>
                <b>新增控件</b><br>
                1）实验性使用新的弹出窗口控件，底层抛弃jqueryUI<br>
                2）新增菜单按钮控件<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）可删除选择器可在表单检查器中使用，检查空<br>
                2）增加demo->表格控件->list<br>
                3) 多选/复合选择/日期 将图标放入输入框内部右侧<br>
                4) 表格控件初始化时，默认是有参数的查询<br>
                5) 树控件内容强制不换行<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复表格控件返回List模式，分页错误的bug<br>
                2）修复树控件叶子节点icon设置bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.3 2011-05-05">
        <ol class="list">
            <li>
                <b>新增静态模板：</b><br>
                1）模板 - 按钮<br>
            </li>
            <li>
                <b>新增控件</b><br>
                1）新增对话框函数：stk.info, stk.warn, stk.error<br>
                2）新增控件：可删除选择器<br>
                3）新增控件：分类选择器<br>
                4）新增控件：字母选择器<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）实验性设置全局css：html { overflow-x: hidden; overflow-y: scroll; }<br>
                2）按钮样式改版(自定义列如果是按钮，请把< input type='button'>方式改成< button type='button' >< /button >)<br>
                3）表单检查器，如果allowBlank=false，则会自动在boxcell里加上红色星号<br>
                4）所有boxcell内控件加上左间距<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复表格控件当列设置show="false"时，查询时多出多余列bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.2d 2011-04-29">
        <ol class="list">
            <li>
                <b>新增静态模板：</b><br>
                1）模板 - 电话订购<br>
                2）模板 - 登录<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）设置分页数改版<br>
                2）布局控件增加cellUnderLine参数，全局设定bocCell下划线<br>
                3）布局控件增加cellMarginBottom参数，全局设定bocCell向下间隔<br>
                4）布局控件feature增加labelBg，让label有背景色强调
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复动态树在没有子节点时点击展开报错的bug<br>
                2）修复多选控件在window时无法点击复选框的bug<br>
                3）修复日期控件缺少disabled参数的bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.2c 2011-04-26">
        <ol class="list">
            <li>
                <b>新增静态模板：</b><br>
                1）模板 - 表格样式二<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）新增stk_info()函数，目前可获得table的信息(数据集，配置，分页信息)<br>
                2）multiSelect控件支持stk_addOptions()和stk_removeOptions()<br>
                3）stk_go()的参数增加refresh:true/false,跳转到目标页面是否也刷新目标页面
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复多选控件在window时的显示bug<br>
                2）外框左菜单显示的bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.2b 2011-04-22">
        <ol class="list">
            <li>
                <b>新增静态模板：</b><br>
                1）模板 - 报告<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）增加类CaseInsensitiveMap，忽略大小写的map，用在表格查询返回list时里面放这个map<br>
                2）增加api函数：stk_firstOption() 使下拉框选中第一个选项<br>
                3）Demo表格控件增加时间列的例子<br>
                4）去除所有浏览器默认样式，大改控件样式<br>
                5）boxcell增加underLine参数,设置为true会有下划线<br>
                6）radioBox/checkBox点击label也可以触发选中和不选<br>
                7）textField控件增加textAlign参数<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复复选框控件缺少disabled参数的bug<br>
                2）修复input有相同name时，没有按数组方式传到action的bug<br>
                3）修复表格控件分页，边框有时丢失的bug<br>
                4）修复树控件jsParam取值的bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.2a 2011-04-19">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）表格控件加入默认皮肤<br>
                2）表格控件增加api函数：stk_removeRow(id) 页面删除该行数据<br>
                3）表格控件可设置分页数<br>
                4）联动下拉框增加stk_callInteract(callBack)函数<br>
                5）调用函数：$(document).stk_go(url,title);可以控制外框打开页面<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复表格控件不分页时表格不显示数据的bug<br>
                2）修复布局控件在各个浏览器兼容问题<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.2 2011-04-12">
        <ol class="list">
            <li>
                <b>新增控件：</b><br>
                1）新增表格列ui:colBool 控件<br>
                2）新增文本编辑器ui:doceditor 控件<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）QueryUtils.java 增加buildLikeStart 和 buildLikeEnd方法，相当于 like '%xxx' 和 like 'xxx%'<br>
                2）表格列按钮插件新增icon属性<br>
                3）表单检查器可以检查checkboxgroup和radioboxgroup是否为空<br>
                4）表格控件新增sortType参数，normal,none,comb，表示普通排序，不排序，组合排序<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复系统在IE6中树控件无效的bug<br>
                2）修复自动填充框自定义参数取不到的bug<br>
                3）修复树自定义传参数的bug<br>
                4）修复表格控件不分页时表格不现实数据的bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.1c 2011-03-31">
        <ol class="list">
            <li>
                <b>新增控件：</b><br>
                1）新增控件ui:autoComplete (自动填充框)<br>
            </li>
            <li>
                <b>功能加强：</b><br>
                1）新增js toDate()函数,把字符串变成js日期对象<br>
                2）新增表格列超链接插件<br>
                3）实现树的refresh()函数<br>
                4）实现输入框控件的emptyText功能<br>
                5）下拉框控件新增api函数 stk_addOptions,stk_removeOptions,stk_removeSelected<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复复选框在ie8下取值赋值的bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.1b 2011-03-23">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）表格控件：增加汇总功能<br>
                2）表单检查器$(Jquery).checkForm添加忽略列表<br>
                3）实现所有组件hiden属性，初始隐藏可设置hidden="true"<br>
                4）树控件增加动态取值功能,请参考demo<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复表格控件在有宽度时对齐的bug<br>
                2）修复表格列数据为null时，afterText和beforeText也会加入的bug<br>
                3）修复$(jquery)函数对Boxcell无效的bug<br>
                4）修复当页面有重复name的input时表单检查器出错<br>
                5）修复窗口控件高度设置bug<br>
                6）修复combobox控件的stk_val()函数bug<br>
                7）修复select控件的stk_text()函数bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.1a 2011-03-16">
        <ol class="list">
            <li>
                <b>功能加强：</b><br>
                1）表格控件：查询时会产生等待圈<br>
                2）表格控件：增加排序功能，点击标题排序，可组合排序<br>
                3）面板控件：当设置高度小于内容时，出现滚动条<br>
                4）FieldSet控件：当设置高度小于内容时，出现滚动条<br>
            </li>
            <li>
                <b>Bug修复：</b><br>
                1）修复表格控件在IE8下的几处bug<br>
                2）修复表格按钮插件在IE8下的bug<br>
                3）解决弹出窗口时会产生水平滚动条的bug<br>
                4）解决HSpacing控件在 layout='column' 布局器无效的bug<br>
            </li>
        </ol>
    </layout:fieldSet>
    <layout:fieldSet title="Version:0.0.1 2011-03-14">
        创建
    </layout:fieldSet>
</layout:panel>
</body>
</html>