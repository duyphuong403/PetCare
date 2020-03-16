<%-- 
    Document   : aboutus
    Created on : Dec 13, 2019, 11:02:31 AM
    Author     : Dell
--%>

<%@include file="../templates-Client/header.jsp" %>
<%@include file="../templates-Client/navbar.jsp" %>
<style>
  #content {
    padding-top: 90px;
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
              <c:set var="as" value="${comInfo}" scope="session" />
              <div class="card-header card-header-primary">
                <h4 class="card-title ">About Us</h4>
              </div>
              <div class="card-body">
                <div class="row">
                  <div class="col-md-12">
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating"><strong>${as.companyName}</strong></label>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">Address: <strong>${as.address}</strong></label>
                        </div>
                      </div>                      
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">Email: <strong>${as.email}</strong></label>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">Phone: <strong>${as.phone}</strong></label>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <iframe src="${as.embededMap}" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                        </div>
                      </div>
                    </div>
                  </div>
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