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
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<html>
<head>
    <meta charset="utf-8">
    <title>主页</title>
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
                <li><a href="<%=basePath%>/jsp/common/leaveWord.jsp">留言</a></li>
                <form class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button type="button" class="btn btn-default">查询</button>
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
        <%--管理员可见--%>
        <c:choose>
            <c:when test="${sessionScope.loginEmpl.user_type eq 1}">
                <div class="col-sm-3">
                        <%--<button type="button" class="btn btn-lg btn-info"><a href="/emplList?currPage=1">用户列表</a></button><br>--%>
                        <%--<button type="button" class="btn btn-lg btn-info"><a href="/toInsert"> 物资新增 </a></button>--%>
                    <ul class="nav nav-pills nav-stacked">
                        <li class="active"><a href="/emplList?currPage=1">用户列表</a></li>
                        <li><a href="/toInsert">物资新增</a></li>
                        <li><a href="#">链接 3</a></li>
                    </ul>
                    <hr class="hidden-sm hidden-md hidden-lg">
                </div>
            </c:when>
            <c:otherwise>
                <div class="col-sm-2">
                    <ul class="nav nav-pills nav-stacked">
                        <li class="active"><a href="">链接1</a></li>
                        <li><a href="#">链接 2</a></li>
                        <li><a href="#">链接 3</a></li>
                    </ul>
                    <hr class="hidden-sm hidden-md hidden-lg">
                </div>
            </c:otherwise>
        </c:choose>


        <div class="col-sm-9">
           <div class="list-group">
                <a href="#" class="list-group-item active">地震急救小知识</a>
                <div class="list-group-item">
                    <h4 class="list-group-item-heading">
                        1. 地震发生时，如果你在自己家里，你可以选择：</br>
                        <p style="font-style: initial;font-size: 16px">地震预警时间短暂，室内避震更具有现实性，而室内房屋倒塌后形成的三角空间，往往是人们得以幸存的相对安全地点，是较好的“避震空间”。这主要是指大块倒塌体与支撑物构成的空间
                        室内易于形成三角空间的地方是炕沿下、坚固家具的附近；内墙墙根、墙角；厨房、厕所、储藏室等空间小的地方</p>
                    </h4>
                </div>
                <div class="list-group-item">
                    <h4 class="list-group-item-heading">
                        2. 地震发生时，如果你在户外，你可以选择：</br>
                        <p style="font-style: initial;font-size: 16px">就地选择开阔地避震；蹲下或趴下，以免摔倒；不要乱跑，避开人多的地方，不要随便返回室内；避开高大建筑物，如楼房特别是有玻璃幕墙的建筑、过街桥、立交桥、高烟囱、水塔下；避开危险物、高耸或悬挂物如变压器、电线杆、路灯、广告牌、吊车等</p>
                    </h4>
                </div>
                <div class="list-group-item">
                    <h4 class="list-group-item-heading">
                        3. 地震发生时，如果你在街上行走，你可以选择：</br>
                        <p style="font-style: initial;font-size: 16px">在街上行走时，最好将身边的书包或柔软的物顶在头上，无物品时也可用手护在头上，尽可能作好自我防御的准备，保持镇静，并迅速离开电线杆和围墙，跑向比较开阔的地区躲避</p>
                    </h4>
                    <p class="list-group-item-text">
                        ...
                    </p>
                </div>
                <div class="list-group-item">
                <span class="badge">14</span> Help
            </div> <a class="list-group-item active"> <span class="badge">14</span> Help</a>
           </div>
        </div>
    </div>
</div>

<div class="jumbotron text-center" style="margin-bottom:0">
    <p>Copyright © 2019</p>
</div>



</body>

</html>
