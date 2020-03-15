/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.aptech.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vn.aptech.entity.Accounts;
import vn.aptech.sb.AccountsFacadeLocal;

/**
 *
 * @author happy
 */
public class AccountController extends HttpServlet {

    @EJB
    private AccountsFacadeLocal accountsFacade;

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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        Accounts curAcc = (Accounts) session.getAttribute("curAcc");
        if (curAcc == null) {
            request.setAttribute("Login", "active");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            if (action == null) {
                request.getRequestDispatcher("AccountController?action=viewEditAccount").forward(request, response);
            } else {
                switch (action) {

                    case "viewEditAccount":

                        request.setAttribute("title", "Edit Account");
                        request.setAttribute("account", "active");
                        request.getRequestDispatcher("profile.jsp").forward(request, response);

                    case "editAccount":
                        if (request.getParameter("accountId") == null) {
                            request.setAttribute("Error", "Cannot find this account!");
                        }
                        if (request.getParameter("re-password").compareTo(request.getParameter("password")) != 0) {
                            request.setAttribute("Error", "Retype password doesn't match!");
                            request.getRequestDispatcher("profile.jsp").forward(request, response);
                        } else {
                            Accounts acc = accountsFacade.find(Integer.parseInt(request.getParameter("accountId")));
//                            acc.setAccId(Integer.parseInt(request.getParameter("accountId")));
//                            acc.setUsername(request.getParameter("username"));
                            acc.setPassword(request.getParameter("password"));
                            acc.setFullname(request.getParameter("fullname"));
                            acc.setEmail(request.getParameter("email"));
                            acc.setPhone(Integer.parseInt(request.getParameter("phone")));
                            acc.setAddress(request.getParameter("address"));
//                            acc.setRole(Short.parseShort(request.getParameter("role")));
//                            acc.setIsInactive(Boolean.parseBoolean(request.getParameter("isInactive")));

                            try {
                                accountsFacade.edit(acc);
                                request.setAttribute("Success", "Changed information already done!");
                                // nap lai session moi. 
                                session.removeAttribute("curAcc");
                                session.setAttribute("curAcc", accountsFacade.find(curAcc.getAccId()));
                            } catch (Exception e) {
                                System.out.println(e);
                                request.setAttribute("Error", "Edit Account failed!");
                            }
                        }
                        request.getRequestDispatcher("UserController").forward(request, response);
//                    case "deleteAccount":
//                       int accId = Integer.parseInt(request.getParameter("accId")) ;
//                        try {
//                            accountsFacade.remove(accountsFacade.find(accId));
//                            request.setAttribute("Success", "Account has been remove!");
//                        } catch (Exception e) {
//                            request.setAttribute("Error", "Delete Account Failed");
//                        }
//                        request.getRequestDispatcher("AdminController?action=account").forward(request, response);
//                        break;
                }
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
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response
    )
            throws ServletException,
            IOException {
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
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response
    )
            throws ServletException,
            IOException {
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
