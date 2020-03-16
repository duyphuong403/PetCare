<%@include file="../templates-Admin/header.jsp" %>
<div class="wrapper ">
  <%@include file="../templates-Admin/sidebar.jsp" %>    
  <div class="main-panel">
    <div class="wrapper ">
      <%@include file="../templates-Admin/status-bar.jsp" %>    
      <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">                           
              <div class="card">
                <div class="card-header card-header-primary">

                  <h4 class="card-title "><b>${title}</b></h4>
                  <a href="#" data-toggle="modal" data-target="#addPetguides" style="color: #fff">
                    Create new PetGuide

                  </a> &emsp; &emsp; &emsp; &emsp; 
                  <!--                                    <a href="EmployeeController?action=petguideList" tilte="Print PetGuides List" style="color:#000000;font-size: 40px;"  target="_blank"><i class="material-icons">print</i></a>-->

                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table">

                      <thead class=" text-primary">
                      <th>
                        PetGuideId
                      </th>
                      <th>
                        Title
                      </th>
                      <th>
                        Content
                      </th>
                      <th>
                        Image Name
                      </th>
                      <th>
                        Date Updated
                      </th>
                      <th>
                        Date Created
                      </th>
                      </thead>
                      <tbody>

                        <c:forEach items="${petguides}" var="item">
                          <tr>
                            <td>
                              ${item.petGuideId}
                            </td>
                            <td>

                              ${item.title}
                            </td>
                            <td>
                              ${item.content}
                            </td>
                            <td>
                              <span class="product-image">
                                <img src="PetGuideImage/${item.imageName}" alt="${item.imageName}" class="img-fluid" style="height: 100px;">
                              </span>
                            </td>
                            <td>
                              ${item.dateUpdated}
                            </td>                           
                            <td>
                              ${item.dateCreated}
                            </td>                           
                            <td class="text-center">
                              <a href="AdminController?action=viewEditGuides&petGuideId=${item.petGuideId}" type="submit" style="color: #333" title="Edit" id="" ><i class="material-icons">edit</i></a>
                              <form action="AdminController?action=deletepet" method="post" id="deletepet${item.petGuideId}">
                                <input type="hidden" name="petGuideId" value="${item.petGuideId}" >
                                <a href="#" type="submit" style="color: #333" title="Delete"  onclick="deletepet${item.petGuideId}()"><i class="material-icons">delete</i></a>
                              </form>
                            </td>
                        <script>
                          function deletepet${item.petGuideId}() {
                            swal({
                              title: "Are you sure?",
                              text: "You will not be able to recover this Account!",
                              icon: "warning",
                              buttons: [
                                'No, cancel it!',
                                'Yes, I am sure!'
                              ],
                              dangerMode: true
                            }).then(function (isConfirm) {
                              if (isConfirm) {
                                $("#deletepet${item.petGuideId}").submit();
                              }
                            });
                          }

                        </script>

                        </tr>
                      </c:forEach>
                      </tbody>

                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal Create Category -->
  <div class="modal fade" id="addPetguides" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
       aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <form autocomplete="off" action="AdminController?action=addPetguides" method="post" enctype="multipart/form-data">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Add new Petguide</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="form-group">
              <label for="Title" class="bmd-label-floating">Title</label>
              <input type="text" class="form-control" id="Title" name="title" required="true" minlength="5" maxlength="50">
            </div>
            <div class="form-group">
              <label for="Content" class="bmd-label-floating">Content</label>
              <input type="text" class="form-control" id="Content" name="content" required="true" minlength="5" maxlength="50">
            </div>

            <div class="form-group" style="text-align: center">
              <label for="ImageName" class="bmd-label-floating" style="float: left;">Choose Image</label>
              <img src="" id="imageChange" height="200" style="max-width: 500px"/>
              <input type="file" class="form-control" id="ImageName" name="ImageName" required="true" accept="image/*" style="opacity: 1;position: static;" onchange="readURL(this);" />
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Save changes</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <% if (request.getAttribute("Error") != null) { %>
  <script>
    swal("Error", "${Error}", "error");
  </script>
  <%};
    request.removeAttribute("Error");
    if (request.getAttribute("Success") != null) { %>
  <script>
    swal("Success", "${Success}", "success");
  </script>
  <%};
    request.removeAttribute("Success");
  %>
  <!-- View Images after select file -->
  <script>
    function readURL(input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
          $('#imageChange')
                  .attr('src', e.target.result)
        };

        reader.readAsDataURL(input.files[0]);
      }
    }
  </script>

  <%@include file="../templates-Admin/footer.jsp" %>
