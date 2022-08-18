<%@ page import="riverRegistrationInformation.DeleteService" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 22/7/2022
  Time: 9:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
int id=Integer.parseInt(request.getParameter("Id"));
DeleteService deleteService=new DeleteService();
deleteService.delete_value(id);
response.sendRedirect("Home");
%>
  </body>
</html>
