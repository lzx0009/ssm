<%--
  Created by IntelliJ IDEA.
  User: 李志轩
  Date: 19/5/6
  Time: 18:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <title>用户注册</title>
    <!-- Bootstrap core CSS-->
    <link href="<%=basePath%>/jsp/common/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="<%=basePath%>/jsp/common/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Custom styles for this template-->
    <link href="<%=basePath%>/jsp/common/css/sb-admin.css" rel="stylesheet">
</head>

<body class="bg-dark">
<div class="container">
    <div class="card card-register mx-auto mt-5">
        <div class="card-header">用户注册</div>
        <div class="card-body">
            <form id="form">
                <div class="form-group">
                    <div class="form-row">
                        <div class="col-md-6">
                            <label for="ename">姓名</label>
                            <input class="form-control" id="ename" name="ename" type="text" aria-describedby="nameHelp" placeholder="Enter name">
                        </div>
                        <div class="col-md-6">
                            <label>性别</label><br/>
                            <td>
                                <label><input  type="radio" name="sex" value="男"  checked="checked"/> 男 &nbsp;&nbsp;&nbsp;</label>
                                <label><input  type="radio" name="sex" value="女" /> 女</label>
                            </td>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-row">
                        <div class="col-md-6">
                            <label for="birthday">出生日期</label>
                            <input class="form-control" id="birthday" type="date" value="2001-01-01">
                        </div>
                        <div class="col-md-6">
                            <label>用户类型</label>
                            <select  class="form-control" name="dno" id="dno">
                                <option value="3">政府</option>
                                <option value="2" selected>普通</option>
                                <option value="4">企业</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-row">
                        <div class="col-md-6">
                            <label for="username">账号</label>
                            <input class="form-control" id="username" type="text" placeholder="Enter username">
                        </div>
                        <div class="col-md-6">
                            <label for="password">密码</label>
                            <input class="form-control" id="password" type="password" placeholder="Enter password">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-row">
                        <div class="col-md-6">
                            <label for="username">身份证号码</label>
                            <input class="form-control" id="custid" type="text" placeholder="Enter custid">
                        </div>
                        <div class="col-md-6">
                            <label for="password">联系电话</label>
                            <input class="form-control" id="phone" type="text" placeholder="Enter phone number">
                        </div>
                    </div>
                </div>
                <a class="btn btn-primary btn-block" onclick="toAdd()">Register</a>
            </form>

                <%--<form action="/add" method="post">--%>
                    <%--<div class="modal-body">--%>
                        <%--<table style="width: 600px;font-size:16px">--%>
                            <%--<tr>--%>
                                <%--<td align="right">员工姓名：</td>--%>
                                <%--<td width="170px"><input name="ename" class="form-control"> </td>--%>
                                <%--<td align="right">性别：</td>--%>
                                <%--<td width="170px" ><input  type="radio" name="sex" value="男"  checked="checked"/>男--%>
                                    <%--<input  type="radio" name="sex" value="女" />女--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<td align="right">出生日期：</td>--%>
                                <%--<td>--%>
                                    <%--<input id="birthday" type="date" name="birthday" value="1996-06-06"  class="form-control"/>--%>
                                <%--</td>--%>
                                <%--<td align="right">部门：</td>--%>
                                <%--<td>--%>
                                    <%--<select  class="form-control" name="dno">--%>
                                        <%--<option value="3">政府</option>--%>
                                        <%--<option value="2" selected>普通</option>--%>
                                        <%--<option value="4">企业</option>--%>
                                    <%--</select>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<td align="right">用户名：</td>--%>
                                <%--<td><input type="text" name="username" class="form-control"></td>--%>
                                <%--<td align="right">密码：</td>--%>
                                <%--<td><input type="password" name="password" class="form-control" /></td>--%>
                            <%--</tr>--%>
                            <%--&lt;%&ndash;<tr>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<td align="right">编号：</td>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<td><input type="text" name="eno"  class="form-control"/></td>&ndash;%&gt;--%>

                            <%--&lt;%&ndash;</tr>&ndash;%&gt;--%>
                        <%--</table>--%>

                    <%--</div>--%>
                    <%--<div class="modal-footer">--%>
                        <%--<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>--%>
                        <%--<button type="submit" class="btn btn-primary">保存</button>--%>
                    <%--</div>--%>
                <%--</form>--%>

                <div class="text-center">
                <a class="d-block small mt-3" href="login.jsp">Login Page</a>
                <%--<a class="d-block small" href="forgot-password.html">Forgot Password?</a>--%>
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
</body>
</html>