<%-- 
    Document   : category
    Created on : Feb 9, 2020, 11:06:40 AM
    Author     : ngodu
--%>

<%@page import="vn.aptech.entity.ProductUnits"%>
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
                <div class="row">
                  <div class="col-md-4">
                    <h4 class="card-title "><b>Products</b></h4>
                    <a href="#" data-toggle="modal" data-target="#addProd" style="color: #fff">
                      Add new Product
                    </a>
                  </div>
                  <div class="col-md-4">
                    <form class="navbar-form " action="EmployeeController?action=product" method="post" style="padding-top: 2%;">
                      <div class="input-group no-border">
                        <label class="bmd-label-floating" style="color:#fff">Search</label>
                        <input type="text" value="${txtSearch}" class="form-control search" name="txtSearch">
                        <button type="submit" class="btn btn-white btn-round btn-just-icon">
                          <i class="material-icons">search</i>
                          <div class="ripple-container"></div>
                        </button>
                      </div>
                    </form>
                  </div>
                  <div class="col-md-4 form-group">
                    <label class="bmd-label-floating" style="color: #fff">Number of Product per page</label>
                    <form action="EmployeeController?action=product" method="post" id="changePageSize">
                      <select name="pageSize" id="pageSize" class="browser-default custom-select" onchange="this.form.submit()">
                        <option value="10" <c:if test="${pageSize == 2}"> selected="true" </c:if >>10</option>
                        <option value="50" <c:if test="${pageSize == 4}"> selected="true" </c:if>>50</option>
                        <option value="100" <c:if test="${pageSize == 100}"> selected="true" </c:if>>100</option>
                        </select>
                      </form>
                    </div>
                  </div>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table">
                      <thead class=" text-primary">
                      <th>
                        No.
                      </th>
                      <th>
                        Name
                      </th>
                      <th>
                        Category
                      </th>                                 
                      <th>
                        Quantity
                      </th>
                       <th>
                        Price
                      </th>
                      <th>
                        Unit
                      </th>
                      <th>
                        Feature
                      </th>                   
                      <th>
                        Created by
                      </th>
                      <th>
                        Action
                      </th>
                      </thead>
                      <tbody>
                      <% int i = 1;%>
                      <c:forEach items="${Products}" var="prod">
                        <tr>
                          <td>
                            <%= i%>
                            <% i++;
                            %>
                          </td>
                          <td>
                            ${prod.name}
                          </td>
                          <td class="show-read-more" style="white-space: nowrap; width: 12em; overflow: hidden; text-overflow: ellipsis;" title="${prod.cateId.name}">
                            ${prod.cateId.name}
                          </td>
                          <td>
                            ${prod.quantity}
                          </td>
                          <td>
                            ${prod.price}
                          </td>
                          <td>
                            ${prod.unitId.name}
                          </td>
                          <td>
                            ${prod.isNew}
                          </td>                       
                          <td>
                            ${prod.accId.username}
                          </td>
                          <td>
                            <a href="EmployeeController?action=viewEditProd&prodId=${prod.prodId}" style="color: #333" title="Edit"><i class="material-icons">edit</i></a>
                            <form action="EmployeeController?action=deleteProd" method="post" id="deleteProd${prod.prodId}">
                              <input type="text" name="prodId" value="${prod.prodId}" hidden="true">
                              <a href="#" type="submit" style="color: #333" title="Delete" id="deleteProd" onclick="deleteProd()"><i class="material-icons">delete</i></a>
                            </form>
                          </td>
                      <script>
                        function deleteProd() {
                          swal({
                            title: "Are you sure?",
                            text: "You will not be able to recover this Product!",
                            icon: "warning",
                            buttons: [
                              'No, cancel it!',
                              'Yes, I am sure!'
                            ],
                            dangerMode: true
                          }).then(function (isConfirm) {
                            if (isConfirm) {
                              $("#deleteProd${prod.prodId}").submit();
                            }
                          });
                        }

                      </script>
                      </tr>
                    </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div>
              <nav aria-label="Page navigation example">
                <ul class="pagination pg-blue justify-content-center">
                  <c:if test="${currentPage != 1}">
                    <li class="page-item"><a class="page-link" href="EmployeeController?action=product&pageSize=${pageSize}&currentPage=${currentPage-1}">Previous</a>
                    </li>
                  </c:if>

                  <c:forEach begin="1" end="${noOfPages}" var="i">
                    <c:choose>
                      <c:when test="${currentPage eq i}">
                        <li class="page-item active"><a class="page-link">
                            ${i} <span class="sr-only">(current)</span></a>
                        </li>
                      </c:when>
                      <c:otherwise>
                        <li class="page-item"><a class="page-link" href="EmployeeController?action=product&pageSize=${pageSize}&currentPage=${i}">${i}</a>
                        </li>
                      </c:otherwise>
                    </c:choose>
                  </c:forEach>

                  <c:if test="${currentPage lt noOfPages}">
                    <li class="page-item"><a class="page-link" href="EmployeeController?action=product&pageSize=${pageSize}&currentPage=${currentPage+1}">Next</a>
                    </li>
                  </c:if>    
                </ul>
              </nav>
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
      <form autocomplete="off" action="EmployeeController?action=addProd" method="post" enctype="multipart/form-data" >
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Add new Category</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label for="Category" class="bmd-label-floating">Category</label>
            <select name="cateId" class="form-control" style="-webkit-appearance: listbox;" >
              <c:forEach items="${Categories}" var="category">
                <option value="${category.cateId}">${category.name}</option>
              </c:forEach>
            </select>
          </div>
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
            <input type="number" class="form-control" id="Quantiy" name="quantity" required="true" min="0" max="99999">
          </div>
          <div class="form-group">
            <label for="Price" class="bmd-label-floating">Price</label>
            <input type="number" class="form-control" id="Price" name="price" required="true" min="0" max="99999">
          </div>
          <div class="form-group">
            <label for="Unit" class="bmd-label-floating">Unit</label>
            <select name="unitId" class="form-control" style="-webkit-appearance: listbox;" >
              <c:forEach items="${Units}" var="unit">
                <option value="${unit.unitId}">${unit.name}</option>
              </c:forEach>
            </select>            
          </div>
          <div class="form-group">
            <label for="Description" class="bmd-label-floating">Is New</label><br>
            <input type="radio" id="yes" name="isNew" value="true" checked="checked">
            <label for="yes">Yes</label>
            <input type="radio" id="no" name="isNew" value="false">
            <label for="no">No</label><br>
          </div>
          <div class="form-group" style="text-align: center">
            <label for="Image" class="bmd-label-floating" style="float: left;">Choose Image</label>
            <img src="#" id="imageChange" height="200" style="max-width: 500px"/>
            <input type="file" class="form-control" id="fileupload" name="file" required="true" accept="image/*" style="opacity: 1;position: static;" onchange="readURL(this);" />
          </div>
          <br/>
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


<!-- View Images after select file -->
<script>
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('#imageChange')
                .attr('src', e.target.result)
      };

      reader.readAsDataURL(input.files[0]);
    }
  }
</script>
<%@include file="../templates-Employee/footer.jsp" %>
