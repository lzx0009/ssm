<%--
  Created by IntelliJ IDEA.
  User: 李志轩
  Date: 19/5/6
  Time: 17:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<head>
    <title>物资列表</title>
    <%@include file="../common/head.jsp"%>
    <%-----------------------------------------body start-------------------------------------------------%>


    <div class="container-fluid">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                物资管理
            </li>
            <li class="breadcrumb-item active">物资列表</li>
        </ol>
    <div class="row">
    <%--<div class="col-sm-2">--%>
        <%--<ul class="nav nav-pills flex-column">--%>
            <%--<li class="nav-item">--%>
                <%--<a class="nav-link active" href="#">物资种类1</a>--%>
            <%--</li>--%>
            <%--<li class="nav-item">--%>
                <%--<a class="nav-link" href="#">物资种类2</a>--%>
            <%--</li>--%>
            <%--<li class="nav-item">--%>
                <%--<a class="nav-link" href="#">物资种类3</a>--%>
            <%--</li>--%>
            <%--<li class="nav-item">--%>
                <%--<a class="nav-link disabled" href="#">物资种类4</a>--%>
            <%--</li>--%>
        <%--</ul>--%>
        <%--<hr class="d-sm-none">--%>
    <%--</div>--%>


    <%--<div class="col-sm-9">--%>
        <%--<table class="table table-hover table-striped">--%>
            <%--<thead class="thead-dark">--%>
            <%--<tr>--%>
                <%--<th>序号</th>--%>
                <%--<th>名称</th>--%>
                <%--<th>分类</th>--%>
                <%--<th>库存</th>--%>
                <%--<th>来源</th>--%>
                <%--<th>二次使用</th>--%>
                <%--<th>保质期</th>--%>
                <%--<th>备注</th>--%>
                <%--<th>操作</th>--%>
                <%--<th>申请数量</th>--%>
            <%--</tr>--%>
            <%--</thead>--%>
            <%--<tbody>--%>
            <%--<c:forEach var="list" items="${sessionScope.equipList.list}" varStatus="s">--%>
                <%--<tr>--%>
                    <%--<td><c:out value="${s.count}"/></td>--%>
                    <%--<td id="equipName"><c:out value="${list.equiName}"/></td>--%>
                    <%--<td><c:out value="${list.description.descname}"/></td>--%>
                    <%--<td><c:out value="${list.equiNum}"/></td>--%>
                    <%--<td><c:out value="${list.equiCompany}"/></td>--%>
                    <%--<td><c:out value="${list.twoUse}"/></td>--%>
                    <%--<td><fmt:formatDate value="${list.endDate}" pattern="yyyy-MM-dd"/> </td>--%>
                    <%--<td><c:out value="${list.remark}"/></td>--%>
                    <%--<td>--%>
                        <%--<c:if test="${sessionScope.loginEmpl.user_type eq 1}">--%>
                            <%--<button type="button" class="btn btn-primary" onclick="editEqui(<c:out value="${list.id}"/>)">编辑</button>--%>
                        <%--</c:if>--%>
                        <%--<button type="button" class="btn btn-success" onclick="addCart(<c:out value="${list.id}"/>)">申请</button>--%>
                    <%--</td>--%>
                    <%--<td><input type="text" id="borrownum<c:out value="${list.id}"/>" size="1" value="1"/></td>--%>
                <%--</tr>--%>
            <%--</c:forEach>--%>
            <%--</tbody>--%>
        <%--</table>--%>
        <%--&lt;%&ndash;分页模块strat&ndash;%&gt;--%>
        <%--<ul class="pagination pagination-sm">--%>
            <%--<li class="page-item">--%>
                        <%--第<c:out value="${sessionScope.equipList.currPage}" />/<c:out value="${sessionScope.equipList.totalPage}" />页--%>
            <%--</li>--%>
            <%--<c:if test="${sessionScope.equipList.currPage != 1}">--%>
                <%--<li class="page-item"><a class="page-link" href="equipList?currPage=1">首页</a></li>--%>
                <%--<li class="page-item"><a class="page-link" href="equipList?currPage=<c:out value="${sessionScope.equipList.currPage-1}" />">上一页</a></li>&nbsp;&nbsp;--%>
            <%--</c:if>--%>
            <%--<c:if test="${sessionScope.equipList.currPage != sessionScope.equipList.totalPage}">--%>
                <%--<li class="page-item"><a class="page-link" href="equipList?currPage=<c:out value="${sessionScope.equipList.currPage+1}" />">下一页</a></li>&nbsp;&nbsp;--%>
                <%--<li class="page-item"><a class="page-link" href="equipList?currPage=<c:out value="${sessionScope.equipList.totalPage}" />">尾页<c:out value="${sessionScope.equipList.totalPage}" /></a></li>&nbsp;&nbsp;--%>
            <%--</c:if>--%>
        <%--</ul>--%>
        <%--&lt;%&ndash;分页模块end&ndash;%&gt;--%>
    <%--</div>--%>
    <%--</div>--%>
<%--&lt;%&ndash;table模板&ndash;%&gt;--%>
    <%--<div class="row">--%>
        <div class="col-sm-12">
            <div class="card mb-3">
                <div class="card-header">
                    <i class="fa fa-table"></i> 可用物资列表</div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
                                <c:if test="${sessionScope.loginEmpl.user_type != 1}">
                                    <th>申请数量</th>
                                </c:if>
                            </tr>
                            </thead>
                            <tfoot>
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
                                <c:if test="${sessionScope.loginEmpl.user_type != 1}">
                                    <th>申请数量</th>
                                </c:if>

                            </tr>
                            </tfoot>
                            <tbody>
                            <%--<c:forEach var="list" items="${sessionScope.equipList.list}" varStatus="s">--%>
                            <c:forEach var="list" items="${sessionScope.equipList}" varStatus="s">
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
                                        <c:choose>
                                            <c:when test="${sessionScope.loginEmpl.user_type eq 1}">
                                                <button type="button" class="btn btn-primary" onclick="editEqui(<c:out value="${list.id}"/>)">编辑</button>
                                                <a type="button" class="btn btn-primary" href="/deleteEquip?id=<c:out value="${list.id}"/>">删除</a>
                                            </c:when>
                                            <c:otherwise>
                                                <button type="button" class="btn btn-success" onclick="addCart(<c:out value="${list.id}"/>)">申请</button>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <c:if test="${sessionScope.loginEmpl.user_type != 1}">
                                        <td><input type="text" id="borrownum<c:out value="${list.id}"/>" size="1" value="1"/></td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
            </div>
        </div>


    </div>


</div>

    <script type="text/javascript" src="<%=basePath%>/jsp/js/Equipment.js"/>

    <%------------------------------------------body end------------------------------------------------%>
    <%@include file="../common/foot.jsp"%>

