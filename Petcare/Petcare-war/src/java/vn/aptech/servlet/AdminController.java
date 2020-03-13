/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.aptech.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vn.aptech.entity.Accounts;
import vn.aptech.entity.Feedbacks;
import vn.aptech.sb.AccountsFacadeLocal;
import vn.aptech.sb.FeedbacksFacadeLocal;

/**
 *
 * @author Dell
 */
public class AdminController extends HttpServlet {

  @EJB
  private AccountsFacadeLocal accountsFacade;
  
  @EJB
  private FeedbacksFacadeLocal feedbacksFacade;

  /**
   * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
   * methods.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {

    HttpSession session = request.getSession();
    String action = request.getParameter("action");
    if (action == null) {
      Accounts curAcc = (Accounts) session.getAttribute("curAcc");
      if (curAcc == null) {
        request.setAttribute("Login", "active");
        request.getRequestDispatcher("login.jsp").forward(request, response);
      } else {
        int role = curAcc.getRole();
        switch (role) {
          case 1:
            request.setAttribute("title", "Dashboard");
            request.getRequestDispatcher("/EmployeeController").forward(request, response);
            break;
          case 2:
            request.setAttribute("title", "Dashboard");
            request.getRequestDispatcher("AdminController?action=account").forward(request, response);
            break;
          default:
            request.setAttribute("title", "Dashboard");
            request.getRequestDispatcher("clientUI/profile.jsp").forward(request, response);
        }
      }
    } else {
      switch (action) {
        case "login":
          String email = request.getParameter("username");
          String pwd = request.getParameter("password");
          if (email == null || email.equals("") || pwd == null || pwd.equals("")) {
            request.setAttribute("message", "Please enter username and password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
          } else {
            Accounts curAcc = accountsFacade.checkLogin(email.toLowerCase(), pwd);
            session.setAttribute("curAcc", curAcc);
            if (curAcc != null) {
              switch (curAcc.getRole()) {
                case 1:
                  request.setAttribute("title", "Dashboard");
                  response.sendRedirect("EmployeeController?action=order");
                  break;
                case 2:
                  response.sendRedirect("AdminController?action=account");
                  break;
                default:
                  response.sendRedirect(request.getHeader("referer"));
                  break;
              }
            } else {
              request.setAttribute("message", "Username or password invalid.");
              request.getRequestDispatcher("login.jsp").forward(request, response);
            }
          }
          break;
        case "account":
          List<Accounts> accounts = accountsFacade.findAll();
          request.setAttribute("title", "Accounts");
          request.setAttribute("account", "active");
          request.setAttribute("accounts", accounts);
          request.getRequestDispatcher("adminUI/account.jsp").forward(request, response);
          if (request.getParameter("txtSearch") != null) {
            request.setAttribute("Accounts", accountsFacade.find(request.getParameter("txtSearch")));
            request.setAttribute("txtSearch", request.getParameter("txtSearch"));
          } else {
            System.out.println();
            request.setAttribute("Error", "Account is already exist!");
          }
          break;
        case "change-state":

          int accId = Integer.parseInt(request.getParameter("accId"));
          boolean value = Boolean.parseBoolean(request.getParameter("value"));

          Accounts acc = accountsFacade.find(accId);
          acc.setIsInactive(value);

          accountsFacade.edit(acc);

          response.getWriter().print(value ? "InActive" : "Active");

          break;
        case "addAccount":
          acc = new Accounts();
//                    Accounts addAccount = accountsFacade.find(Integer.parseInt(request.getParameter("accId")));
          acc.setUsername(request.getParameter("username"));
          acc.setPassword(request.getParameter("password"));
          acc.setFullname(request.getParameter("fullname"));
          acc.setEmail(request.getParameter("email"));
          acc.setPhone(Integer.parseInt(request.getParameter("phone")));
          acc.setAddress(request.getParameter("address"));
          acc.setRole(Short.parseShort(request.getParameter("role")));
          acc.setIsInactive(Boolean.parseBoolean(request.getParameter("isInactive")));
          acc.setDateCreated(new Date());
          acc.setReasonBanned(request.getParameter("reasonBanned"));

          try {
            accountsFacade.create(acc);
          } catch (Exception e) {
            System.out.println(e);
            request.setAttribute("Error", "Account is already exist!");
          }
          request.getRequestDispatcher("AdminController?action=account").forward(request, response);
          break;
//        case "viewEditAccount":
//          if (request.getAttribute("Accounts") == null) {
//            request.setAttribute("Accounts", accountsFacade.findAll());
//          }
//          request.setAttribute("title", "Edit Account");
//          request.setAttribute("account", "active");
//          if (request.getParameter("accId") != null) {
//            request.setAttribute("editAccount", accountsFacade.find(Integer.parseInt(request.getParameter("accId"))));
//          } else {
//            request.setAttribute("Error", "Account ID was null!");
//          }
//          request.getRequestDispatcher("adminUI/editAccount.jsp").forward(request, response);
//          break;
//        case "editAccount":
//          if (request.getParameter("accId") == null) {
//            request.setAttribute("Error", "Cannot find this account!");
//          } else {
//            acc = new Accounts();
//            acc.setUsername(request.getParameter("username"));
//            acc.setPassword(request.getParameter("password"));
//            acc.setFullname(request.getParameter("fullname"));
//            acc.setEmail(request.getParameter("email"));
//            acc.setPhone(Integer.parseInt(request.getParameter("phone")));
//            acc.setAddress(request.getParameter("address"));
//            acc.setRole(Short.parseShort(request.getParameter("role")));
//            acc.setIsInactive(Boolean.parseBoolean(request.getParameter("isInactive")));
////                    acc.setDateCreated(new Date());
//            acc.setReasonBanned(request.getParameter("reasonBanned"));
//
//            try {
//              accountsFacade.edit(acc);
//            } catch (Exception e) {
//              System.out.println(e);
//              request.setAttribute("Error", "Edit Account failed.");
//            }
//          }
//          request.getRequestDispatcher("AdminController?action=account").forward(request, response);
//          break;

        case "deleteAccount":
          accId = Integer.parseInt(request.getParameter("accId"));
          try {
            accountsFacade.remove(accountsFacade.find(accId));
          } catch (Exception e) {
            request.setAttribute("Error", "Delete Account Failed");
          }
          request.getRequestDispatcher("AdminController?action=account").forward(request, response);
          break;
        case "orders":
          response.sendRedirect("login.jsp");
          break;
        case "petguides":
          request.setAttribute("title", "PetGuides");
          request.setAttribute("petguide", "active");
          request.getRequestDispatcher("adminUI/petguide.jsp").forward(request, response);
          break;
        case "aboutus":
          response.sendRedirect("login.jsp");
          break;
        case "profile":
          response.sendRedirect("login.jsp");
          break;
        case "logout":
          session.removeAttribute("curAcc");
          session.removeAttribute("cart");
          response.sendRedirect(request.getHeader("referer"));
          break;
          
        case "feedbacks":
          List<Feedbacks> feedbacks = feedbacksFacade.findAll();
          request.setAttribute("title", "Contact Us");
          request.setAttribute("ContactUs", "active");
          request.getRequestDispatcher("clientUI/contactus.jsp").forward(request, response);
          if (request.getParameter("txtSearch") != null) {
            request.setAttribute("Feedbacks", feedbacksFacade.find(request.getParameter("txtSearch")));
            request.setAttribute("txtSearch", request.getParameter("txtSearch"));
          } else {
            System.out.println();
            request.setAttribute("Error", "Feedbacks is already exist!");
          }
          break;
          
        
      }
      
    
    }
  }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
  /**
   * Handles the HTTP <code>GET</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    processRequest(request, response);
  }

  /**
   * Handles the HTTP <code>POST</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    processRequest(request, response);
  }

  /**
   * Returns a short description of the servlet.
   *
   * @return a String containing servlet description
   */
  @Override
  public String getServletInfo() {
    return "Short description";
  }// </editor-fold>

}
