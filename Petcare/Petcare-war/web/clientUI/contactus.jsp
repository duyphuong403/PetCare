<%@include file="../templates-Client/header.jsp" %>
<%@include file="../templates-Client/navbar.jsp" %>
 <form autocomplete="off" action="UserController?action=contactus" method="post">
<div class="modal-body">
    
                        <div class="form-group">
                            <label for="Fullname" class="bmd-label-floating"><b>Full Name</b></label>
                            <input type="text" class="form-control" id="Fullname" name="fullname" required="true" minlength="5" maxlength="200">
                        </div>
                        <div class="form-group">
                            <label for="Email" class="bmd-label-floating"><b>Email</b></label>
                            <input type="email" class="form-control" id="Email" name="email" required="true">
                        </div>
                        <div class="form-group">
                            <label for="Phone" class="bmd-label-floating"><b>Phone</b></label>
                            <input type="number" class="form-control" id="Phone" name="phone" required="true">
                        </div>
                        <div class="form-group">
                            <label for="Content" class="bmd-label-floating"><b>Content</b></label>
                            <textarea class="form-control" type="textarea" class="form-control" id="Content" name="content"
                                      maxlength="6000" rows="7"></textarea>
                        </div>
                        
                         <div class="modal-footer">
                        <button type="reset" class="btn btn-secondary" data-dismiss="modal">Reset</button>
                        <button type="submit" class="btn btn-success">Submit</button>
                    </div>
                        <br/>
                    </div>
</

<%@include file="../templates-Client/footer.jsp" %>