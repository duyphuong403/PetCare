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
                response.sendRedirect("profile.jsp");
            } else {

                switch (action) {
                    case "viewEditAccount":

                        if (request.getAttribute("Accounts") == null) {
                            request.setAttribute("Accounts", accountsFacade.findAll());
                        }
                        request.setAttribute("title", "Edit Account");
                        request.setAttribute("account", "active");
                        if (request.getParameter("accId") != null) {
                            request.setAttribute("editAccount", accountsFacade.find(Integer.parseInt(request.getParameter("accId"))));
                        } else {
                            request.setAttribute("Error", "Account ID was null!");
                        }
                        request.getRequestDispatcher("adminUI/editAccount.jsp").forward(request, response);

                    case "editAccount":
                        if (request.getParameter("accId") == null) {
                            request.setAttribute("Error", "Cannot find this account!");
                        } else {
                            Accounts acc = new Accounts();
                            acc.setUsername(request.getParameter("username"));
                            acc.setPassword(request.getParameter("password"));
                            acc.setFullname(request.getParameter("fullname"));
                            acc.setEmail(request.getParameter("email"));
                            acc.setPhone(Integer.parseInt(request.getParameter("phone")));
                            acc.setAddress(request.getParameter("address"));
                            acc.setRole(Short.parseShort(request.getParameter("role")));
                            acc.setIsInactive(Boolean.parseBoolean(request.getParameter("isInactive")));
//                    acc.setDateCreated(new Date());
                            acc.setReasonBanned(request.getParameter("reasonBanned"));

                            try {
                                accountsFacade.edit(acc);
                            } catch (Exception e) {
                                System.out.println(e);
                                request.setAttribute("Error", "Edit Account failed.");
                            }
                        }
                        request.getRequestDispatcher("AdminController?action=account").forward(request, response);
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
