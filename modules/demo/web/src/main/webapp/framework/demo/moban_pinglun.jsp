<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>模板 - 发表评论</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
    <div class="panel-add04">
    <h2 class="ad004-head mb5"><span>发表评论</span><a class="return ml10" href="#">&lt;&lt;返回</a></h2>
    <div class="ad004-opt">
    <button class="stk-button stk-button-st-3">发表评论</button>&nbsp;&nbsp;<button class="stk-button stk-button-st-3">取消</button>
    </div>
    <div>
    <table class="add04-table">
     <tr>
         <th><label>标题：</label></th>
         <td><input type="text" class="stk-input" /></td>
     </tr>
     <tr>
         <th><label>内容：</label></th>
         <td><textarea class="stk-textarea"></textarea></td>
     </tr>
    </table>
    </div>
    <div class="ad004-opt1">
    <button class="stk-button stk-button-st-3">发表评论</button>&nbsp;&nbsp;<button class="stk-button stk-button-st-3">取消</button>
    </div>
    </div>
</body>
</html>