<%-- 
    Document   : invoice
    Created on : Mar 12, 2020, 10:25:40 PM
    Author     : Dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0105)https://s3-eu-west-1.amazonaws.com/htmlpdfapi.production/free_html5_invoice_templates/example1/index.html -->
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Petcare | Invoice</title>

    <link rel="shortcut icon" type="image/x-icon" href="lib/images/pet-icon.png"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <style>
      .clearfix:after {
        content: "";
        display: table;
        clear: both;
      }

      a {
        color: #5D6975;
        text-decoration: underline;
      }

      body {
        position: relative;
        width: 21cm;  
        height: 29.7cm; 
        margin: 0 auto; 
        color: #001028;
        background: #FFFFFF; 
        font-family: Arial, sans-serif; 
        font-size: 12px; 
        font-family: Arial;
      }

      header {
        padding: 10px 0;
        margin-bottom: 30px;
      }

      #logo {
        text-align: center;
        margin-bottom: 10px;
      }

      #logo img {
        width: 90px;
      }

      h1 {
        border-top: 1px solid  #5D6975;
        border-bottom: 1px solid  #5D6975;
        color: #5D6975;
        font-size: 2.4em;
        line-height: 1.4em;
        font-weight: normal;
        text-align: center;
        margin: 0 0 20px 0;
        background: url(dimension.png);
      }

      #project {
        float: left;
      }

      #project span {
        color: #5D6975;
        text-align: right;
        width: 52px;
        margin-right: 10px;
        display: inline-block;
        font-size: 0.8em;
      }

      #company {
        float: right;
        text-align: right;
      }

      #project div,
      #company div {
        white-space: nowrap;        
      }

      #notices .notice {
        color: #5D6975;
        font-size: 1.2em;
      }

      footer {
        color: #5D6975;
        width: 100%;
        height: 30px;
        position: absolute;
        bottom: 0;
        border-top: 1px solid #C1CED9;
        padding: 8px 0;
        text-align: center;
      }
    </style>
  </head>
  <body>
    <c:set value="${Order}" var="ord" scope="session"/>
    <header class="clearfix">
      <div id="logo">
        <img src="lib/images/pet-icon.png">
      </div>
      <h1>INVOICE <b>#${ord.orderId}</b></h1>
      <div id="company" class="clearfix">
        <div>Petcare</div>
        <div>590 Cach Mang Thang Tam street,<br> District 3, HCM City, Viet Nam</div>
        <div>(602) 519-0450</div>
        <div><a href="mailto:support@petcare.com">support@petcare.com</a></div>
      </div>
      <div id="project">
        <div><span>FULNAME</span> ${ord.accId.fullname}</div>
        <div><span>PHONE</span> 0${ord.accId.phone}</div>
        <div><span>ADDRESS</span> ${ord.accId.address}</div>
        <div><span>EMAIL</span> <a href="mailto:${ord.accId.email}">${ord.accId.email}</a></div>
        <div><span>DATE</span> ${ord.dateCreated}</div>
      </div>
    </header>
    <main>
      <table class="table table-striped">
        <thead>
          <tr>
            <th scope="col">NO.</th>
            <th scope="col">PRODUCT</th>
            <th scope="col">UNIT</th>
            <th scope="col">PRICE</th>
            <th scope="col">QTY</th>
            <th scope="col">TOTAL</th>
          </tr>
        </thead>
        <tbody>
          <%int i = 1;%>
          <c:forEach var="ordDt" items="${OrderDetails}">
            <tr>
              <th scope="row"><%= i%></th>
              <td>${ordDt.name}</td>
              <td>${ordDt.unit}</td>
              <td>${ordDt.price}</td>
              <td>${ordDt.quantity}</td>             
              <td>${ordDt.total}</td>
              <% i++;%>
            </tr>
          </c:forEach>
          <tr>
            <c:set value="${SubTotal}" var="subtotal" scope="session"/>
            <td colspan="5" style="font-size:20px; text-align: right"><b>Subtotal:</b></td>
            <td style="font-size: 20px"><b>${SubTotal}</b></td>
          </tr>
        </tbody>
      </table>
      <div id="notices">
        <div>NOTICE:</div>
        <div class="notice">A finance charge of 1.5% will be made on unpaid balances after 30 days.</div>
      </div>
    </main>
    <footer>
      Invoice was created on a computer and is valid without the signature and seal.
    </footer>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  </body>
</html>