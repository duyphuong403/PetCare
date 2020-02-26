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
                <div class="col-md-6 col-lg-4">
                  <div class="product">
                    <a href="https://demo.themeregion.com/biotic/shop-details.html">
                      <span class="product-image">
                        <img src="lib/images/cat2.jpg" alt="Image" class="img-fluid">
                      </span>
                      <span class="product-title">Organic <span>Cabbage</span></span>
                      <span class="price"><del>$15.00</del>$12.00</span>
                    </a>
                  </div><!-- /.product -->                                    
                </div>                
              </div><!-- /.row -->
            </div><!-- /.tr-products -->

            <div class="tr-pagination text-center">
              <ul class="pagination">
                <li class="float-left"><a class="page-numbers" href="https://demo.themeregion.com/biotic/shop-list.html#">Prev</a></li>
                <li><a class="page-numbers" href="https://demo.themeregion.com/biotic/shop-list.html#">1</a></li>
                <li><a class="page-numbers" href="https://demo.themeregion.com/biotic/shop-list.html#">2</a></li>
                <li class="active"><a class="page-numbers" href="https://demo.themeregion.com/biotic/shop-list.html#">3</a></li>
                <li><a class="page-numbers" href="https://demo.themeregion.com/biotic/shop-list.html#">4</a></li>
                <li><a class="page-numbers" href="https://demo.themeregion.com/biotic/shop-list.html#">5</a></li>
                <li><a class="page-numbers" href="https://demo.themeregion.com/biotic/shop-list.html#">6</a></li>
                <li><a class="page-numbers" href="https://demo.themeregion.com/biotic/shop-list.html#">7</a></li>
                <li><a class="page-numbers" href="https://demo.themeregion.com/biotic/shop-list.html#">8</a></li>
                <li><a class="page-numbers" href="https://demo.themeregion.com/biotic/shop-list.html#">9</a></li>
                <li><a class="page-numbers" href="https://demo.themeregion.com/biotic/shop-list.html#">...</a></li>
                <li><a class="page-numbers" href="https://demo.themeregion.com/biotic/shop-list.html#">21</a></li>
                <li><a class="page-numbers" href="https://demo.themeregion.com/biotic/shop-list.html#">22</a></li>
                <li><a class="page-numbers" href="https://demo.themeregion.com/biotic/shop-list.html#">23</a></li>
                <li><a class="page-numbers" href="https://demo.themeregion.com/biotic/shop-list.html#">24</a></li>
                <li class="float-right"><a class="page-numbers" href="https://demo.themeregion.com/biotic/shop-list.html#">Next</a></li>
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
