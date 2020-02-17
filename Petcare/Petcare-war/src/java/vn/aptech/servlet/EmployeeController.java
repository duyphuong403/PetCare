/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.aptech.servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vn.aptech.entity.Accounts;
import vn.aptech.entity.Categories;
import vn.aptech.sb.CategoriesFacadeLocal;
import vn.aptech.sb.ProductsFacadeLocal;

/**
 *
 * @author ngodu
 */
@WebServlet(name = "EmployeeController", urlPatterns = {"/EmployeeController"})
public class EmployeeController extends HttpServlet {

    @EJB
    private ProductsFacadeLocal productsFacade;

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
        try {
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
                            request.setAttribute("dashboard", "active");
                            request.getRequestDispatcher("employeeUI/index.jsp").forward(request, response);
                            break;
                        case 2:
                            request.setAttribute("title", "Dashboard");
                            request.setAttribute("dashboard", "active");
                            request.getRequestDispatcher("adminUI/index.jsp").forward(request, response);
                            break;
                        default:
                            request.setAttribute("title", "Dashboard");
                            request.setAttribute("dashboard", "active");
                            request.getRequestDispatcher("clientUI/profile.jsp").forward(request, response);
                    }
                }
            } else {
                switch (action) {
                    case "category":
                        if (request.getAttribute("Categories") == null) {
                            request.setAttribute("Categories", categoriesFacade.findAll());
                        }
                        request.setAttribute("title", "Category");
                        request.setAttribute("category", "active");
                        request.getRequestDispatcher("employeeUI/category.jsp").forward(request, response);
                        break;
                    case "addCate":
                        Categories cate = new Categories();
                        cate.setName(request.getParameter("name"));
                        cate.setDescription(request.getParameter("description"));
                        cate.setDateCreated(new Date());

                        try {
                            categoriesFacade.create(cate);
                        } catch (Exception e) {
                            log(e.toString());
                            request.setAttribute("Error", "Category Name already exists.");
                        }

                        request.getRequestDispatcher("EmployeeController?action=category").forward(request, response);
                        break;
                    case "deleteCate":

                        int cateId = Integer.parseInt(request.getParameter("cateId"));
//                        if (productsFacade.FindCategoryById(cateId)) {
//                            request.setAttribute("Error", "Cannot remove Category contain product.");
//                        } else {
                        if (categoriesFacade.Delete(cateId)) {
                            request.setAttribute("Success", "Delete Category Successful");
                        } else {
                            request.setAttribute("Error", "Delete Category Failed");
                        }
//                        }
                        request.getRequestDispatcher("EmployeeController?action=category").forward(request, response);
                        break;
                    case "product":
                        request.setAttribute("title", "Product");
                        request.setAttribute("product", "active");
                        request.getRequestDispatcher("employeeUI/product.jsp").forward(request, response);
                        break;
                    case "account":
                        request.setAttribute("title", "Account");
                        request.setAttribute("account", "active");
                        break;
                    case "petguide":
                        request.setAttribute("title", "PetGuide");
                        request.setAttribute("petguide", "active");
                        break;
                    case "profile":
                        request.setAttribute("title", "Profile-");
                        request.setAttribute("profile", "active");
                        break;
                    case "logout":
                        session.removeAttribute("curAcc");
                        response.sendRedirect("login.jsp");
                        break;
                    default:
                        request.setAttribute("title", "Dashboard");
                        request.setAttribute("dashboard", "active");
                        request.getRequestDispatcher("employeUI/index.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
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
