<%-- 
    Document   : payment
    Created on : Mar 8, 2020, 4:30:32 PM
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
  .form-control:invalid {
    background-image: linear-gradient(to top, #ffb009 2px, rgba(244, 67, 54, 0) 2px), linear-gradient(to top, #d2d2d2 1px, rgba(210, 210, 210, 0) 1px);
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
                <h4 class="card-title ">Shopping Cart</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table">
                    <c:if test="${cart.lineItemCount == 0}">
                      <tr> 
                        <td colspan="6" style="text-align: center; color: #512f04"><b>- Cart is currently empty -</b></td>
                      </tr>
                    </c:if>
                    <c:if test="${cart.lineItemCount != 0}">
                      <thead class=" text-primary">
                      <th>
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
                        Total Price
                      </th>
                      </thead>
                      <tbody> 
                        <% int i = 1;%>
                        <c:forEach var="cartItem" items="${cart.list}" varStatus="counter">
                        <form name="item" method="POST" action="CartController">
                          <tr>
                            <td> <%= i%><% i++;%></td>
                            <td><img src="ProductImages/${cartItem.imageName}" alt="Image" class="img-fluid" style="max-width: 150px; max-height: 100px;"></td>
                            <td><c:out value="${cartItem.name}"/></td>
                            <td style="width: 20%">
                              ${cartItem.quantity}
                            </td>
                            <td>$<c:out value="${cartItem.price}"/></td>
                            <td>$<c:out value="${cartItem.totalCost}"/></td>
                          </tr>
                        </form>
                      </c:forEach>
                      </tr>
                      <tr>
                        <td><a href="UserController?action=showCart" class="btn btn-primary" title="Back" style="float:left;color: #fff;font-weight: 600; background-color: #9dbe94;">Back</a></td>
                        <td colspan="4" style="font-size:20px; text-align: right"><b>Subtotal:</b></td>
                        <td style="font-size: 20px"><b>$<c:out value="${cart.total}"/></b></td>
                      </tr>
                      </tbody>
                    </c:if>
                  </table>
                </div>
              </div>
            </div>
          </div>          
        </div>
        <!-- Payment Info -->
        <% if (session.getAttribute("curAcc") != null) { %>
        <c:set value="${curAcc}" var="acc" scope="session"/>
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header card-header-primary">
                <h4 class="card-title ">Payment Info</h4>
              </div>
              <div class="card-body">
                <div class="row">
                  <div class="col-md-12">
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">Fullname</label>
                          <input type="text" class="form-control" value="${acc.fullname}" required="true" disabled="true">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group">
                          <label class="bmd-label-floating">Phone</label>
                          <input type="text" class="form-control" value="0${acc.phone}" required="true" disabled="true">
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group">
                          <label class="bmd-label-floating">Email</label>
                          <input type="text" class="form-control" name="name" required="true" value="${acc.email}" disabled="true">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">Address</label>
                          <input type="text" class="form-control" name="name" required="true" value="${acc.email}" disabled="true">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <a href="#" class="btn btn-primary" title="Change Payment Info" style="float:left;color: #fff;font-weight: 600; background-color: #a713a6;">Change Info</a>
                          <a href="UserController?action=addOrder" class="btn btn-success" title="Confirm delivery to this address" style="float:right;color: #fff;font-weight: 600; background-color: #057aff;">Confirm</a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>          
        </div>
        <% }
        %>
      </div>
    </div>
  </div>
</div>

<%@include file="../templates-Client/footer.jsp" %>
