<%@include file="../templates-Client/header.jsp" %>
<%@include file="../templates-Client/navbar.jsp" %>
<style>

  #content {
    padding-top: 500px;
  }
  .card .card-header-primary:not(.card-header-icon):not(.card-header-text) {
    background: linear-gradient(60deg, #ffad00, #fedd97);
    padding-top: 50px;
  }

  .col-md-12 {
      padding-top: 50px;
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
 <form autocomplete="off" action="UserController?action=addFeedback" method="post">   
<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header card-header-primary">

                        <h4 class="card-title "><b>${title}</b></h4>
                    </div>
                    
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="Fullname" class="bmd-label-floating"><b>Full Name</b></label>
                            <input type="text" class="form-control" id="Fullname" name="fullname" required="true" minlength="5" maxlength="200">
                        </div>
                        <div class="form-group">
                            <label for="Email" class="bmd-label-floating"><b>Email</b></label>
                            <input type="email" class="form-control" id="Email" name="email" required="true">
                            <small>Format: abc@xyz.com</small>
                        </div>
                        <div class="form-group">
                            <label for="Phone" class="bmd-label-floating"><b>Phone</b></label>
                            <input type="tel" class="form-control" id="Phone" name="phone" required="true" minlength="9" maxlength="10">
                            <small>Format: 1234567890</small>
                        </div>
                        <div class="form-group">
                            <label for="Content" class="bmd-label-floating"><b>Content</b></label>
                            <textarea class="form-control" type="textarea" id="Content" name="content"
                                      maxlength="2000" rows="7"></textarea>
                        </div>
                    </div>
                    </div>  
                </div>
            </div>
        </div>    
                 
                         <div class="modal-footer">
                             <a href="UserController" type="button" class="btn btn-primary pull-left" style="background-color: #c1c6c7;">Back</a>
                             <button type="submit" class="btn btn-success">Submit</button>
                    </div>
                        <br/>
                    </div>
</

<%@include file="../templates-Client/footer.jsp" %>