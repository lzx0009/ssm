<%--
  Created by IntelliJ IDEA.
  User: 李志轩
  Date: 19/5/6
  Time: 17:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<head>
    <title>当前申请物资</title>

    <%@include file="../common/head.jsp"%>



    <div class="container-fluid">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                已选择物资
            </li>
            <%--<li class="breadcrumb-item active">资料编辑</li>--%>
        </ol>
        <table class="table table-hover table-striped">
            <thead class="thead-dark">
        <tr>
            <td>序号</td>
            <td>物资名称</td>
            <td>物资数量</td>
            <td>物资分类</td>
            <td>保质期</td>
            <td>二次资源</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="list" items="${sessionScope.cart.goods}" varStatus="s">
            <tr>
                <td><c:out value="${s.count}"/></td>
                <td><c:out value="${list.key.equiName}"></c:out></td>
                <td><c:out value="${list.value}"></c:out></td>
                <td><c:out value="${list.key.description.descname}"></c:out></td>
                <%--<td><c:out value="${list.key.endDate}"></c:out></td>--%>
                <td><fmt:formatDate value="${list.key.endDate}" pattern="yyyy/MM/dd" /></td>
                <td><c:out value="${list.key.twoUse}"></c:out></td>
            </tr>
        </c:forEach>
        </tbody>
        <tfoot>
        <tr>
            <td colspan="5" align="right">
                <c:choose>
                    <c:when test="${sessionScope.cart.goods.size() == 0 or sessionScope.cart ==null}">
                        <div align="center">您还未申请物资呢！</div>
                        <%--<a href="javascript:history.go(-1)">返回物资列表 </a>--%>
                    </c:when>
                    <c:otherwise>
                        <a class="btn btn-danger" href="/cleanCart">清空</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a class="btn btn-info" href="/cartCommit"> 提交 </a>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
        </tfoot>
    </table>

    </div>
    <script type="text/javascript" src="<%=basePath%>/jsp/js/Equipment.js"></script>

    <%@include file="../common/foot.jsp"%>

