/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.aptech.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import vn.aptech.entity.Accounts;
import vn.aptech.entity.Categories;
import vn.aptech.entity.OrderDetails;
import vn.aptech.entity.Orders;
import vn.aptech.entity.ProductUnits;
import vn.aptech.entity.Products;
import vn.aptech.sb.AccountsFacadeLocal;
import vn.aptech.sb.CategoriesFacadeLocal;
import vn.aptech.sb.OrderDetailsFacadeLocal;
import vn.aptech.sb.OrdersFacadeLocal;
import vn.aptech.sb.PetGuidesFacadeLocal;
import vn.aptech.sb.ProductUnitsFacadeLocal;
import vn.aptech.sb.ProductsFacadeLocal;

/**
 *
 * @author ngodu
 */
@MultipartConfig(location = "/ProductImages", fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)

@WebServlet(name = "EmployeeController", urlPatterns = {"/EmployeeController"})
public class EmployeeController extends HttpServlet {

  @EJB
  private OrderDetailsFacadeLocal orderDetailsFacade;

  @EJB
  private OrdersFacadeLocal ordersFacade;

  @EJB
  private AccountsFacadeLocal accountsFacade;

  @EJB
  private PetGuidesFacadeLocal petGuidesFacade;

  public static final String SAVE_DIRECTORY = "uploadDir";

  @EJB
  private ProductUnitsFacadeLocal productUnitsFacade;

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
//      System.out.println(request.getRequestURL().toString());

      HttpSession session = request.getSession();
      session.setMaxInactiveInterval(24 * 60 * 60);
      Categories cate;
      Products prod;
      Orders ord;
      List<OrderDetails> ordl;
      int subtotal;
      int nOfPages;
      int pageSize;
      int currentPage;

      String uploadDir = "C:\\PetCare\\Petcare\\PetCare-war\\web\\ProductImages\\";
      String PetGuides = "C:\\PetCare\\Petcare\\PetCare-war\\web\\PetGuideImages\\";
      String action = request.getParameter("action");
      Accounts curAcc = (Accounts) session.getAttribute("curAcc");
      if (curAcc == null) {
        request.setAttribute("Login", "active");
        request.getRequestDispatcher("login.jsp").forward(request, response);
      } else {
        if (action == null) {
          int role = curAcc.getRole();
          if (!curAcc.getIsActive()) {
            request.setAttribute("Error", "Your account was banned. Please contact Administrator");
            request.getRequestDispatcher("UserController").forward(request, response);
          } else {
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
            case "order":
//              orderDetailsFacade.joinTable(2);
              if (request.getAttribute("countProd") == null) {
                request.setAttribute("countProd", ordersFacade.count());
              }
              currentPage = 1;
              if (request.getParameter("currentPage") != null) {
                currentPage = Integer.parseInt(request.getParameter("currentPage"));
              }
              request.setAttribute("currentPage", currentPage);

              pageSize = 10;
              if (request.getParameter("pageSize") != null) {
                pageSize = Integer.parseInt(request.getParameter("pageSize"));
              }
              request.setAttribute("pageSize", pageSize);

              nOfPages = ordersFacade.count() / pageSize;
              if (ordersFacade.count() % pageSize > 0) {
                nOfPages++;
              }
              request.setAttribute("noOfPages", nOfPages);

              if (request.getParameter("txtSearch") != null && !request.getParameter("txtSearch").equals("")) {
                List<Orders> ordList = ordersFacade.searchWithPagination(Integer.parseInt(request.getParameter("txtSearch")), currentPage, pageSize);
                request.setAttribute("Orders", ordList);
//                request.setAttribute("OrderDetail", orderDetailsFacade.getListOrder(ord));
                if (ordList.isEmpty()) {
                  request.setAttribute("Error", "Not found any order with this ID");
                }
                request.setAttribute("txtSearch", request.getParameter("txtSearch"));
              } else {
                request.setAttribute("Orders", ordersFacade.getRecordsPagination(currentPage, pageSize));
              }

              request.setAttribute("title", "Orders");
              request.setAttribute("order", "active");
              request.getRequestDispatcher("employeeUI/order.jsp").forward(request, response);
              break;
            case "orderDetail":
              ord = ordersFacade.find(Integer.parseInt(request.getParameter("orderId")));
              request.setAttribute("Orders", ord);
              ordl = orderDetailsFacade.getListOrder(ord);
              request.setAttribute("OrderDetail", ordl);
              subtotal = 0;
              for (int i = 0; i < ordl.size(); i++) {
                subtotal += ordl.get(i).getTotal();
              }
              request.setAttribute("SubTotal", subtotal);
              request.setAttribute("title", "Order Detail");
              request.setAttribute("order", "active");
              request.getRequestDispatcher("employeeUI/orderDetail.jsp").forward(request, response);

              break;
            case "updateStatus":
              ord = ordersFacade.find(Integer.parseInt(request.getParameter("orderId")));
              ord.setStatus(request.getParameter("status"));
              ord.setDateUpdated(new Date());
              try {
                ordersFacade.edit(ord);
              } catch (Exception e) {
                request.setAttribute("Error", "Change status failed.");
                System.out.println("Error Update status: " + e);
              }
              request.getRequestDispatcher("EmployeeController?action=order").forward(request, response);
              break;
            case "invoice":
              ord = ordersFacade.find(Integer.parseInt(request.getParameter("orderId")));
              request.setAttribute("Order", ord);

              ordl = orderDetailsFacade.getListOrder(ord);
              subtotal = 0;
              for (int i = 0; i < ordl.size(); i++) {
                subtotal += ordl.get(i).getTotal();
              }
              request.setAttribute("SubTotal", subtotal);
              request.setAttribute("OrderDetails", ordl);
              request.getRequestDispatcher("employeeUI/invoice.jsp").forward(request, response);
              break;
            case "category":
              if (request.getAttribute("Categories") == null) {
                request.setAttribute("Categories", categoriesFacade.findAll());
              }
              request.setAttribute("title", "Category");
              request.setAttribute("category", "active");
              request.getRequestDispatcher("employeeUI/category.jsp").forward(request, response);
              break;
            case "addCate":
              cate = new Categories();
              cate.setName(request.getParameter("name"));
              cate.setDescription(request.getParameter("description"));
              cate.setDateCreated(new Date());

              try {
                categoriesFacade.create(cate);
              } catch (Exception e) {
                System.out.println(e);
                request.setAttribute("Error", "Category Name already exists.");
              }
              request.getRequestDispatcher("EmployeeController?action=category").forward(request, response);
              break;
            case "editCate":
              cate = new Categories();
              cate.setCateId(Integer.parseInt(request.getParameter("cateId")));
              cate.setName(request.getParameter("name"));
              cate.setDescription(request.getParameter("description"));
              cate.setDateUpdated(new Date());
              try {
                categoriesFacade.edit(cate);
              } catch (Exception e) {
                System.out.println(e);
                request.setAttribute("Error", "Edit category failed. " + e.getMessage());
              }
              request.getRequestDispatcher("EmployeeController?action=category").forward(request, response);
              break;
            case "deleteCate":
              int cateId = Integer.parseInt(request.getParameter("cateId"));
              if (!categoriesFacade.Delete(cateId)) {
                request.setAttribute("Error", "Delete Category Failed");
              }
              request.getRequestDispatcher("EmployeeController?action=category").forward(request, response);
              break;

            case "product":
              if (request.getAttribute("countProd") == null) {
                request.setAttribute("countProd", productsFacade.count());
              }
              currentPage = 1;
              if (request.getParameter("currentPage") != null) {
                currentPage = Integer.parseInt(request.getParameter("currentPage"));
              }
              request.setAttribute("currentPage", currentPage);

              pageSize = 100;
              nOfPages = productsFacade.count() / pageSize;
              if (productsFacade.count() % pageSize > 0) {
                nOfPages++;
              }
              request.setAttribute("noOfPages", nOfPages);

              if (request.getParameter("txtSearch") != null && !request.getParameter("txtSearch").equals("")) {
                List<Products> prodList = productsFacade.searchWithPagination(request.getParameter("txtSearch"), currentPage, pageSize);
                if (prodList.isEmpty()) {
                  request.setAttribute("Error", "Not found any result.");
                } else {
                  request.setAttribute("Products", prodList);
                }                
              } else if (request.getParameter("category") != null && !request.getParameter("category").equals("")) {
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

              request.setAttribute("title", "Product");
              request.setAttribute("product", "active");
              request.getRequestDispatcher("employeeUI/product.jsp").forward(request, response);
              break;
            case "addProd":
              prod = new Products();
              Categories addCate = categoriesFacade.find(Integer.parseInt(request.getParameter("cateId")));
              prod.setCateId(addCate);
              prod.setName(request.getParameter("name"));
              prod.setDescription(request.getParameter("description"));
              prod.setIsNew(Boolean.parseBoolean(request.getParameter("isNew")));
              prod.setQuantity(Integer.parseInt(request.getParameter("quantity")));
              prod.setPrice(Integer.parseInt(request.getParameter("price")));
              ProductUnits prodUnit = productUnitsFacade.find(Integer.parseInt(request.getParameter("unitId")));
              prod.setUnitId(prodUnit);
              prod.setDateCreated(new Date());
              prod.setAccId(curAcc);

              InputStream inputStream;
              FileOutputStream fileOutputStream;

              File fileSaveDir = new File(uploadDir);
              if (!fileSaveDir.exists()) {
                fileSaveDir.mkdirs();
              }
              for (Part part : request.getParts()) {

                inputStream = request.getPart(part.getName()).getInputStream();
                int i = inputStream.available();
                byte[] b = new byte[i];
                inputStream.read(b);
                String fileName = extractFileName(part);
                fileName = new File(fileName).getName();

                if (fileName != null && fileName.length() > 0) {
                  fileOutputStream = new FileOutputStream(fileSaveDir + "/" + fileName);
                  fileOutputStream.write(b);
                  fileOutputStream.close();
                  prod.setImageName(fileName);
                  System.out.println("Uploaded file " + fileSaveDir + "\\" + fileName + ".");
                }
                inputStream.close();
              }

              try {
                productsFacade.create(prod);
              } catch (Exception e) {
                System.out.println(e);
                request.setAttribute("Error", "Product Name already exists.");
              }
              request.getRequestDispatcher("EmployeeController?action=product").forward(request, response);
              break;
            case "viewEditProd":
              if (request.getAttribute("Categories") == null) {
                request.setAttribute("Categories", categoriesFacade.findAll());
              }
              if (request.getAttribute("Units") == null) {
                request.setAttribute("Units", productUnitsFacade.findAll());
              }
              request.setAttribute("title", "Edit Product");
              request.setAttribute("product", "active");
              if (request.getParameter("prodId") != null) {
                request.setAttribute("editProd", productsFacade.find(Integer.parseInt(request.getParameter("prodId"))));
              } else {
                request.setAttribute("Error", "Prod Id was null");
              }
              request.getRequestDispatcher("employeeUI/editProd.jsp").forward(request, response);
              break;
            case "editProd":
              if (request.getParameter("prodId") == null || request.getParameter("cateId") == null) {
                request.setAttribute("Error", "Product Id or Category Id was null");
              } else {
                prod = productsFacade.find(Integer.parseInt(request.getParameter("prodId")));
                prod.setName(request.getParameter("name"));
                prod.setCateId(categoriesFacade.find(Integer.parseInt(request.getParameter("cateId"))));
                prod.setDescription(request.getParameter("description"));
                prod.setImageName(request.getParameter("imageName"));
                
                InputStream isEdit;
                FileOutputStream fosEdit;

                File fileEdit = new File(uploadDir);
                if (!fileEdit.exists()) {
                  fileEdit.mkdirs();
                }
                for (Part part : request.getParts()) {
                  if (part.getName().equals("imageChange") && !part.getSubmittedFileName().equals("")) {
                    isEdit = request.getPart(part.getName()).getInputStream();
                    int i = isEdit.available();
                    byte[] b = new byte[i];
                    isEdit.read(b);
                    String fileName = extractFileName(part);
                    fileName = new File(fileName).getName();

                    if (fileName != null && fileName.length() > 0) {
                      fosEdit = new FileOutputStream(fileEdit + "/" + fileName);
                      fosEdit.write(b);
                      fosEdit.close();
                      prod.setImageName(fileName);
                      System.out.println("Uploaded file " + fileEdit + "\\" + fileName + ".");
                    }
                    isEdit.close();
                  }
                }
                prod.setQuantity(Integer.parseInt(request.getParameter("quantity")));
                prod.setPrice(Integer.parseInt(request.getParameter("price")));
                prod.setUnitId(productUnitsFacade.find(Integer.parseInt(request.getParameter("unitId"))));
                prod.setIsNew(Boolean.parseBoolean(request.getParameter("isNew")));
                prod.setAccId(curAcc);
                prod.setDateUpdated(new Date());
                try {
                  productsFacade.edit(prod);
                } catch (Exception e) {
                  System.out.println(e);
                  request.setAttribute("Error", "Edit Product failed.");
                }
              }
              request.getRequestDispatcher("EmployeeController?action=product").forward(request, response);
              break;

            case "deleteProd":
              int prodId = Integer.parseInt(request.getParameter("prodId"));
              Products prodDel = productsFacade.find(prodId);
              if (productsFacade.Delete(prodId)) {
                File file = new File(uploadDir + "\\" + prodDel.getImageName());
                if (!file.delete()) {
                  request.setAttribute("Error", "Delete Product Failed");
                }
              } else {
                request.setAttribute("Error", "Delete Product Failed");
              }
              request.getRequestDispatcher("EmployeeController?action=product").forward(request, response);
              break;

            case "unit":
              if (request.getAttribute("Units") == null) {
                request.setAttribute("Units", productUnitsFacade.findAll());
              }

              request.setAttribute("title", "Product Units");
              request.setAttribute("unit", "active");
              request.getRequestDispatcher("employeeUI/unit.jsp").forward(request, response);
              break;
            case "addUnit":
              ProductUnits unit = new ProductUnits();
              unit.setName(request.getParameter("name"));
              unit.setDescription(request.getParameter("description"));
              unit.setDateCreated(new Date());
              try {
                productUnitsFacade.create(unit);
              } catch (Exception e) {
                System.out.println(e);
                request.setAttribute("Error", "Add new Unit failed. Unit Name already exists.");
              }
              request.getRequestDispatcher("EmployeeController?action=unit").forward(request, response);
              break;
            case "editUnit":
              ProductUnits editUnit = new ProductUnits();
              editUnit.setUnitId(Integer.parseInt(request.getParameter("unitId")));
              editUnit.setName(request.getParameter("name"));
              editUnit.setDescription(request.getParameter("description"));
              editUnit.setDateUpdated(new Date());
              try {
                productUnitsFacade.edit(editUnit);
              } catch (Exception e) {
                System.out.println(e.getMessage());
                request.setAttribute("Error", "Edit Unit failed.");
              }
              request.getRequestDispatcher("EmployeeController?action=unit").forward(request, response);
              break;
            case "deleteUnit":
              int unitId = Integer.parseInt(request.getParameter("unitId"));
              if (productUnitsFacade.Delete(unitId)) {
              } else {
                request.setAttribute("Error", "Delete Unit Failed");
              }
              request.getRequestDispatcher("EmployeeController?action=unit").forward(request, response);
              break;

            case "account":

              request.setAttribute("title", "Account");
              request.setAttribute("account", "active");
              request.setAttribute("accounts", accountsFacade.filterEmployee());
              request.getRequestDispatcher("employeeUI/account.jsp").forward(request, response);

              break;

            case "change-state":

              int accId = Integer.parseInt(request.getParameter("accId"));
              boolean value = Boolean.parseBoolean(request.getParameter("value"));

              Accounts acc = accountsFacade.find(accId);
              acc.setIsActive(value);
              if (!value) {
                session.removeAttribute("curAcc");
              }

              accountsFacade.edit(acc);

              response.getWriter().print(value ? "Active" : "InActive");

              break;
            case "petguide":
              request.setAttribute("title", "PetGuide");
              request.setAttribute("petguide", "active");
              if (request.getAttribute("Petguides") == null) {
                request.setAttribute("Petguides", petGuidesFacade.findAll());
              }

              request.getRequestDispatcher("employeeUI/petguide.jsp").forward(request, response);
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
      }
    } catch (IOException | NumberFormatException | ServletException e) {
      System.out.println(e);
    }
  }

  private String extractFileName(Part part) {
    String contentDisp = part.getHeader("content-disposition");
    String[] items = contentDisp.split(";");
    for (String s : items) {
      if (s.trim().startsWith("filename")) {
        return s.substring(s.indexOf("=") + 2, s.length() - 1);
      }
    }
    return "";
  }

  public File getFolderUpload() {
    File folderUpload = new File(System.getProperty("user.home") + "/Uploads");
    if (!folderUpload.exists()) {
      folderUpload.mkdirs();
    }
    return folderUpload;
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
