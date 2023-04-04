
<%@ page language="java" contentType="text/html;charset =utf-8"
pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <meta charset="utf-8" />
    <title>jsp BASE</title>
  </head>

  <body>
    <% request.setCharacterEncoding("utf-8"); %>
   
     <script language=javascript> 
   self.window.alert("수정이 완료되었습니다.");
    location.href="../pages/shoppingBoard.jsp";
</script>
  </body>
</html>