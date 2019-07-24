<%--
  Created by IntelliJ IDEA.
  User: 李志轩
  Date: 19/4/19
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%--<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="<%=basePath%>/bootstrap3/css/bootstrap.min.css">
    <script src="<%=basePath%>/bootstrap3/js/jquery-3.3.1.min.js"></script>
    <%--<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>
    <script src="<%=basePath%>/bootstrap3/js/bootstrap.min.js"></script>
    <title>login</title>
</head>
<%--<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>--%>
<body style="background: url(../bootstrap3/timg.jpg); background-repeat:no-repeat">
<script type="text/javascript" src="<%=basePath%>/jsp/js/emplouee.js"></script>
<div class="container" style="margin-top: 15%;padding-top: 2%;background-color: #bce8f1;width: 40%">
    <div class="row clearfix" style="border: 1px;border-style: double">
        <div class="col-md-2 column">
        </div>
        <div class="col-md-8 column">
        <%--<div class="col-md-4 column">--%>

            <form>
                <h1 style="font-style: italic;padding-bottom: 30px" align="center">救援装备物资管理系统</h1>
                <table class="table">
                    <tr>
                        <td><div style="margin-top: 8px">账号 &nbsp;:</div></td>
                        <td><input type="text" class="form-control" id="inputUsername3" name="username" /></td>
                    </tr>
                    <tr>
                        <td><div style="margin-top: 8px">密码 &nbsp;:</div></td>
                        <td><input type="password" class="form-control" id="inputPassword3" name="password" /></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <button type="button" class="btn btn-default"  onclick="sub()">登录</button>
                            &nbsp;&nbsp;&nbsp;
                            <a href="#modal-container-655684" role="button" class="btn btn-default" data-toggle="modal">注册</a>
                        </td>
                    </tr>
                </table>
            </form>
                    <%--弹窗--%>
                    <div class="modal fade" id="modal-container-655684" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                    <h4 class="modal-title" id="myModalLabel">
                                        用户注册
                                    </h4>
                                </div>
                                <form action="/add" method="post">
                                    <div class="modal-body">
                                        <table style="font-size:16px">
                                            <tr>
                                                <td align="right">员工姓名：</td>
                                                <td><input name="ename" class="form-control"> </td>
                                                <td align="right">性别：</td>
                                                <td><input  type="radio" name="sex" value="男"  checked="checked"/>男
                                                    <input  type="radio" name="sex" value="女" />女
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">出生日期：</td>
                                                <td>
                                                    <input id="birthday" type="date" name="birthday" value="1996-06-06"  class="form-control"/>
                                                </td>
                                                <td align="right">部门：</td>
                                                <td>
                                                    <select  class="form-control" name="dno">
                                                        <option value="3">政府</option>
                                                        <option value="2" selected>普通</option>
                                                        <option value="4">企业</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">用户名：</td>
                                                <td><input type="text" name="username" class="form-control"></td>
                                                <td align="right">密码：</td>
                                                <td><input type="password" name="password" class="form-control" /></td>
                                            </tr>
                                            <%--<tr>--%>
                                                <%--<td align="right">编号：</td>--%>
                                                <%--<td><input type="text" name="eno"  class="form-control"/></td>--%>

                                            <%--</tr>--%>
                                        </table>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                        <button type="submit" class="btn btn-primary">保存</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <%--弹窗end--%>
        </div>
        <div class="col-md-2 column">
        </div>
    </div>
</div>


</body>
</html>
