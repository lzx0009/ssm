<%--
  Created by IntelliJ IDEA.
  User: 李志轩
  Date: 19/5/6
  Time: 17:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<head>
    <title>用户信息修改</title>

    <%@include file="../common/head.jsp"%>
    <%-----------------------------------------------------------------------------------%>
    <div class="container-fluid">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                个人中心
            </li>
            <li class="breadcrumb-item active">资料编辑</li>
        </ol>
        <div class="row">
            <div class="col-sm-3">
                <%--<h2>关于我</h2>--%>
                <%--<h5>我的照片:</h5>--%>
                <%--<div class="fakeimg">这边插入图像</div>--%>
                <%--<p>关于我的介绍..</p>--%>
                <%--<h3>链接</h3>--%>
                <%--<p>描述文本。</p>--%>
                    <%--<div class="list-group">--%>
                        <%--<a href="#" class="list-group-item list-group-item-action">First item</a>--%>
                        <%--<a href="#" class="list-group-item list-group-item-action">Second item</a>--%>
                        <%--<a href="#" class="list-group-item list-group-item-action">Third item</a>--%>
                    <%--</div>--%>
                <%--<hr class="hidden-sm hidden-md hidden-lg">--%>
            </div>
            <div class="col-sm-8">
                <table border="0" width="600px">
                    <tr>
                        <td align="center" style="font-size: 24px; color: #666">个人资料修改</td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%--<a href="javascript:document.getElementById('saveForm').submit()">保存</a>--%>
                            <%--&nbsp;&nbsp;--%>
                            <%--<a href="javascript:history.go(-1)">返回>> </a>--%>
                        </td>
                    </tr>
                </table>
                <form action="/emplEdit" method="post" id="saveForm">
                    <table class="table">
                        <tr>
                            <td align="right">姓名：</td>
                            <td><input name="ename" type="text" value="<c:out value="${sessionScope.loginEmpl.ename}"/>" ></td>
                        </tr>
                        <tr>
                            <td align="right">性别：</td>
                            <%--<td><select name="sex">--%>
                            <%--<option value="男">男</option>--%>
                            <%--<option value="女" selected="selected">女</option>--%>
                            <%--</select>--%>
                            <td><input name="sex" type="radio" value="男" checked>男 &nbsp;&nbsp;&nbsp;
                                <input name="sex" type="radio" value="女">女
                            </td>
                        </tr>
                        <tr>
                            <td align="right">出生日期：</td>
                            <td>
                                <input type="date" name="birthday" value="<fmt:formatDate value="${sessionScope.loginEmpl.birthday}"  pattern="yyyy-MM-dd"/>">
                            </td>
                        </tr>
                        <%--<tr>--%>
                        <%--<td align="right">注册时间：</td>--%>
                        <%--<td>--%>
                        <%--<input type="date" name="joindate" value="<fmt:formatDate value="${sessionScope.loginEmpl.joinDate}"  pattern="yyyy-MM-dd"/>">--%>
                        <%--</td>--%>
                        <%--</tr>--%>
                        <tr>
                            <td align="right">密码：</td>
                            <td><input value="<c:out value="${sessionScope.loginEmpl.password}"/>" name="password"></td>
                        <tr/>

                        <tr>
                            <td align="center" colspan="2">
                                <a class="btn btn-default" href="javascript:document.getElementById('saveForm').submit()">保存</a>

                            </td>
                            &nbsp;&nbsp;
                            <%--<a href="javascript:history.go(-1)">返回>> </a>--%>
                        </tr>

                        <%--<tr>--%>
                        <%--<td align="right">所属部门：</td>--%>
                        <%--<td>--%>
                        <%--<select id="description" class="form-control need" name="description">--%>
                        <%--<c:forEach items="${sessionScope.description}" var="IDtype">--%>
                        <%--<option value="${IDtype.descid}"--%>
                        <%--<c:if test="${sessionScope.equip.id eq IDtype.descid}">selected</c:if>>${IDtype.descname}</option>--%>
                        <%--</c:forEach>--%>
                        <%--</select>--%>
                        <%--</td>--%>
                        <%--</tr>--%>


                    </table>

                </form>


            </div>
        </div>
    </div>



    <%-----------------------------------------------------------------------------------%>

    <%@include file="../common/foot.jsp"%>

