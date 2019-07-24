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
    <title>用户列表</title>
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
                        <li><a href="#"><c:out value="${sessionScope.loginEmpl.ename}"/></a></li>
                        <li class="divider"></li>
                        <li><a href="/loglist?username=<c:out value="${sessionScope.loginEmpl.username}"/>">历史纪录</a></li>
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

        <div class="col-sm-11">
            <h2>所有用户</h2>
            <table class="table table-hover table-striped">
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>生日</th>
                        <th>注册时间</th>
                        <th>编号</th>
                        <th>账号</th>
                        <th>密码</th>
                        <th>部门</th>
                        <c:if test="${sessionScope.loginEmpl.user_type eq 1}">
                                <th>
                                    编辑
                                </th>
                        </c:if>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="list" items="${sessionScope.emplList.list}" varStatus="s">
                        <tr>
                            <td><c:out value="${s.count}"/></td>
                            <td><c:out value="${list.ename}"/> </td>
                            <td><c:out value="${list.sex}"/> </td>
                            <td><fmt:formatDate value="${list.birthday}" pattern="yyyy-MM-dd"/> </td>
                            <td><fmt:formatDate value="${list.joinDate}" pattern="yyyy-MM-dd"/> </td>
                            <td><c:out value="${list.eno}"/> </td>
                            <td><c:out value="${list.username}"/> </td>
                            <td><c:out value="${list.password}"/> </td>
                            <td><c:out value="${list.department.dname}"/></td>
                            <c:if test="${sessionScope.loginEmpl.user_type eq 1}">
                                <td>
                                    <button type="button" class="btn btn-primary" onclick="">编辑</button>
                                </td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <ul class="pager">
                <li>
                    <span>
                        第<c:out value="${sessionScope.emplList.currPage}" />/<c:out value="${sessionScope.emplList.totalPage}" />页
                    </span></li>
                <c:if test="${sessionScope.emplList.currPage != 1}">
                    <li><a href="emplList?currPage=1">[首页]</a></li>
                    <li><a href="emplList?currPage=<c:out value="${sessionScope.emplList.currPage-1}" />">[上一页]</a></li>&nbsp;&nbsp;
                </c:if>
                <c:if test="${sessionScope.emplList.currPage != sessionScope.emplList.totalPage}">
                    <li><a href="emplList?currPage=<c:out value="${sessionScope.emplList.currPage+1}" />">[下一页]</a></li>&nbsp;&nbsp;
                    <li><a href="emplList?currPage=<c:out value="${sessionScope.emplList.totalPage}" />">[尾页]<c:out value="${sessionScope.emplList.totalPage}" /></a></li>&nbsp;&nbsp;
                </c:if>

            </ul>
        </div>
    </div>
</div>

<div class="jumbotron text-center" style="margin-bottom:0">
    <p>Copyright © 2019</p>
</div>


</body>

</html>
