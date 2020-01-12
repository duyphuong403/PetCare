<%-- 
    Document   : navbar
    Created on : Dec 13, 2019, 10:12:35 AM
    Author     : Dell
--%>
<% if (session.getAttribute("curAcc") != null) { %>
<div style="float: right; padding-right: 1%; padding-top: 2%;"><a href="AdminController?action=profile&id=${curAcc.accId}" style="color: #2c1d00;font-family: 'Myriad Pro'; text-decoration: none;">Hi <b>${curAcc.fullname}</b></a></div>
<%}%>
<div id="header"> 
    <a href="#" id="logo"><img src="lib/images/logo.gif" width="310" height="114" alt=""/></a>
    <ul class="navigation" id="navigation">
        <li class="${Home}"><a href="UserController">Home</a></li>
        <li class="${PetMart}"><a href="UserController?action=petmart">PetMart</a></li>
        <li class="${Blog}"><a href="UserController?action=blog">Blog</a></li>
        <li class="${PetGuide}"><a href="UserController?action=petguide">PetGuide</a></li>
        <li class="${AboutUs}"><a href="UserController?action=aboutus">About us</a></li>
        <li class="${ContactUS}"><a href="UserController?action=contactus">Feedback</a></li>
    </ul>
</div>

