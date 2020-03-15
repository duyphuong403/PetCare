<%-- 
    Document   : productdetail
    Created on : Mar 10, 2020, 8:27:24 PM
    Author     : TheVi-PC
--%>

<%@include file="../templates-Client/header.jsp" %>
<%@include file="../templates-Client/navbar.jsp" %>
<style>
  .quantity {
    text-align: center;
    font-size: 14px;
    width: 130px;
    border: 1px solid #d9d9d9;
    border-radius: 30px;
    display: inline-block;
  }
  .quantity a {
    color: #2b2b2b;
    padding: 0 10px;
    line-height: 0;
    border: 0;
    display: inline-block;
  }
  .product-details-info {
    padding: 40px 0;
  }
  .product-details-info .product-title {
    font-size: 30px;
    margin-bottom: 0;
    line-height: 32px;
  }
  .form-control, .is-focused .form-control {
    background-image: none;
  }
  .form-control:invalid {
    background-image: none;
  }
</style>
<c:set var="prod" value="${Products}" scope="request"/>
<div id="body" style="padding-top: 100px;">
  <div id="content">
    <div class="main-content bg-color">
      <div class="container">
        <div class="row">
          <div class="col-md-8 col-lg-9  push-md-4 push-lg-3">
            <div class="details-content">
              <div class="product-details section-bg-white">
                <div class="row">
                  <div class="col-lg-6">
                    <img src="ProductImages/${prod.imageName}" alt="${prod.imageName}" class="img-fluid" style="max-height: 350px;">
                  </div>
                  <div class="col-lg-6">
                    <div class="product-details-info">
                      <span class="product-title"><strong>${prod.name}</strong></span>
                      <span class="price" style="font-size: 20px;">$ ${prod.price}</span>

                      <c:if test="${prod.quantity != 0}">
                        <form method="POST" action="CartController?action=addToCart">
                          <input type="hidden" name="maxQuantity" value="${prod.quantity}">
                          <input type="hidden" name="unit" value="${prod.unitId.name}">
                          <input type="hidden" name="price" value="${prod.price}">
                          <input type="hidden" name="prodId" value="${prod.prodId}">
                          <input type="hidden" name="imageName" value="${prod.imageName}">
                          <input type="hidden" name="name" value="${prod.name}">                   
                          <div class="quantity-price" style="padding-top: 20px;">
                            <span>Quantity</span>
                            <div class="quantity" data-trigger="spinner">
                              <input type="number" class="form-control" name="quantity" title="quantity" value="1" style="text-align: center" min="1" max="${prod.quantity}" required="true">
                            </div>             
                          </div> 

                          <div class="add-to-cart" style="padding-top: 20px;">
                            <button type="submit" class="btn btn-success" >Add to Cart</button>
                          </div><!-- /.add-to-cart -->                
                        </form>
                      </c:if>
                      <c:if test="${prod.quantity == 0}">
                        <h4 style="color:red"><strong>Out of stock</strong></h4>
                      </c:if>
                    </div><!-- /.products-details-info -->
                  </div>
                </div><!-- /.row -->
              </div><!-- /.products-details -->
              <div class="products-description section-bg-white">              
                <h3><strong>Description</strong></h3>
                <hr/>
                <div class="tab-content">
                  <div role="tabpanel" class="tab-pane fade show active" id="details">
                    <h5>${prod.description}</h5>
                  </div><!-- /.tab-pane -->                   
                </div><!-- /.tab-content -->                          
              </div><!-- /.products-description -->  
            </div><!-- /.details-content -->                   
          </div>
          <div class="col-md-4 col-lg-3 pull-md-8 pull-lg-9">
            <div class="gb-sidebar">
              <div class="widget-area">           
                <div class="widget widget_categories">                
                  <%@include file="../templates-Client/categories.jsp" %>
                </div><!-- /.widget -->               
              </div><!-- /.widget-area -->    
            </div><!-- /.gb-sidebar -->                        
          </div>
        </div><!-- /.row -->
      </div><!-- /.container -->
    </div><!-- /.main-content -->
  </div>
</div>

<%@include file="../templates-Client/footer.jsp" %>
