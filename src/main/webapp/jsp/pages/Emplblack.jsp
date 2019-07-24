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
    <title>用户黑名单</title>

    <%@include file="../common/head.jsp"%>
    <%---------------------------------------------------------------------------------------------------------%>

    <div class="container-fluid">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                用户管理
            </li>
            <li class="breadcrumb-item active">黑名单</li>
        </ol>
        <div class="row">

            <div class="col-sm-12">
                <table class="table table-hover table-striped">
                    <thead class="thead-dark">
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
                    <c:forEach var="list" items="${sessionScope.black}" varStatus="s">
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

    <%@include file="../common/foot.jsp"%>

