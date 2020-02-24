package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import vn.aptech.entity.Accounts;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      response.setHeader("X-Powered-By", "JSP/2.3");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("    <head>\r\n");
      out.write("        <title>PetShop | Login</title>\r\n");
      out.write("        <meta charset=\"UTF-8\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("        <!--===============================================================================================-->\t\r\n");
      out.write("        <link rel=\"icon\" type=\"image/png\" href=\"lib/images/pet-icon.png\"/>\r\n");
      out.write("        <!--===============================================================================================-->\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"lib/vendor/bootstrap/css/bootstrap.min.css\">\r\n");
      out.write("        <!--===============================================================================================-->\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"lib/font/font-awesome-4.7.0/css/font-awesome.min.css\">\r\n");
      out.write("        <!--===============================================================================================-->\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"lib/font/iconic/css/material-design-iconic-font.min.css\">\r\n");
      out.write("        <!--===============================================================================================-->\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"lib/vendor/animate/animate.css\">\r\n");
      out.write("        <!--===============================================================================================-->\t\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"lib/vendor/css-hamburgers/hamburgers.min.css\">\r\n");
      out.write("        <!--===============================================================================================-->\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"lib/vendor/animsition/css/animsition.min.css\">\r\n");
      out.write("        <!--===============================================================================================-->\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"lib/vendor/select2/select2.min.css\">\r\n");
      out.write("        <!--===============================================================================================-->\t\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"lib/vendor/daterangepicker/daterangepicker.css\">\r\n");
      out.write("        <!--===============================================================================================-->\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"lib/css/util.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"lib/css/main.css\">\r\n");
      out.write("        <!--===============================================================================================-->\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        ");

            if (session.getAttribute("curAcc") != null){
                Accounts acc = (Accounts)session.getAttribute("curAcc");
                switch (acc.getRole()){
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
        
      out.write("\r\n");
      out.write("        <div class=\"limiter\">\r\n");
      out.write("            <div class=\"container-login100\">\r\n");
      out.write("                <div class=\"wrap-login100\">\r\n");
      out.write("                    <form class=\"login100-form validate-form\" autocomplete=\"off\" action=\"AdminController?action=login\" method=\"post\">\r\n");
      out.write("                        <span class=\"login100-form-title p-b-26\">\r\n");
      out.write("                            Welcome\r\n");
      out.write("                        </span>                      \r\n");
      out.write("                        <span style=\"color:red\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${message}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</span>");
 request.removeAttribute("message");
      out.write("<br/>\r\n");
      out.write("                        <div class=\"wrap-input100 validate-input\" data-validate = \"Enter username.\">\r\n");
      out.write("                            <input class=\"input100\" type=\"text\" name=\"username\" autocomplete=\"off\" >\r\n");
      out.write("                            <span class=\"focus-input100\" data-placeholder=\"Username\"></span>\r\n");
      out.write("                        </div>\r\n");
      out.write("\r\n");
      out.write("                        <div class=\"wrap-input100 validate-input\" data-validate=\"Enter password\">\r\n");
      out.write("                            <span class=\"btn-show-pass\">\r\n");
      out.write("                                <i class=\"zmdi zmdi-eye\"></i>\r\n");
      out.write("                            </span>\r\n");
      out.write("                            <input class=\"input100\" type=\"password\" name=\"password\" autocomplete=\"off\" >\r\n");
      out.write("                            <span class=\"focus-input100\" data-placeholder=\"Password\"></span>\r\n");
      out.write("                        </div>\r\n");
      out.write("\r\n");
      out.write("                        <div class=\"container-login100-form-btn\">\r\n");
      out.write("                            <div class=\"wrap-login100-form-btn\">\r\n");
      out.write("                                <div class=\"login100-form-bgbtn\"></div>\r\n");
      out.write("                                <button class=\"login100-form-btn\" type=\"submit\">\r\n");
      out.write("                                    Login\r\n");
      out.write("                                </button>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("\r\n");
      out.write("                        <div class=\"text-center p-t-115\">\r\n");
      out.write("                            <span class=\"txt1\">\r\n");
      out.write("                                Don't have an account?\r\n");
      out.write("                            </span>\r\n");
      out.write("\r\n");
      out.write("                            <a class=\"txt2\" href=\"AdminController?action=register\">\r\n");
      out.write("                                Sign Up\r\n");
      out.write("                            </a>\r\n");
      out.write("                            <a href=\"UserController\" class=\"txt2\" >\r\n");
      out.write("                                / Back To Home\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </form>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <div id=\"dropDownSelect1\"></div>\r\n");
      out.write("\r\n");
      out.write("        <!--===============================================================================================-->\r\n");
      out.write("        <script src=\"lib/vendor/jquery/jquery-3.2.1.min.js\"></script>\r\n");
      out.write("        <!--===============================================================================================-->\r\n");
      out.write("        <script src=\"lib/vendor/animsition/js/animsition.min.js\"></script>\r\n");
      out.write("        <!--===============================================================================================-->\r\n");
      out.write("        <script src=\"lib/vendor/bootstrap/js/popper.js\"></script>\r\n");
      out.write("        <script src=\"lib/vendor/bootstrap/js/bootstrap.min.js\"></script>\r\n");
      out.write("        <!--===============================================================================================-->\r\n");
      out.write("        <script src=\"lib/vendor/select2/select2.min.js\"></script>\r\n");
      out.write("        <!--===============================================================================================-->\r\n");
      out.write("        <script src=\"lib/vendor/daterangepicker/moment.min.js\"></script>\r\n");
      out.write("        <script src=\"lib/vendor/daterangepicker/daterangepicker.js\"></script>\r\n");
      out.write("        <!--===============================================================================================-->\r\n");
      out.write("        <script src=\"lib/vendor/countdowntime/countdowntime.js\"></script>\r\n");
      out.write("        <!--===============================================================================================-->\r\n");
      out.write("        <script src=\"lib/js/main.js\"></script>\r\n");
      out.write("\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
