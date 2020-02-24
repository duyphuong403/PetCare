package org.apache.jsp.clientUI;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(5);
    _jspx_dependants.add("/clientUI/../templates-Client/header.jsp");
    _jspx_dependants.add("/clientUI/../templates-Client/navbar.jsp");
    _jspx_dependants.add("/clientUI/../templates-Client/formSearch.jsp");
    _jspx_dependants.add("/clientUI/../templates-Client/feature.jsp");
    _jspx_dependants.add("/clientUI/../templates-Client/footer.jsp");
  }

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_forEach_var_items;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_forEach_var_items = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_forEach_var_items.release();
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

      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\"\r\n");
      out.write("      xmlns:h=\"http://xmlns.jcp.org/jsf/html\"\r\n");
      out.write("      xmlns:ui=\"http://xmlns.jcp.org/jsf/facelets\">\r\n");
      out.write("    <head>\r\n");
      out.write("        ");

            if (request.getAttribute("title") == null) {
                request.setAttribute("title", "Home");
            }
        
      out.write("\r\n");
      out.write("        <title>PetShop | ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${title}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</title>\r\n");
      out.write("        <meta charset=\"iso-8859-1\"/>\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("        <link href=\"lib/css/style.css\" rel=\"stylesheet\" type=\"text/css\"/>\r\n");
      out.write("        <script src=\"lib/js/jquery-3.4.1.js\"></script>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css\">\r\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js\"></script>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\r\n");
      out.write("        <link rel=\"shortcut icon\" type=\"image/x-icon\" href=\"lib/images/pet-icon.png\"/>\r\n");
      out.write("        \r\n");
      out.write("        <link href=\"https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/icon?family=Material+Icons\">\r\n");
      out.write("        <script src=\"https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("        <!--[if IE 6]><link href=\"css/ie6.css\" rel=\"stylesheet\" type=\"text/css\"><![endif]-->\r\n");
      out.write("        <!--[if IE 7]><link href=\"css/ie7.css\" rel=\"stylesheet\" type=\"text/css\"><![endif]-->\r\n");
      out.write("    </head>\r\n");
      out.write("    <body class=\"container\">\r\n");
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div id=\"header\" class=\"topnav\"> \r\n");
      out.write("    <a href=\"#\" id=\"logo\"><img src=\"lib/images/logo.gif\" width=\"310\" height=\"114\" alt=\"\"/></a>\r\n");
      out.write("    <ul class=\"navigation\" id=\"navigation\">\r\n");
      out.write("        <li class=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${Home}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\"><a href=\"UserController\">Home</a></li>\r\n");
      out.write("        <li class=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${PetMart}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\"><a href=\"UserController?action=petmart\">PetMart</a></li>\r\n");
      out.write("        <li class=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${PetGuide}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\"><a href=\"UserController?action=petguide\">PetGuide</a></li>\r\n");
      out.write("        <li class=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${AboutUs}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\"><a href=\"UserController?action=aboutus\">About us</a></li>\r\n");
      out.write("        <li class=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${ContactUS}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\"><a href=\"UserController?action=contactus\">Contact us</a></li>\r\n");
      out.write("        ");
 if (session.getAttribute("curAcc") == null) { 
      out.write("\r\n");
      out.write("            <li class=\"\" style=\"width: 135px;\"><a href=\"UserController?action=login\">Sign In/Sign Up</a></li>\r\n");
      out.write("            <li class=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${Cart}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\"><a href=\"UserController?action=cart\" style=\"padding-top: 5px;background: none\"><i class=\"material-icons\">shopping_cart</i></a></li>\r\n");
      out.write("        ");
}else {
      out.write("        \r\n");
      out.write("            <li class=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${Cart}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\"><a href=\"UserController?action=cart\" style=\"padding-top: 5px;\"><i class=\"material-icons\">shopping_cart</i></a></li>\r\n");
      out.write("            <li class=\"\" style=\"width: 20%\"><a href=\"AdminController?action=profile&id=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${curAcc.accId}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" style=\"background: none\">Hi <i>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${curAcc.fullname}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</i></li>\r\n");
      out.write("        ");
}
      out.write("\r\n");
      out.write("    </ul>\r\n");
      out.write("    <a href=\"javascript:void(0);\" class=\"icon\" onclick=\"myFunction()\">\r\n");
      out.write("        <i class=\"fa fa-bars\"></i>\r\n");
      out.write("    </a>\r\n");
      out.write("</div>\r\n");
      out.write("<script>\r\n");
      out.write("    function myFunction() {\r\n");
      out.write("        var x = document.getElementById(\"header\");\r\n");
      out.write("        if (x.className === \"topnav\") {\r\n");
      out.write("            x.className += \" responsive\";\r\n");
      out.write("        } else {\r\n");
      out.write("            x.className = \"topnav\";\r\n");
      out.write("        }\r\n");
      out.write("    }\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div id=\"body\" class=\"container\">\r\n");
      out.write("    <div class=\"banner\">&nbsp;</div>\r\n");
      out.write("    <div id=\"content\" class=\"row\">\r\n");
      out.write("        <div class=\"content col-8 col-xm-4\">\r\n");
      out.write("            <ul>\r\n");
      out.write("                ");
      if (_jspx_meth_c_forEach_0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\r\n");
      out.write("                <li> <a href=\"#\"><img src=\"lib/images/cat.jpg\" width=\"114\" height=\"160\" alt=\"\"></a>\r\n");
      out.write("                    <h2>Something good</h2>\r\n");
      out.write("                    <p>Gothica, quam nun c putamus parum claram, anteposuerit litterarum formas humani tatis per seacula. <a class=\"more\" href=\"#\">View all</a></p>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li> <a href=\"#\"><img src=\"lib/images/koi.jpg\" width=\"114\" height=\"160\" alt=\"\"></a>\r\n");
      out.write("                    <h2>Kinds of Fish</h2>\r\n");
      out.write("                    <p>Quam nunc putamus parum claram, antep osuerit litter arum formas humanitatis per seacula quarta. <a class=\"more\" href=\"#\">View all</a></p>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li> <a href=\"#\"><img src=\"lib/images/bird.jpg\" width=\"114\" height=\"160\" alt=\"\"></a>\r\n");
      out.write("                    <h2>Fun birds</h2>\r\n");
      out.write("                    <p>Mirum est notare quam littera gothica , quam nunc putamus parum claram, anteposuerit. <a class=\"more\" href=\"#\">View all</a></p>\r\n");
      out.write("                </li>\r\n");
      out.write("            </ul>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div id=\"sidebar\" class=\"col-4 col-xm-8\">\r\n");
      out.write("            ");
      out.write("\r\n");
      out.write("<div class=\"search\">\r\n");
      out.write("    <input type=\"text\" name=\"s\" placeholder=\"Find...\">\r\n");
      out.write("    <button>&nbsp;</button>\r\n");
      out.write("<!--    <label for=\"articles\">\r\n");
      out.write("        <input type=\"radio\" id=\"articles\" name=\"search\">\r\n");
      out.write("        Articles</label>\r\n");
      out.write("    <label for=\"products\">\r\n");
      out.write("        <input type=\"radio\" id=\"products\" name=\"search\" checked>\r\n");
      out.write("        PetMart Products</label>-->\r\n");
      out.write("</div>");
      out.write("\r\n");
      out.write("            <div class=\"section\">\r\n");
      out.write("                <ul class=\"navigation\">\r\n");
      out.write("                    <li class=\"active\"><a href=\"#\">Shopping Guides</a></li>\r\n");
      out.write("                </ul>\r\n");
      out.write("                <div class=\"aside\">\r\n");
      out.write("                    <div>\r\n");
      out.write("                        <div>\r\n");
      out.write("                            <ul>\r\n");
      out.write("                                ");
      if (_jspx_meth_c_forEach_1(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("                            </ul>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    ");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"featured\">\r\n");
      out.write("    <ul>\r\n");
      out.write("        <li><a href=\"#\"><img src=\"lib/images/organic-and-chemical-free.jpg\" width=\"300\" height=\"90\" alt=\"\"></a></li>\r\n");
      out.write("        <li><a href=\"#\"><img src=\"lib/images/good-food.jpg\" width=\"300\" height=\"90\" alt=\"\"></a></li>\r\n");
      out.write("        <li class=\"last\"><a href=\"#\"><img src=\"lib/images/pet-grooming.jpg\" width=\"300\" height=\"90\" alt=\"\"></a></li>\r\n");
      out.write("    </ul>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("    ");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div id=\"footer\">\r\n");
      out.write("    <div id=\"footnote\">\r\n");
      out.write("        <div class=\"section\">\r\n");
      out.write("            Copyright &copy; 2019 - 2020 <a href=\"UserController?action=login\"><b>Petcare</b></a> \r\n");
      out.write("            All rights reserved\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <script src=\"lib/js/material-dashboard.js?v=2.1.1\" type=\"text/javascript\"></script>\r\n");
      out.write("    <script src=\"lib/js/core/jquery.min.js\"></script>\r\n");
      out.write("    <script src=\"lib/js/core/popper.min.js\"></script>\r\n");
      out.write("    <script src=\"lib/js/core/bootstrap-material-design.min.js\"></script>\r\n");
      out.write("    <script src=\"lib/js/plugins/perfect-scrollbar.jquery.min.js\"></script>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
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

  private boolean _jspx_meth_c_forEach_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_var_items.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_forEach_0.setPageContext(_jspx_page_context);
    _jspx_th_c_forEach_0.setParent(null);
    _jspx_th_c_forEach_0.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${Articles}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    _jspx_th_c_forEach_0.setVar("article");
    int[] _jspx_push_body_count_c_forEach_0 = new int[] { 0 };
    try {
      int _jspx_eval_c_forEach_0 = _jspx_th_c_forEach_0.doStartTag();
      if (_jspx_eval_c_forEach_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("                    <li> <a href=\"#\"><img src=\"lib/images/");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${article.imageName}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\" width=\"114\" height=\"160\" alt=\"\"></a>\r\n");
          out.write("                        <h2>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${article.title}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</h2>\r\n");
          out.write("                        <p>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${article.content}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("<a class=\"more\" href=\"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${article.petGuideId}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\">View all</a></p>\r\n");
          out.write("                    </li>\r\n");
          out.write("                ");
          int evalDoAfterBody = _jspx_th_c_forEach_0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_forEach_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_forEach_0[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_forEach_0.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_forEach_0.doFinally();
      _jspx_tagPool_c_forEach_var_items.reuse(_jspx_th_c_forEach_0);
    }
    return false;
  }

  private boolean _jspx_meth_c_forEach_1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_1 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_var_items.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_forEach_1.setPageContext(_jspx_page_context);
    _jspx_th_c_forEach_1.setParent(null);
    _jspx_th_c_forEach_1.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${Categories}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    _jspx_th_c_forEach_1.setVar("item");
    int[] _jspx_push_body_count_c_forEach_1 = new int[] { 0 };
    try {
      int _jspx_eval_c_forEach_1 = _jspx_th_c_forEach_1.doStartTag();
      if (_jspx_eval_c_forEach_1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("                                    <li><a href=\"#\">");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${item.name}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</a></li>\r\n");
          out.write("                                ");
          int evalDoAfterBody = _jspx_th_c_forEach_1.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_forEach_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_forEach_1[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_forEach_1.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_forEach_1.doFinally();
      _jspx_tagPool_c_forEach_var_items.reuse(_jspx_th_c_forEach_1);
    }
    return false;
  }
}
