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
import vn.aptech.sb.PetGuidesFacadeLocal;
import vn.aptech.sb.CategoriesFacadeLocal;

/**
 *
 * @author Dell
 */
public class UserController extends HttpServlet {

    @EJB
    private PetGuidesFacadeLocal articlesFacade;

    @EJB
    private CategoriesFacadeLocal categoriesFacade;

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
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        if (action == null) {
            request.setAttribute("Home", "active");
            request.setAttribute("Categories", categoriesFacade.findAll());
            request.setAttribute("Articles", articlesFacade.findAll());
            request.getRequestDispatcher("clientUI/index.jsp").forward(request, response);
        } else {
            switch (action) {
                case "petmart":
                    request.setAttribute("title", "Petmart");
                    request.setAttribute("PetMart", "active");
                    request.getRequestDispatcher("clientUI/petmart.jsp").forward(request, response);
                    break;
                case "aboutus":
                    request.setAttribute("title", "About Us");
                    request.setAttribute("AboutUs", "active");
                    request.getRequestDispatcher("clientUI/aboutus.jsp").forward(request, response);
                    break;
                case "petguide":
                    request.setAttribute("title", "Pet Guide");
                    request.setAttribute("PetGuide", "active");
                    request.getRequestDispatcher("clientUI/petguide.jsp").forward(request, response);
                    break;
                case "contactus":
                    request.setAttribute("title", "Contact Us");
                    request.setAttribute("ContactUs", "active");
                    request.getRequestDispatcher("clientUI/contactus.jsp").forward(request, response);
                    break;
                case "cart":
                    request.setAttribute("title", "Cart");
                    request.setAttribute("Cart", "active");
                    request.getRequestDispatcher("clientUI/cart.jsp").forward(request, response);
                    break;
                case "login":
                    if (session.getAttribute("curAcc") != null) {
                        request.getRequestDispatcher("clientUI/index.jsp").forward(request, response);
                    } else {
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                        break;
                    }
                default:
                    request.getRequestDispatcher("clientUI/index.jsp").forward(request, response);
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
