
<%@include file="templates-Client/header.jsp" %>
<%@include file="templates-Client/navbar.jsp" %>
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
<div class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header card-header-primary">

            <h4 class="card-title "><b>${title}</b></h4>
            <a href="#" data-toggle="modal" data-target="#editAccount" style="color: #fff">

          </div>

          <div class="modal-body">
            <c:set var="acc" scope="session" value="${curAcc}"/>  
            <form action="AccountController?action=editAccount" method="post" style="width:100%">
              <div class="form-group">
                <label class="bmd-label-floating">Username</label>
                <input type="text" name="accountId" value="${acc.accId}" hidden="true"/>
                <input type="text" name="dateCreated" value="${acc.dateCreated}" hidden="true"/>

                <input type="text" readonly="true" class="form-control" id="Username" name="username" required="true" value="${acc.username}" minlength="6" maxlength="200">
              </div>
              <div class="form-group">
                <label for="Password" class="bmd-label-floating">Password</label>
                <input type="password" class="form-control" id="Password" name="password" required="true" value="${acc.password}" minlength="6" maxlength="50">
              </div>
              <div class="form-group">
                <label for="rePassword" class="bmd-label-floating">Confirm Password</label>
                <input type="password" class="form-control" id="Password" name="re-password" required="true" value="${acc.password}">
              </div>
              <div class="form-group">
                <label for="Fullname" class="bmd-label-floating">Full name</label>
                <input type="text" class="form-control" id="Fullname" name="fullname" required="true" value="${acc.fullname}" minlength="6" maxlength="50">
              </div>
              <div class="form-group">
                <label for="Email" class="bmd-label-floating">Email</label>
                <input type="email" class="form-control" id="Email" name="email" required="true" value="${acc.email}" minlength="8" maxlength="200">
              </div>
              <div class="form-group">
                <label for="Phone" class="bmd-label-floating">Phone</label>
                <input type="text" class="form-control" id="Phone" name="phone" required="true" value="${acc.phone}" pattern="[1-9]{9}" title="Phone number must have 9 digits! No need to input 0 at first!">
              </div>
              <div class="form-group">
                <label for="Address" class="bmd-label-floating">Address</label>
                <input type="text" class="form-control" id="Address" name="address" required="true" value="${acc.address}">
              </div>
              <div class="form-group">

<!--                                            <input type="text" class="form-control" id="Role" name="role" required="true" value="${acc.role}">-->
                <!--                                <label for="Role" class="bmd-label-floating">Role</label>&emsp;
                                                <INPUT TYPE="radio" name="role" value="0"/>Customer &emsp;
                                                <INPUT TYPE="radio" NAME="role" VALUE="1" checked="true"/>Employee &emsp;
                                                <INPUT TYPE="radio" NAME="role" VALUE="2"/>Administrator -->
              </div>
          </div>  
        </div>
      </div>
    </div>
    <a href="UserController" type="button" class="btn btn-primary pull-left" style="background-color: #c1c6c7;">Back</a>
    <button type="submit" class="btn btn-success">Update Account</button>
    <div class="clearfix"></div>
    </form>
  </div>
</div>
<%@include file="templates-Client/footer.jsp" %>