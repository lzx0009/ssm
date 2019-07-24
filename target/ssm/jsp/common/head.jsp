<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
    <title>login</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap core CSS-->
    <link href="<%=basePath%>/jsp/common/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="<%=basePath%>/jsp/common/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Page level plugin CSS-->
    <link href="<%=basePath%>/jsp/common/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="<%=basePath%>/jsp/common/css/sb-admin.css" rel="stylesheet">

<script src="<%=basePath%>/bootstrap3/js/jquery-3.3.1.min.js"></script>
<%--<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>
<%--<script src="<%=basePath%>/bootstrap3/js/bootstrap.min.js"></script>--%>
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
<%--导航栏start--%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="">救援装备物资管理系统</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
                <a class="nav-link" href="<%=basePath%>/jsp/pages/index.jsp">
                    <i class="fa fa-fw fa-dashboard"></i>
                    <span class="nav-link-text">主页</span>
                </a>
            </li>
            <%--<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">--%>
                <%--<a class="nav-link" href="<%=basePath%>/jsp/pages/EmplEdit.jsp">--%>
                    <%--<i class="fa fa-fw fa-area-chart"></i>--%>
                    <%--<span class="nav-link-text">个人信息</span>--%>
                <%--</a>--%>
            <%--</li>--%>
            <c:if test="${sessionScope.loginEmpl.user_type != 1}">
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
                <a class="nav-link" href="<%=basePath%>/jsp/pages/EquiCart.jsp">
                    <i class="fa fa-fw fa-table"></i>
                    <span class="nav-link-text">当前申请物资</span>
                </a>
            </li>
            </c:if>
            <%--<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Link">--%>
                <%--<a class="nav-link" href="<%=basePath%>/jsp/pages/logList.jsp">--%>
                    <%--<i class="fa fa-fw fa-table"></i>--%>
                    <%--<span class="nav-link-text">已领取物资记录</span>--%>
                <%--</a>--%>
            <%--</li>--%>

            <%--//用户管理模块--%>
            <c:if test="${sessionScope.loginEmpl.user_type eq 1}">

            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
                <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents" data-parent="#exampleAccordion">
                    <i class="fa fa-fw fa-wrench"></i>
                    <span class="nav-link-text">用户管理</span>
                </a>
                <ul class="sidenav-second-level collapse" id="collapseComponents">
                    <li>
                        <a href="/emplList?currPage=1">用户列表</a>
                    </li>
                    <li>
                        <a href="/depaList">单位管理</a>
                    </li>
                    <li>
                        <a href="/queryBlack">黑名单</a>
                    </li>
                </ul>
            </li>
            </c:if>
            <%--//物资管理模块--%>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Example Pages">
                <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseExamplePages" data-parent="#exampleAccordion">
                    <i class="fa fa-fw fa-file"></i>
                    <span class="nav-link-text">物资管理</span>
                </a>
                <ul class="sidenav-second-level collapse" id="collapseExamplePages">
                    <li>
                        <a href="/equipList?currPage=1">物资列表</a>
                    </li>
                    <c:if test="${sessionScope.loginEmpl.user_type eq 1}">

                    <li>
                        <a href="/descList">物资类别管理</a>
                    </li>
                    <li>
                        <a href="/toInsert">物资新增</a>
                    </li>
                    </c:if>
                    <%--<li>--%>
                        <%--<a href="">Blank Page</a>--%>
                    <%--</li>--%>
                </ul>
            </li>
            <%--//预留导航1--%>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Menu Levels">
                <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMulti" data-parent="#exampleAccordion">
                    <i class="fa fa-fw fa-sitemap"></i>
                    <span class="nav-link-text">个人中心</span>
                </a>
                <ul class="sidenav-second-level collapse" id="collapseMulti">
                    <li title="Charts">
                        <a href="<%=basePath%>/jsp/pages/EmplEdit.jsp"><c:out value="${sessionScope.loginEmpl.ename}"/></a>
                    </li>
                    <c:if test="${sessionScope.loginEmpl.user_type != 1}">
                    <li title="Link">
                        <a href="/loglist?username=<c:out value="${sessionScope.loginEmpl.username}"/>">历史记录</a>
                    </li>
                    </c:if>
                </ul>
            </li>
            <%--<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Link">--%>
            <%--<a class="nav-link" href="#">--%>
            <%--<i class="fa fa-fw fa-link"></i>--%>
            <%--<span class="nav-link-text">Link</span>--%>
            <%--</a>--%>
            <%--</li>--%>
        </ul>
        <ul class="navbar-nav sidenav-toggler">
            <li class="nav-item">
                <a class="nav-link text-center" id="sidenavToggler">
                    <i class="fa fa-fw fa-angle-left"></i>
                </a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle mr-lg-2" id="messagesDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fa fa-fw fa-envelope"></i>
                    <span class="d-lg-none">消息
              <span class="badge badge-pill badge-primary">12 New</span>
            </span>
                    <span class="indicator text-primary d-none d-lg-block">
              <i class="fa fa-fw fa-circle"></i>
            </span>
                </a>
                <div class="dropdown-menu" aria-labelledby="messagesDropdown">
                    <h6 class="dropdown-header">New Messages:</h6>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">
                        <strong>David Miller</strong>
                        <span class="small float-right text-muted">11:21 AM</span>
                        <div class="dropdown-message small">Hey there! This new version of SB Admin is pretty awesome! These messages clip off when they reach the end of the box so they don't overflow over to the sides!</div>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">
                        <strong>Jane Smith</strong>
                        <span class="small float-right text-muted">11:21 AM</span>
                        <div class="dropdown-message small">I was wondering if you could meet for an appointment at 3:00 instead of 4:00. Thanks!</div>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">
                        <strong>John Doe</strong>
                        <span class="small float-right text-muted">11:21 AM</span>
                        <div class="dropdown-message small">I've sent the final files over to you for review. When you're able to sign off of them let me know and we can discuss distribution.</div>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item small" href="#">View all messages</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle mr-lg-2" id="alertsDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fa fa-fw fa-bell"></i>
                    <span class="d-lg-none">Alerts
              <span class="badge badge-pill badge-warning">6 New</span>
            </span>
                    <span class="indicator text-warning d-none d-lg-block">
              <i class="fa fa-fw fa-circle"></i>
            </span>
                </a>
                <div class="dropdown-menu" aria-labelledby="alertsDropdown">
                    <h6 class="dropdown-header">New Alerts:</h6>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">
              <span class="text-success">
                <strong>
                  <i class="fa fa-long-arrow-up fa-fw"></i>Status Update</strong>
              </span>
                        <span class="small float-right text-muted">11:21 AM</span>
                        <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">
              <span class="text-danger">
                <strong>
                  <i class="fa fa-long-arrow-down fa-fw"></i>Status Update</strong>
              </span>
                        <span class="small float-right text-muted">11:21 AM</span>
                        <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">
              <span class="text-success">
                <strong>
                  <i class="fa fa-long-arrow-up fa-fw"></i>Status Update</strong>
              </span>
                        <span class="small float-right text-muted">11:21 AM</span>
                        <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item small" href="#">View all alerts</a>
                </div>
            </li>
            <li class="nav-item">
                <form class="form-inline my-2 my-lg-0 mr-lg-2">
                    <div class="input-group">
                        <input class="form-control" type="text" placeholder="Search for...">
                        <span class="input-group-btn">
                <button class="btn btn-primary" type="button">
                  <i class="fa fa-search"></i>
                </button>
              </span>
                    </div>
                </form>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
                    <i class="fa fa-fw fa-sign-out"></i>Logout</a>
            </li>
        </ul>

    </div>
</nav>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="/logout">Logout</a>
                <%--<a class="btn btn-primary" href="login.jsp">Logout</a>--%>
            </div>
        </div>
    </div>
</div>

<%--导航栏end--%>
<%--页面body  start--%>
<div class="content-wrapper">
    <div class="container-fluid">
