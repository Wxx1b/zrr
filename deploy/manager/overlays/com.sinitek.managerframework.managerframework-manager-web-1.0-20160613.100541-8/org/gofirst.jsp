<%--
  Created by IntelliJ IDEA.
  User: sinitek
  Date: 12-9-6
  Time: 上午10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>切换用户跳转页面</title>
    <script type="text/javascript">
        (function () {
            if (top.location != document.location)
                top.location = "${contextPath}/first.jsp";
            else
                document.location = "${contextPath}/first.jsp";
        })();
    </script>
</head>
<body>

</body>
</html>