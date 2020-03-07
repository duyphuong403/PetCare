<%-- 
    Document   : navbar
    Created on : Dec 13, 2019, 10:12:35 AM
    Author     : Dell
--%>

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
        <%} else {%>
        <a href="UserController?action=profile&id=${curAcc.accId}" style="background: none">Hi <i>${curAcc.fullname}</i>
        <% } %>
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
      <a href="UserController?action=cart" style="padding-top: 5px;background: none">
        <i class="material-icons">shopping_cart</i>
        <span class="cart-number">3</span>
      </a>
    </li>
  </ul>
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  </a>
</div>
<script>
  function myFunction() {
    var x = document.getElementById("header");
    if (x.className === "topnav") {
      x.className += " responsive";
    } else {
      x.className = "topnav";
    }
  }
</script>
