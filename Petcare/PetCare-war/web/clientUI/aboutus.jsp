<%-- 
    Document   : aboutus
    Created on : Dec 13, 2019, 11:02:31 AM
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
                <h4 class="card-title ">Coming soon</h4>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<%@include file="../templates-Client/footer.jsp" %>