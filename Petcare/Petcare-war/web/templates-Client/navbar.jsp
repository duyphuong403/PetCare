<%-- 
    Document   : navbar
    Created on : Dec 13, 2019, 10:12:35 AM
    Author     : Dell
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="vn.aptech.entity.Accounts"%>
<style>
  .container {
    background-color: #fff;
    min-height: 100%;
  }
  a:hover, a:focus {
    color: #fff !important;
    text-decoration: none;
  }
  .dropdown-item.active, .dropdown-item:active {
    color: #ffffff;
    text-decoration: none;
    background-color: #ff9800;
  </style>
  <div id="header" class="topnav"> 
    <div class="topbar-content">
      <div class="float-left">
        <span><span class="icon icon-phone-call"></span> Call us <span class="number" style="color: #000000">+123 45 67 89</span></span>
        </div>
        <div class="float-right">
          <div class="user-option">
            <i class="far fa-user"></i>
            <% if (session.getAttribute("curAcc") == null) { %>
            <a href="login.jsp" style="color: #000000">Login</a>  /  <a href="register.jsp" style="color: #000000">Signup</a>
            <%} else {
          Accounts curAcc = (Accounts) session.getAttribute("curAcc"); %>
            <a href="#pablo" id="navbarDropdownProfile" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="background: none">Hi <i>
                <c:if test="${curAcc.fullname != null}" >${curAcc.fullname}</c:if>
                <c:if test="${curAcc.fullname == null}" >${curAcc.username}</c:if>
                </i>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownProfile">
                <% if (curAcc.getRole() == 1) { %> 
                <a class="dropdown-item" href="EmployeeController?action=order">Dashboard</a>
                <% } else if (curAcc.getRole() == 2) {%>
                <a class="dropdown-item" href="AdminController?action=account">Dashboard</a>
                <% } %>
                <a class="dropdown-item" href="profile.jsp">Profile</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="AdminController?action=logout">Log out</a>
              </div>
              <% }%>
          </div>
        </div>
      </div>
      <a href="#" id="logo"><img src="lib/images/logo.gif" width="310" height="114" alt=""/></a>
      <ul class="navigation" id="navigation">
        <li class="${Home}"><a href="UserController">Home</a></li>
        <li class="${PetMart}"><a href="UserController?action=petmart">PetMart</a></li>
        <li class="${PetGuide}"><a href="UserController?action=petguide">PetGuide</a></li>
        <li class="${AboutUs}"><a href="UserController?action=aboutus">About us</a></li>
        <li class="${ContactUS}"><a href="UserController?action=contactus">Contact us</a></li>
        <li class="${Cart}">
          <a href="UserController?action=showCart" style="padding-top: 5px;background: none">
            <i class="material-icons">shopping_cart</i>
            <jsp:useBean id="cart" scope="session" class="vn.aptech.classes.CartBean" />
            <span class="cart-number">
              <c:if test="${cart.lineItemCount != 0}">
                ${cart.lineItemCount}
              </c:if>
              <c:if test="${cart.lineItemCount == 0}">
                0
              </c:if>
            </span>
          </a>
        </li>
      </ul>
    </div>
    <!--<script>
      function myFunction() {
        var x = document.getElementById("header");
        if (x.className === "topnav") {
          x.className += " responsive";
        } else {
          x.className = "topnav";
        }
      }
    </script>-->
