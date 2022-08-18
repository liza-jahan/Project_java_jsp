<%@ page import="riverRegistrationInformation.RiverBean" %>
<%@ page import="riverRegistrationInformation.EditValueService" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 22/7/2022
  Time: 7:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
String districtName=request.getParameter("districtName");
String riverName=request.getParameter("riverName");
Float height=Float.valueOf(request.getParameter("height"));
Float width=Float.valueOf(request.getParameter("width"));
Float depth=Float.valueOf(request.getParameter("depth"));
String information=request.getParameter("information");
int id= Integer.parseInt(request.getParameter("Id"));


 RiverBean riverBean=new RiverBean();
  riverBean.setDistrictName(districtName);
  riverBean.setRiverName(riverName);
  riverBean.setHeight(height);
  riverBean.setWidth(width);
  riverBean.setDepth(depth);
  riverBean.setInformation(information);
  riverBean.setId(id);

  EditValueService editValueService=new EditValueService();
 editValueService.edit_user(riverBean);
 response.sendRedirect("Home");
%>
 <!--- <script type="text/javascript">
    window.location.href="http://localhost:8080/      /.jsp"
   </script>---->
  </body>
</html>
