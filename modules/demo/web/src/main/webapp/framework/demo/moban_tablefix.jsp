<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>模板 - 固定列表格</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
    <script type="text/javascript">
    $(function(){
        new STK.fixedGrid({
            headTopId : 'J_fixedGrid_HT',
            headLeftId : 'J_fixedGrid_ConFix',
            conBoxId : 'J_fixedGrid_Con',
            scrollXId : 'J_scrollX',
            scrollYId : 'J_scrollY',
            hoverCss : 'hover'
        });
    })
    </script>
</head>
<body>

<div class="stk-fixed-th-box" style="padding-left:160px">
<div class="stk-fixed-left" style="width:160px;">
	<div class="stk-hTL">
		<table id="J_fixedGrid_HL" style="table-layout:fixed;width:100%" class="fixHeadTable">
	    <tr>
	    <th>行列1</th>
	    <th>行列2</th>
	    </tr>
	    </table>
	</div>
	<div class="stk-hL" style="height:300px">
    	<table id="J_fixedGrid_ConFix" class="fixHeadTable" style="table-layout:fixed;width:100%">
        <tbody>
        <script type="text/javascript">
        for(var i=0;i<80;i++){
			document.writeln('<tr class="'+(i%2 == 0?'' : 'even')+'"><td>行列1</td><td>行列2</td></tr>');
		}
        </script>
        </tbody>
        </table>
    </div>
</div>
<div class="stk-fixed-right" style="width:100%">
	<div class="stk-hT" style="width:100%">
		<table id="J_fixedGrid_HT" class="fixHeadTable" style="table-layout:fixed;width:180%">
	        <tr>
	        <th width="50px">头1</th>
	        <th>头2</th>
	        <th>头3</th>
	        <th>头4</th>
	        <th>头5</th>
	        <th>头6</th>
	        <th>头7</th>
	        <th>头8</th>
	        <th>头9</th>
	        <th>头10</th>
	        <th>头11</th>
	        <th>头12</th>
	        </tr>
	    </table>
	</div>
	<div class="stk-con" style="width:100%;height:300px;">
    	<table id="J_fixedGrid_Con" class="fixHeadTable" style="min-height:16px;table-layout:fixed;width:180%">
        <tbody>
        <script type="text/javascript">
        for(var i=0;i<80;i++){
			document.writeln('<tr class="'+(i%2 == 0?'' : 'even')+'"><td width="50px">内容1</td><td>内容2</td><td>内容3</td><td>内容4</td><td>内容5</td><td>内容6</td><td>内容7</td><td>内容8</td><td>内容9</td><td>内容10</td><td>内容11</td><td>内容12</td></tr>');
		}
        </script>
        </tbody>
        </table>
        <div class="stk-scrollX" style="width:100%">
        <div id="J_scrollX" class="stk-scrollBar" style="width:500px;">
            <div class="scrLine"></div>
        </div>
        </div>
        <div class="stk-scrollY" style="height:300px;">
        <div id="J_scrollY" class="stk-scrollBar" style="height:300px;">
        	<div class="scrLine"></div>
       	</div>
        </div>
    </div>
</div>
</div>
</body>
</html>