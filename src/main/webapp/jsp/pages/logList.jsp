<%--
  Created by IntelliJ IDEA.
  User: 李志轩
  Date: 19/5/6
  Time: 18:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<head>
    <title>物资申请记录</title>

    <%@include file="../common/head.jsp"%>


    <div class="container-fluid">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                个人中心
            </li>
            <li class="breadcrumb-item active">领取记录</li>
        </ol>
        <div class="row">
            <div class="col-sm-12">
                <h2>您的领取记录如下：</h2>
                <table class="table table-hover table-striped">
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>单号</th>
                        <th>物资名称</th>
                        <th>领取数量</th>
                        <th>领取时间</th>
                        <th>归还</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="l" varStatus="s" items="${sessionScope.equiplog}">

                        <tr>
                            <td><c:out value="${s.count}"/></td>
                            <td><c:out value="${l.id}"/></td>
                            <td><c:out value="${l.equipName}"/></td>
                            <td><c:out value="${l.equipOutNum}"/></td>
                            <td><fmt:formatDate value="${l.outDate}" pattern="yyyy-MM-dd"/> </td>
                            <td>
                                <c:choose>
                                    <c:when test="${l.tag==1}">
                                        <button type="button" id="buttonSelect<c:out value="${l.id}" />" class="btn btn-primary" onclick="backEquip(<c:out value="${l.id}"/>,<c:out value="${l.equipId}"/>,<c:out value="${l.equipOutNum}"/>)">归还</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button type="button" disabled="disabled">已归还</button>
                                    </c:otherwise>
                                </c:choose>

                            </td>
                        </tr>
                    </c:forEach>


                    </tbody>
                </table>

            </div>
        </div>
    </div>


    <script type="text/javascript" src="<%=basePath%>/jsp/js/Equipment.js"></script>
    <%@include file="../common/foot.jsp"%>

