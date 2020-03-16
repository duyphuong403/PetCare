
<%@include file="../templates-Admin/header.jsp" %>
<div class="wrapper ">
  <%@include file="../templates-Admin/sidebar.jsp" %>    
  <div class="main-panel">
    <div class="wrapper ">
      <%@include file="../templates-Admin/status-bar.jsp" %>    
      <!-- Modal Edit Category -->
      <div class="container">
        <h4 class="card-title "><b>${title}</b></h4>

        <c:set var="pet" scope="session" value="${editPetguides}"/>  

        <form action="AdminController?action=editPetguides" method="post" style="width:100%" enctype="multipart/form-data">
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
              <img src="" id="imageChange" height="200" width="auto" title=""/>
              <img src="PetGuideImage/${pet.imageName}" id="currentImage" height="200" style="max-width: 500px"/>
              <input type="text" name="imageName" value="${pet.imageName}" hidden="true"/>
              <input type="file" class="form-control" id="imageChange" name="imageChange" accept="image/*" style="opacity: 1;position: static;" onchange="readURL(this);" />
            </div>
          </div>
          <div class="form-control">
            <button><a href="AdminController?action=petguides" class="btn btn--pill btn--red">Back</a></button>
            <button type="submit" class="btn btn-primary">Save changes</button>
          </div>
        </form>
      </div>

    </div>
  </div>
</div>
<script>
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('#currentImage').remove();
        $('#imageChange')
                .attr('src', e.target.result)
                .width(auto)
                .height(200)
                .max - width(500);
      };

      reader.readAsDataURL(input.files[0]);
    }
  }
</script>

<%@include file="../templates-Admin/footer.jsp" %>