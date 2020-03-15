<%-- 
    Document   : feedbacks
    Created on : Mar 12, 2020, 8:26:16 PM
    Author     : TheVi-PC
--%>

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


                  </a> &emsp; &emsp; &emsp; &emsp; 

                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table">

                      <thead class=" text-primary">
                      <th>
                        ID
                      </th>
                      <th>
                        Full Name
                      </th>
                      <th>
                        Email
                      </th>
                      <th>
                        Phone
                      </th>
                      <th>
                        Content 
                      </th>
                      <th>
                        IsRead 
                      </th>
                      <th>
                        Date Created
                      </th>

                      </thead>
                      <tbody>

                        <c:forEach items="${feedbacks}" var="item">
                          <tr>
                            <td>
                              ${item.feedbacktId}
                            </td>
                            <td>

                              ${item.fullname}
                            </td>
                            <td>
                              ${item.email}
                            </td>
                            <td>
                              ${item.phone}
                            </td>
                            <td>
                              ${item.content}
                            </td>
                            <td>
                              ${item.isRead}
                            </td>
                            <td>
                              ${item.dateCreated}
                            </td>

                            <td class="text-center">


                              <form action="AdminController?action=deletefeed" method="post" id="deletefeed${item.feedbacktId}">
                                <input type="hidden" name="feedbacktId" value="${item.feedbacktId}" >
                                <a href="#" type="submit" style="color: #333" title="Delete"  onclick="deletefeed${item.feedbacktId}()"><i class="material-icons">delete</i></a>
                              </form>
                            </td>
                        <script>
                          function deletefeed${item.feedbacktId}() {
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
                                $("#deletefeed${item.feedbacktId}").submit();
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
    
   

    <%@include file="../templates-Admin/footer.jsp" %>
