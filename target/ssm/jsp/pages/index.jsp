<%--
  Created by IntelliJ IDEA.
  User: 李志轩
  Date: 19/5/6
  Time: 17:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<head>
   <title>主页</title>

<%@include file="../common/head.jsp"%>
   <script type="text/javascript">
      $(document).ready(function () {
          var id1 = document.getElementById("id1");
          var id2 = document.getElementById("id2");
          var id3 = document.getElementById("id3");
          var id4 = document.getElementById("id4");
          id1.style.width=35+'%';
          id2.style.width=45+'%';
          id3.style.width=55+'%';
          id4.style.width=65+'%';
      })
   </script>
   <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
         <li class="breadcrumb-item">
            <a href="/index">主页</a>
         </li>
         <%--<li class="breadcrumb-item active">Cards</li>--%>
      </ol>
      <h3>您好，<c:out value="${sessionScope.loginEmpl.ename}"/></h3>
      <hr>

      <div class="card mb-3">
         <div class="card-header">
            <i class="fa fa-area-chart"></i> 物资发放情况</div>
         <div class="card-body" style="width: 60%">
            <%--<canvas id="myAreaChart" width="100%" height="30">121</canvas>--%>

               生命支持类：
            <div class="progress">
               <div id="id1" class="progress-bar"></div>
            </div>
            <br>
               生命救助类：
            <div class="progress">
               <div class="progress-bar bg-success" id="id2"></div>
            </div>
            <br>
               器材工具类：
            <div class="progress">
               <div class="progress-bar bg-info" id="id3"></div>
            </div>
            <br>
               防护用品类：
            <div class="progress">
               <div class="progress-bar bg-warning" id="id4"></div>
            </div>
         </div>
         <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
      </div>
      <%--<div class="col-lg-4">--%>
         <%--<!-- Example Pie Chart Card-->--%>
         <%--<div class="card mb-3">--%>
            <%--<div class="card-header">--%>
               <%--<i class="fa fa-pie-chart"></i> Pie Chart Example</div>--%>
            <%--<div class="card-body">--%>
               <%--<canvas id="myPieChart" width="100%" height="100"></canvas>--%>
            <%--</div>--%>
            <%--<div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>--%>
         <%--</div>--%>
      <%--</div>--%>


      <!-- Icon Cards-->
      <div class="row" style="height: 100px">
         <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-primary o-hidden h-100">
               <div class="card-body">
                  <div class="card-body-icon">
                     <i class="fa fa-fw fa-comments"></i>
                  </div>
                  <div class="mr-5">26 New Messages!</div>
               </div>
               <a class="card-footer text-white clearfix small z-1" href="#">
                  <span class="float-left">View Details</span>
                  <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
               </a>
            </div>
         </div>
         <%--<div class="col-xl-3 col-sm-6 mb-3">--%>
            <%--<div class="card text-white bg-warning o-hidden h-100">--%>
               <%--<div class="card-body">--%>
                  <%--<div class="card-body-icon">--%>
                     <%--<i class="fa fa-fw fa-list"></i>--%>
                  <%--</div>--%>
                  <%--<div class="mr-5">11 New Tasks!</div>--%>
               <%--</div>--%>
               <%--<a class="card-footer text-white clearfix small z-1" href="#">--%>
                  <%--<span class="float-left">View Details</span>--%>
                  <%--<span class="float-right">--%>
                <%--<i class="fa fa-angle-right"></i>--%>
              <%--</span>--%>
               <%--</a>--%>
            <%--</div>--%>
         <%--</div>--%>
         <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-success o-hidden h-100">
               <div class="card-body">
                  <div class="card-body-icon">
                     <i class="fa fa-fw fa-shopping-cart"></i>
                  </div>
                  <div class="mr-5">123 New Orders!</div>
               </div>
               <a class="card-footer text-white clearfix small z-1" href="#">
                  <span class="float-left">View Details</span>
                  <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
               </a>
            </div>
         </div>
         <%--<div class="col-xl-3 col-sm-6 mb-3">--%>
            <%--<div class="card text-white bg-danger o-hidden h-100">--%>
               <%--<div class="card-body">--%>
                  <%--<div class="card-body-icon">--%>
                     <%--<i class="fa fa-fw fa-support"></i>--%>
                  <%--</div>--%>
                  <%--<div class="mr-5">13 New Tickets!</div>--%>
               <%--</div>--%>
               <%--<a class="card-footer text-white clearfix small z-1" href="#">--%>
                  <%--<span class="float-left">View Details</span>--%>
                  <%--<span class="float-right">--%>
                <%--<i class="fa fa-angle-right"></i>--%>
              <%--</span>--%>
               <%--</a>--%>
            <%--</div>--%>
         <%--</div>--%>
      </div>
   </div>

   <script src="<%=basePath%>/jsp/common/vendor/chart.js/Chart.min.js"></script>

<%@include file="../common/foot.jsp"%>
