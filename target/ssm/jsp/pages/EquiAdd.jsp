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
    <title>物资新增</title>

    <%@include file="../common/head.jsp"%>
<%-------------------------------------------------------------------------------------------------------------------%>

    <div class="container-fluid">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                物资管理
            </li>
            <li class="breadcrumb-item active">物资新增</li>
        </ol>
        <div class="row">
            <div class="col-sm-2">
                <%--<h2>关于我</h2>--%>
                <%--<h5>我的照片:</h5>--%>
                <%--<div class="fakeimg">这边插入图像</div>--%>
                <%--<p>关于我的介绍..</p>--%>
                <%--<h3>链接</h3>--%>
                <%--<p>描述文本。</p>--%>
                <%--<ul class="nav nav-pills nav-stacked">--%>
                <%--<li class="active"><a href="#">链接 1</a></li>--%>
                <%--<li><a href="page2.jsp">page2</a></li>--%>
                <%--<li><a href="#">链接 3</a></li>--%>
                <%--</ul>--%>
                <hr class="hidden-sm hidden-md hidden-lg">
            </div>
            <div class="col-sm-8">
                <table border="0" width="600px">
                    <tr>
                        <td align="center" style="font-size: 24px; color: #666">物资新增</td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%--<a class="btn btn-default" onclick="addEqui()">保存</a>--%>
                            <%--<a href="javascript:document.getElementById('saveForm').submit()">保存</a>--%>
                            &nbsp;&nbsp;
                            <%--<a class="btn-default" href="javascript:history.go(-1)">返回>> </a>--%>
                        </td>
                    </tr>
                </table>
                <form>
                    <table class="table">
                        <tr>
                            <td align="right">物资名称：</td>
                            <td><input id="equiName" type="text" placeholder="物资名称" name="equiName" ></td>
                        </tr>
                        <tr>
                            <td align="right">可否二次使用：</td>
                            <td><select id="twoUse" name="twoUse">
                                <option value="1">可以</option>
                                <option value="0" selected="selected">不可以</option>
                            </select>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">捐赠公司：</td>
                            <td><input id="equiCompany" type="text" name="equiCompany" placeholder="捐赠公司" /></td>
                        </tr>
                        <tr>
                            <td align="right">保质期：</td>
                            <td>
                                <input id="endDate" type="date" name="endDate" value="endDate" />
                                <%--<input value="<fmt:formatDate    pattern="yyyy-MM-dd"/>">--%>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">物资数量：</td>
                            <td><input id="equiNum" placeholder="数量" value="100" name="equiNum"></td>
                        <tr/>
                        <tr>
                            <td align="right">备注：</td>
                            <td><input id="remark" placeholder="备注信息" name="remark"></td>
                        </tr>
                        <tr>
                            <td align="right">物资分类：</td>
                            <td>
                                <select id="equiClass" class="form-control need" name="equiClass">
                                    <c:forEach items="${sessionScope.description}" var="IDtype">
                                        <option value="${IDtype.descid}">
                                                ${IDtype.descname}
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center" onclick="addEqui()">保存</td>
                        </tr>


                    </table>

                </form>


            </div>
            <div class="col-sm-2"></div>
        </div>
    </div>



<%-------------------------------------------------------------------------------------------------------------------%>

    <script type="text/javascript" src="<%=basePath%>/jsp/js/Equipment.js"></script>


    <%@include file="../common/foot.jsp"%>

