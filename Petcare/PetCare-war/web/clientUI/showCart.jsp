<%-- 
    Document   : index
    Created on : Dec 13, 2019, 10:08:46 AM
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
  .container{
    min-height: 1080px;
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
                  <c:if test="${cart.lineItemCount == 0}">
                    <table class="table">
                      <tr>
                        <td colspan="6" style="text-align: center; color: #512f04"><b>- Cart is currently empty -</b></td>
                      </tr>
                      <tr>
                        <td><a href="UserController?action=petmart" class="btn btn-primary" title="Back" style="float:left;color: #fff;font-weight: 600; background-color: #38ca0e;">Continue Buy</a></td>
                      </tr>
                    </table>
                  </c:if>
                  <c:if test="${cart.lineItemCount != 0}">
                    <table class="table">

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
                        Subtotal
                      </th>
                      </thead>

                      <% int i = 1;%>
                      <c:forEach var="cartItem" items="${cart.list}" varStatus="counter">
                        <tr>
                          <td> <%= i%><% i++;%></td>
                          <td><img src="ProductImages/${cartItem.imageName}" alt="Image" class="img-fluid" style="max-width: 150px; max-height: 100px;"></td>
                          <td style="width: 40%"><c:out value="${cartItem.name}"/></td>
                          <td style="width: 20%">
                            <form action="CartController" method="post" name="item">
                              <input type='hidden' name='stt' value='${counter.count}'>
                              <input type='number' class="form-control" name="quantity" value="<c:if test='${cartItem.quantity > cartItem.maxQuantity}'>${cartItem.maxQuantity}</c:if><c:if test='${cartItem.quantity <= cartItem.maxQuantity}'>${cartItem.quantity}</c:if>" style="width: 45%;display: inline-block; text-align: center;" min="1" max="${cartItem.maxQuantity}" title="Quantity in stock: ${cartItem.maxQuantity}" required="true"> 
                                <button type="submit" name="action" value="Update" style="color:#001fff" title="Update"><i class="material-icons">refresh</i></button>
                                <button type="submit" name="action" value="Delete" style="color: red;" title="Remove"><i class="material-icons">close</i></button>
                              </form>
                            </td>
                              <td>$<c:out value="${cartItem.price}"/></td>
                          <td>$<c:out value="${cartItem.totalCost}"/></td>
                        </tr>
                      </c:forEach>


                      <tr>
                        <td colspan="5" style="font-size:20px; text-align: right"><b>Total Price:</b></td>
                        <td style="font-size: 20px"><b>$<c:out value="${cart.total}"/></b></td>
                      </tr>
                      <tr>
                        <td colspan="6">
                          <a href="UserController?action=petmart" class="btn btn-primary" title="Back" style="float:left;color: #fff;font-weight: 600; background-color: #38ca0e;">Continue Buy</a>
                          <a href="PaymentController" class="btn btn-success" title="Payment" style="float:right;color: #fff;font-weight: 600; background-color: #057aff;">Payment</a>
                        </td>
                      </tr>
                    </table>

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