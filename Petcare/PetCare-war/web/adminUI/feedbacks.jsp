<%-- 
    Document   : feedbacks
    Created on : Mar 12, 2020, 8:26:16 PM
    Author     : TheVi-PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../templates-Admin/header.jsp" %>
<div class="wrapper ">
    <%@include file="../templates-Admin/sidebar.jsp" %>    
    <div class="main-panel">
        <div class="wrapper ">
            <%@include file="../templates-Admin/sidebar.jsp" %>    
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table">

                                            <thead class=" text-primary">
                                            <th>
                                                ID
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
                                                Content 
                                            </th>
                                            <th>
                                                IsRead 
                                            </th>
                                            <th>
                                                Date Created
                                            </th>
                                            
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${feedbacks}" var="feed">
                                                    <tr>
                                                        <td>
                                                            ${feed.feedbacktId}
                                                        </td>
                                                        <td>
                                                            ${feed.fullname}
                                                        </td>
                                                        <td>
                                                            ${feed.email}
                                                        </td>
                                                        <td>
                                                            ${feed.phone}
                                                        </td>
                                                        <td>
                                                            ${feed.content}
                                                        </td>
                                                        <td>
                                                            ${feed.isRead}
                                                        </td>
                                                        <td>
                                                            ${feed.dateCreated}
                                                        </td>
                                                        
<!--                                                        <td>
                                                            <a href="AdminController?action=viewEditAccount&accId=${acc.accId}" style="color: #333" title="Edit"><i class="material-icons">edit</i></a>
                                                            <form action="AdminController?action=deleteAccount" method="post" id="deleteAccount${acc.accId}">
                                                                <input type="text" name="accId" value="${acc.accId}" hidden="true">
                                                                <a href="#" type="submit" style="color: #333" title="Delete" id="" onclick="deleteAccount${acc.accId}()"><i class="material-icons">delete</i></a>
                                                            </form>
                                                        </td>-->
<!--                                                <script>
                                                    function deleteAccount${acc.accId}() {
                                                        swal({
                                                            title: "Are you sure?",
                                                            text: "You will not be able to recover this Account!",
                                                            icon: "warning",
                                                            buttons: [
                                                                'No, cancel it!',
                                                                'Yes, I am sure!'
                                                            ],
                                                            dangerMode: true
                                                        }).then(function (isConfirm) {
                                                            if (isConfirm) {
                                                                $("#deleteAccount${acc.accId}").submit();
                                                            }
                                                        });
                                                    }

                                                </script>-->
                                                </tr>
                                            </c:forEach>
                                            </tbody>

                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal Create Category -->
    <div class="modal fade" id="addAccount" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form autocomplete="off" action="AdminController?action=addAccount" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add new Account</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="Username" class="bmd-label-floating">Username</label>
                            <input type="text" class="form-control" id="Username" name="username" required="true" minlength="5" maxlength="200">
                        </div>
                        <div class="form-group">
                            <label for="Password" class="bmd-label-floating">Password</label>
                            <input type="password" class="form-control" id="Password" name="password" required="true">
                        </div>
                        <div class="form-group">
                            <label for="Email" class="bmd-label-floating">Email</label>
                            <input type="email" class="form-control" id="Email" name="email" required="true">
                        </div>
                        <div class="form-group">
                            <label for="Fullname" class="bmd-label-floating">Full name</label>
                            <input type="text" class="form-control" id="Fullname" name="fullname">
                        </div>
                        <div class="form-group">
                            <label for="Phone" class="bmd-label-floating">Phone number</label>
                            <input type="number" class="form-control" id="Phone" name="phone" required="true">
                        </div>

                        <div class="form-group">
                            <label for="Role" class="bmd-label-floating">Role</label>
                            <INPUT TYPE="radio" name="role" value="0"/>Customer 
                            <INPUT TYPE="radio" NAME="role" VALUE="1" checked="true"/>Employee 
                            <INPUT TYPE="radio" NAME="role" VALUE="2"/>Administrator 
                        </div>
<!--                        <div class="custom-control custom-switch">
                            <input type="checkbox" class="custom-control-input cbx-active" id="switch${acc.accId}" ${acc.isInactive ? "checked" : ""} accId="${acc.accId}">
                            <label class="custom-control-label" for="switch${acc.accId}">${acc.isInactive ? "InActive" : "Active"}</label>
                        </div>-->
                        <br/>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <% if (request.getAttribute("Error") != null) { %>
    <script>
        swal("Error", "${Error}", "error");
    </script>
    <%};
        request.removeAttribute("Error");
        if (request.getAttribute("Success") != null) { %>
    <script>
        swal("Success", "${Success}", "success");
    </script>
    <%};
        request.removeAttribute("Success");
    %>
//
//    <script>
//        $('.cbx-active').change(function () {
//            var checkBox = $(this);
//            var accId = checkBox.attr('accId');
//            var value = this.checked;
//            $.post('http://localhost:8080/Petcare-war/EmployeeController?action=change-state', {
//                accId: accId,
//                value: value
//            }, function (resp) {
//                checkBox.next().html(resp);
//            });
//        });
//    </script>

    <%@include file="../templates-Admin/footer.jsp" %>
