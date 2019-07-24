<%--
  Created by IntelliJ IDEA.
  User: 李志轩
  Date: 19/4/27
  Time: 17:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <meta charset="utf-8">
    <title>个人资料修改</title>
    <link rel="stylesheet" href="<%=basePath%>/bootstrap3/css/bootstrap.min.css">
    <script src="<%=basePath%>/bootstrap3/js/jquery-3.3.1.min.js"></script>
    <%--<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>
    <script src="<%=basePath%>/bootstrap3/js/bootstrap.min.js"></script>
</head>
<body>

<div class="jumbotron" style="height: 175px;margin-bottom:0;background: url(<%=basePath%>/bootstrap3/backgrond.jpg)">
    <h2 style="font-size: 45px" align="center">救援装备物资管理系统</h2>
</div>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">localhost</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/index">主页</a></li>
                <li><a href="/equipList?currPage=1">物资</a></li>
                <li><a href="#">留言</a></li>
                <form class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default">提交</button>
                </form>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        个人中心 <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="<%=basePath%>/jsp/Employee/editEmpl.jsp"><c:out value="${sessionScope.loginEmpl.ename}"/></a></li>
                        <li class="divider"></li>
                        <li ><a href="/loglist?username=<c:out value="${sessionScope.loginEmpl.username}"/>">历史纪录</a></li>
                        <li class="divider"></li>
                        <li><a href="/logout">退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="row">
        <div class="col-sm-2">
            <%--<h2>关于我</h2>--%>
            <%--<h5>我的照片:</h5>--%>
            <%--<div class="fakeimg">这边插入图像</div>--%>
            <%--<p>关于我的介绍..</p>--%>
            <%--<h3>链接</h3>--%>
            <%--<p>描述文本。</p>--%>
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="#">链接 1</a></li>
                <li><a href="#">链接 3</a></li>
            </ul>
            <hr class="hidden-sm hidden-md hidden-lg">
        </div>
        <div class="col-sm-8">
            <table border="0" width="600px">
                <tr>
                    <td align="center" style="font-size: 24px; color: #666">个人资料修改</td>
                </tr>
                <tr>
                    <td align="right">
                        <%--<a href="javascript:document.getElementById('saveForm').submit()">保存</a>--%>
                        <%--&nbsp;&nbsp;--%>
                        <%--<a href="javascript:history.go(-1)">返回>> </a>--%>
                    </td>
                </tr>
            </table>
            <form action="/emplEdit" method="post" id="saveForm">
                <table class="table">
                    <tr>
                        <td align="right">姓名：</td>
                        <td><input name="ename" type="text" value="<c:out value="${sessionScope.loginEmpl.ename}"/>" ></td>
                    </tr>
                    <tr>
                        <td align="right">性别：</td>
                        <%--<td><select name="sex">--%>
                            <%--<option value="男">男</option>--%>
                            <%--<option value="女" selected="selected">女</option>--%>
                            <%--</select>--%>
                         <td><input name="sex" type="radio" value="男" checked>男 &nbsp;&nbsp;&nbsp;
                            <input name="sex" type="radio" value="女">女
                        </td>
                    </tr>
                    <tr>
                        <td align="right">出生日期：</td>
                        <td>
                            <input type="date" name="birthday" value="<fmt:formatDate value="${sessionScope.loginEmpl.birthday}"  pattern="yyyy-MM-dd"/>">
                        </td>
                    </tr>
                    <%--<tr>--%>
                        <%--<td align="right">注册时间：</td>--%>
                        <%--<td>--%>
                            <%--<input type="date" name="joindate" value="<fmt:formatDate value="${sessionScope.loginEmpl.joinDate}"  pattern="yyyy-MM-dd"/>">--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    <tr>
                        <td align="right">密码：</td>
                        <td><input value="<c:out value="${sessionScope.loginEmpl.password}"/>" name="password"></td>
                    <tr/>

                    <tr>
                        <td align="center" colspan="2">
                            <a class="btn btn-default" href="javascript:document.getElementById('saveForm').submit()">保存</a>

                        </td>
                        &nbsp;&nbsp;
                        <%--<a href="javascript:history.go(-1)">返回>> </a>--%>
                    </tr>

                    <%--<tr>--%>
                        <%--<td align="right">所属部门：</td>--%>
                        <%--<td>--%>
                            <%--<select id="description" class="form-control need" name="description">--%>
                                <%--<c:forEach items="${sessionScope.description}" var="IDtype">--%>
                                    <%--<option value="${IDtype.descid}"--%>
                                            <%--<c:if test="${sessionScope.equip.id eq IDtype.descid}">selected</c:if>>${IDtype.descname}</option>--%>
                                <%--</c:forEach>--%>
                            <%--</select>--%>
                        <%--</td>--%>
                    <%--</tr>--%>


                </table>

            </form>


        </div>
        <div class="col-sm-2"></div>
        </div>
</div>

<div class="jumbotron text-center" style="margin-bottom:0px">
    <p>Copyright © 2019</p>
</div>


</body>

</html>
