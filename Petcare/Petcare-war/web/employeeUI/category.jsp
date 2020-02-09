<%-- 
    Document   : category
    Created on : Feb 9, 2020, 11:06:40 AM
    Author     : ngodu
--%>

<%@include file="../templates-Employee/header.jsp" %>
<div class="wrapper ">
    <%@include file="../templates-Employee/sidebar.jsp" %>    
    <div class="main-panel">
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header card-header-primary">
                                <h4 class="card-title ">Categories</h4>
                                <a href="#" data-toggle="modal" data-target="#addCate" style="color: #333">
                                    Add new Category
                                </a>
                                <!-- Modal -->
                                <div class="modal fade" id="basicExampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                                     aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                ...
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                <button type="button" class="btn btn-primary">Save changes</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead class=" text-primary">
                                        <th>
                                            CateID
                                        </th>
                                        <th>
                                            Name
                                        </th>
                                        <th>
                                            Description
                                        </th>
                                        <th>
                                            DateUpdated
                                        </th>
                                        <th>
                                            DateCreated
                                        </th>
                                        <th>
                                            Action
                                        </th>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${Categories}" var="cate">
                                            <tr>
                                                <td>
                                                    ${cate.cateId}
                                                </td>
                                                <td>
                                                    ${cate.name}
                                                </td>
                                                <td>
                                                    ${cate.description}
                                                </td>
                                                <td>
                                                    ${cate.dateUpdated}
                                                </td>
                                                <td>
                                                    ${cate.dateCreated}
                                                </td>
                                                <td>
                                                    <a href="#" style="color: #333" title="Edit"><i class="material-icons">edit</i></a>
                                                    <a href="#" style="color: #333" title="Delete" onclick="return confirm('Are you sure want Delete ?')"><i class="material-icons">delete</i></a>
                                                </td>
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
<%@include file="../templates-Employee/footer.jsp" %>
