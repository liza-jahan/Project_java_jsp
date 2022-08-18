<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/Index_page_style.css">

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-company-red">
    <a class="navbar-brand " href="#" style="font-family: 'Copperplate Gothic Bold'"><span style="color: white" River>River </span> <span style="color: white">Information</span> <span style="color: white">System</span></a>
    <!-- Container wrapper -->
    <div class="container-fluid">
        <!-- Toggle button -->
        <button
                class="navbar-toggler"
                type="button"
                data-mdb-toggle="collapse"
                data-mdb-target="#navbarRightAlignExample"
                aria-controls="navbarRightAlignExample"
                aria-expanded="false"
                aria-label="Toggle navigation"
        >
            <i class="fas fa-bars"></i>
        </button>

        <!-- Collapsible wrapper -->
        <div class="collapse navbar-collapse" id="navbarRightAlignExample">
            <!-- Left links -->
            <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#" style="color: white"> Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="Information.jsp" style="color: white">Information</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="" style="color: white">About</a>
                </li>
                <!-- Navbar dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" style="color: white" href="User_registration.jsp" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Contact
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Log in</a>
                        <a class="dropdown-item" href="#">Registration</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>
                </li>

            </ul>

        </div>

    </div>

</nav>
</body>
</html>