<%-- 
    Document   : category
    Created on : Feb 9, 2020, 11:06:40 AM
    Author     : ngodu
--%>

<%@include file="../templates-Employee/header.jsp" %>

<div class="wrapper ">
    <%@include file="../templates-Employee/sidebar.jsp" %>    
    <div class="main-panel">
        <%@include file="../templates-Employee/status-bar.jsp" %>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header card-header-primary">
                                <h4 class="card-title "><b>Accounts</b></h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table">
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
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${accounts}" var="acc">
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
                                                        ${acc.phone}
                                                    </td>
                                                    <td>
                                                        ${acc.address}
                                                    </td>
                                                    <td>
                                                        ${acc.role}
                                                    </td>
                                                    <td>
                                                        <div class="custom-control custom-switch">
                                                            <input type="checkbox" class="custom-control-input cbx-active" id="switch${acc.accId}" ${acc.isInactive ? "checked" : ""} accId="${acc.accId}">
                                                            <label class="custom-control-label" for="switch${acc.accId}">${acc.isInactive ? "InActive" : "Active"}</label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        ${acc.dateCreated}
                                                    </td>
                                                    <td>
                                                        ${acc.reasonBanned}
                                                    </td>
<!--                                                    <td>
                                                        <a href="#" data-toggle="modal" data-target="#editCate${cate.cateId}" style="color: #333" title="Edit"><i class="material-icons">edit</i></a>
                                                        <form action="EmployeeController?action=deleteCate" method="post" id="deleteCate${cate.cateId}">
                                                            <input type="text" name="cateId" value="${cate.cateId}" hidden="true">
                                                            <a href="#" type="submit" style="color: #333" title="Delete" id="deleteCate" onclick="deleteCate()"><i class="material-icons">delete</i></a>
                                                        </form>
                                                    </td>-->
                                            <script>
                                                function deleteCate() {
                                                    swal({
                                                        title: "Are you sure?",
                                                        text: "You will not be able to recover this Category!",
                                                        icon: "warning",
                                                        buttons: [
                                                            'No, cancel it!',
                                                            'Yes, I am sure!'
                                                        ],
                                                        dangerMode: true,
                                                    }).then(function (isConfirm) {
                                                        if (isConfirm) {
                                                            $("#deleteCate${cate.cateId}").submit();
                                                        }
                                                    })
                                                }

                                            </script>
                                            <!-- Modal Edit Category -->
                                            <div class="modal fade" id="editCate${cate.cateId}" tabindex="-1" role="dialog" aria-labelledby="EditModalLabel"
                                                 aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <form autocomplete="off" action="EmployeeController?action=editCate" method="post">
                                                            <input type="text" name="cateId" hidden="true" value="${cate.cateId}"/>
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">Add new Category</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="form-group">
                                                                    <label for="Name" class="bmd-label-floating">Name</label>
                                                                    <input type="text" class="form-control" id="Name" name="name" required="true" value="${cate.name}">
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="Description" class="bmd-label-floating">Description</label>
                                                                    <input type="text" class="form-control" id="Description" name="description" required="true" value="${cate.description}">
                                                                </div>
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
<div class="modal fade" id="addCate" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form autocomplete="off" action="EmployeeController?action=addCate" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add new Category</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="Name" class="bmd-label-floating">Name</label>
                        <input type="text" class="form-control" id="Name" name="name" required="true">
                    </div>
                    <div class="form-group">
                        <label for="Description" class="bmd-label-floating">Description</label>
                        <input type="text" class="form-control" id="Description" name="description" required="true">
                    </div>
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

<script>
    $('.cbx-active').change(function(){
        var checkBox = $(this);
        var accId = checkBox.attr('accId');
        var value = this.checked;
        $.post('http://localhost:8080/Petcare-war/EmployeeController?action=change-state',{
            accId: accId,
            value: value
        }, function(resp) {
            checkBox.next().html(resp);
        });
    });
</script>

<%@include file="../templates-Employee/footer.jsp" %>
