<%-- 
    Document   : category
    Created on : Feb 9, 2020, 11:06:40 AM
    Author     : ngodu
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
                <h4 class="card-title "><b>Accounts</b></h4>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table">
                    <thead class=" text-primary">
                    <th>
                      Account ID
                    </th>
                    <th>
                      Username
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
                      Address
                    </th>
                    <th>
                      Role
                    </th>
                    <th>
                      Status
                    </th>
                    <th>
                      Date Created
                    </th>
                    <th>
                      Reason Banned
                    </th>
                    </thead>
                    <tbody>
                      <c:forEach items="${accounts}" var="acc">
                        <tr>
                          <td>
                            ${acc.accId}
                          </td>
                          <td>
                            ${acc.username}
                          </td>
                          <td>
                            ${acc.fullname}
                          </td>
                          <td>
                            ${acc.email}
                          </td>
                          <td>
                            ${acc.phone}
                          </td>
                          <td>
                            ${acc.address}
                          </td>
                          <td>
                            ${acc.role}
                          </td>
                          <td>
                            <div class="custom-control custom-switch">
                              <input type="checkbox" class="custom-control-input cbx-active" id="switch${acc.accId}" ${acc.isInactive ? "checked" : ""} accId="${acc.accId}">
                              <label class="custom-control-label" for="switch${acc.accId}">${acc.isInactive ? "InActive" : "Active"}</label>
                            </div>
                          </td>
                          <td>
                            <fmt:formatDate value="${acc.dateCreated}" pattern="HH:mm:ss MM-dd-yyyy" />
                          </td>
                          <td>
                            ${acc.reasonBanned}
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

<script>
  $('.cbx-active').change(function () {
    var checkBox = $(this);
    var accId = checkBox.attr('accId');
    var value = this.checked;
    $.post('http://localhost:8080/Petcare-war/EmployeeController?action=change-state', {
      accId: accId,
      value: value
    }, function (resp) {
      checkBox.next().html(resp);
    });
  });
</script>

<%@include file="../templates-Employee/footer.jsp" %>
