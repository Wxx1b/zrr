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
<div class="workflow">
    <table width="100%">
        <tr class="bottomline">
            <td class="workflow-step">Step1</td>
            <td class="workflow-stepname">提交投资池</td>
            <td class="workflow-state"><span class="colorRed">通过</span></td>
            <td>
                <p><b>处理人:</b><span class="colorGray">陈炎</span></p>
                <p><b>状态:</b><span class="colorGray">已处理</span></p>
                <p><b>时间:</b><span class="colorGray">2011-01-05</span></p>
            </td>
            <td>
                <p><b>备注:</b></p>
                <p class="colorGray">没有问题通过</p>
            </td>
        </tr>
        <tr class="bottomline">
            <td class="workflow-step">Step2</td>
            <td class="workflow-stepname">主管审批</td>
            <td class="workflow-state"><span class="colorGreen">-</span></td>
            <td>
                <p><b>处理人:</b><span class="colorGray">陈炎</span></p>
                <p><b>状态:</b><span class="colorRed">待处理</span></p>
                <p><b>时间:</b><span class="colorGray">2011-01-05</span></p>
            </td>
            <td>
                <p><b>备注:</b></p>
                <p class="colorGray">没有问题通过</p>
            </td>
        </tr>
        <tr class="bottomline">
            <td class="workflow-step">Step3</td>
            <td class="workflow-stepname">部门经理审批</td>
            <td class="workflow-state"><span class="colorGreen">驳回</span></td>
            <td>
                <p><b>处理人:</b><span class="colorGray">陈炎</span></p>
                <p><b>状态:</b><span class="colorGray">已处理</span></p>
                <p><b>时间:</b><span class="colorGray">2011-01-05</span></p>
            </td>
            <td>
                <p><b>备注:</b></p>
                <p class="colorGray">没有问题通过</p>
            </td>
        </tr>
        <tr class="bottomline">
            <td class="workflow-step">Step4</td>
            <td class="workflow-stepname">董事长审批</td>
            <td class="workflow-state"><span class="colorBlack">停止</span></td>
            <td>
                <p><b>处理人:</b><span class="colorGray">陈炎</span></p>
                <p><b>状态:</b><span class="colorGray">已处理</span></p>
                <p><b>时间:</b><span class="colorGray">2011-01-05</span></p>
            </td>
            <td>
                <p><b>备注:</b></p>
                <p class="colorGray">没有问题通过</p>
            </td>
        </tr>
    </table>
</div>
</body>
</html>