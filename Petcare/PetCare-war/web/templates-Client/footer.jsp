<%-- 
    Document   : footer
    Created on : Dec 13, 2019, 10:08:00 AM
    Author     : Dell
--%>

<div id="footer">
  <div id="footnote">
    <div class="section">
      Copyright &copy; 2019 - 2020 <a href="login.jsp"><b>Petcare</b></a> 
      All rights reserved
    </div>
  </div>
  <% if (request.getAttribute("Error") != null) { %>
  <script>
    swal("Error", "${Error}", "error");
  </script>
  <% request.removeAttribute("Error"); };
    
    if (request.getAttribute("Success") != null) { %>
  <script>
    swal("Success", "${Success}", "success");
  </script>
  <% request.removeAttribute("Success");};%>
  
  <% if (session.getAttribute("Error") != null) { %>
  <script>
    swal("Error", "${Error}", "error");
  </script>
  <%};
    session.removeAttribute("Error"); %>
  <script src="lib/js/material-dashboard.js?v=2.1.1" type="text/javascript"></script>
  <script src="lib/js/core/jquery.min.js"></script>
  <script src="lib/js/core/popper.min.js"></script>
  <script src="lib/js/core/bootstrap-material-design.min.js"></script>
  <script src="lib/js/plugins/perfect-scrollbar.jquery.min.js"></script>
</div>
</body>
</html>
