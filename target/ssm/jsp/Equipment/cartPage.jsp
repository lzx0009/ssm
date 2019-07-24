<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 李志轩
  Date: 19/4/29
  Time: 0:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <title>当前已申请物资</title>
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
                <li><a href="../common/leaveWord.jsp">留言</a></li>
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


<table class="table" style="width: 60%">

    <tr>
        <td>序号</td>
        <td>物资名称</td>
        <td>物资数量</td>
        <td>物资分类</td>
        <td>保质期</td>
        <td>二次资源</td>
    </tr>
    <c:forEach var="list" items="${sessionScope.cart.goods}" varStatus="s">
        <tr>
            <td><c:out value="${s.count}"/></td>
            <td><c:out value="${list.key.equiName}"></c:out></td>
            <td><c:out value="${list.value}"></c:out></td>
            <td><c:out value="${list.key.description.descname}"></c:out></td>
            <td><c:out value="${list.key.endDate}"></c:out></td>
            <td><c:out value="${list.key.twoUse}"></c:out></td>
        </tr>
    </c:forEach>
    <tr>
        <td colspan="3" align="right">
            <c:choose>
                <c:when test="${sessionScope.cart.goods.size() == 0 or sessionScope.cart ==null}">
                    <div align="center">您还未申请物资呢！</div>
                    <a href="javascript:history.go(-1)">返回物资列表 </a>
                </c:when>
                <c:otherwise>
                    <a href="/cleanCart"> clean</a>
                    <a href="/cartCommit"> commit </a>
                </c:otherwise>
            </c:choose>
        </td>
    </tr>
</table>

</body>
</html>
