
<%@include file="../templates-Admin/header.jsp" %>
<div class="wrapper ">
    <%@include file="../templates-Admin/sidebar.jsp" %>    
    <div class="main-panel">
        <div class="wrapper ">
            <%@include file="../templates-Admin/status-bar.jsp" %>    
            <!-- Modal Edit Category -->
            <div class="container">
                <h4 class="card-title "><b>${title}</b></h4>

                <c:set var="guides" scope="session" value="${pet}"/>  

                <form action="AdminController?action=editPetguides" method="post" style="width:100%">
                    <div class="card-body">
                        <div class="form-group">
                            <input type="hidden" class="form-control" name="petGuideId" value="${pet.petGuideId}" >
                        </div>
                        <div class="form-group">
                            <label for="Title" class="bmd-label-floating">Title</label>
                            <input type="text" class="form-control" id="Title" name="title" value="${pet.title}"required="true" minlength="5" maxlength="50">
                        </div>
                        <div class="form-group">
                            <label for="Content" class="bmd-label-floating">Content</label>
                            <input type="text" class="form-control" id="Content" name="content" value="${pet.content}" required="true" minlength="5" maxlength="50">
                        </div>
                        <div class="form-group" style="text-align: center">
                            <label for="ImageName" class="bmd-label-floating" style="float: left;">Choose Image</label>
                            <img src="#" id="ImageName" height="200" style="max-width: 500px"/>
                            <input type="file" class="form-control" id="ImageName" name="ImageName" value="${pet.imageName}"required="true" accept="image/*" style="opacity: 1;position: static;" onchange="readURL(this);" />
                        </div>
                        <!--                        <div class="form-group">
                                                    <input type="hidden" class="form-control" id="imageName" name="curAcc" value="${pet.accId}"  minlength="8" maxlength="200">
                                                </div>-->


                    </div>
                    <div class="form-control">
                        <button><a href="AdminController" class="btn btn--pill btn--red">Back</a></button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>

<%@include file="../templates-Admin/footer.jsp" %>