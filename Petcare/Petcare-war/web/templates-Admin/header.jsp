<%-- 
    Document   : header
    Created on : Jan 17, 2020, 8:51:39 PM
    Author     : ngodu
--%>

<%@page import="vn.aptech.entity.Accounts"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            Accounts curAcc = (Accounts)session.getAttribute("curAcc");
            if (curAcc == null){
                response.sendRedirect("login.jsp");
            }else if (curAcc.getRole() == 1){
                response.sendRedirect("employeeUI/index.jsp");                
            }else if (curAcc.getRole() == 0){
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
    </head>