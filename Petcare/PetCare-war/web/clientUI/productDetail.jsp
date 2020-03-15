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
</style>

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
                    <div id="details-slider" class="details-slider carousel slide" data-ride="carousel">
                      <ol class="carousel-indicators">
                        <li data-target="#details-slider" data-slide-to="0" class="active"><img src="./shop_detail._files/list1.png" alt="Image" class="img-fluid"></li>
                        <li data-target="#details-slider" data-slide-to="1" class=""><img src="./shop_detail._files/list2.png" alt="Image" class="img-fluid"></li>
                        <li data-target="#details-slider" data-slide-to="2" class=""><img src="./shop_detail._files/list3.png" alt="Image" class="img-fluid"></li>
                        <li data-target="#details-slider" data-slide-to="3"><img src="./shop_detail._files/list4.png" alt="Image" class="img-fluid"></li>
                      </ol>
                      <div class="carousel-inner" role="listbox">
                        <div class="carousel-item item active">
                          <img class="img-fluid" src="./shop_detail._files/slider1.jpg" alt="Image">
                        </div>
                        <div class="carousel-item">
                          <img class="img-fluid" src="./shop_detail._files/slider1.jpg" alt="Image">
                        </div>
                        <div class="carousel-item">
                          <img class="img-fluid" src="./shop_detail._files/slider1.jpg" alt="Image">
                        </div>
                      </div>
                    </div><!-- /#details-slider -->  
                  </div>
                  <div class="col-lg-6">
                    <div class="product-details-info">
                      <span class="product-title">Organic <strong>Cabbage</strong></span>
                      <span class="price"><del>$15.00</del>$12.00</span>

                      <p>100% Organic Food from Farm Tomoko</p>
                      <ul class="global-list">
                        <li>Food from Farm Hong Quat Packging</li>
                        <li>100% Organic Food</li>
                        <li>100% Fresh Not Chemicals</li>
                      </ul>
                      <div class="quantity-price">
                        <span>Quality</span>
                        <div class="quantity" data-trigger="spinner">
                          <a href="https://demo.themeregion.com/biotic/shop-details.html#" data-spin="down"><i class="fa fa-minus"></i></a>
                          <input type="text" name="quantity" value="1" title="quantity" class="input-text">
                          <a href="https://demo.themeregion.com/biotic/shop-details.html#" data-spin="up"><i class="fa fa-plus"></i></a>
                        </div>                                              
                      </div> 
                      <div class="add-to-cart">
                        <a class="btn btn-primary" href="https://demo.themeregion.com/biotic/shopping-cart.html">Add to Cart</a>
                        <span><a href="https://demo.themeregion.com/biotic/shop-details.html#"><i class="fa fa-heart-o" aria-hidden="true"></i></a></span>
                      </div><!-- /.add-to-cart -->                
                    </div><!-- /.products-details-info -->
                  </div>
                </div><!-- /.row -->
              </div><!-- /.products-details -->                                                            
            </div><!-- /.details-content -->                   
          </div>
          <div class="col-md-4 col-lg-3 pull-md-8 pull-lg-9">
            <div class="gb-sidebar">
              <div class="widget-area">           
                <div class="widget widget_categories">
                  <h3 class="widget_title">Categories</h3>
                  <ul>
                    <li><a href="https://demo.themeregion.com/biotic/shop-details.html#">All Post</a>(2)</li>
                    <li><a href="https://demo.themeregion.com/biotic/shop-details.html#">Vegetables</a>(3)</li>
                    <li><a href="https://demo.themeregion.com/biotic/shop-details.html#">Fruits</a>(7)</li>
                    <li><a href="https://demo.themeregion.com/biotic/shop-details.html#">Dried</a>(1)</li>
                    <li><a href="https://demo.themeregion.com/biotic/shop-details.html#">Vegetables</a> (9)</li>
                    <li><a href="https://demo.themeregion.com/biotic/shop-details.html#">Dried Fruit </a>(10)</li>
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
