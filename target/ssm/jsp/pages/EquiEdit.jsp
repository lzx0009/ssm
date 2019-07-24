<%--
  Created by IntelliJ IDEA.
  User: 李志轩
  Date: 19/5/6
  Time: 17:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<head>
    <title>物资信息修改</title>

    <%@include file="../common/head.jsp"%>
<%-----------------------------------------------------start=========---------------------------------------%>

    <div class="container-fluid">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                物资管理
            </li>
            <li class="breadcrumb-item active">资料编辑</li>
        </ol>
    <div class="col-sm-6"></div>
    <div class="col-sm-6">
        <table border="0" width="600px">
            <tr>
                <td align="center" style="font-size: 24px; color: #666">物资修改</td>
            </tr>
            <tr>
                <td align="right">
                    <a class="btn btn-default" href="javascript:document.getElementById('saveForm').submit()">保存</a>
                    &nbsp;&nbsp;
                    <%--<a href="javascript:history.go(-1)">返回>> </a>--%>
                </td>
            </tr>
        </table>
        <%--<h2>Table</h2>--%>
        <form action="/Equiupdate" method="post" id="saveForm">
            <table class="table">
                <tr hidden>
                    <td colspan="2"><input name="id" value="<c:out value="${sessionScope.equip.id}"/>"></td>
                </tr>
                <tr>
                    <td align="right">物资名称：</td>
                    <td><input name="equiName" type="text" value="<c:out value="${sessionScope.equip.equiName}"/>" ></td>
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
                        <input name="endData" value="<fmt:formatDate value="${sessionScope.equip.endDate}"  pattern="yyyy-MM-dd"/>">
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
                        <select id="equiClass" class="form-control need" name="equiClass" style="width: 210px">
                            <c:forEach items="${sessionScope.description}" var="IDtype">
                                <option value="${IDtype.descid}"
                                        <c:if test="${sessionScope.equip.equiClass eq IDtype.descid}">selected</c:if>>${IDtype.descname}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>


            </table>

        </form>


    </div>
    <%--<div class="col-sm-2"></div>--%>
    </div>
    <script type="text/javascript" src="<%=basePath%>/jsp/js/Equipment.js"></script>

    <%@include file="../common/foot.jsp"%>

