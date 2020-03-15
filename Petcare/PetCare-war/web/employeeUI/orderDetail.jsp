<%-- 
    Document   : home
    Created on : Dec 16, 2019, 2:25:19 PM
    Author     : Dell
--%>

<%@include file="../templates-Employee/header.jsp" %>
<style>
  .page-link:hover{
    color: #000000;
  }
</style>
<div class="wrapper ">
  <%@include file="../templates-Employee/sidebar.jsp" %>    
  <div class="main-panel">
    <%@include file="../templates-Employee/status-bar.jsp" %>
    <div class="content">
      <div class="container-fluid">
        <a href="EmployeeController?action=order" class="btn btn-default">Back</a>
        <c:set var="ord" value="${Orders}" scope="session"/>
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header card-header-primary">
                <div class="row">
                  <div class="col-md-8">
                    <h4 class="card-title "><b>Customer Infomation</b></h4>
                  </div>
                  <c:if test="${ord.status != 'Not Verify'}" >
                    <div class="col-md-4" style="text-align: right;">
                       <a href="EmployeeController?action=invoice&orderId=${ord.orderId}" tilte="Print Invoice" style="color:#000000;font-size: 40px;"  target="_blank"><i class="material-icons">print</i></a>
                    </div>
                  </c:if>
                </div>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table">
                    <thead class=" text-primary">
                    <th>
                      Customer
                    </th>
                    <th>
                      Address
                    </th>
                    <th>
                      Email
                    </th>
                    <th>
                      Phone
                    </th>
                    <th>
                      Status
                    </th>                                 
                    <th>
                      Date Ordered
                    </th>
                    </thead>
                    <tbody>
                      <tr>
                        <td>
                          <c:if test="${ord.accId.fullname != null}">${ord.accId.fullname}</c:if>
                          <c:if test="${ord.accId.fullname == null}">${ord.accId.username}</c:if>
                          </td>
                          <td>
                          ${ord.accId.address}
                        </td>
                        <td>
                          ${ord.accId.email}
                        </td>                          
                        <td>
                          0${ord.accId.phone}
                        </td>
                        <td>
                          ${ord.status}
                        </td>
                        <td>
                          <fmt:formatDate value="${ord.dateCreated}" pattern="HH:mm:ss MM-dd-yyyy" />
                        </td>                        
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- Table Order Detail -->
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header card-header-primary">
                <div class="row">
                  <div class="col-md-4">
                    <h4 class="card-title "><b>Order Detail</b></h4>                
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
                      Image
                    </th>
                    <th>
                      Unit
                    </th>                                 
                    <th>
                      Quantity
                    </th>
                    <th>
                      Price
                    </th>                
                    <th>
                      SubTotal
                    </th>
                    </thead>
                    <tbody>
                      <% int i = 1;%>
                      <c:forEach var="ordDt" items="${OrderDetail}" >
                        <tr>
                          <td>
                            <%= i%>
                            <% i++;
                            %>
                          </td>
                          <td>
                            ${ordDt.name}
                          </td>
                          <td>
                            <img src="ProductImages/${ordDt.prodId.imageName}"  alt="${ordDt.prodId.imageName}" class="img-fluid" style="max-width: 150px; max-height: 100px;"/>
                          </td>                          
                          <td>                              
                            ${ordDt.unit}
                          </td>
                          <td>
                            ${ordDt.quantity}
                          </td>
                          <td>
                            ${ordDt.price}
                          </td>
                          <td>
                            ${ordDt.total}
                          </td>
                        </tr>
                      </c:forEach>
                      <tr>
                        <c:set value="${SubTotal}" var="subtotal" scope="session"/>
                        <td colspan="6" style="font-size:20px; text-align: right"><b>Total: <b></td>
                              <td style="font-size: 20px"><b>${SubTotal}</b></td>
                              </tr>
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
