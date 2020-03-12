<%-- 
    Document   : account
    Created on : Jan 18, 2020, 9:35:45 AM
    Author     : ngodu
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../templates-Admin/header.jsp" %>
<div class="wrapper ">
    <%@include file="../templates-Admin/sidebar.jsp" %>    
    <div class="main-panel">
        <div class="wrapper ">
            <%@include file="../templates-Employee/sidebar.jsp" %>    
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header card-header-primary">
                                    Edit Account
                                </div>

                                <div class="modal-body">
                                    <c:set var="acc" scope="session" value="${editAccount}"/>  
                                    <form action="AdminController?action=editAccount" method="post" enctype="multipart/form-data" style="width:100%">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Username</label>
                                            <input type="text" name="accId" value="${acc.accId}" hidden="true"/>
                                            <input type="text" class="form-control" id="Username" name="username" required="true" value="${acc.username}" maxlength="200">
                                        </div>
                                        <div class="form-group">
                                            <label for="Password" class="bmd-label-floating">Password</label>
                                            <input type="password" class="form-control" id="Password" name="password" required="true" value="${acc.password}">
                                        </div>
                                        <div class="form-group">
                                            <label for="Fullname" class="bmd-label-floating">Full name</label>
                                            <input type="text" class="form-control" id="Fullname" name="fullname" required="true" value="${acc.fullname}">
                                        </div>
                                        <div class="form-group">
                                            <label for="Email" class="bmd-label-floating">Email</label>
                                            <input type="email" class="form-control" id="Email" name="email" required="true" value="${acc.email}">
                                        </div>
                                        <div class="form-group">
                                            <label for="Phone" class="bmd-label-floating">Phone</label>
                                            <input type="number" class="form-control" id="Phone" name="phone" required="true" value="${acc.phone}">
                                        </div>
                                        <div class="form-group">
                                            <label for="Address" class="bmd-label-floating">Address</label>
                                            <input type="text" class="form-control" id="Address" name="address" required="true" value="${acc.address}">
                                        </div>
                                        <div class="form-group">
                                           
<!--                                            <input type="text" class="form-control" id="Role" name="address" required="true" value="${acc.role}">-->
                                            <label for="Role" class="bmd-label-floating">Role</label>
                                            <INPUT TYPE="radio" name="role" value="0"/>Customer 
                                            <INPUT TYPE="radio" NAME="role" VALUE="1" checked="true"/>Employee 
                                            <INPUT TYPE="radio" NAME="role" VALUE="2"/>Administrator 
                                        </div>
                                </div>  
                            </div>
                        </div>
                    </div>
                    <a href="AdminController?action=account" type="button" class="btn btn-primary pull-left" style="background-color: #c1c6c7;">Back</a>
                    <button type="submit" class="btn btn-primary pull-right">Update Account</button>
                    <div class="clearfix"></div>
                    </form>
                </div>
            </div>
        </div>         
    </div>
</div>
</div>
</div>
</div>


<%@include file="../templates-Admin/footer.jsp" %>
