<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>模板 - 语言中心</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
</head>
<body>
<div class="language_box">
	<ul class="btn_language">
		<li class="btn_box"><a href="#"><b class="flag_usa"></b><span>USA</span></a></li>
        <li class="select_box"><em href="#" class="btn_down"><a href="#" class="btn_country"><b class="flag_china"></b><span>中国</span></a></em>
        	<div class="select_con">
            	<ul>
                	<li class="select_sub"><a href="#"><b class="flag_honggong"></b><span>香港</span></a></li>
                    <li class="select_sub" style="border-bottom:0px"><a href="#"><b class="flag_taiwan"></b><span>台灣</span></a></li>
                </ul>
            </div>
        </li>
  	</ul>
</div>
</body>
</html>