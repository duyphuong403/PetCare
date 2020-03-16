<%-- 
    Document   : accountList
    Created on : Mar 16, 2020, 4:00:09 PM
    Author     : happy
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
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
        <div id="logo">
            <img src="lib/images/pet-icon.png">
        </div>
        <h1><b>${title}</b></h1>
        <div id="company" class="clearfix">
            <div>Petcare</div>
            <div>590 Cach Mang Thang Tam street,<br> District 3, HCM City, Viet Nam</div>
            <div>(602) 519-0450</div>
            <div><a href="mailto:support@petcare.com">support@petcare.com</a></div>
        </div>
        <div>
            <table class="table table-striped">
                <th>
                    PetGuide ID
                </th>
                <th>
                    Title
                </th>
                <th>
                    Content
                </th>
                
                <th>
                    Date Created
                </th>
                
                <c:forEach items="${petguideList}" var="acc">
                    <tr>
                        <td>
                            ${acc.petGuideId}
                        </td>
                        <td>
                            ${acc.title}
                        </td>
                        <td>
                            ${acc.content}
                        </td>
                        <td>
                            ${acc.dateCreated}
                        </td>
                        
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
</html>
