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
                <h4 class="card-title "><b>Products</b></h4>
                <a href="#" data-toggle="modal" data-target="#addProd" style="color: #fff">
                  Add new Product
                </a>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table">
                    <thead class=" text-primary">
                    <th>
                      ProdId
                    </th>
                    <th>
                      Name
                    </th>
                    <th>
                      Description
                    </th>
                    <th>
                      Image
                    </th>
                    <th>
                      Quantity
                    </th>
                    <th>
                      Unit
                    </th>
                    <th>
                      Is New
                    </th>
                    <th>
                      DateUpdated
                    </th>
                    <th>
                      DateCreated
                    </th>
                    <th>
                      Created by
                    </th>
                    <th>
                      Action
                    </th>
                    </thead>
                    <tbody>
                      <c:forEach items="${Products}" var="prod">
                        <tr>
                          <td>
                            ${prod.prodId}
                          </td>
                          <td>
                            ${prod.name}
                          </td>
                          <td class="show-read-more" style=" display: block; white-space: nowrap; width: 12em; overflow: hidden; text-overflow: ellipsis;" title="${prod.description}">
                            ${prod.description}
                          </td>
                          <td>
                            ${prod.imageName}
                          </td>
                          <td>
                            ${prod.quantity}
                          </td>
                          <td>
                            ${prod.unit}
                          </td>
                          <td>
                            ${prod.isNew}
                          </td>
                          <td>
                            ${prod.dateUpdated}
                          </td>
                          <td>
                            ${prod.dateCreated}
                          </td>
                          <td>
                            ${prod.accId.username}
                          </td>
                          <td>
                            <a href="#" data-toggle="modal" data-target="#editProd${prod.prodId}" style="color: #333" title="Edit"><i class="material-icons">edit</i></a>
                            <form action="EmployeeController?action=deleteProd" method="post" id="deleteProd${prod.prodId}">
                              <input type="text" name="cateId" value="${prod.prodId}" hidden="true">
                              <a href="#" type="submit" style="color: #333" title="Delete" id="deleteProd" onclick="deleteProd()"><i class="material-icons">delete</i></a>
                            </form>
                          </td>
                      <script>
                        function deleteCate() {
                          swal({
                            title: "Are you sure?",
                            text: "You will not be able to recover this Product!",
                            icon: "warning",
                            buttons: [
                              'No, cancel it!',
                              'Yes, I am sure!'
                            ],
                            dangerMode: true,
                          }).then(function (isConfirm) {
                            if (isConfirm) {
                              $("#deleteProd${prod.prodId}").submit();
                            }
                          })
                        }

                      </script>
                      <!-- Modal Edit Category -->
                      <div class="modal fade" id="editProd${prod.prodId}" tabindex="-1" role="dialog" aria-labelledby="EditModalLabel"
                           aria-hidden="true">
                        <div class="modal-dialog" role="document">
                          <div class="modal-content">
                            <form autocomplete="off" action="EmployeeController?action=editProd" method="post">
                              <input type="text" name="cateId" hidden="true" value="${prod.prodId}"/>
                              <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Add new Category</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                  <span aria-hidden="true">&times;</span>
                                </button>
                              </div>
                              <div class="modal-body">
                                <div class="form-group">
                                  <label for="Name" class="bmd-label-floating">Name</label>
                                  <input type="text" class="form-control" id="Name" name="name" required="true" value="${prod.name}" maxlength="200">
                                </div>
                                <div class="form-group">
                                  <label for="Description" class="bmd-label-floating">Description</label>
                                  <input type="text" class="form-control" id="Description" name="description" required="true" value="${prod.description}" maxlength="200">
                                </div>
                                <div class="form-group">
                                  <label for="Image" class="bmd-label-floating">Image</label>
                                  <input type="text" class="form-control" id="Image" name="imageName" required="true" value="${prod.imageName}" maxlength="200">
                                </div>
                                <div class="form-group">
                                  <label for="Quantity" class="bmd-label-floating">Quantity</label>
                                  <input type="number" class="form-control" id="Quantity" name="quantity" required="true" value="${prod.quantity}">
                                </div>
                                <div class="form-group">
                                  <label for="Unit" class="bmd-label-floating">Unit</label>
                                  <input type="text" class="form-control" id="Unit" name="unit" required="true" value="${prod.unit}" maxlength="50">
                                </div>
                                <div class="form-group">
                                  <label for="IsNew" class="bmd-label-floating">Is New</label>
                                  <input type="text" class="form-control" id="IsNew" name="isNew" required="true" value="${prod.isNew}">
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
<!-- Modal Create Product -->
<div class="modal fade" id="addProd" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <form autocomplete="off" action="EmployeeController?action=addProd" method="post" enctype="multipart/form-data">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Add new Category</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label for="Name" class="bmd-label-floating">Name</label>
            <input type="text" class="form-control" id="Name" name="name" required="true" maxlength="200">
          </div>
          <div class="form-group">
            <label for="Description" class="bmd-label-floating">Description</label>
            <input type="text" class="form-control" id="Description" name="description" required="true" maxlength="200">
          </div>
          <div class="form-group">
            <label for="Quantiy" class="bmd-label-floating">Quantiy</label>
            <input type="number" class="form-control" id="Quantiy" name="description" required="true">
          </div>
          <div class="form-group">
            <label for="Unit" class="bmd-label-floating">Unit</label>
            <input type="text" class="form-control" id="Unit" name="unit" required="true" maxlength="50">
          </div>
          <div class="form-group">
            <label for="Description" class="bmd-label-floating">Is New</label><br>
            <input type="radio" id="yes" name="isNew" value="true" checked="checked">
            <label for="yes">Yes</label>
            <input type="radio" id="no" name="isNew" value="false">
            <label for="no">No</label><br>
          </div>
          <div class="form-group">
            <label for="Image" class="bmd-label-floating">Choose Image</label>
            <input type="file" class="form-control" id="fileupload" name="files" multiple required="true" accept="image/*" style="opacity: 1;position: static;" onchange="readURL(this);"/>
          </div>
          <br/>
          <br/>
          <div id='dvPreview'></div>
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
<!-- View Images after select file -->
<script language="javascript" type="text/javascript">
  window.onload = function () {
    var fileUpload = document.getElementById("fileupload");
    fileUpload.onchange = function () {
      if (typeof (FileReader) != "undefined") {
        var dvPreview = document.getElementById("dvPreview");
        dvPreview.innerHTML = "";
        var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
        for (var i = 0; i < fileUpload.files.length; i++) {
          var file = fileUpload.files[i];
          if (regex.test(file.name.toLowerCase())) {
            var reader = new FileReader();
            reader.onload = function (e) {
              var img = document.createElement("IMG");
              img.height = "115";
              img.width = "115";
              img.src = e.target.result;
              dvPreview.appendChild(img);
            }
            reader.readAsDataURL(file);
          } else {
            alert(file.name + " is not a valid image file.");
            dvPreview.innerHTML = "";
            return false;
          }
        }
      } else {
        alert("This browser does not support HTML5 FileReader.");
      }
    }
  };
</script>

<!-- Count length and replace by ... -->
<script>

</script>
<%@include file="../templates-Employee/footer.jsp" %>
