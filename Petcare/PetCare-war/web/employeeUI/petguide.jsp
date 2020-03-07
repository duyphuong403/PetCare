<%@include file="../templates-Employee/header.jsp" %>
<div class="wrapper">
  <%@include file="../templates-Employee/sidebar.jsp" %>    
  <div class="main-panel">
    <%@include file="../templates-Employee/status-bar.jsp" %>
    <!-- code will here-->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header card-header-primary">
                <h4 class="card-title ">Simple Table</h4>
                <p class="card-category"> Here is a subtitle for this table</p>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table">
                    <thead class=" text-primary">
                    <th>
                      ID
                    </th>
                    <th>
                      Title
                    </th>
                    <th>
                      Content
                    </th>
                    <th>
                      Image
                    </th>                   
                    <th>
                      Date Updated
                    </th>
                    </thead>
                    <tbody>
                      <c:forEach items="${Petguides}" var="petGuide">
                      <tr>
                        <td>
                          ${petGuide.petGuideId}
                        </td>      
                        <td>
                          ${petGuide.title}
                        </td>
                        <td>
                          ${petGuide}
                        </td>    
                        <td>
                          ${petGuide}
                        </td>    
                        <td>
                          ${petGuide}
                        </td>    
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

<%@include file="../templates-Employee/footer.jsp" %>