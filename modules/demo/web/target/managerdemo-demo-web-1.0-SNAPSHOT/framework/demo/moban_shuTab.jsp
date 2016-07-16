<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>模板 - 按钮</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
    <script>
    $(function(){
    	var tabT=$('.tabT dl dt a');
    	var tabT1=$('.tabT');
    	var tabF=$('.tabF');
    	var tabC1=$('.tabC1');
    	var tabM_click=$('.tabM ul li');
    	tabT.click(function(){
    		if(tabF.css('display')=='none'){
    			tabT.removeClass('selected');
    			tabT1.css('left','160px');
    			tabC1.css('margin-left','190px');
    			tabC1.addClass('tabL1').removeClass('tabL2');
    			tabF.show();
    		}else{
    			tabT.addClass('selected');
    			tabT1.css('left','0');
    			tabC1.css('margin-left','');
    			tabC1.addClass('tabL2').removeClass('tabL1');
    			tabF.hide();
    		}
    		var fixtable = $( document ).find( "div[cn='tablefix']" );
    		$.each( fixtable, function ( i, n ){
    			var tableId = $( n ).attr( "id" ).replaceAll( "_wrap", "" );
    			$("#"+tableId).stk_adjust();
    		});
    	})
    	tabM_click.click(function(){
    		tabM_click.children("a").removeClass('selected');
    		$(this).children("a").addClass('selected');

    	});
    });
    </script>
    </head>

    <body>
    <div class="getTAB clearfix">
    	<div class="tabF">
    	    <p><img src="../css/blue/images/tmp-left.gif"></p>
    	    <p><img src="../css/blue/images/tmp-left.gif"></p>
    	</div>
    	<div class="tabT">
        	<dl>
            	<dt><a href="#"></a></dt>
            </dl>
    	    <div class="tabM">
        		<ul>
            		<li><a href="#"><span>全部</span></a></li>
            		<li><a href="#"><span>重点券商</span></a></li>
            		<li><a href="#"><span>分管行业</span></a></li>
            		<li><a href="#"><span>公司类</span></a></li>
    				<li><a href="#"><span>行业类</span></a></li>
            	</ul>
        	</div>
        </div>
        <div class="tabC1 clearfix">12345
        </div>
    </div>
    </body>
</html>