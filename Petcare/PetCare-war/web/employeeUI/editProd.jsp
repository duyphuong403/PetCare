<%-- 
    Document   : editProd
    Created on : Mar 2, 2020, 9:11:56 PM
    Author     : Dell
--%>

<%@include file="../templates-Employee/header.jsp" %>

<div class="wrapper ">
  <%@include file="../templates-Employee/sidebar.jsp" %>    
  <div class="main-panel">
    <%@include file="../templates-Employee/status-bar.jsp" %>
    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header card-header-primary">
                <h4 class="card-title">Edit Product</h4>
              </div>
              <div class="card-body">
                <c:set var="prod" scope="session" value="${editProd}"/>  
                <form action="EmployeeController?action=editProd" method="post" enctype="multipart/form-data" style="width:100%">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group">
                            <label class="bmd-label-floating">Name</label>
                            <input type="text" name="prodId" value="${prod.prodId}" hidden="true"/>
                            <input type="text" class="form-control" id="Name" name="name" required="true" value="${prod.name}" maxlength="200">
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group">
                            <label for="Quantity" class="bmd-label-floating">Quantity</label>
                            <input type="number" class="form-control" id="Quantity" name="quantity" required="true" value="${prod.quantity}" min="0" max="99999">
                          </div>
                        </div>                      
                      </div>
                      <div class="row">
                        <div class="col-md-12">
                          <div class="form-group">
                            <label class="bmd-label-floating">Description</label>
                            <textarea row="1" type="text" class="form-control" id="Description" name="description" required="true" value="" maxlength="200">${prod.description}</textarea>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-4">
                          <div class="form-group">
                            <label class="bmd-label-floating">Category</label>
                            <select name="cateId" class="form-control" style="-webkit-appearance: listbox;" >
                              <c:forEach items="${Categories}" var="category">                                    
                                <option value="${category.cateId}" <c:if test="${category.cateId == prod.cateId.cateId}"> selected </c:if>>${category.name}</option>
                              </c:forEach>
                            </select>                      
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="form-group">
                            <label for="Unit" class="bmd-label-floating">Unit</label>
                            <select name="unitId" class="form-control" style="-webkit-appearance: listbox;" >
                              <c:forEach items="${Units}" var="unit">                                    
                                <option value="${unit.unitId}" <c:if test="${unit.unitId == prod.unitId.unitId}"> selected </c:if>>${unit.name}</option>  
                              </c:forEach>              
                            </select>
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="form-group">
                            <p for="IsNew" class="bmd-label-floating">Is New</p>
                            <input type="radio" class="" id="IsNew" name="isNew" required="true" value="true" <c:if test="${prod.isNew}"> checked="true"</c:if>>
                              <label for="yes">Yes</label>
                              <input type="radio" class="" id="IsNew" name="isNew" required="true" value="false" <c:if test="${!prod.isNew}"> checked="true"</c:if>>
                              <label for="no">No</label>
                            </div>
                            <br/>
                          </div>      
                        </div>
                        <div class="row">
                          <div class="col-md-6">
                            <div class="form-group">
                              <label class="bmd-label-floating">Date Updated</label>
                              <input type="datetime" class="form-control" disabled value="${prod.dateUpdated}">
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group">
                            <label class="bmd-label-floating">Date Created</label>
                            <input type="datetime" class="form-control" disabled value="${prod.dateCreated}">
                          </div>
                        </div>
                      </div>                  
                    </div>
                    <div class="col-md-6">
                      <div class="row">
                        <div class="col-md-12" style="text-align: center;">
                          <div class="form-group">
                            <img src="ProductImages/${prod.imageName}" id="currentImage" width="auto" height="200" title="${prod.imageName}"/>
                            <img src="#" id="imageChange" height="200" width="auto" title=""/>
                            <input type="text" name="imageName" value="${prod.imageName}" hidden="true"/>
                            <input type="file" name="imageChange" id="imageChange" accept="image/*" style="opacity: 1;position: static;" onchange="readURL(this);"/>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <a href="EmployeeController?action=product" type="button" class="btn btn-primary pull-left" style="background-color: #c1c6c7;">Back</a>
                  <button type="submit" class="btn btn-primary pull-right">Update Product</button>
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
<%@include file="../templates-Employee/footer.jsp" %>
