<%-- 
    Document   : accountList
    Created on : Mar 16, 2020, 4:00:09 PM
    Author     : happy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <h4 class="card-title "><b>${title}</b></h4>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>

</head>
<body>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-hover">
                <thead class=" text-primary">
                <th>
                    Account ID
                </th>
                <th>
                    Username
                </th>
                <th>
                    Full Name
                </th>
                <th>
                    Email
                </th>
                <th>
                    Phone
                </th>
                <th>
                    Address
                </th>
                <th>
                    Role
                </th>
                <th>
                    Status
                </th>
                <th>
                    Date Created
                </th>
                <th>
                    Reason Banned
                </th>
                <c:forEach items="${accountList}" var="acc">
                    <tr>
                        <td>
                            ${acc.accId}
                        </td>
                        <td>
                            ${acc.username}
                        </td>
                        <td>
                            ${acc.fullname}
                        </td>
                        <td>
                            ${acc.email}
                        </td>
                        <td>
                            0${acc.phone}
                        </td>
                        <td>
                            ${acc.address}
                        </td>
                        <td>
                            <c:if test="${acc.role == 0}">User</c:if>
                            <c:if test="${acc.role == 1}">Employee</c:if>
                            <c:if test="${acc.role == 2}">Administrator</c:if>
                            </td>
                            <td>
                            <c:if test="${acc.isActive == true}">Active</c:if>
                            <c:if test="${acc.isActive == false}">Banned</c:if>
                            </td>
                            <td>
                            ${acc.dateCreated}
                        </td>
                        <td>
                            ${acc.reasonBanned}
                        </td>
                    </tr>
                </c:forEach>
                </tbody>

            </table>
        </div>
    </div>
</body>
</html>
