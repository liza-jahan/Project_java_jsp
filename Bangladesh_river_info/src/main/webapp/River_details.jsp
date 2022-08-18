<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="riverRegistrationInformation.EditValueService" %>
<%@ page import="riverRegistrationInformation.RiverBean" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 25/7/2022
  Time: 10:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Search Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/River_details_style.css">
</head>
<body>

<%
    int id = Integer.parseInt(request.getParameter("Id"));
    EditValueService editValueService = new EditValueService();
    RiverBean riverBean = editValueService.get_value_of_user(id);
    request.setAttribute("riverBean", riverBean);

%>
<nav class="navbar navbar-expand-lg navbar-light bg-company-red">
    <a class="navbar-brand " href="#" style="font-family: 'Copperplate Gothic Bold'">R<span style="color: aqua">I</span>S</a>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp">Home </a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="Information.jsp">Information</a>
            </li>

            <li class="nav-item active">
                <a class="nav-link disabled" href="#">About</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}" method="get">
            <!--   <input class="form-control mr-sm-2" type="search" placeholder="Search" name="key" aria-label="Search">-->
            <!--  <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>-->
        </form>

    </div>
</nav>
<div>
    <div>
        <h3>
            <ul style="text-align: center">River details</ul>
        </h3>

        <table  class="center">
            <tr>
                <div class="desing">
                    <th>District Name</th>
                    <th> River Name</th>
                    <th>Height</th>
                    <th>Width</th>
                    <th>Depth</th>
                    <th style="text-align: center">Information</th>


                </div>

            </tr>
            <tr>

                <td><c:out value="${riverBean.getDistrictName()}"/></td>
                <td><c:out value="${riverBean.getRiverName()}"/></td>
                <td><c:out value="${riverBean.getHeight()}"/></td>
                <td><c:out value="${riverBean.getWidth()}"/></td>
                <td><c:out value="${riverBean.getDepth()}"/></td>
                <td><c:out value="${riverBean.getInformation()}"/></td>
            </tr>
        </table>

    </div>

</div>
</body>
</html>