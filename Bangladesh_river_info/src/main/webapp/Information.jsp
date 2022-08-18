<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="riverRegistrationInformation.RiverRepository" %>
<%@ page import="riverRegistrationInformation.RiverBean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/Information_style.css">
</head>
<body>

<%
    String distr = request.getParameter("district");
    String key = request.getParameter("key");
    RiverRepository riverRepository = new RiverRepository();
    List<RiverBean> list = null;
    if (distr != null && !distr.equals("")) {
        list = riverRepository.getRiverOfADistrict(distr);

    } else if (key != null && !key.equals("")) {

        list = riverRepository.search(key);

    } else {
        list = riverRepository.getAllRiver();

    }
    List<String> districtlist = riverRepository.getAllDistrict();

    request.setAttribute("riverList", list);
    request.setAttribute("districtlist", districtlist);


%>
<nav class="navbar navbar-expand-lg navbar-light bg-company-red">
    <a class="navbar-brand " href="#" style="font-family: 'Copperplate Gothic Bold'">R<span style="color: aqua">I</span>S</a>


    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp" style="color: white">Home </a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="Information.jsp" style="color: white">River information</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="User_registration.jsp" style="color: white">Contact</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0" action="" method="get">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" name="key" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="color: black">Search</button>
        </form>

    </div>
</nav>
<div class="container">
    <div class="row py-3">
        <div class="col col-md-3">
            <ul class="list-group">
                <c:forEach var="list" items="${districtlist}">
                    <a href="?district=<c:out value="${list}"/>">
                        <li class="list-group-item"><c:out value="${list}"/></li>
                    </a>

                </c:forEach>

            </ul>
        </div>

        <div class="col col-md-9">
            <div class="row">
                <c:forEach var="river" items="${riverList}">
                    <div class="card col col-md-4" style="width: 18rem;">

                        <img class="card-img-top" src="img/river1.jpg" alt="Card image cap"
                             style="height:auto ; width: 100px">
                        <div class="card-body">
                            <h5 class="card-title"><a href="Information_page.jsp?Id=<c:out value="${river.getId()}"/>">
                                <c:out value="${river.getRiverName()}"/> </a></h5>
                            <p class="card-text"><c:out value="${river.getDistrictName()}"/></p>

                            <a href="River_details.jsp?Id=<c:out value="${river.getId()}"/>" class="btn btn-primary">View
                                Details</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

</body>
</html>