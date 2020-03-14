<%-- 
    Document   : petmart
    Created on : Dec 13, 2019, 10:48:47 AM
    Author     : Dell
--%>

<%@include file="../templates-Client/header.jsp" %>
<%@include file="../templates-Client/navbar.jsp" %>
<div id="body">
  <div id="content">
    <%@include file="../templates-Client/formSearch.jsp" %>
    <div class="main-content popup-one">
      <div class="container">
        <div class="row">
          <div class="col-md-8 col-lg-9 push-md-4 push-lg-3">
            <div class="tr-products">
              <div class="row">
                <c:forEach items="${Products}" var="prod" varStatus="counter">
                  <div class="col-md-6 col-lg-4">
                    <div class="product">
                      <form method="POST" action="CartController?action=addToCart">
                        <input type="hidden" name="quantity" value="1">
                        <input type="hidden" name="maxQuantity" value="${prod.quantity}">
                        <input type="hidden" name="unit" value="${prod.unitId.name}">
                        <input type="hidden" name="price" value="${prod.price}">
                        <input type="hidden" name="prodId" value="${prod.prodId}">
                        <input type="hidden" name="imageName" value="${prod.imageName}">
                        <input type="hidden" name="name" value="${prod.name}">                   
                        <a href="#">
                          <span class="product-image">
                            <img src="ProductImages/${prod.imageName}" alt="Image" class="img-fluid" style="height: 150px;">
                          </span>
                          <span class="product-title">${prod.name}</span>
                          <span class="price">$${prod.price}</span>
                        </a>
                        <div class="product-icon">
                          <ul class="global-list">
                            <c:if test="${prod.quantity > 0}">                                
                              <li>
                                <button type="submit"><i class="material-icons">add_shopping_cart</i></button>
                              </li>
                            </c:if>
                            <c:if test="${prod.quantity <= 0}">                                
                              <li style="margin-left: 18px;color: red;">
                                <button><h4>Out of stock</h4></button>
                              </li>
                            </c:if>
                          </ul>
                        </div>
                      </form>
                    </div><!-- /.product -->                                    
                  </div>                
                </c:forEach>
              </div><!-- /.row -->
            </div><!-- /.tr-products -->

            <div class="tr-pagination text-center">
              <ul class="pagination">
                <c:if test="${currentPage != 1}">
                  <li class="float-left"><a class="page-numbers" href="UserController?action=petmart&pageSize=${pageSize}&currentPage=${currentPage-1}">Previous</a>
                  </li>
                </c:if>

                <c:forEach begin="1" end="${noOfPages}" var="i">
                  <c:choose>
                    <c:when test="${currentPage eq i}">
                      <li <c:if test="${currentPage == i}"> class="active" </c:if>><a class="page-numbers">
                          ${i}</a>
                      </li>
                    </c:when>
                    <c:otherwise>
                      <li><a class="page-numbers" href="UserController?action=petmart&pageSize=${pageSize}&currentPage=${i}">${i}</a>
                      </li>
                    </c:otherwise>
                  </c:choose>
                </c:forEach>

                <c:if test="${currentPage lt noOfPages}">
                  <li class="float-right"><a class="page-numbers" href="UserController?action=petmart&pageSize=${pageSize}&currentPage=${currentPage+1}">Next</a>
                  </li>
                </c:if>                
              </ul>       
            </div><!-- /.tr-pagination -->                        
          </div>
          <div class="col-md-4 col-lg-3 pull-md-8 pull-lg-9">
            <div class="gb-sidebar">
              <div class="widget-area">           
                <div class="widget widget_categories">
                  <h3 class="widget_title">Categories</h3>
                  <ul>
                    <li><a href="https://demo.themeregion.com/biotic/shop-list.html#">All Post</a>(2)</li>
                    <li><a href="https://demo.themeregion.com/biotic/shop-list.html#">Vegetables</a>(3)</li>
                    <li><a href="https://demo.themeregion.com/biotic/shop-list.html#">Fruits</a>(7)</li>
                    <li><a href="https://demo.themeregion.com/biotic/shop-list.html#">Dried</a>(1)</li>
                    <li><a href="https://demo.themeregion.com/biotic/shop-list.html#">Vegetables</a> (9)</li>
                    <li><a href="https://demo.themeregion.com/biotic/shop-list.html#">Dried Fruit </a>(10)</li>
                  </ul>
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
