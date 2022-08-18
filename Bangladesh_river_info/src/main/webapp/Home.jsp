<%@ page import="riverRegistrationInformation.RiverRepository" %>
<%@ page import="riverRegistrationInformation.RiverBean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 21/7/2022
  Time: 4:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/Home.css">

</head>
<body>
<%


    String isUserLogin = (String) session.getAttribute("User_log_in_status");
    String userAuthority = (String) session.getAttribute("UserAuthority");
    if (isUserLogin == null || !isUserLogin.equals("yes")) {
        response.sendRedirect("/");

    }
    int logedInUserId = Integer.parseInt(String.valueOf(session.getAttribute("Id")));

    RiverRepository riverRepository = new RiverRepository();
    List<RiverBean> list = riverRepository.getRiverOfAUser(logedInUserId);
    request.setAttribute("riverList", list);

%>
<nav class="navbar navbar-expand-lg navbar-light bg-company-red">
    <a class="navbar-brand " href="#" style="font-family: 'Copperplate Gothic Bold'">R<span style="color: aqua">I</span>S</a>
    <!-- Container wrapper -->
    <div class="container-fluid">

        <!-- Collapsible wrapper -->
        <div class="collapse navbar-collapse" id="navbarRightAlignExample">
            <!-- Left links -->
            <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="River_Registration.jsp">River Registration</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="User_log_out_process.jsp">Log out</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div>

        <h3>
            <ul style="text-align: center">Registration details</ul>
        </h3>

        <table class="center">

        <tr>
            <div class="desing">
                <th>District Name</th>
                <th> River Name</th>
                <th>Height</th>
                <th>Width</th>
                <th>Depth</th>
                <th style="position: center">Information</th>
                <th>Edit</th>
                <th>Delete</th>

            </div>
        </tr>

        <c:forEach var="river" items="${riverList}">

            <tr>

                <td><c:out value="${river.getDistrictName()}"/></td>
                <td><c:out value="${river.getRiverName()}"/></td>
                <td><c:out value="${river.getHeight()}"/></td>
                <td><c:out value="${river.getWidth()}"/></td>
                <td><c:out value="${river.getDepth()}"/></td>
                <td><c:out value="${river.getInformation()}"/></td>

                <td>
                    <a href="Edit_River_Registration.jsp?Id=<c:out value="${river.getId()}"/>" style="color: blueviolet">Edit</a>
                </td>
                <td>
                    <a href="Delete_River_Registration.jsp?Id=<c:out value="${river.getId()}"/>" style="color: brown">Delete</a>
                </td>


            </tr>
        </c:forEach>
    </table>
</div>

<%

    if (userAuthority.equals("Admin")) {

%>
<a href="River_Registration.jsp"> Manage account</a>
<%
    }
%>

</body>
</html>
