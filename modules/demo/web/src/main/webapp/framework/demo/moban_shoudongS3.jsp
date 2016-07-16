<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>模板 - 手动批量调整step3</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<a href="moban_shoudongS1.jsp">Step1</a>，<a href="moban_shoudongS2.jsp">Step2</a>，<a href="moban_shoudongS3.jsp">Step3</a><--实际开发不需要
<div style="padding:10px">
<div class="adjust_step fwb mb10"><span class="colorBlue">Step3：</span>投资池批量调整结果</div>
<div class="mbatch-result-item mb10">
    <div class="title">
    	<p class="tt1">深圳发展A</p>
        <p>(0000001)</p>
        <b></b>
    </div>
    <div class="con1">
    	<p class="tt1">当前所属投资池：</p>
        <p class="tt2">王静的test\test禁止池-不需要审批</p>
    </div>
    <div class="con2">
    	<p class="tt1 colorGreen"><b class="icon-st40 mr5"></b>调出审批中</p>
        <p class="tt2">成功调出[基础池]审批中...</p>
    </div>
</div>
<div class="mbatch-result-item">
    <div class="title">
    	<p class="tt1">深圳发展A</p>
        <p>(0000001)</p>
        <b></b>
    </div>
    <div class="con1">
    	<p class="tt1">当前所属投资池：</p>
        <p class="tt2">王静的test\test禁止池-不需要审批</p>
    </div>
    <div class="con2">
    	<p class="tt1 colorRed"><b class="icon-st41 mr5"></b>出池失败</p>
        <p class="tt2">成功调出[基础池]审批中...</p>
    </div>
</div>
</div>
</body>
</html>