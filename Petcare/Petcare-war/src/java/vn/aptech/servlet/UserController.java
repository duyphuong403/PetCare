/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.aptech.servlet;

import java.io.IOException;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vn.aptech.classes.CartBean;
import vn.aptech.classes.CartItemBean;
import vn.aptech.entity.Accounts;
import vn.aptech.entity.Feedbacks;
import vn.aptech.entity.OrderDetails;
import vn.aptech.entity.Orders;
import vn.aptech.sb.AccountsFacadeLocal;
import vn.aptech.sb.PetGuidesFacadeLocal;
import vn.aptech.sb.CategoriesFacadeLocal;
import vn.aptech.sb.FeedbacksFacadeLocal;
import vn.aptech.sb.OrderDetailsFacadeLocal;
import vn.aptech.sb.OrdersFacadeLocal;
import vn.aptech.sb.ProductUnitsFacadeLocal;
import vn.aptech.sb.ProductsFacadeLocal;

/**
 *
 * @author Dell
 */
public class UserController extends HttpServlet {

    @EJB
    private AccountsFacadeLocal accountsFacade;

    @EJB
    private OrderDetailsFacadeLocal orderDetailsFacade;

    @EJB
    private OrdersFacadeLocal ordersFacade;

    @EJB
    private ProductUnitsFacadeLocal productUnitsFacade;

    @EJB
    private ProductsFacadeLocal productsFacade;

    @EJB
    private PetGuidesFacadeLocal articlesFacade;

    @EJB
    private CategoriesFacadeLocal categoriesFacade;

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
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        if (action == null) {
            request.setAttribute("Home", "active");
            request.setAttribute("Categories", categoriesFacade.findAll());
            request.setAttribute("Articles", articlesFacade.findAll());
            request.getRequestDispatcher("clientUI/index.jsp").forward(request, response);
        } else {
            switch (action) {
                case "showCart":
                    request.setAttribute("title", "Cart");
                    request.setAttribute("Cart", "active");
                    request.getRequestDispatcher("clientUI/showCart.jsp").forward(request, response);
                    break;
                case "petmart":
                    request.setAttribute("title", "Petmart");
                    request.setAttribute("PetMart", "active");

                    if (request.getAttribute("countProd") == null) {
                        request.setAttribute("countProd", productsFacade.count());
                    }
                    int currentPage = 1;
                    if (request.getParameter("currentPage") != null) {
                        currentPage = Integer.parseInt(request.getParameter("currentPage"));
                    }
                    request.setAttribute("currentPage", currentPage);

                    int pageSize = 9;
                    if (request.getParameter("pageSize") != null) {
                        pageSize = Integer.parseInt(request.getParameter("pageSize"));
                    }
                    request.setAttribute("pageSize", pageSize);

                    int nOfPages = productsFacade.count() / pageSize;
                    if (productsFacade.count() % pageSize > 0) {
                        nOfPages++;
                    }
                    request.setAttribute("noOfPages", nOfPages);

                    if (request.getParameter("txtSearch") != null) {
                        List<Products> prodList = productsFacade.searchWithPagination(request.getParameter("txtSearch"), currentPage, pageSize);
                        if (prodList.isEmpty()) {
                            request.setAttribute("Error", "Not found any result.");
                        } else {
                            request.setAttribute("Products", prodList);
                        }
                        request.setAttribute("txtSearch", request.getParameter("txtSearch"));
                    } else if (request.getParameter("category") != null) {
                        request.setAttribute("Products", productsFacade.searchCateWithPagination(categoriesFacade.find(Integer.parseInt(request.getParameter("category"))), currentPage, pageSize));
                    } else {
                        request.setAttribute("Products", productsFacade.getProductPagination(currentPage, pageSize));
                    }

                    if (request.getAttribute("Categories") == null) {
                        request.setAttribute("Categories", categoriesFacade.findAll());
                    }

                    if (request.getAttribute("Units") == null) {
                        request.setAttribute("Units", productUnitsFacade.findAll());
                    }

                    request.getRequestDispatcher("clientUI/petmart.jsp").forward(request, response);
                    break;
                case "productDetail":
                    request.setAttribute("title", "Product Detail");
                    request.setAttribute("PetMart", "active");
                    request.setAttribute("Products", productsFacade.find(Integer.parseInt(request.getParameter("prodId"))));
                    if (request.getAttribute("Categories") == null) {
                        request.setAttribute("Categories", categoriesFacade.findAll());
                    }

                    try {
                        accountsFacade.create(acc);
                        // cho no dang nhap thanh cong luon
                        session.setAttribute("curAcc", acc);
                        request.getRequestDispatcher("UserController").forward(request, response);
                    } catch (Exception e) {
                        System.out.println(e);
                        request.setAttribute("Error", "Account is already exist!");
                        request.getRequestDispatcher("register.jsp").forward(request, response);
                    }

                    break;
                case "petguide":
                    request.setAttribute("title", "Pet Guide");
                    request.setAttribute("PetGuide", "active"); // Phuc
                    request.setAttribute("Articles", articlesFacade.findAll());
                    request.getRequestDispatcher("clientUI/petguide.jsp").forward(request, response);
<<<<<<< HEAD

=======
>>>>>>> parent of 58134ac... pet guide update
                    break;
                case "contactus":
                    request.setAttribute("title", "Contact Us");
                    request.setAttribute("ContactUs", "active");
                    request.getRequestDispatcher("clientUI/contactus.jsp").forward(request, response);
                    break;
                case "addFeedback":
                    Feedbacks feed = new Feedbacks();
                    feed.setFullname(request.getParameter("fullname"));
                    feed.setEmail(request.getParameter("email"));
                    feed.setPhone(Integer.parseInt(request.getParameter("phone")));
                    feed.setContent(request.getParameter("content"));
                    feed.setIsRead(false);
                    feed.setDateCreated(new Date());

                    try {
                        accountsFacade.create(acc);
                        // cho no dang nhap thanh cong luon
                        session.setAttribute("curAcc", acc);
                        request.getRequestDispatcher("UserController").forward(request, response);
                    } catch (Exception e) {
                        System.out.println(e);
                        request.setAttribute("Error", "Account is already exist!");
                        request.getRequestDispatcher("register.jsp").forward(request, response);
                    }

                    break;

                case "petguide":
                    request.setAttribute("title", "Pet Guide");
                    request.setAttribute("PetGuide", "active"); // Phuc
                    request.setAttribute("Articles", articlesFacade.findAll());
                    request.getRequestDispatcher("clientUI/petguide.jsp").forward(request, response);
                    break;
                case "contactus":
                    request.setAttribute("title", "Contact Us");
                    request.setAttribute("ContactUs", "active");
                    request.getRequestDispatcher("clientUI/contactus.jsp").forward(request, response);
                    break;
                case "addFeedback":
                    Feedbacks feed = new Feedbacks();
                    feed.setFullname(request.getParameter("fullname"));
                    feed.setEmail(request.getParameter("email"));
                    feed.setPhone(Integer.parseInt(request.getParameter("phone")));
                    feed.setContent(request.getParameter("content"));
                    feed.setIsRead(false);
                    feed.setDateCreated(new Date());

                    try {
                        feedbacksFacade.create(feed);
                        request.setAttribute("Success", "Thank you for your feedback.");
                    } catch (Exception e) {
                        System.out.println(e);
                        request.setAttribute("Error", "Cannot Create Feedback!");
                    }
                    request.getRequestDispatcher("clientUI/contactus.jsp").forward(request, response);
                    break;
                case "addOrder":
                    if (session.getAttribute("curAcc") == null) {
                        response.sendRedirect("login.jsp");
                    } else {
                        if (session.getAttribute("cart") != null) {
                            Orders order = new Orders();
                            Date curDate = new Date();
                            Accounts curAcc = (Accounts) session.getAttribute("curAcc");
                            order.setAccId(curAcc);
                            order.setDateCreated(curDate);
                            order.setStatus("Not Verify");
                            try {
                                ordersFacade.create(order);
                            } catch (Exception e) {
                                System.out.println("Error create order: " + e);
                            }
                            Orders curOrd = ordersFacade.getOrderLastest(curAcc);
                            CartBean cb = (CartBean) session.getAttribute("cart");
                            OrderDetails ordl;
                            boolean isFailed = false;
                            for (int i = 0; i < cb.list.size(); i++) {
                                CartItemBean cib = (CartItemBean) cb.list.get(i);
                                ordl = new OrderDetails();
                                ordl.setOrderId(curOrd);
                                ordl.setProdId(productsFacade.find(cib.getProdId()));
                                ordl.setName(cib.getName());
                                ordl.setUnit(cib.getUnit());
                                ordl.setPrice(cib.getPrice());
                                ordl.setQuantity(cib.getQuantity());
                                ordl.setTotal(cib.getTotalCost());
                                try {
                                    orderDetailsFacade.create(ordl);
                                } catch (Exception e) {
                                    System.out.println("Error create order detail: " + e);
                                    isFailed = true;
                                    break;
                                }
                            }
                            if (isFailed) {
                                request.setAttribute("Error", "Order failed.");
                                request.getRequestDispatcher("UserController?action=showCart").forward(request, response);
                            } else {
                                request.setAttribute("Success", "Order success. Employee will contact to you to verify. Thank you.");
                                session.removeAttribute("cart");
                                request.getRequestDispatcher("clientUI/index.jsp").forward(request, response);
                            }
                        }
                    }
                    break;
                case "history":
                    Accounts curAcc = (Accounts) session.getAttribute("curAcc");
                    if (curAcc == null) {
                        request.setAttribute("Error", "Please sign in before continue.");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    } else {
                        // get orderId
                        List<Orders> curOrd = ordersFacade.getOrderByAccId(curAcc);
                        // check if any order
                        if (!curOrd.isEmpty()) {
//              ArrayList ordlList = new ArrayList();
//              for (int i = 0; i < curOrd.size(); i++) {
//                ordlList.add(orderDetailsFacade.getListOrder(ordersFacade.find(curOrd.get(i).getOrderId())));
//              }
                            request.setAttribute("order", curOrd);
                            request.setAttribute("orderDetail", orderDetailsFacade.findAll());
                            request.setAttribute("title", "Order History");
                            request.getRequestDispatcher("clientUI/orderHistory.jsp").forward(request, response);
                        } else {
                            session.setAttribute("Error", "Not found any order.");
                            response.sendRedirect("UserController");
                        }
                    }
                    break;
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
