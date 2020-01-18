/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.aptech.servlet;

import java.io.IOException;
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
 * @author Dell
 */
public class AdminController extends HttpServlet {

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
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        if (action == null) {
            Accounts curAcc = (Accounts) session.getAttribute("curAcc");
            if (curAcc == null) {
                request.setAttribute("Login", "active");
                request.getRequestDispatcher("clientUI/login.jsp").forward(request, response);
            } else {
                int role = curAcc.getRole();
                switch (role) {
                    case 1:
                        request.setAttribute("title", "Dashboard");
                        request.getRequestDispatcher("employeeUI/index.jsp").forward(request, response);
                        break;
                    case 2:
                        request.setAttribute("title", "Dashboard");
                        request.getRequestDispatcher("adminUI/index.jsp").forward(request, response);
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
                                    request.getRequestDispatcher("employeeUI/index.jsp").forward(request, response);
                                    break;
                                case 2:
                                    request.setAttribute("title", "Dashboard");
                                    request.getRequestDispatcher("adminUI/index.jsp").forward(request, response);
                                    break;
                                default:
                                    request.getRequestDispatcher("clientUI/index.jsp").forward(request, response);
                                    break;
                            }
                        } else {
                            request.setAttribute("message", "Username or password invalid.");
                            request.getRequestDispatcher("login.jsp").forward(request, response);
                        }
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
