<%--
  Created by IntelliJ IDEA.
  User: 李志轩
  Date: 19/4/27
  Time: 17:55
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
    <title>物资列表</title>
    <link rel="stylesheet" href="<%=basePath%>/bootstrap3/css/bootstrap.min.css">
    <script src="<%=basePath%>/bootstrap3/js/jquery-3.3.1.min.js"></script>
    <%--<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>
    <script src="<%=basePath%>/bootstrap3/js/bootstrap.min.js"></script>
</head>
<body>
<script type="text/javascript" src="<%=basePath%>/jsp/js/Equipment.js"></script>
<div class="jumbotron" style="height: 175px;margin-bottom:0;background: url(<%=basePath%>/bootstrap3/backgrond.jpg)">
    <h2 style="font-size: 45px" align="center">救援装备物资管理系统</h2>
</div>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar">壹</span>
                <span class="icon-bar">贰</span>
                <span class="icon-bar">叁</span>
            </button>
            <a class="navbar-brand" href="#">localhost</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="index">主页</a></li>
                <li><a href="/equipList?currPage=1">物资</a></li>
                <li><a href="#">留言</a></li>
                <li><a href="<%=basePath%>/jsp/Equipment/cartPage.jsp">已选择物资</a></li>
                <form class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default">查询</button>
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

<%--<div class="container">--%>
    <%--<div class="row">--%>
        <div class="col-sm-2">
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a id="modal-655684" href="#modal-container-655684"data-toggle="modal">链接</a></li>
                <li><a href="#">物资种类1</a></li>
                <li><a href="#">物资种类2</a></li>
                <li><a href="#">物资种类3</a></li>
                <li><a href="#">物资种类4</a></li>
            </ul>
            <hr class="hidden-sm hidden-md hidden-lg">
        </div>


        <div class="col-sm-10">
            <h2>可申请物资</h2>
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>名称</th>
                    <th>分类</th>
                    <th>库存</th>
                    <th>来源</th>
                    <th>二次使用</th>
                    <th>保质期</th>
                    <th>备注</th>
                    <th>操作</th>
                    <th>申请数量</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="list" items="${sessionScope.equipList.list}" varStatus="s">
                    <tr>
                        <td><c:out value="${s.count}"/></td>
                        <td id="equipName"><c:out value="${list.equiName}"/></td>
                        <td><c:out value="${list.description.descname}"/></td>
                        <td><c:out value="${list.equiNum}"/></td>
                        <td><c:out value="${list.equiCompany}"/></td>
                        <td><c:out value="${list.twoUse}"/></td>
                        <td><fmt:formatDate value="${list.endDate}" pattern="yyyy-MM-dd"/> </td>
                        <td><c:out value="${list.remark}"/></td>
                        <td>
                            <c:if test="${sessionScope.loginEmpl.user_type eq 1}">
                                <button type="button" class="btn btn-primary" onclick="editEqui(<c:out value="${list.id}"/>)">编辑</button>
                            </c:if>
                            <button type="button" class="btn btn-success" onclick="addCart(<c:out value="${list.id}"/>)">申请</button>
                        </td>
                        <td><input type="text" id="borrownum<c:out value="${list.id}"/>" size="1" value="1"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <ul class="pager">
                <li>
                    <span>
                        第<c:out value="${sessionScope.equipList.currPage}" />/<c:out value="${sessionScope.equipList.totalPage}" />页
                    </span></li>
                    <c:if test="${sessionScope.equipList.currPage != 1}">
                        <li><a href="equipList?currPage=1">[首页]</a></li>
                        <li><a href="equipList?currPage=<c:out value="${sessionScope.equipList.currPage-1}" />">[上一页]</a></li>&nbsp;&nbsp;
                    </c:if>
                    <c:if test="${sessionScope.equipList.currPage != sessionScope.equipList.totalPage}">
                        <li><a href="equipList?currPage=<c:out value="${sessionScope.equipList.currPage+1}" />">[下一页]</a></li>&nbsp;&nbsp;
                        <li><a href="equipList?currPage=<c:out value="${sessionScope.equipList.totalPage}" />">[尾页]<c:out value="${sessionScope.equipList.totalPage}" /></a></li>&nbsp;&nbsp;
                    </c:if>

            </ul>
        </div>
    <%--</div>--%>
<%--</div>--%>

<%--弹窗--%>
<div class="modal fade" id="modal-container-655684" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">
                    物资新增
                </h4>
            </div>
            <div class="modal-body">
                <form>
                    <table class="table">
                        <tr>
                            <td align="right">物资名称：</td>
                            <td><input type="text" value="<c:out value="${sessionScope.equip.equiName}"/>" ></td>
                        </tr>
                        <tr>
                            <td align="right">可否二次使用：</td>
                            <td><select id="a5" name="twoUse">
                                <option value="1">可以</option>
                                <option value="0" selected="selected">不可以</option>
                            </select>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">捐赠公司：</td>
                            <td><input type="text" name="equiCompany" value="<c:out value="${sessionScope.equip.equiCompany}"/>" /></td>
                        </tr>
                        <tr>
                            <td align="right">保质期：</td>
                            <td>
                                <input value="<fmt:formatDate value="${sessionScope.equip.endDate}"  pattern="yyyy-MM-dd"/>">
                            </td>
                        </tr>
                        <tr>
                            <td align="right">物资数量：</td>
                            <td><input value="<c:out value="${sessionScope.equip.equiNum}"/>" name="equiNum"></td>
                        <tr/>
                        <tr>
                            <td align="right">备注：</td>
                            <td><input value="<c:out value="${sessionScope.equip.remark}"/>" name="remark"></td>
                        </tr>
                        <tr>
                            <td align="right">物资分类：</td>
                            <td>
                                <select id="equiClass" class="form-control need" name="equiClass">
                                    <c:forEach items="${sessionScope.description}" var="IDtype">
                                        <option value="${IDtype.descid}"
                                                <c:if test="${sessionScope.equip.id eq IDtype.descid}">selected</c:if>>${IDtype.descname}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">保存</button>
            </div>
        </div>
    </div>
</div>
<%--弹窗end--%>

<div class="jumbotron text-center" style="margin-bottom:0">
    <p>Copyright © 2019</p>
</div>


</body>

</html>
