<%@page import="vn.aptech.entity.Accounts"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>PetShop | Login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->	
    <link rel="icon" type="image/png" href="lib/images/pet-icon.png"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="lib/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="lib/font/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="lib/font/iconic/css/material-design-iconic-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="lib/vendor/animate/animate.css">
    <!--===============================================================================================-->	
    <link rel="stylesheet" type="text/css" href="lib/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="lib/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="lib/vendor/select2/select2.min.css">
    <!--===============================================================================================-->	
    <link rel="stylesheet" type="text/css" href="lib/vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="lib/css/util.css">
    <link rel="stylesheet" type="text/css" href="lib/css/main.css">
    <!--===============================================================================================-->
    <script src="lib/js/sweetalert.js"></script>
  </head>
  <body>
    <%
      if (session.getAttribute("curAcc") != null) {
        Accounts acc = (Accounts) session.getAttribute("curAcc");
        switch (acc.getRole()) {
          case 0:
            response.sendRedirect("UserController");
            break;
          case 1:
            response.sendRedirect("EmployeeController");
            break;
          case 2:
            response.sendRedirect("AdminController");
            break;
          default:
            response.sendRedirect("UserController");
            break;
        }
      }
    %>
    <div class="limiter">
      <div class="container-login100">
        <div class="wrap-login100">
          <form class="login100-form validate-form" autocomplete="off" action="AdminController?action=login" method="post">
            <span class="login100-form-title p-b-26">
              Welcome
            </span>                      
            <span style="color:red">${message}</span><% request.removeAttribute("message");%><br/>
            <div class="wrap-input100 validate-input" data-validate = "Enter username.">
              <input class="input100" type="text" name="username" autocomplete="off" >
              <span class="focus-input100" data-placeholder="Username"></span>
            </div>

            <div class="wrap-input100 validate-input" data-validate="Enter password">
              <span class="btn-show-pass">
                <i class="zmdi zmdi-eye"></i>
              </span>
              <input class="input100" type="password" name="password" autocomplete="off" >
              <span class="focus-input100" data-placeholder="Password"></span>
            </div>

            <div class="container-login100-form-btn">
              <div class="wrap-login100-form-btn">
                <div class="login100-form-bgbtn"></div>
                <button class="login100-form-btn" type="submit">
                  Login
                </button>
              </div>
            </div>

            <div class="text-center p-t-115">
              <span class="txt1">
                Don't have an account?
              </span>

              <a class="txt2" href="register.jsp">
                <b>Sign Up</b>
              </a>
              <a href="UserController" class="txt2" >
                / Back To Home
              </a>
            </div>
          </form>
        </div>
      </div>
    </div>


    <div id="dropDownSelect1"></div>
    <% if (request.getAttribute("Error") != null) { %>
    <script>
      swal("Error", "${Error}", "error");
    </script>
    <%};%>
    <!--===============================================================================================-->
    <script src="lib/vendor/jquery/jquery-3.2.1.min.js"></script>
    <!--===============================================================================================-->
    <script src="lib/vendor/animsition/js/animsition.min.js"></script>
    <!--===============================================================================================-->
    <script src="lib/vendor/bootstrap/js/popper.js"></script>
    <script src="lib/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="lib/vendor/select2/select2.min.js"></script>
    <!--===============================================================================================-->
    <script src="lib/vendor/daterangepicker/moment.min.js"></script>
    <script src="lib/vendor/daterangepicker/daterangepicker.js"></script>
    <!--===============================================================================================-->
    <script src="lib/vendor/countdowntime/countdowntime.js"></script>
    <!--===============================================================================================-->
    <script src="lib/js/main.js"></script>

  </body>
</html>
