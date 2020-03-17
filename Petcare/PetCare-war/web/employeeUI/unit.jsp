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
                <h4 class="card-title "><b>Units</b></h4>
                <a href="#" data-toggle="modal" data-target="#addUnit" style="color: #fff">
                  Add new Unit
                </a>                
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table">
                    <thead class=" text-primary">
                    <th>
                      UnitId
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
                      <c:forEach items="${Units}" var="unit">
                        <tr>
                          <td>
                            ${unit.unitId}
                          </td>
                          <td>
                            ${unit.name}
                          </td>
                          <td class="show-read-more" style="white-space: nowrap; width: 12em; overflow: hidden; text-overflow: ellipsis;" title="${unit.description}">
                            ${unit.description}
                          </td>                       
                          <td>
                            <fmt:formatDate value="${unit.dateUpdated}" pattern="HH:mm:ss MM-dd-yyyy" />
                          </td>
                          <td>
                            <fmt:formatDate value="${unit.dateCreated}" pattern="HH:mm:ss MM-dd-yyyy" />
                          </td>
                          <td>
                            <a href="#" data-toggle="modal" data-target="#editUnit${unit.unitId}" style="color: #333" title="Edit"><i class="material-icons">edit</i></a>
                            <form action="EmployeeController?action=deleteUnit" method="post" id="deleteUnit${unit.unitId}">
                              <input type="text" name="unitId" value="${unit.unitId}" hidden="true">
                              <a href="#" type="submit" style="color: #333" title="Delete" id="deleteUnit" onclick="deleteUnit${unit.unitId}()"><i class="material-icons">delete</i></a>
                            </form>
                          </td>
                      <script>
                        function deleteUnit${unit.unitId}() {
                          swal({
                            title: "Are you sure?",
                            text: "You will not be able to recover this Unit!",
                            icon: "warning",
                            buttons: [
                              'No, cancel it!',
                              'Yes, I am sure!'
                            ],
                            dangerMode: true,
                          }).then(function (isConfirm) {
                            if (isConfirm) {
                              $("#deleteUnit${unit.unitId}").submit();
                            }
                          })
                        }

                      </script>
                      <!-- Modal Edit Unit -->
                      <div class="modal fade" id="editUnit${unit.unitId}" tabindex="-1" role="dialog" aria-labelledby="EditModalLabel"
                           aria-hidden="true">
                        <div class="modal-dialog" role="document">
                          <div class="modal-content">
                            <form autocomplete="off" action="EmployeeController?action=editUnit" method="post">
                              <input type="text" name="unitId" hidden="true" value="${unit.unitId}"/>
                              <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Edit Unit</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                  <span aria-hidden="true">&times;</span>
                                </button>
                              </div>
                              <div class="modal-body">
                                <div class="form-group">
                                  <label for="Name" class="bmd-label-floating">Name</label>
                                  <input type="text" class="form-control" id="Name" name="name" required="true" value="${unit.name}" maxlength="200">
                                </div>
                                <div class="form-group">
                                  <label for="Description" class="bmd-label-floating">Description</label>
                                  <input type="text" class="form-control" id="Description" name="description" required="true" value="${unit.description}" maxlength="200">
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
<!-- Modal Create Unit -->
<div class="modal fade" id="addUnit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <form autocomplete="off" action="EmployeeController?action=addUnit" method="post" >
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Add new Unit</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label for="Name" class="bmd-label-floating">Name</label>
            <input type="text" class="form-control" id="Name" name="name" required="true" maxlength="50">
          </div>
          <div class="form-group">
            <label for="Description" class="bmd-label-floating">Description</label>
            <input type="text" class="form-control" id="Description" name="description" maxlength="200">
          </div>
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

<%@include file="../templates-Employee/footer.jsp" %>
