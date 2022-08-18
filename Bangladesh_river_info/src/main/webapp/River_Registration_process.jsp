<%@ page import="riverRegistrationInformation.RiverRepository" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 18/7/2022
  Time: 9:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%

String isUserLogin  = (String )session.getAttribute("User_log_in_status");
if(isUserLogin==null || ! isUserLogin.equals("yes"))
{
response.sendRedirect("/");
}


String  districtName=request.getParameter("districtName");
String  riverName=request.getParameter("riverName");
float  height=Float.parseFloat(request.getParameter("height"));
float width=Float.parseFloat(request.getParameter("width"));
float  depth=Float.parseFloat(request.getParameter("depth"));
String  information=request.getParameter("information");
int logedInUserId = Integer.parseInt(String.valueOf(session.getAttribute("Id")));


RiverRepository  riverRepository = new RiverRepository();
int status=riverRepository.save(districtName,riverName,height,width,depth,information,logedInUserId );

if(status>0){
response.sendRedirect("Home");
}
else{
     out.println("Registration Failed");


}

%>
</body>
</html>
