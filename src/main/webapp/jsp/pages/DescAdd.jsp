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
    <title>物资种类新增</title>

    <%@include file="../common/head.jsp"%>
    <%-------------------------------------------------------------------------------------------------------------------%>

    <div class="container-fluid">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                物资管理
            </li>
            <li class="breadcrumb-item active">物资种类新增</li>
        </ol>
        <div class="row">
            <div class="col-sm-2">
                <hr class="hidden-sm hidden-md hidden-lg">
            </div>
            <div class="col-sm-8">
                <table border="0" width="600px">
                    <tr>
                        <td align="center" style="font-size: 24px; color: #666">物资种类新增</td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%--<a class="btn btn-default" onclick="addEqui()">保存</a>--%>
                            <a class="btn btn-default" href="javascript:document.getElementById('saveForm').submit()">保存</a>
                            &nbsp;&nbsp;
                            <%--<a class="btn-default" href="javascript:history.go(-1)">返回>> </a>--%>
                        </td>
                    </tr>
                </table>
                <form id="saveForm" action="/descSave" method="post">
                    <table class="table">
                        <tr>
                            <td align="right">物资分类名称：</td>
                            <td><input id="descname" type="text" placeholder="物资分类名称" name="descname" ></td>
                        </tr>
                        <tr>
                            <td align="right">备注：</td>
                            <td><input id="remark" placeholder="备注信息" name="remark"></td>
                        </tr>
                        <%--<tr>--%>
                            <%--<td align="right">物资分类：</td>--%>
                            <%--<td>--%>
                                <%--<select id="equiClass" class="form-control need" name="equiClass">--%>
                                    <%--<c:forEach items="${sessionScope.description}" var="IDtype">--%>
                                        <%--<option value="${IDtype.descid}">--%>
                                                <%--${IDtype.descname}--%>
                                        <%--</option>--%>
                                    <%--</c:forEach>--%>
                                <%--</select>--%>
                            <%--</td>--%>
                        <%--</tr>--%>


                    </table>

                </form>


            </div>
            <div class="col-sm-2"></div>
        </div>
    </div>



    <%-------------------------------------------------------------------------------------------------------------------%>

    <script type="text/javascript" src="<%=basePath%>/jsp/js/Equipment.js"></script>


    <%@include file="../common/foot.jsp"%>

