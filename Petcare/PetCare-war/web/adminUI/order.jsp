<%-- 
    Document   : home
    Created on : Dec 16, 2019, 2:25:19 PM
    Author     : Dell
--%>

<%@include file="../templates-Admin/header.jsp" %>
<style>
  .page-link:hover{
    color: #000000;
  }
</style>
<div class="wrapper ">
  <%@include file="../templates-Admin/sidebar.jsp" %>    
  <div class="main-panel">
    <%@include file="../templates-Admin/status-bar.jsp" %>
    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header card-header-primary">
                <div class="row">
                  <div class="col-md-4">
                    <h4 class="card-title "><b>Orders</b></h4>                
                  </div>
                  <div class="col-md-4">
                    <form class="navbar-form " action="AdminController?action=order" method="post" style="padding-top: 2%;">
                      <div class="input-group no-border">
                        <label class="bmd-label-floating" style="color:#fff">Search Order ID</label>
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
                    <form action="AdminController?action=order" method="post" id="changePageSize">
                      <select name="pageSize" id="pageSize" class="browser-default custom-select" onchange="this.form.submit()">
                        <option value="10" <c:if test="${pageSize == 10}"> selected="true" </c:if >>10</option>
                        <option value="50" <c:if test="${pageSize == 50}"> selected="true" </c:if>>50</option>
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
                        Order ID
                      </th>
                      <th>
                        Customer
                      </th>                                                  
                      <th>
                        Status
                      </th>
                      <th>
                        Date Updated
                      </th>
                      <th>
                        Date Created
                      </th>                
                      <th>

                      </th>
                      </thead>
                      <tbody>
                      <% int i = 1;%>
                      <c:forEach items="${Orders}" var="ord">
                        <tr>
                          <td>
                            <%= i%>
                            <% i++;
                            %>
                          </td>
                          <td>
                            ${ord.orderId}
                          </td>
                          <td>
                            <a href="#" data-toggle="modal" data-target="#viewUserInfo${ord.orderId}" style="color: #0043ff;" title="Click to see"><b>${ord.accId.fullname}</b></a>
                          </td>
                          <td>
                            <form action="EmployeeController?action=updateStatus" method="post" id="updateVerify">
                              <input type="hidden" value="${ord.orderId}" name="orderId"/>
                              <select name="status" class="browser-default custom-select" onchange="this.form.submit()">
                                <option value="Not Verify" <c:if test="${ord.status == 'Not Verify'}"> selected="true" </c:if>>Not Verify</option>
                                <option value="Verified" <c:if test="${ord.status == 'Verified'}"> selected="true" </c:if>>Verified</option>
                                <option value="Deliveried" <c:if test="${ord.status == 'Deliveried'}"> selected="true" </c:if>>Deliveried</option>
                              </select>
                            </form>
                          </td>
                          <td>
                            <fmt:formatDate value="${ord.Updated}" pattern="HH:mm:ss MM-dd-yyyy" />
                          </td>
                          <td>
                            <fmt:formatDate value="${ord.dateCreated}" pattern="HH:mm:ss MM-dd-yyyy" />
                          </td>
                          <td>
                            <a href="EmployeeController?action=invoice&orderId=${ord.orderId}" tilte="Print Invoice" style="color:#000000;font-size: 40px;"  target="_blank"><i class="material-icons">print</i></a>
                          </td>
                        </tr>
                        <!-- Modal Edit Category -->
                      <div class="modal fade" id="viewUserInfo${ord.orderId}" tabindex="-1" role="dialog" aria-labelledby="EditModalLabel"
                           aria-hidden="true">
                        <div class="modal-dialog" role="document">
                          <div class="modal-content">                           
                            <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalLabel">Customer Infomation</h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                            <div class="modal-body">
                              <div class="form-group">
                                <label for="Name" class="bmd-label-floating">Fullname</label>
                                <input type="text" class="form-control" id="Name" name="name" required="true" value="${ord.accId.fullname}" disabled="true">
                              </div>
                              <div class="form-group">
                                <label for="Description" class="bmd-label-floating">Phone Number</label>
                                <input type="text" class="form-control"  value="0${ord.accId.phone}" disabled="true">
                              </div>
                              <div class="form-group">
                                <label for="Description" class="bmd-label-floating">Email</label>
                                <input type="text" class="form-control"  value="${ord.accId.email}" disabled="true">
                              </div>
                              <div class="form-group">
                                <label for="Description" class="bmd-label-floating">Address</label>
                                <input type="text" class="form-control"  value="${ord.accId.address}" disabled="true">
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
                    </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div>
              <nav aria-label="Page navigation example">
                <ul class="pagination pg-blue justify-content-center">
                  <c:if test="${currentPage <= 1 && currentPage != 1}">
                    <li class="page-item"><a class="page-link" href="EmployeeController?action=order&pageSize=${pageSize}&currentPage=${currentPage-1}">Previous</a>
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
                        <li class="page-item"><a class="page-link" href="EmployeeController?action=order&pageSize=${pageSize}&currentPage=${i}">${i}</a>
                        </li>
                      </c:otherwise>
                    </c:choose>
                  </c:forEach>

                  <c:if test="${currentPage lt noOfPages}">
                    <li class="page-item"><a class="page-link" href="EmployeeController?action=order&pageSize=${pageSize}&currentPage=${currentPage+1}">Next</a>
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

<%@include file="../templates-Admin/footer.jsp" %>
