<%--
  Created by IntelliJ IDEA.
  User: 李志轩
  Date: 19/5/6
  Time: 17:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<head>
    <title>用户列表</title>

    <%@include file="../common/head.jsp"%>
    <%---------------------------------------------------------------------------------------------------------%>

    <div class="container-fluid">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                用户管理
            </li>
            <li class="breadcrumb-item active">用户单位管理</li>
        </ol>
        <div class="row">

            <div class="col-sm-12">
                <table class="table table-hover table-striped">
                    <thead class="thead-dark">
                    <tr>
                        <th>序号</th>
                        <th>单位名称</th>
                        <th>备注</th>
                        <th>编辑</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="list" items="${sessionScope.departList}" varStatus="s">
                        <tr>
                            <td><c:out value="${s.count}"/></td>
                            <td><c:out value="${list.dname}"/></td>
                            <td><c:out value="${list.ddesc}"/></td>
                            <td>
                                <button type="button" class="btn btn-primary" onclick="">编辑</button>
                                <button type="button" class="btn btn-primary" onclick="">删除</button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <%--<ul class="pagination pagination-sm">--%>
                <%--<li>--%>
                <%--<span>--%>
                <%--第<c:out value="${sessionScope.emplList.currPage}" />/<c:out value="${sessionScope.emplList.totalPage}" />页--%>
                <%--</span></li>--%>
                <%--<c:if test="${sessionScope.emplList.currPage != 1}">--%>
                <%--<li class="page-item"><a class="page-link" href="emplList?currPage=1">首页</a></li>--%>
                <%--<li class="page-item"><a class="page-link" href="emplList?currPage=<c:out value="${sessionScope.emplList.currPage-1}" />">上一页</a></li>&nbsp;&nbsp;--%>
                <%--</c:if>--%>
                <%--<c:if test="${sessionScope.emplList.currPage != sessionScope.emplList.totalPage}">--%>
                <%--<li class="page-item"><a class="page-link" href="emplList?currPage=<c:out value="${sessionScope.emplList.currPage+1}" />">下一页</a></li>&nbsp;&nbsp;--%>
                <%--<li class="page-item"><a class="page-link" href="emplList?currPage=<c:out value="${sessionScope.emplList.totalPage}" />">尾页<c:out value="${sessionScope.emplList.totalPage}" /></a></li>&nbsp;&nbsp;--%>
                <%--</c:if>--%>

                <%--</ul>--%>
            </div>
        </div>
    </div>

    <%---------------------------------------------------------------------------------------------------------%>
    <script type="text/javascript" src="<%=basePath%>/jsp/js/emplouee.js"></script>

    <%@include file="../common/foot.jsp"%>

