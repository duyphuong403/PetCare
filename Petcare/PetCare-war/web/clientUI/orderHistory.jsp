<%-- 
    Document   : orderHistory
    Created on : Mar 14, 2020, 10:52:41 AM
    Author     : Dell
--%>

<%@include file="../templates-Client/header.jsp" %>
<%@include file="../templates-Client/navbar.jsp" %>
<style>
  #content {
    padding-top: 50px;
  }
  .card .card-header-primary:not(.card-header-icon):not(.card-header-text) {
    background: linear-gradient(60deg, #ffad00, #fedd97);
  }

  .card {
    background: #f6cc0026;
  }
  table td, table th {
    background: transparent !important;
  }
  .form-control, .is-focused .form-control {
    background-image: linear-gradient(to top, #ffb518 2px, rgba(156, 39, 176, 0) 2px), linear-gradient(to top, #d2d2d2 1px, rgb(255, 255, 255) 1px);
  }
</style>
<div id="body" class="container">
  <div id="content" class="row">
    <div class="content" style="width:100%">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header card-header-primary">
                <h4 class="card-title ">Order History</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <c:if test="${order == null}">
                    <table class="table table-striped">
                      <tr> 
                        <td colspan="6" style="text-align: center; color: #512f04"><b>Not found and order.</b></td>
                      </tr>
                    </table>
                  </c:if>
                  <c:if test="${order != null}">
                    <% int i = 1;%>
                    <c:forEach var="ord" items="${order}">
                      <table class="table table-striped">
                        <thead class="text-primary">
                          <tr>
                            <td colspan="6"><h4 style="color: #0523f6;">Order ID: <b>#${ord.orderId}</b></h4></td>
                          </tr>
                        <th width="5%">
                          No.
                        </th>
                        <th>
                          Image
                        </th>
                        <th>
                          Name
                        </th>
                        <th>
                          Quantiy
                        </th>
                        <th>
                          Unit Price
                        </th>
                        <th>
                          Subtotal
                        </th>
                        </thead>
                        <tbody>
                          <c:forEach items="${ordlList}" var="odl">
                            <c:if test="${odl.get(i)}" ></c:if>
                          <tr>
                            <td> <%= i%><% i++;%></td>
                            <td><img src="ProductImages/" alt="Image" class="img-fluid" style="max-width: 150px; max-height: 100px;"></td>
                            <td>product name</td>
                            <td style="width: 20%">
                              quantiy
                            </td>
                            <td>price</td>
                            <td>subtotal</td>
                          </tr>
                          <tr>
                            <td colspan="5" style="font-size:20px; text-align: right"><b>Total Price:</b></td>
                            <td style="font-size: 20px"><b>total</b></td>
                          </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                      <hr/>
                    </c:forEach>
                  </c:if>
                </div>
              </div>
            </div>
          </div>          
        </div>
      </div>
    </div>
  </div>
</div>

<%@include file="../templates-Client/footer.jsp" %>
