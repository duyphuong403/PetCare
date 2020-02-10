<%-- 
    Document   : header
    Created on : Jan 17, 2020, 8:51:39 PM
    Author     : ngodu
--%>

<%@page import="vn.aptech.entity.Accounts"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <link rel="shortcut icon" type="image/x-icon" href="lib/images/pet-icon.png"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <%
            if (request.getAttribute("title") == null) {
                request.setAttribute("title", "Home");
            }
            Accounts curAcc = (Accounts) session.getAttribute("curAcc");
            if (curAcc == null) {
                response.sendRedirect("login.jsp");
            } else if (curAcc.getRole() == 2) {
                response.sendRedirect("adminUI/index.jsp");
            } else if (curAcc.getRole() == 0) {
                response.sendRedirect("clientUI/index.jsp");
            }
        %>
        <title>Employee | ${title}</title>

        <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">-->

        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
        <!--     Fonts and icons     -->
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
        <!-- CSS Files -->
        <link href="lib/css/material-dashboard.css?v=2.1.1" rel="stylesheet" />
        <!-- CSS Just for demo purpose, don't include it in your project -->
        <link href="lib/css/demo/demo.css" rel="stylesheet" />
        <style type="text/css">
            .dropdown-menu .dropdown-item:hover, .dropdown-menu .dropdown-item:focus, .dropdown-menu a:hover, .dropdown-menu a:focus, .dropdown-menu a:active {
                box-shadow: 0 4px 20px 0px rgba(0, 0, 0, 0.14), 0 7px 10px -5px rgba(156, 39, 176, 0.4);
                background-color: #00bcd4;
                color: #FFFFFF;
            }
        </style>

        <!-- Optional: include a polyfill for ES6 Promises for IE11 -->
        <!--<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </head>