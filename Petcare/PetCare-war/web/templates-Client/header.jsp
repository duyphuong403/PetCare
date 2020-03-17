<%-- 
    Document   : header
    Created on : Dec 13, 2019, 10:00:48 AM
    Author     : Dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="http://xmlns.jcp.org/jsf/html"
      xmlns:ui="http://xmlns.jcp.org/jsf/facelets">
    <head>
        <%
            if (request.getAttribute("title") == null) {
                request.setAttribute("title", "Home");
            }
        %>
        <title>PetShop | ${title}</title>
        <meta charset="iso-8859-1"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="lib/css/style.css" rel="stylesheet" type="text/css"/>
        <script src="lib/js/jquery-3.4.1.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="lib/css/all.css">
        <link rel="shortcut icon" type="image/x-icon" href="lib/images/pet-icon.png"/>
        
        <link href="lib/css/material-dashboard.css?v=2.1.1" rel="stylesheet" />

        <link href="lib/css/material-components-web.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <script src="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"></script>

        <!-- CSS -->
        <link rel="stylesheet" href="lib/css/animate.css">
        <link rel="stylesheet" href="lib/css/fonts.css">
        <link rel="stylesheet" href="lib/css/font-awesome.min.css">
        <link rel="stylesheet" href="lib/css/magnific-popup.css">
        <link rel="stylesheet" href="lib/css/slick.css">
        <link rel="stylesheet" href="lib/css/structure.css">
        <link rel="stylesheet" href="lib/css/main.css">
        <link id="preset" rel="stylesheet" href="lib/css/preset1.css">
        <link rel="stylesheet" href="lib/css/responsive.css">
        <link rel="stylesheet" href="lib/css/phuc-style.css">
        <script src="lib/js/sweetalert.js"></script>
        <!--[if IE 6]><link href="css/ie6.css" rel="stylesheet" type="text/css"><![endif]-->
        <!--[if IE 7]><link href="css/ie7.css" rel="stylesheet" type="text/css"><![endif]--> 
    </head>
    <body class="container">
      <style>
        #body {
           min-height: 600px;
        }
      </style>
      <%@include file="../common-template/preload.jsp" %>