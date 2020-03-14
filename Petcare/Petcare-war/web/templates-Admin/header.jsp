<%-- 
    Document   : header
    Created on : Jan 17, 2020, 8:51:39 PM
    Author     : ngodu
--%>

<%@page import="vn.aptech.entity.Accounts"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="utf-8" />
    <link rel="shortcut icon" type="image/x-icon" href="lib/images/pet-icon.png"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%
      if (request.getAttribute("title") == null) {
        request.setAttribute("title", "Home");
      }
      Accounts curAcc = (Accounts) session.getAttribute("curAcc");
      if (curAcc == null) {
        response.sendRedirect("login.jsp");
      } else if (curAcc.getRole() == 1) {
        response.sendRedirect("employeeUI/index.jsp");
      } else if (curAcc.getRole() == 0) {
        response.sendRedirect("clientUI/index.jsp");
      }
    %>
    <title>Administrator | ${title}</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <!-- CSS Files -->
    <link href="lib/css/material-dashboard.css?v=2.1.1" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="lib/css/demo/demo.css" rel="stylesheet" />
    <script src="lib/js/sweetalert.js"></script>
    <script src="lib/js/jquery.min.js"></script>
    <style>
      .card .card-header-primary .card-icon, .card .card-header-primary .card-text, .card .card-header-primary:not(.card-header-icon):not(.card-header-text), .card.bg-primary, .card.card-rotate.bg-primary .front, .card.card-rotate.bg-primary .back {
        background: linear-gradient(60deg, #ff9800, #e9dbc7);
      }
      a:hover, a:focus {
        color: #ff9800 !important;
        text-decoration: none;
      }
      .page-item.active .page-link {
        z-index: 1;
        color: #ffffff;
        background-color: #ff9800;
        border-color: #ff9800;
      }
      .form-control, .is-focused .form-control {
        background-image: linear-gradient(to top, #ff9800 2px, rgba(156, 39, 176, 0) 2px), linear-gradient(to top, #d2d2d2 1px, rgba(210, 210, 210, 0) 1px);
      }
    </style>
  </head>