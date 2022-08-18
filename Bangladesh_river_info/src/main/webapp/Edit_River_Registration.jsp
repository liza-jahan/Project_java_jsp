
<%@ page import="riverRegistrationInformation.EditValueService" %>
<%@ page import="riverRegistrationInformation.RiverBean" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert title here</title>
    <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/Edit_style.css">
</head>
<body>
<%

    int id= Integer.parseInt(request.getParameter("Id"));
    EditValueService editValueService=new EditValueService();
    RiverBean riverBean=editValueService.get_value_of_user(id);

%>


  <header id="hero">
    <div class="container">
        <div class="regbox box">

            <h1>Edit River Registration</h1>
            <form action="Edit_River_Registration_process" method="post">
                <input type="hidden" placeholder="River_name" name="Id" value="<%=id%>" required>

                <p>District name</p>

                         <div class="opo">
                           <select type="text" placeholder="District_name" name="districtName" value="<%=riverBean.getDistrictName()%>"required>

                               <option> Dhaka</option>
                               <option> Gaibandha</option>
                               <option> Chittagong</option>
                               <option> Rajshahi</option>
                               <option> Sylhet</option>
                               <option> Jessore</option>
                               <option> Mymensingh</option>
                               <option> Comilla</option>


                           </select>
                         </div>

                    <p>River Name</p>
                     <input type="text" placeholder="River_name" name="riverName" value="<%=riverBean.getRiverName()%>" required>
                    <p>River Height(Km)</p>
                    <input type="number" placeholder="River_height" name="height" value="<%=riverBean.getHeight()%>" >
                    <p>River Width(Km)</p>
                    <input type="number" placeholder="River_width" name="width"value="<%=riverBean.getWidth()%>">
                    <p>River Depth(M)</p>
                    <input type="number" placeholder="River_depth" name="depth"value="<%=riverBean.getDepth()%>">
                    <p>Other Information</p>
                    <input type="text" placeholder="information" name="information" value="<%=riverBean.getInformation()%>"required><br>
                    <input type="submit" value="Register">

                </form>
        </div>
    </div>
  </header>

</body>
</html>