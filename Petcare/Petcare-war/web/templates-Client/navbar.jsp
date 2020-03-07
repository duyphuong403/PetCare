<%-- 
    Document   : navbar
    Created on : Dec 13, 2019, 10:12:35 AM
    Author     : Dell
--%>

<div id="header" class="topnav"> 
    <a href="#" id="logo"><img src="lib/images/logo.gif" width="310" height="114" alt=""/></a>
    <ul class="navigation" id="navigation">
        <li class="${Home}"><a href="UserController">Home</a></li>
        <li class="${PetMart}"><a href="UserController?action=petmart">PetMart</a></li>
        <li class="${PetGuide}"><a href="UserController?action=petguide">PetGuide</a></li>
        <li class="${AboutUs}"><a href="UserController?action=aboutus">About us</a></li>
        <li class="${ContactUS}"><a href="UserController?action=contactus">Contact us</a></li>
        <% if (session.getAttribute("curAcc") == null) { %>
            <li class="" style="width: 135px;"><a href="UserController?action=login">Sign In/Sign Up</a></li>
            <li class="${Cart}"><a href="UserController?action=cart" style="padding-top: 5px;background: none"><i class="material-icons">shopping_cart</i></a></li>
        <%}else {%>        
            <li class="${Cart}"><a href="UserController?action=cart" style="padding-top: 5px;"><i class="material-icons">shopping_cart</i></a></li>
            <li class="" style="width: 20%"><a href="UserController?action=profile&id=${curAcc.accId}" style="background: none">Hi <i>${curAcc.fullname}</i></li>
        <%}%>
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
