<%--
  Created by IntelliJ IDEA.
  User: 李志轩
  Date: 19/4/27
  Time: 17:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>login</title>
    <!-- Bootstrap core CSS-->
    <link href="<%=basePath%>/jsp/common/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="<%=basePath%>/jsp/common/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Custom styles for this template-->
    <link href="<%=basePath%>/jsp/common/css/sb-admin.css" rel="stylesheet">
</head>

<body class="bg-dark">
<div class="container">
    <div class="card card-login mx-auto mt-5">
        <div class="card-header">Login</div>
        <div class="card-body">
            <form>
                <div class="form-group">
                    <label for="inputUsername3">UserName</label>
                    <input name="username" class="form-control" id="inputUsername3" type="email" aria-describedby="emailHelp" placeholder="Enter username">
                </div>
                <div class="form-group">
                    <label for="inputPassword3">Password</label>
                    <input name="password" class="form-control" id="inputPassword3" type="password" placeholder="Password">
                </div>
                <div class="form-group">
                    <div class="form-check">
                        <label class="form-check-label">
                            <input class="form-check-input" type="checkbox"> Remember Password</label>
                    </div>
                </div>
                <a class="btn btn-primary btn-block" onclick="sub()">Login</a>
            </form>
            <div class="text-center">
                <a class="d-block small mt-3" href="EmplAdd.jsp">Register an Account</a>

                <!--<a class="d-block small" href="forgot-password.html">Forgot Password?</a>-->
            </div>


        </div>
    </div>
</div>
<!-- Bootstrap core JavaScript-->
<script type="text/javascript" src="<%=basePath%>/jsp/js/emplouee.js"></script>

<script src="<%=basePath%>/jsp/common/vendor/jquery/jquery.min.js"></script>
<script src="<%=basePath%>/jsp/common/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="<%=basePath%>/jsp/common/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="<%=basePath%>/bootstrap3/js/bootstrap.min.js"></script>
</body>

</html>
